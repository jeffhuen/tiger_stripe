# File generated from our OpenAPI spec
defmodule Stripe.Services.Treasury.InboundTransferService do
  @moduledoc """
  TreasuryInboundTransfersResourceInboundTransfer

  Use [InboundTransfers](https://docs.stripe.com/docs/treasury/moving-money/financial-accounts/into/inbound-transfers) to add funds to your [FinancialAccount](https://api.stripe.com#financial_accounts) via a PaymentMethod that is owned by you. The funds will be transferred via an ACH debit.

  Related guide: [Moving money with Treasury using InboundTransfer objects](https://docs.stripe.com/docs/treasury/moving-money/financial-accounts/into/inbound-transfers)
  """
  alias Stripe.Client

  @doc """
  Cancel an InboundTransfer

  Cancels an InboundTransfer.
  """
  @spec cancel(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Treasury.InboundTransfer.t()} | {:error, Stripe.Error.t()}
  def cancel(client, inbound_transfer, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/treasury/inbound_transfers/#{inbound_transfer}/cancel",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Create an InboundTransfer

  Creates an InboundTransfer.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Treasury.InboundTransfer.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/treasury/inbound_transfers",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  List all InboundTransfers

  Returns a list of InboundTransfers sent from the specified FinancialAccount.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/treasury/inbound_transfers",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Retrieve an InboundTransfer

  Retrieves the details of an existing InboundTransfer.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Treasury.InboundTransfer.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/treasury/inbound_transfers/#{id}",
      Keyword.merge(opts, params: params)
    )
  end
end
