defmodule Stripe.Generator.ParamsGenerator do
  @moduledoc false

  alias Stripe.Generator.DocFormatter
  alias Stripe.Generator.Naming

  @file_header "# File generated from our OpenAPI spec"

  @doc """
  Generate params modules from parsed spec.
  Returns `[{file_path, content}]`.
  """
  def generate(spec) do
    spec.resources
    |> Enum.flat_map(fn resource ->
      resource.operations
      |> Enum.flat_map(fn op ->
        generate_params(resource, op, spec.path_specs)
      end)
    end)
    |> Enum.uniq_by(fn {path, _} -> path end)
    |> Enum.sort_by(fn {path, _} -> path end)
  end

  defp generate_params(resource, op, path_specs) do
    path_key = "#{String.upcase(to_string(op.http_method))} #{op.path}"
    path_spec = Map.get(path_specs, path_key)

    params_schema =
      cond do
        # POST/PUT/PATCH — use requestBody schema
        op.http_method in [:post, :put, :patch] && path_spec && path_spec.params_schema ->
          path_spec.params_schema

        # GET/DELETE — use query parameters
        op.http_method in [:get, :delete, :head] && path_spec && path_spec.query_params != [] ->
          query_params_to_schema(path_spec.query_params)

        true ->
          nil
      end

    if params_schema do
      # Use resolved service class unless explicitly overridden.
      params_class = resolve_params_class(op)
      package = op.service_package || resource.package
      module = Naming.params_module(params_class, package, op.method_name)
      path = Naming.module_to_path(module)
      content = generate_params_module(module, params_schema)
      [{path, content}]
    else
      []
    end
  end

  defp query_params_to_schema(params) do
    properties =
      params
      |> Enum.reject(fn p -> p["in"] != "query" end)
      |> Enum.map(fn p ->
        schema = p["schema"] || %{"type" => "string"}

        schema =
          if p["description"], do: Map.put(schema, "description", p["description"]), else: schema

        {p["name"], schema}
      end)
      |> Map.new()

    required =
      params
      |> Enum.filter(fn p -> p["required"] == true end)
      |> Enum.map(fn p -> p["name"] end)

    %{"type" => "object", "properties" => properties, "required" => required}
  end

  defp generate_params_module(module, schema) do
    fields =
      schema
      |> extract_params_fields()
      |> Enum.sort_by(& &1.name)

    struct_fields = Enum.map_join(fields, ", ", fn f -> ":#{f.name}" end)

    # @moduledoc from module name
    class_name =
      inspect(module) |> String.split(".") |> List.last() |> String.replace("Params", "")

    readable = Macro.underscore(class_name) |> String.replace("_", " ")
    moduledoc = "Parameters for #{readable}."

    # @typedoc from field descriptions
    typedoc =
      case DocFormatter.build_typedoc_table(fields) do
        nil -> ""
        table -> "\n  @typedoc \"\"\"\n#{table}\n  \"\"\""
      end

    """
    #{@file_header}
    defmodule #{inspect(module)} do
      @moduledoc "#{moduledoc}"
    #{typedoc}
      @type t :: %__MODULE__{}

      defstruct [#{struct_fields}]
    end
    """
  end

  defp extract_params_fields(schema) do
    properties = schema["properties"] || %{}

    Enum.map(properties, fn {name, prop} ->
      %{
        name: name,
        description: prop["description"],
        enum: prop["enum"],
        format: prop["format"],
        max_length: prop["maxLength"]
      }
    end)
  end

  # When params_overrides() gains entries, match here like resolve_service/2.
  defp resolve_params_class(op), do: op.service_class
end
