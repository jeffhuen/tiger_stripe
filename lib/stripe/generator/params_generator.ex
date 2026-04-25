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
    {fields, nested_modules} = extract_params_fields(schema)
    fields = Enum.sort_by(fields, & &1.name)

    struct_fields = Enum.map_join(fields, ", ", fn f -> ":#{f.name}" end)

    type_fields =
      fields
      |> Enum.map_join(",\n", fn f ->
        type_str = params_typespec(f.type, [], f.name)

        type_str =
          if f.required do
            type_str
          else
            "#{type_str} | nil"
          end

        "        #{f.name}: #{type_str}"
      end)

    nested_blocks = generate_nested_type_aliases(nested_modules)

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

    {nested_fields, child_nested} =
      Enum.reduce(props, {[], %{}}, fn {n, p}, {fields_acc, nested_acc} ->
        {t, sub_nested} = resolve_param_type(n, p)

        field = %{
          name: n,
          type: t,
          required: MapSet.member?(nested_required, n),
          description: p["description"],
          enum: p["enum"],
          format: p["format"],
          max_length: p["maxLength"]
        }

        {[field | fields_acc], Map.merge(nested_acc, sub_nested)}
      end)

    nested_fields = Enum.sort_by(nested_fields, & &1.name)

    nested = %{
      class_name: class_name,
      fields: nested_fields,
      required: nested_required,
      children: child_nested
    }

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

  defp resolve_param_type(name, %{"type" => "object", "additionalProperties" => add_props})
       when add_props != false do
    {value_type, nested} = resolve_param_type(name, add_props)
    {{:map, value_type}, nested}
  end

  defp resolve_param_type(_name, %{"type" => "object"}), do: {:map, %{}}
  defp resolve_param_type(_name, _), do: {:map, %{}}

  defp generate_nested_type_aliases(nested_modules) when map_size(nested_modules) == 0, do: ""

  defp generate_nested_type_aliases(nested_modules) do
    nested_modules
    |> flatten_nested_params([])
    |> Enum.map_join("", fn {path, nested} -> generate_nested_type_alias(path, nested) end)
  end

  defp flatten_nested_params(nested_modules, prefix) do
    nested_modules
    |> Enum.sort_by(fn {name, _} -> name end)
    |> Enum.flat_map(fn {name, nested} ->
      path = prefix ++ [name]
      children = Map.get(nested, :children, %{})

      [{path, nested} | flatten_nested_params(children, path)]
    end)
  end

  defp generate_nested_type_alias(path, nested) do
    fields = Enum.sort_by(nested.fields, & &1.name)
    type_name = local_type_name(path)

    type_fields =
      fields
      |> Enum.map_join(",\n", fn f ->
        "          optional(#{atom_literal(f.name)}) => #{params_typespec(f.type, path, f.name)} | nil"
      end)

    map_fields =
      case type_fields do
        "" -> "          optional(String.t()) => term()"
        fields -> fields <> ",\n          optional(String.t()) => term()"
      end

    typedoc =
      case DocFormatter.build_typedoc_table(fields) do
        nil -> ""
        table -> "\n  @typedoc \"\"\"\n#{table}\n  \"\"\""
      end

    """
    #{typedoc}
      @type #{type_name} :: %{
    #{map_fields}
        }
    """
  end

  defp atom_literal(name), do: name |> String.to_atom() |> inspect()

  defp local_type_name(path) do
    path
    |> Enum.map(&safe_type_part/1)
    |> Enum.join("_")
  end

  defp safe_type_part(part) do
    part =
      part
      |> Naming.to_snake_case()
      |> String.replace(~r/[^a-zA-Z0-9_]/, "_")

    if String.match?(part, ~r/^\d/), do: "field_#{part}", else: part
  end

  defp params_typespec(:string, _path, _field_name), do: "String.t()"
  defp params_typespec(:integer, _path, _field_name), do: "integer()"
  defp params_typespec(:float, _path, _field_name), do: "float()"
  defp params_typespec(:boolean, _path, _field_name), do: "boolean()"
  defp params_typespec(:map, _path, _field_name), do: "map()"

  defp params_typespec({:map, inner}, path, field_name),
    do: "%{String.t() => #{params_typespec(inner, path, field_name)}}"

  defp params_typespec({:list, inner}, path, field_name),
    do: "[#{params_typespec(inner, path, field_name)}]"

  defp params_typespec({:nullable, inner}, path, field_name),
    do: params_typespec(inner, path, field_name)

  defp params_typespec({:nested, _name}, path, field_name),
    do: "#{local_type_name(path ++ [field_name])}()"

  defp params_typespec(_, _path, _field_name), do: "term()"

  # When params_overrides() gains entries, match here like resolve_service/2.
  defp resolve_params_class(op), do: op.service_class
end
