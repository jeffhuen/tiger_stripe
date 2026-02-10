defmodule Stripe.Generator.ParamsGenerator do
  @moduledoc false

  alias Stripe.Generator.DocFormatter
  alias Stripe.Generator.Naming
  alias Stripe.Generator.Overrides

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
    {fields, nested_modules} = extract_params_fields(schema)
    fields = Enum.sort_by(fields, & &1.name)

    struct_fields = Enum.map_join(fields, ", ", fn f -> ":#{f.name}" end)

    type_fields =
      fields
      |> Enum.map_join(",\n", fn f ->
        type_str = params_typespec(f.type)

        type_str =
          if f.required do
            type_str
          else
            "#{type_str} | nil"
          end

        "        #{f.name}: #{type_str}"
      end)

    nested_blocks =
      nested_modules
      |> Enum.sort_by(fn {name, _} -> name end)
      |> Enum.map_join("", fn {_name, nested} -> generate_nested_params(nested, "  ") end)

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
      @type t :: %__MODULE__{
    #{type_fields}
        }

      defstruct [#{struct_fields}]
    #{nested_blocks}end
    """
  end

  defp extract_params_fields(schema) do
    properties = schema["properties"] || %{}
    required = MapSet.new(schema["required"] || [])

    Enum.reduce(properties, {[], %{}}, fn {name, prop}, {fields_acc, nested_acc} ->
      {type, new_nested} = resolve_param_type(name, prop)

      field = %{
        name: name,
        type: type,
        required: MapSet.member?(required, name),
        description: prop["description"],
        enum: prop["enum"],
        format: prop["format"],
        max_length: prop["maxLength"]
      }

      {[field | fields_acc], Map.merge(nested_acc, new_nested)}
    end)
  end

  defp resolve_param_type(name, %{"type" => "object", "properties" => props} = schema)
       when map_size(props) > 0 do
    class_name = Macro.camelize(name)
    nested_required = MapSet.new(schema["required"] || [])

    nested_fields =
      props
      |> Enum.map(fn {n, p} ->
        {t, _} = resolve_param_type(n, p)

        %{
          name: n,
          type: t,
          required: MapSet.member?(nested_required, n),
          description: p["description"],
          enum: p["enum"],
          format: p["format"],
          max_length: p["maxLength"]
        }
      end)
      |> Enum.sort_by(& &1.name)

    nested = %{class_name: class_name, fields: nested_fields, required: nested_required}
    {{:nested, class_name}, %{name => nested}}
  end

  defp resolve_param_type(name, %{"anyOf" => variants}) do
    non_null = Enum.reject(variants, fn v -> v == %{"enum" => [""]} || v == %{} end)

    case non_null do
      [single] ->
        {type, nested} = resolve_param_type(name, single)
        {{:nullable, type}, nested}

      _ ->
        {:map, %{}}
    end
  end

  defp resolve_param_type(name, %{"oneOf" => variants}) do
    resolve_param_type(name, %{"anyOf" => variants})
  end

  defp resolve_param_type(name, %{"type" => "array", "items" => items}) do
    {inner, nested} = resolve_param_type(name, items)
    {{:list, inner}, nested}
  end

  defp resolve_param_type(_name, %{"$ref" => _}), do: {:map, %{}}
  defp resolve_param_type(_name, %{"type" => "string"}), do: {:string, %{}}
  defp resolve_param_type(_name, %{"type" => "integer"}), do: {:integer, %{}}
  defp resolve_param_type(_name, %{"type" => "number"}), do: {:float, %{}}
  defp resolve_param_type(_name, %{"type" => "boolean"}), do: {:boolean, %{}}
  defp resolve_param_type(_name, %{"type" => "object"}), do: {:map, %{}}
  defp resolve_param_type(_name, _), do: {:map, %{}}

  defp generate_nested_params(nested, indent) do
    fields = Enum.sort_by(nested.fields, & &1.name)
    struct_fields = Enum.map_join(fields, ", ", fn f -> ":#{f.name}" end)

    type_fields =
      fields
      |> Enum.map_join(",\n", fn f ->
        "#{indent}        #{f.name}: #{params_typespec(f.type)} | nil"
      end)

    typedoc =
      case DocFormatter.build_typedoc_table(fields) do
        nil -> ""
        table -> "\n#{indent}  @typedoc \"\"\"\n#{table}\n#{indent}  \"\"\""
      end

    """

    #{indent}defmodule #{nested.class_name} do
    #{indent}  @moduledoc "Nested parameters."
    #{typedoc}
    #{indent}  @type t :: %__MODULE__{
    #{type_fields}
    #{indent}    }
    #{indent}  defstruct [#{struct_fields}]
    #{indent}end
    """
  end

  defp params_typespec(:string), do: "String.t()"
  defp params_typespec(:integer), do: "integer()"
  defp params_typespec(:float), do: "float()"
  defp params_typespec(:boolean), do: "boolean()"
  defp params_typespec(:map), do: "map()"
  defp params_typespec({:list, inner}), do: "[#{params_typespec(inner)}]"
  defp params_typespec({:nullable, inner}), do: params_typespec(inner)
  defp params_typespec({:nested, _name}), do: "map()"
  defp params_typespec(_), do: "term()"

  defp resolve_params_class(op) do
    case Map.get(Overrides.params_overrides(), {to_string(op.http_method), op.path}) do
      %{params_class: params_class} when is_binary(params_class) -> params_class
      _ -> op.service_class
    end
  end
end
