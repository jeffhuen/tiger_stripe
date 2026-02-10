defmodule Stripe.Generator.EventGenerator do
  @moduledoc false

  alias Stripe.Generator.DocFormatter
  alias Stripe.Generator.Naming

  @file_header "# File generated from our OpenAPI spec"

  @doc """
  Generate event-related modules from parsed spec.

  Produces:
    - `events.ex` — flat list of all known event type strings
    - Per-event typed modules for thin events (matching Ruby SDK's 21 event files)
    - `unknown_event_notification.ex` — fallback for unrecognized thin events

  Returns `[{file_path, content}]`.
  """
  def generate(spec) do
    constants = generate_event_constants(spec.event_types)
    per_event = generate_per_event_modules(spec.event_types)
    unknown = generate_unknown_event_notification()

    [constants | per_event] ++ [unknown]
  end

  # -- Event Constants (events.ex) --------------------------------------------

  defp generate_event_constants(event_types) do
    entries =
      event_types
      |> Enum.sort_by(fn {type, _} -> type end)
      |> Enum.map_join(",\n", fn {type, _} -> ~s(    "#{type}") end)

    content = """
    #{@file_header}
    defmodule Stripe.Events do
      @moduledoc "Known Stripe event type constants."

      @event_types [
    #{entries}
      ]

      @doc "List of all known Stripe event types."
      def event_types, do: @event_types

      @doc "Check if a string is a known event type."
      def valid_event_type?(type), do: type in @event_types
    end
    """

    {"lib/stripe/events.ex", content}
  end

  # -- Per-Event Typed Modules ------------------------------------------------

  defp generate_per_event_modules(event_types) do
    event_types
    |> Enum.filter(fn {_type, meta} -> meta.kind == "thin" end)
    |> Enum.sort_by(fn {type, _} -> type end)
    |> Enum.map(&generate_event_module/1)
  end

  defp generate_event_module({event_type, meta}) do
    module = Naming.event_module(event_type)
    file_path = Naming.module_to_path(module)
    module_name = inspect(module)

    # Use schema-declared fields for the struct
    fields = meta.schema_fields |> Enum.map_join(", ", fn f -> ":#{f}" end)

    # Generate nested Data module if data has actual properties
    data_tree = build_data_type_tree(meta.data_schema)
    data_module_code = if data_tree, do: render_data_module(data_tree, "Data"), else: ""

    # inner_types for the top-level event module
    inner_types_code =
      if data_tree do
        ~s(def __inner_types__, do: %{"data" => Data})
      else
        ""
      end

    # fetch_related_object/2 for events with related_object
    fetch_fn =
      if meta.has_related_object do
        """
        def fetch_related_object(%__MODULE__{related_object: %{"url" => url}} = event, client) do
          opts = case Map.get(event, :context) do
            nil -> []
            ctx -> [stripe_context: ctx]
          end
          Stripe.Client.request(client, :get, url, opts)
        end
        """
      else
        ""
      end

    moduledoc =
      case meta.description do
        nil ->
          "Event notification for `#{event_type}`."

        "" ->
          "Event notification for `#{event_type}`."

        desc ->
          case DocFormatter.html_to_markdown(desc) do
            nil -> "Event notification for `#{event_type}`."
            md -> DocFormatter.escape_for_heredoc(md)
          end
      end

    content = """
    #{@file_header}
    defmodule #{module_name} do
      @moduledoc \"\"\"
      #{moduledoc}
      \"\"\"

    #{data_module_code}

      defstruct [#{fields}]

      def lookup_type, do: "#{event_type}"

      #{inner_types_code}

      #{fetch_fn}
    end
    """

    {file_path, content}
  end

  # -- Unknown Event Notification (fallback) ----------------------------------

  defp generate_unknown_event_notification do
    content = """
    #{@file_header}
    defmodule Stripe.Events.UnknownEventNotification do
      @moduledoc "Fallback for unrecognized thin event notifications."

      defstruct [:related_object]

      def fetch_related_object(%__MODULE__{related_object: %{"url" => url}}, client) do
        Stripe.Client.request(client, :get, url)
      end
    end
    """

    {"lib/stripe/events/unknown_event_notification.ex", content}
  end

  # -- Nested Data Type Tree --------------------------------------------------

  defp build_data_type_tree(nil), do: nil
  defp build_data_type_tree(%{"properties" => props}) when map_size(props) == 0, do: nil

  defp build_data_type_tree(%{"properties" => props}) when is_map(props) do
    fields = props |> Map.keys() |> Enum.sort()

    field_descriptions =
      Map.new(props, fn {name, schema} ->
        {name, %{name: name, description: schema["description"]}}
      end)

    children =
      for {name, prop_schema} <- props,
          child_schema = nested_object_schema(prop_schema),
          child_schema != nil do
        child_tree = build_data_type_tree(child_schema)
        if child_tree, do: {name, Macro.camelize(name), child_tree}, else: nil
      end
      |> Enum.reject(&is_nil/1)

    %{fields: fields, children: children, field_descriptions: field_descriptions}
  end

  defp build_data_type_tree(_), do: nil

  # Extract nested object schema from a property definition
  defp nested_object_schema(%{"type" => "object", "properties" => props})
       when is_map(props) and map_size(props) > 0,
       do: %{"properties" => props}

  defp nested_object_schema(%{
         "type" => "array",
         "items" => %{"type" => "object", "properties" => props}
       })
       when is_map(props) and map_size(props) > 0,
       do: %{"properties" => props}

  defp nested_object_schema(_), do: nil

  # -- Code Rendering ---------------------------------------------------------

  defp render_data_module(%{fields: fields, children: children} = tree, module_name) do
    child_code =
      children
      |> Enum.sort_by(fn {_, mod_name, _} -> mod_name end)
      |> Enum.map_join("\n", fn {_field, mod_name, subtree} ->
        render_data_module(subtree, mod_name)
      end)

    fields_str = fields |> Enum.map_join(", ", fn f -> ":#{f}" end)

    type_fields =
      fields
      |> Enum.map_join(",\n", fn f -> "        #{f}: term()" end)

    typedoc =
      case Map.get(tree, :field_descriptions) do
        descs when is_map(descs) and map_size(descs) > 0 ->
          props = descs |> Map.values() |> Enum.sort_by(& &1[:name])

          case DocFormatter.build_typedoc_table(props) do
            nil -> ""
            table -> "  @typedoc \"\"\"\n#{table}\n  \"\"\"\n"
          end

        _ ->
          ""
      end

    inner_types_code =
      if children != [] do
        entries =
          children
          |> Enum.sort_by(fn {_, mod, _} -> mod end)
          |> Enum.map_join(", ", fn {field, mod, _} -> ~s("#{field}" => #{mod}) end)

        "def __inner_types__, do: %{#{entries}}"
      else
        ""
      end

    """
    defmodule #{module_name} do
      @moduledoc false
      #{child_code}
    #{typedoc}  @type t :: %__MODULE__{
    #{type_fields}
        }

      defstruct [#{fields_str}]
      #{inner_types_code}
    end
    """
  end
end
