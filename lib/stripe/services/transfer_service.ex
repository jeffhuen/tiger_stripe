# File generated from our OpenAPI spec
defmodule Stripe.Services.TransferService do
  @moduledoc """
  Transfer

  A `Transfer` object is created when you move funds between Stripe accounts as
  part of Connect.

  Before April 6, 2017, transfers also represented movement of funds from a
  Stripe account to a card or bank account. This behavior has since been split
  out into a [Payout](https://api.stripe.com#payout_object) object, with corresponding payout endpoints. For more
  information, read about the
  [transfer/payout split](https://docs.stripe.com/transfer-payout-split).

  Related guide: [Creating separate charges and transfers](https://docs.stripe.com/connect/separate-charges-and-transfers)
  """
  alias Stripe.Client

  @doc """
  Create a transfer

  To send funds from your Stripe account to a connected account, you create a new transfer object. Your [Stripe balance](#balance) must be able to cover the transfer amount, or you’ll receive an “Insufficient Funds” error.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Transfer.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v1/transfers", Keyword.merge(opts, params: params))
  end

  @doc """
  List all transfers

  Returns a list of existing transfers sent to connected accounts. The transfers are returned in sorted order, with the most recently created transfers appearing first.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/transfers", Keyword.merge(opts, params: params))
  end

  @doc """
  Retrieve a transfer

  Retrieves the details of an existing transfer. Supply the unique transfer ID from either a transfer creation request or the transfer list, and Stripe will return the corresponding transfer information.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Transfer.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, transfer, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/transfers/#{transfer}", Keyword.merge(opts, params: params))
  end

  @doc """
  Update a transfer

  Updates the specified transfer by setting the values of the parameters passed. Any parameters not provided will be left unchanged.

  This request accepts only metadata as an argument.
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Transfer.t()} | {:error, Stripe.Error.t()}
  def update(client, transfer, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/transfers/#{transfer}",
      Keyword.merge(opts, params: params)
    )
  end
end
