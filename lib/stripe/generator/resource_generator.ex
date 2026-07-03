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
    # Map all resource schema IDs to modules so nested-field metadata can cast
    # expanded objects into the same generated structs as top-level responses.
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
    expandable_set = MapSet.new(resource.expandable_fields)

    struct_fields = Enum.map_join(props, ", ", fn p -> ":#{p.name}" end)

    expandable_line =
      if resource.expandable_fields != [] do
        fields = Enum.map_join(resource.expandable_fields, ", ", &"\"#{&1}\"")
        "\n  def expandable_fields, do: [#{fields}]\n"
      else
        ""
      end

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
      @type t :: %__MODULE__{}

      defstruct [#{struct_fields}]

      @object_name "#{resource.object_name}"
      def object_name, do: @object_name
    #{expandable_line}#{nested_fields_fn}end
    """

    {path, content}
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
end
