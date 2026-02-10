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
    # Build a set of resource schema IDs for ref resolution
    resource_ids = MapSet.new(spec.resources, & &1.schema_id)

    spec.resources
    |> Enum.filter(& &1.is_primary)
    |> Enum.map(fn resource ->
      generate_resource(resource, resource_ids)
    end)
  end

  defp generate_resource(resource, resource_ids) do
    module = Naming.resource_module(resource.class_name, resource.package)
    path = Naming.module_to_path(module)

    props = resource.properties
    required = resource.required
    expandable_set = MapSet.new(resource.expandable_fields)

    struct_fields = Enum.map_join(props, ", ", fn p -> ":#{p.name}" end)

    type_fields =
      props
      |> Enum.map_join(",\n", fn p ->
        type_str = type_to_typespec(p.type, p.name, resource, resource_ids)

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

    inner_type_blocks = generate_inner_types(resource.inner_types, "  ")

    inner_types_fn =
      if map_size(resource.inner_types) > 0 do
        entries =
          resource.inner_types
          |> Enum.sort_by(fn {name, _} -> name end)
          |> Enum.map_join(",\n", fn {name, inner} ->
            ~s(    "#{name}" => __MODULE__.#{inner.class_name})
          end)

        """

          def __inner_types__ do
            %{
        #{entries}
            }
          end
        """
      else
        ""
      end

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
    #{expandable_line}#{inner_type_blocks}#{inner_types_fn}end
    """

    {path, content}
  end

  defp generate_inner_types(inner_types, indent) when map_size(inner_types) == 0 do
    _ = indent
    ""
  end

  defp generate_inner_types(inner_types, indent) do
    inner_types
    |> Enum.sort_by(fn {name, _} -> name end)
    |> Enum.map_join("", fn {_name, inner} ->
      generate_inner_type_module(inner, indent)
    end)
  end

  defp generate_inner_type_module(inner, indent) do
    props = Enum.sort_by(inner.properties, & &1.name)
    struct_fields = Enum.map_join(props, ", ", fn p -> ":#{p.name}" end)

    type_fields =
      props
      |> Enum.map_join(",\n", fn p ->
        type_str = simple_typespec(p.type)
        "#{indent}        #{p.name}: #{type_str} | nil"
      end)

    nested_blocks = generate_inner_types(inner[:inner_types] || inner.inner_types, indent <> "  ")

    typedoc =
      case DocFormatter.build_typedoc_table(props) do
        nil -> ""
        table -> "\n#{indent}  @typedoc \"\"\"\n#{table}\n#{indent}  \"\"\""
      end

    """

    #{indent}defmodule #{inner.class_name} do
    #{indent}  @moduledoc false
    #{typedoc}
    #{indent}  @type t :: %__MODULE__{
    #{type_fields}
    #{indent}    }
    #{indent}  defstruct [#{struct_fields}]
    #{nested_blocks}#{indent}end
    """
  end

  # -- Type specs -------------------------------------------------------------

  defp type_to_typespec({:ref, ref_name}, field_name, resource, resource_ids) do
    if MapSet.member?(resource_ids, ref_name) do
      # Expandable field check
      if field_name in resource.expandable_fields do
        "String.t() | map()"
      else
        "map()"
      end
    else
      "map()"
    end
  end

  defp type_to_typespec({:list, inner}, field_name, resource, resource_ids) do
    inner_spec = type_to_typespec(inner, field_name, resource, resource_ids)
    "[#{inner_spec}]"
  end

  defp type_to_typespec({:nullable, inner}, field_name, resource, resource_ids) do
    type_to_typespec(inner, field_name, resource, resource_ids)
  end

  defp type_to_typespec({:inner, _name}, _field_name, _resource, _resource_ids), do: "map()"
  defp type_to_typespec(:string, _, _, _), do: "String.t()"
  defp type_to_typespec(:integer, _, _, _), do: "integer()"
  defp type_to_typespec(:float, _, _, _), do: "float()"
  defp type_to_typespec(:boolean, _, _, _), do: "boolean()"
  defp type_to_typespec(:map, _, _, _), do: "map()"
  defp type_to_typespec(_, _, _, _), do: "term()"

  defp simple_typespec(:string), do: "String.t()"
  defp simple_typespec(:integer), do: "integer()"
  defp simple_typespec(:float), do: "float()"
  defp simple_typespec(:boolean), do: "boolean()"
  defp simple_typespec(:map), do: "map()"
  defp simple_typespec({:list, inner}), do: "[#{simple_typespec(inner)}]"
  defp simple_typespec({:nullable, inner}), do: simple_typespec(inner)
  defp simple_typespec({:ref, _}), do: "map()"
  defp simple_typespec({:inner, _}), do: "map()"
  defp simple_typespec(_), do: "term()"
end
