defmodule Stripe.Deserializer do
  @moduledoc false

  alias Stripe.ObjectTypes

  @spec cast(map() | list() | term(), keyword()) :: struct() | map() | list() | term()
  def cast(data, opts \\ [])

  # V1 list
  def cast(%{"object" => "list"} = data, opts) do
    items = data["data"] |> List.wrap() |> Enum.map(&cast(&1, opts))

    %Stripe.ListObject{
      object: data["object"],
      data: items,
      has_more: data["has_more"],
      url: data["url"]
    }
  end

  # V1 search result
  def cast(%{"object" => "search_result"} = data, opts) do
    items = data["data"] |> List.wrap() |> Enum.map(&cast(&1, opts))

    %Stripe.SearchResult{
      object: data["object"],
      data: items,
      has_more: data["has_more"],
      url: data["url"],
      next_page: data["next_page"],
      total_count: data["total_count"]
    }
  end

  # V2 list (detected by next_page_url key + data being a list)
  def cast(%{"next_page_url" => _, "data" => items} = data, opts) when is_list(items) do
    cast_items = Enum.map(items, &cast(&1, opts))

    %Stripe.V2.ListObject{
      data: cast_items,
      next_page_url: data["next_page_url"]
    }
  end

  # Object with known type
  def cast(%{"object" => object_name} = data, opts) do
    api_mode = Keyword.get(opts, :api_mode, :v1)

    case resolve_module(object_name, api_mode) do
      nil -> data
      module -> populate_struct(module, data, opts)
    end
  end

  # Map without "object" key — return raw
  def cast(%{} = data, _opts), do: data

  # Top-level list — cast each element
  def cast(data, opts) when is_list(data), do: Enum.map(data, &cast(&1, opts))

  # Scalars (string, integer, nil, etc.) — passthrough
  def cast(data, _opts), do: data

  # -- Private ----------------------------------------------------------------

  defp resolve_module(name, :v2) do
    Map.get(ObjectTypes.v2_object_name_to_module(), name) ||
      Map.get(ObjectTypes.object_name_to_module(), name)
  end

  defp resolve_module(name, _v1) do
    Map.get(ObjectTypes.object_name_to_module(), name)
  end

  defp populate_struct(module, data, opts) do
    inner_types =
      if function_exported?(module, :__inner_types__, 0),
        do: module.__inner_types__(),
        else: %{}

    to_struct(module, data, inner_types, opts)
  end

  defp to_struct(module, data, inner_types, opts) do
    module.__struct__()
    |> Map.keys()
    |> List.delete(:__struct__)
    |> Enum.map(fn atom_key ->
      string_key = Atom.to_string(atom_key)
      raw = Map.get(data, string_key)
      {atom_key, cast_field(string_key, raw, inner_types, opts)}
    end)
    |> then(&struct(module, &1))
  end

  defp cast_field(_key, nil, _inner_types, _opts), do: nil

  # Field has an inner type mapping and the value is a list → cast each element
  defp cast_field(key, raw, inner_types, opts)
       when is_map_key(inner_types, key) and is_list(raw) do
    inner_module = Map.fetch!(inner_types, key)
    Enum.map(raw, &cast_to_inner_struct(inner_module, &1, opts))
  end

  # Field has an inner type mapping and the value is a map → cast to inner type struct
  defp cast_field(key, %{} = raw, inner_types, opts) when is_map_key(inner_types, key) do
    inner_module = Map.fetch!(inner_types, key)
    cast_to_inner_struct(inner_module, raw, opts)
  end

  # Expanded object (map with "object" key, no inner type match) → recursive cast
  defp cast_field(_key, %{"object" => _} = raw, _inner_types, opts) do
    cast(raw, opts)
  end

  # List without inner type match → cast each element that has an "object" key
  defp cast_field(_key, raw, _inner_types, opts) when is_list(raw) do
    Enum.map(raw, fn
      %{"object" => _} = item -> cast(item, opts)
      other -> other
    end)
  end

  # Scalar passthrough
  defp cast_field(_key, raw, _inner_types, _opts), do: raw

  # Cast a raw map into an inner type struct, recursively casting fields
  defp cast_to_inner_struct(module, %{} = raw, opts) do
    inner_types =
      if function_exported?(module, :__inner_types__, 0),
        do: module.__inner_types__(),
        else: %{}

    module.__struct__()
    |> Map.keys()
    |> List.delete(:__struct__)
    |> Enum.map(fn atom_key ->
      string_key = Atom.to_string(atom_key)
      raw_value = Map.get(raw, string_key)
      {atom_key, cast_field(string_key, raw_value, inner_types, opts)}
    end)
    |> then(&struct(module, &1))
  end

  defp cast_to_inner_struct(_module, raw, _opts), do: raw
end
