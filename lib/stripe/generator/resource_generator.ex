defmodule Stripe.Generator.ResourceGenerator do
  @moduledoc false

  alias Stripe.Generator.DocFormatter
  alias Stripe.Generator.Naming

  @file_header "# File generated from our OpenAPI spec"

  @doc """
  Generate resource modules from parsed spec.
  Returns `[{file_path, content}]`.
  """
  def generate(spec) do
    # Map ALL resource schema IDs to modules so typespecs can reference the actual
    # struct type.  Non-primary schemas (e.g. payment_method_details_crypto) share
    # the same {class_name, package} as their primary, so they resolve to the same module.
    ref_to_module =
      spec.resources
      |> Map.new(fn r -> {r.schema_id, Naming.resource_module(r.class_name, r.package)} end)

    spec.resources
    |> Enum.filter(& &1.is_primary)
    |> Enum.map(fn resource ->
      generate_resource(resource, ref_to_module)
    end)
  end

  defp generate_resource(resource, ref_to_module) do
    module = Naming.resource_module(resource.class_name, resource.package)
    path = Naming.module_to_path(module)

    props = resource.properties
    required = resource.required
    expandable_set = MapSet.new(resource.expandable_fields)

    struct_fields = Enum.map_join(props, ", ", fn p -> ":#{p.name}" end)

    type_fields =
      props
      |> Enum.map_join(",\n", fn p ->
        type_str = type_to_typespec(p.type, p.name, resource, ref_to_module)

        type_str =
          if MapSet.member?(required, p.name) do
            type_str
          else
            "#{type_str} | nil"
          end

        "          #{p.name}: #{type_str}"
      end)

    expandable_line =
      if resource.expandable_fields != [] do
        fields = Enum.map_join(resource.expandable_fields, ", ", &"\"#{&1}\"")
        "\n  def expandable_fields, do: [#{fields}]\n"
      else
        ""
      end

    inner_type_blocks = generate_inner_type_aliases(resource.inner_types, ref_to_module)
    nested_fields_fn = generate_nested_fields_fn(resource, ref_to_module)

    # @moduledoc from schema title + description
    moduledoc_content =
      DocFormatter.schema_moduledoc(resource.title, resource.description) ||
        "#{resource.class_name} resource."

    moduledoc = ~s(  @moduledoc """\n  #{moduledoc_content}\n  """)

    # @typedoc from property descriptions
    enriched_props =
      Enum.map(props, fn p ->
        Map.put(p, :expandable, MapSet.member?(expandable_set, p.name))
      end)

    typedoc =
      case DocFormatter.build_typedoc_table(enriched_props) do
        nil -> ""
        table -> "\n  @typedoc \"\"\"\n#{table}\n  \"\"\""
      end

    content = """
    #{@file_header}
    defmodule #{inspect(module)} do
    #{moduledoc}
    #{typedoc}
      @type t :: %__MODULE__{
    #{type_fields}
        }

      defstruct [#{struct_fields}]

      @object_name "#{resource.object_name}"
      def object_name, do: @object_name
    #{expandable_line}#{inner_type_blocks}#{nested_fields_fn}end
    """

    {path, content}
  end

  defp generate_inner_type_aliases(inner_types, _ref_to_module) when map_size(inner_types) == 0,
    do: ""

  defp generate_inner_type_aliases(inner_types, ref_to_module) do
    inner_types
    |> flatten_inner_types([])
    |> Enum.map_join("", fn {path, inner} ->
      generate_inner_type_alias(path, inner, ref_to_module)
    end)
  end

  defp flatten_inner_types(inner_types, prefix) do
    inner_types
    |> Enum.sort_by(fn {name, _} -> name end)
    |> Enum.flat_map(fn {name, inner} ->
      path = prefix ++ [name]
      children = inner[:inner_types] || inner.inner_types || %{}

      [{path, inner} | flatten_inner_types(children, path)]
    end)
  end

  defp generate_inner_type_alias(path, inner, ref_to_module) do
    props = Enum.sort_by(inner.properties, & &1.name)
    type_name = local_type_name(path)

    type_fields =
      props
      |> Enum.map_join(",\n", fn p ->
        type_str = nested_field_typespec(p.type, path, p.name, ref_to_module)
        "          optional(#{atom_literal(p.name)}) => #{type_str} | nil"
      end)

    map_fields =
      case type_fields do
        "" -> "          optional(String.t()) => term()"
        fields -> fields <> ",\n          optional(String.t()) => term()"
      end

    typedoc =
      case DocFormatter.build_typedoc_table(props) do
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

  defp generate_nested_fields_fn(resource, ref_to_module) do
    entries =
      resource.inner_types
      |> Enum.sort_by(fn {name, _} -> name end)
      |> Enum.map(fn {name, inner} ->
        ~s(    "#{name}" => #{nested_shape_metadata(inner, ref_to_module)})
      end)

    resource_entries =
      (resource[:resource_inner_refs] || %{})
      |> Enum.sort_by(fn {name, _} -> name end)
      |> Enum.map(fn {name, meta} ->
        mod = Naming.resource_module(meta.class_name, meta.package)
        ~s(    "#{name}" => {:resource, #{inspect(mod)}})
      end)

    all_entries = entries ++ resource_entries

    if all_entries == [] do
      ""
    else
      """

        def __nested_fields__ do
          %{
      #{Enum.join(all_entries, ",\n")}
          }
        end
      """
    end
  end

  defp nested_shape_metadata(inner, ref_to_module) do
    children = inner[:inner_types] || inner.inner_types || %{}

    fields =
      inner.properties
      |> Enum.sort_by(& &1.name)
      |> Enum.map_join(",\n", fn p ->
        ~s(        "#{p.name}" => #{field_metadata(p.type, p.name, children, ref_to_module)})
      end)

    """
    %{
          fields: %{
    #{fields}
          }
        }\
    """
  end

  defp field_metadata({:inner, _name}, field_name, children, ref_to_module) do
    children
    |> Map.fetch!(field_name)
    |> nested_shape_metadata(ref_to_module)
  end

  defp field_metadata({:nullable, inner}, field_name, children, ref_to_module),
    do: field_metadata(inner, field_name, children, ref_to_module)

  defp field_metadata({:list, inner}, field_name, children, ref_to_module),
    do: "{:list, #{field_metadata(inner, field_name, children, ref_to_module)}}"

  defp field_metadata({:map, inner}, field_name, children, ref_to_module),
    do: "{:map, #{field_metadata(inner, field_name, children, ref_to_module)}}"

  defp field_metadata({:ref, ref_name}, _field_name, _children, ref_to_module) do
    case Map.get(ref_to_module, ref_name) do
      nil -> ":scalar"
      mod -> "{:resource, #{inspect(mod)}}"
    end
  end

  defp field_metadata({:expandable_ref, ref_name}, _field_name, _children, ref_to_module) do
    case Map.get(ref_to_module, ref_name) do
      nil -> ":scalar"
      mod -> "{:resource, #{inspect(mod)}}"
    end
  end

  defp field_metadata({:union, types}, field_name, children, ref_to_module) do
    types
    |> Enum.map(&field_metadata(&1, field_name, children, ref_to_module))
    |> Enum.reject(&(&1 == ":scalar"))
    |> List.first()
    |> case do
      nil -> ":scalar"
      meta -> meta
    end
  end

  defp field_metadata(_type, _field_name, _children, _ref_to_module), do: ":scalar"

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

  defp nested_field_typespec({:inner, _name}, path, field_name, _ref_to_module),
    do: "#{local_type_name(path ++ [field_name])}()"

  defp nested_field_typespec({:nullable, inner}, path, field_name, ref_to_module),
    do: nested_field_typespec(inner, path, field_name, ref_to_module)

  defp nested_field_typespec({:list, inner}, path, field_name, ref_to_module),
    do: "[#{nested_field_typespec(inner, path, field_name, ref_to_module)}]"

  defp nested_field_typespec({:map, inner}, path, field_name, ref_to_module),
    do: "%{String.t() => #{nested_field_typespec(inner, path, field_name, ref_to_module)}}"

  defp nested_field_typespec({:union, types}, path, field_name, ref_to_module) do
    types
    |> Enum.map(&nested_field_typespec(&1, path, field_name, ref_to_module))
    |> Enum.uniq()
    |> Enum.join(" | ")
  end

  defp nested_field_typespec(type, _path, _field_name, ref_to_module),
    do: scalar_or_resource_typespec(type, ref_to_module)

  defp scalar_or_resource_typespec(:string, _), do: "String.t()"
  defp scalar_or_resource_typespec(:integer, _), do: "integer()"
  defp scalar_or_resource_typespec(:float, _), do: "float()"
  defp scalar_or_resource_typespec(:boolean, _), do: "boolean()"
  defp scalar_or_resource_typespec(:map, _), do: "map()"

  defp scalar_or_resource_typespec({:ref, ref_name}, ref_to_module) do
    case Map.get(ref_to_module, ref_name) do
      nil -> "map()"
      mod -> "#{inspect(mod)}.t()"
    end
  end

  defp scalar_or_resource_typespec({:expandable_ref, ref_name}, ref_to_module) do
    case Map.get(ref_to_module, ref_name) do
      nil -> "String.t() | map()"
      mod -> "String.t() | #{inspect(mod)}.t()"
    end
  end

  defp scalar_or_resource_typespec(_, _), do: "term()"

  # -- Type specs -------------------------------------------------------------

  defp type_to_typespec({:expandable_ref, ref_name}, _field_name, _resource, ref_to_module) do
    case Map.get(ref_to_module, ref_name) do
      nil -> "map()"
      mod -> "String.t() | #{inspect(mod)}.t()"
    end
  end

  defp type_to_typespec({:ref, ref_name}, _field_name, _resource, ref_to_module) do
    case Map.get(ref_to_module, ref_name) do
      nil -> "map()"
      mod -> "#{inspect(mod)}.t()"
    end
  end

  defp type_to_typespec({:list, inner}, field_name, resource, ref_to_module) do
    inner_spec = type_to_typespec(inner, field_name, resource, ref_to_module)
    "[#{inner_spec}]"
  end

  defp type_to_typespec({:nullable, inner}, field_name, resource, ref_to_module) do
    type_to_typespec(inner, field_name, resource, ref_to_module)
  end

  defp type_to_typespec({:inner, _name}, field_name, _resource, _ref_to_module),
    do: "#{local_type_name([field_name])}()"

  defp type_to_typespec({:map, inner}, field_name, _resource, ref_to_module) do
    inner_spec = nested_field_typespec(inner, [], field_name, ref_to_module)
    "%{String.t() => #{inner_spec}}"
  end

  defp type_to_typespec({:union, types}, field_name, _resource, ref_to_module) do
    types
    |> Enum.map(&nested_field_typespec(&1, [], field_name, ref_to_module))
    |> Enum.uniq()
    |> Enum.join(" | ")
  end

  defp type_to_typespec(:string, _, _, _), do: "String.t()"
  defp type_to_typespec(:integer, _, _, _), do: "integer()"
  defp type_to_typespec(:float, _, _, _), do: "float()"
  defp type_to_typespec(:boolean, _, _, _), do: "boolean()"
  defp type_to_typespec(:map, _, _, _), do: "map()"
  defp type_to_typespec(_, _, _, _), do: "term()"
end
