# File generated from our OpenAPI spec
defmodule Stripe.Services.Radar.ValueListService do
  @moduledoc """
  RadarListList

  Value lists allow you to group values together which can then be referenced in rules.

  Related guide: [Default Stripe lists](https://docs.stripe.com/radar/lists#managing-list-items)
  """
  alias Stripe.Client

  @doc """
  Create a value list

  Creates a new `ValueList` object, which can then be referenced in rules.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Radar.ValueList.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v1/radar/value_lists", Keyword.merge(opts, params: params))
  end

  @doc """
  Delete a value list

  Deletes a `ValueList` object, also deleting any items contained within the value list. To be deleted, a value list must not be referenced in any rules.
  """
  @spec delete(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Radar.ValueList.t()} | {:error, Stripe.Error.t()}
  def delete(client, value_list, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :delete,
      "/v1/radar/value_lists/#{value_list}",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  List all value lists

  Returns a list of `ValueList` objects. The objects are sorted in descending order by creation date, with the most recently created object appearing first.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/radar/value_lists", Keyword.merge(opts, params: params))
  end

  @doc """
  Retrieve a value list

  Retrieves a `ValueList` object.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Radar.ValueList.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, value_list, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/radar/value_lists/#{value_list}",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Update a value list

  Updates a `ValueList` object by setting the values of the parameters passed. Any parameters not provided will be left unchanged. Note that `item_type` is immutable.
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Radar.ValueList.t()} | {:error, Stripe.Error.t()}
  def update(client, value_list, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/radar/value_lists/#{value_list}",
      Keyword.merge(opts, params: params)
    )
  end
end
