# File generated from our OpenAPI spec
defmodule Stripe.Services.TransferReversalService do
  @moduledoc """
  TransferReversal

  [Stripe Connect](https://docs.stripe.com/connect) platforms can reverse transfers made to a
  connected account, either entirely or partially, and can also specify whether
  to refund any related application fees. Transfer reversals add to the
  platform's balance and subtract from the destination account's balance.

  Reversing a transfer that was made for a [destination
  charge](https://docs.stripe.com/docs/connect/destination-charges) is allowed only up to the amount of
  the charge. It is possible to reverse a
  [transfer_group](https://docs.stripe.com/connect/separate-charges-and-transfers#transfer-options)
  transfer only if the destination account has enough balance to cover the
  reversal.

  Related guide: [Reverse transfers](https://docs.stripe.com/connect/separate-charges-and-transfers#reverse-transfers)
  """
  alias Stripe.Client

  @doc """
  Create a transfer reversal

  When you create a new reversal, you must specify a transfer to create it on.

  When reversing transfers, you can optionally reverse part of the transfer. You can do so as many times as you wish until the entire transfer has been reversed.

  Once entirely reversed, a transfer can’t be reversed again. This method will return an error when called on an already-reversed transfer, or when trying to reverse more money than is left on a transfer.
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.TransferReversal.t()} | {:error, Stripe.Error.t()}
  def create(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/transfers/#{id}/reversals",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  List all reversals

  You can see a list of the reversals belonging to a specific transfer. Note that the 10 most recent reversals are always available by default on the transfer object. If you need more than those 10, you can use this API method and the `limit` and `starting_after` parameters to page through additional reversals.
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/transfers/#{id}/reversals",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Retrieve a reversal

  By default, you can see the 10 most recent reversals stored directly on the transfer object, but you can also retrieve details about a specific reversal stored on the transfer.
  """
  @spec retrieve(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.TransferReversal.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, transfer, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/transfers/#{transfer}/reversals/#{id}",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Update a reversal

  Updates the specified reversal by setting the values of the parameters passed. Any parameters not provided will be left unchanged.

  This request only accepts metadata and description as arguments.
  """
  @spec update(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.TransferReversal.t()} | {:error, Stripe.Error.t()}
  def update(client, transfer, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/transfers/#{transfer}/reversals/#{id}",
      Keyword.merge(opts, params: params)
    )
  end
end
