defmodule Stripe.Generator.ServiceGenerator do
  @moduledoc false

  alias Stripe.Generator.DocFormatter
  alias Stripe.Generator.Naming

  @file_header "# File generated from our OpenAPI spec"

  @doc """
  Generate service modules from parsed spec.
  Returns `[{file_path, content}]`.
  """
  def generate(spec) do
    services = group_operations(spec.resources)
    path_specs = spec.path_specs
    resource_docs = spec.resource_docs

    service_files =
      Enum.flat_map(services, &generate_service(&1, path_specs, resource_docs))

    namespace_files = generate_namespace_services(services)
    aggregate_files = generate_aggregates(services)
    manual_files = generate_manual_services()
    service_files ++ namespace_files ++ aggregate_files ++ manual_files
  end

  # -- Group operations by service class + package ----------------------------
  # Operations already have correct service_class set by the OpenAPI parser
  # (including nested prefixes like AccountCapability, CustomerTaxId).
  # Cross-cutting duplicates were already removed by the parser.

  defp group_operations(resources) do
    resources
    |> Enum.flat_map(fn resource ->
      resource.operations
      |> Enum.map(fn op ->
        %{
          method_name: op.method_name,
          http_method: op.http_method,
          path: op.path,
          path_params: op.path_params,
          service_class: op.service_class,
          package: op.service_package || resource.package,
          base_address: op.base_address,
          api_mode: op.api_mode
        }
      end)
    end)
    # Skip resources with no remaining operations (cross-cutting schemas deduped away)
    |> Enum.reject(fn op -> op.service_class == nil end)
    |> Enum.group_by(fn op -> {op.service_class, op.package} end)
    |> Enum.map(fn {{class_name, package}, ops} ->
      %{
        class_name: class_name,
        package: package,
        module: Naming.service_module(class_name, package),
        operations: Enum.sort_by(ops, & &1.method_name)
      }
    end)
    |> Enum.sort_by(fn s -> {s.package, s.class_name} end)
  end

  # -- Generate individual service modules ------------------------------------

  defp generate_service(service, path_specs, resource_docs) do
    module_name = inspect(service.module)
    path = Naming.module_to_path(service.module)

    # Detect methods that have multiple arities (different path param counts)
    conflicting_methods = find_conflicting_methods(service.operations)

    methods =
      service.operations
      |> Enum.map_join("\n", fn op ->
        generate_method(op, op.method_name in conflicting_methods, path_specs)
      end)

    # @moduledoc from resource_docs lookup
    moduledoc_content =
      case Map.get(resource_docs, {service.package, service.class_name}) do
        %{title: title, description: description} ->
          DocFormatter.schema_moduledoc(title, description)

        _ ->
          nil
      end

    moduledoc_content = moduledoc_content || "#{service.class_name} API operations."
    moduledoc = ~s(  @moduledoc """\n  #{moduledoc_content}\n  """)

    content = """
    #{@file_header}
    defmodule #{module_name} do
    #{moduledoc}
      alias Stripe.Client

    #{methods}end
    """

    [{path, content}]
  end

  # Find method names that appear with different path param counts
  defp find_conflicting_methods(operations) do
    operations
    |> Enum.group_by(& &1.method_name)
    |> Enum.filter(fn {_name, ops} ->
      ops |> Enum.map(fn op -> length(op.path_params) end) |> Enum.uniq() |> length() > 1
    end)
    |> Enum.map(fn {name, _} -> name end)
    |> MapSet.new()
  end

  defp generate_method(op, strip_defaults, path_specs) do
    path_params = op.path_params

    # Build function signature
    path_param_args = Enum.map(path_params, &Macro.underscore/1)

    {params_arg, opts_arg} =
      if strip_defaults do
        {"params", "opts"}
      else
        {"params \\\\ %{}", "opts \\\\ []"}
      end

    args = ["client"] ++ path_param_args ++ [params_arg, opts_arg]

    sig = Enum.join(args, ", ")

    # Build the path string with interpolation
    path_str = build_path_string(op.path)

    # Build opts for Client.request
    merge_opts = build_merge_opts(op)

    # Look up operation docs from path_specs
    path_key = "#{String.upcase(to_string(op.http_method))} #{op.path}"
    op_spec = Map.get(path_specs, path_key, %{})

    # @doc
    doc_content = DocFormatter.operation_doc(op_spec[:summary], op_spec[:description])

    doc_line =
      case doc_content do
        nil -> ""
        text -> "  @doc \"\"\"\n  #{text}\n  \"\"\"\n"
      end

    # @deprecated
    deprecated_line =
      if op_spec[:deprecated] == true do
        "  @deprecated \"This endpoint is deprecated by Stripe.\"\n"
      else
        ""
      end

    # @spec
    spec_args =
      ["Client.t()"] ++
        List.duplicate("String.t()", length(path_params)) ++
        ["map()", "keyword()"]

    spec_line =
      "  @spec #{op.method_name}(#{Enum.join(spec_args, ", ")}) ::\n          {:ok, term()} | {:error, Stripe.Error.t()}\n"

    """
    #{doc_line}#{deprecated_line}#{spec_line}  def #{op.method_name}(#{sig}) do
        Client.request(client, :#{op.http_method}, #{path_str},
          #{merge_opts}
        )
      end
    """
  end

  defp build_path_string(path) do
    if String.contains?(path, "{") do
      interpolated =
        Regex.replace(~r/\{(\w+)\}/, path, fn _, param ->
          "\#{#{Macro.underscore(param)}}"
        end)

      ~s("#{interpolated}")
    else
      ~s("#{path}")
    end
  end

  defp build_merge_opts(op) do
    extra_opts = []
    extra_opts = if op.api_mode == :v2, do: extra_opts ++ ["api_mode: :v2"], else: extra_opts

    extra_opts =
      if op.base_address && op.base_address != "api" do
        extra_opts ++ ["base_address: :#{op.base_address}"]
      else
        extra_opts
      end

    case extra_opts do
      [] ->
        "Keyword.merge(opts, params: params)"

      extras ->
        opts_str = ["params: params" | extras] |> Enum.join(", ")
        "Keyword.merge(opts, #{opts_str})"
    end
  end

  # -- Namespace services (BillingService, IssuingService, etc.) ---------------

  defp generate_namespace_services(services) do
    packages =
      services
      |> Enum.map(& &1.package)
      |> Enum.reject(&(&1 == ""))
      |> Enum.filter(&generate_namespace_for_package?/1)
      |> Enum.uniq()
      |> Enum.sort()

    Enum.flat_map(packages, fn package ->
      direct_services =
        services
        |> Enum.filter(&(&1.package == package))
        |> Enum.sort_by(& &1.class_name)

      child_namespaces = direct_child_packages(packages, package)

      module = Naming.namespace_service_module(package)
      path = Naming.module_to_path(module)

      service_fields =
        direct_services
        |> Enum.map(fn child ->
          field_name = Naming.to_snake_case(child.class_name)
          {field_name, inspect(child.module)}
        end)

      namespace_fields =
        child_namespaces
        |> Enum.map(fn child_pkg ->
          field_name = Naming.to_snake_case(child_pkg |> String.split(".") |> List.last())
          ns_module = Naming.namespace_service_module(child_pkg)
          {field_name, inspect(ns_module)}
        end)

      fields =
        service_fields
        |> Kernel.++(namespace_fields)
        |> Map.new()
        |> Enum.to_list()
        |> Enum.sort_by(fn {name, _} -> name end)

      field_list = Enum.map_join(fields, ", ", fn {name, _} -> ":#{name}" end)

      package_label =
        package
        |> String.split(".")
        |> Enum.map_join(" ", &String.capitalize/1)

      content = """
      #{@file_header}
      defmodule #{inspect(module)} do
        @moduledoc "#{package_label} services."
        defstruct [#{field_list}]
      end
      """

      [{path, content}]
    end)
  end

  defp generate_namespace_for_package?(package) do
    parts = String.split(package, ".")

    case parts do
      ["V2" | _] ->
        length(parts) <= 2

      _ ->
        true
    end
  end

  # -- Aggregate modules (V1, V2) ---------------------------------------------

  defp generate_aggregates(services) do
    {v2_services, v1_services} =
      services
      |> Enum.split_with(fn s -> String.starts_with?(s.package, "V2") end)

    v1_file = generate_aggregate_module(Stripe.Services.V1, v1_services)
    v2_file = generate_aggregate_module(Stripe.Services.V2, v2_services)

    v1_file ++ v2_file
  end

  defp generate_aggregate_module(_module, []), do: []

  defp generate_aggregate_module(module, services) do
    path = Naming.module_to_path(module)

    root_services = Enum.filter(services, &(&1.package == ""))

    packages = aggregate_packages(module, services)

    # Namespace packages take precedence over root services with the same name
    # (e.g. Billing namespace absorbs the root BillingService field)
    namespace_fields =
      packages
      |> Enum.map(fn pkg ->
        field = Naming.to_snake_case(pkg |> String.split(".") |> List.last())
        {field, pkg}
      end)
      |> Map.new(fn {field, _} = entry -> {field, entry} end)

    root_entries =
      root_services
      |> Enum.map(fn s ->
        field = Naming.to_snake_case(s.class_name)
        {field, inspect(s.module)}
      end)
      |> Enum.reject(fn {field, _} -> Map.has_key?(namespace_fields, field) end)

    pkg_entries =
      Enum.map(packages, fn pkg ->
        field = Naming.to_snake_case(pkg |> String.split(".") |> List.last())
        ns_module = Naming.namespace_service_module(pkg)
        {field, inspect(ns_module)}
      end)

    manual_entries = manual_service_entries(module)

    entries =
      Enum.sort_by(root_entries ++ pkg_entries ++ manual_entries, fn {name, _} -> name end)

    field_list = Enum.map_join(entries, ", ", fn {name, _} -> ":#{name}" end)

    label =
      case module do
        Stripe.Services.V1 -> "V1"
        Stripe.Services.V2 -> "V2"
      end

    content = """
    #{@file_header}
    defmodule #{inspect(module)} do
      @moduledoc "Aggregate namespace for #{label} API services."
      defstruct [#{field_list}]
    end
    """

    [{path, content}]
  end

  defp direct_child_packages(packages, package) do
    prefix = package <> "."
    parent_depth = package |> String.split(".") |> length()

    packages
    |> Enum.filter(fn candidate ->
      String.starts_with?(candidate, prefix) &&
        candidate |> String.split(".") |> length() == parent_depth + 1
    end)
    |> Enum.sort()
  end

  defp aggregate_packages(Stripe.Services.V1, services) do
    services
    |> Enum.map(& &1.package)
    |> Enum.reject(&(&1 == ""))
    |> Enum.filter(fn package -> String.split(package, ".") |> length() == 1 end)
    |> Enum.uniq()
    |> Enum.sort()
  end

  defp aggregate_packages(Stripe.Services.V2, services) do
    services
    |> Enum.map(& &1.package)
    |> Enum.reject(&(&1 == ""))
    |> Enum.filter(fn package ->
      parts = String.split(package, ".")
      length(parts) == 2 && hd(parts) == "V2"
    end)
    |> Enum.uniq()
    |> Enum.sort()
  end

  # Catch-all removed — only V1 and V2 aggregate modules exist.

  # -- Manual services (not in OpenAPI spec) ------------------------------------

  # Hand-written services included in aggregates to match Ruby SDK layout.
  defp manual_service_entries(Stripe.Services.V1) do
    [{"oauth", "Stripe.Services.OAuthService"}]
  end

  defp manual_service_entries(_module), do: []

  defp generate_manual_services do
    [generate_oauth_service()]
  end

  defp generate_oauth_service do
    content = ~S'''
    # Hand-written — OAuth endpoints are not in the OpenAPI spec.
    defmodule Stripe.Services.OAuthService do
      @moduledoc "OAuth API operations for Stripe Connect."
      alias Stripe.Client

      @doc """
      Build an OAuth authorize URL for Stripe Connect.

      ## Options

        * `:express` - Use Express account flow (`/express/oauth/authorize`)

      """
      def authorize_url(client, params \\ %{}, opts \\ []) do
        path =
          if Keyword.get(opts, :express, false) do
            "/express/oauth/authorize"
          else
            "/oauth/authorize"
          end

        params = Map.put_new_lazy(params, "client_id", fn -> resolve_client_id!(client, params) end)
        params = Map.put_new(params, "response_type", "code")

        query = Client.encode_form_params(params)
        {:ok, "#{client.connect_base}#{path}?#{query}"}
      end

      @doc """
      Exchange an authorization code for an access token, or refresh a token.
      """
      def token(client, params \\ %{}, opts \\ []) do
        opts =
          case Map.get(params, "client_secret") do
            nil -> opts
            secret -> Keyword.put(opts, :api_key, secret)
          end

        Client.request(
          client,
          :post,
          "/oauth/token",
          Keyword.merge(opts, params: params, base_address: :connect)
        )
      end

      @doc """
      Deauthorize a connected account.
      """
      def deauthorize(client, params \\ %{}, opts \\ []) do
        params = Map.put_new_lazy(params, "client_id", fn -> resolve_client_id!(client, params) end)

        Client.request(
          client,
          :post,
          "/oauth/deauthorize",
          Keyword.merge(opts, params: params, base_address: :connect)
        )
      end

      defp resolve_client_id!(client, params) do
        case Map.get(params, "client_id") || client.client_id do
          nil ->
            raise ArgumentError,
                  "No client_id provided. Set :client_id on the Stripe client, " <>
                    "or pass \"client_id\" in params."

          id ->
            id
        end
      end
    end
    '''

    {"lib/stripe/services/oauth_service.ex", content}
  end
end
