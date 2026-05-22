# File generated from our OpenAPI spec
defmodule Stripe.Services.Radar.ValueListItemService do
  @moduledoc """
  RadarListListItem

  Value list items allow you to add specific values to a given Radar value list, which can then be used in rules.

  Related guide: [Managing list items](https://docs.stripe.com/radar/lists#managing-list-items)
  """
  alias Stripe.Client

  @doc """
  Create a value list item

  Creates a new `ValueListItem` object, which is added to the specified parent value list.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Radar.ValueListItem.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/radar/value_list_items",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Delete a value list item

  Deletes a `ValueListItem` object, removing it from its parent value list.
  """
  @spec delete(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Radar.ValueListItem.t()} | {:error, Stripe.Error.t()}
  def delete(client, item, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :delete,
      "/v1/radar/value_list_items/#{item}",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  List all value list items

  Returns a list of `ValueListItem` objects. The objects are sorted in descending order by creation date, with the most recently created object appearing first.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/radar/value_list_items",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Retrieve a value list item

  Retrieves a `ValueListItem` object.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Radar.ValueListItem.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, item, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/radar/value_list_items/#{item}",
      Keyword.merge(opts, params: params)
    )
  end
end
