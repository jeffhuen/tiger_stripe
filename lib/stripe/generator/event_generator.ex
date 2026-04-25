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

    # Use schema-declared fields for the struct, plus :context for authentication
    # context needed by fetch_related_object/2 (matches Ruby SDK attr_reader :context)
    all_fields = (meta.schema_fields ++ ["context"]) |> Enum.uniq() |> Enum.sort()
    fields = all_fields |> Enum.map_join(", ", fn f -> ":#{f}" end)

    # Generate local data types if data has actual properties
    data_tree = build_data_type_tree(meta.data_schema)
    data_type_code = if data_tree, do: render_data_type_aliases(data_tree), else: ""

    # nested-field metadata for the top-level event module
    nested_fields_code =
      if data_tree do
        """
        def __nested_fields__ do
          %{
            "data" => #{render_data_metadata(data_tree)}
          }
        end
        """
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

    #{data_type_code}

      defstruct [#{fields}]

      def lookup_type, do: "#{event_type}"

      #{nested_fields_code}

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

  defp render_data_type_aliases(tree), do: render_data_type_aliases(tree, ["data"])

  defp render_data_type_aliases(%{children: children} = tree, path) do
    child_code =
      children
      |> Enum.sort_by(fn {field, _mod_name, _subtree} -> field end)
      |> Enum.map_join("", fn {field, _mod_name, subtree} ->
        render_data_type_aliases(subtree, path ++ [field])
      end)

    typedoc =
      case Map.get(tree, :field_descriptions) do
        descs when is_map(descs) and map_size(descs) > 0 ->
          props = descs |> Map.values() |> Enum.sort_by(& &1[:name])

          case DocFormatter.build_typedoc_table(props) do
            nil -> ""
            table -> "\n  @typedoc \"\"\"\n#{table}\n  \"\"\""
          end

        _ ->
          ""
      end

    child_fields = Map.new(children, fn {field, _mod_name, _subtree} -> {field, true} end)

    type_fields =
      tree.fields
      |> Enum.map_join(",\n", fn field ->
        type =
          if Map.has_key?(child_fields, field),
            do: "#{local_type_name(path ++ [field])}()",
            else: "term()"

        "          optional(#{atom_literal(field)}) => #{type} | nil"
      end)

    map_fields =
      case type_fields do
        "" -> "          optional(String.t()) => term()"
        fields -> fields <> ",\n          optional(String.t()) => term()"
      end

    """
    #{child_code}
    #{typedoc}
      @type #{local_type_name(path)} :: %{
    #{map_fields}
        }
    """
  end

  defp render_data_metadata(%{fields: fields, children: children}) do
    child_metadata = Map.new(children, fn {field, _mod_name, subtree} -> {field, subtree} end)

    field_entries =
      fields
      |> Enum.map_join(",\n", fn field ->
        metadata =
          case Map.fetch(child_metadata, field) do
            {:ok, subtree} -> render_data_metadata(subtree)
            :error -> ":scalar"
          end

        ~s(        "#{field}" => #{metadata})
      end)

    """
    %{
          fields: %{
    #{field_entries}
          }
        }\
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
      |> Macro.underscore()
      |> String.replace(~r/[^a-zA-Z0-9_]/, "_")

    if String.match?(part, ~r/^\d/), do: "field_#{part}", else: part
  end
end
