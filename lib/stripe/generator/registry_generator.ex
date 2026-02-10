defmodule Stripe.Generator.RegistryGenerator do
  @moduledoc false

  alias Stripe.Generator.Naming

  @file_header "# File generated from our OpenAPI spec"

  @doc """
  Generate registry modules (ObjectTypes, EventTypes).
  Returns `[{file_path, content}]`.
  """
  def generate(spec) do
    [generate_object_types(spec.resources), generate_event_types(spec.event_types)]
  end

  defp generate_object_types(resources) do
    # Only register primary resources (avoids collision on class_name)
    {v2_resources, v1_resources} =
      resources
      |> Enum.filter(fn r -> r.is_primary && r.object_name != nil end)
      |> Enum.split_with(fn r -> String.starts_with?(r.package, "V2") end)

    v1_entries =
      v1_resources
      |> Enum.map(fn r ->
        module = Naming.resource_module(r.class_name, r.package)
        {r.object_name, inspect(module)}
      end)
      |> Enum.uniq_by(fn {name, _} -> name end)
      |> Enum.sort_by(fn {name, _} -> name end)

    v2_entries =
      v2_resources
      |> Enum.map(fn r ->
        module = Naming.resource_module(r.class_name, r.package)
        {r.object_name, inspect(module)}
      end)
      |> Enum.uniq_by(fn {name, _} -> name end)
      |> Enum.sort_by(fn {name, _} -> name end)

    v1_map_entries =
      v1_entries
      |> Enum.map_join(",\n", fn {name, mod} -> ~s(      "#{name}" => #{mod}) end)

    v2_map_entries =
      v2_entries
      |> Enum.map_join(",\n", fn {name, mod} -> ~s(      "#{name}" => #{mod}) end)

    v2_block =
      if v2_entries != [] do
        """

          def v2_object_name_to_module do
            %{
        #{v2_map_entries}
            }
          end
        """
      else
        """

          def v2_object_name_to_module do
            %{}
          end
        """
      end

    content = """
    #{@file_header}
    defmodule Stripe.ObjectTypes do
      @moduledoc false

      def object_name_to_module do
        %{
    #{v1_map_entries}
        }
      end
    #{v2_block}end
    """

    {"lib/stripe/object_types.ex", content}
  end

  defp generate_event_types(event_types) do
    entries =
      event_types
      |> Enum.sort_by(fn {type, _} -> type end)
      |> Enum.map_join(",\n", fn {type, %{data_ref: data_ref}} ->
        ref_str = if data_ref, do: ~s("#{data_ref}"), else: "nil"
        ~s(      "#{type}" => #{ref_str})
      end)

    module_entries =
      event_types
      |> Enum.filter(fn {_type, meta} -> meta.kind == "thin" end)
      |> Enum.sort_by(fn {type, _} -> type end)
      |> Enum.map_join(",\n", fn {type, _} ->
        mod = inspect(Naming.event_module(type))
        ~s(      "#{type}" => #{mod})
      end)

    content = """
    #{@file_header}
    defmodule Stripe.EventTypes do
      @moduledoc false

      @doc "Maps event type strings to the schema ref of the event's data object."
      def event_type_to_data_ref do
        %{
    #{entries}
        }
      end

      @doc "Maps thin event type strings to their per-event typed module."
      def event_type_to_module do
        %{
    #{module_entries}
        }
      end
    end
    """

    {"lib/stripe/event_types.ex", content}
  end
end
