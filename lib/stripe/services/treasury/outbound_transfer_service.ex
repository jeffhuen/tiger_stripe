# File generated from our OpenAPI spec
defmodule Stripe.Services.Treasury.OutboundTransferService do
  @moduledoc """
  TreasuryOutboundTransfersResourceOutboundTransfer

  Use [OutboundTransfers](https://docs.stripe.com/docs/treasury/moving-money/financial-accounts/out-of/outbound-transfers) to transfer funds from a [FinancialAccount](https://api.stripe.com#financial_accounts) to a PaymentMethod belonging to the same entity. To send funds to a different party, use [OutboundPayments](https://api.stripe.com#outbound_payments) instead. You can send funds over ACH rails or through a domestic wire transfer to a user's own external bank account.

  Simulate OutboundTransfer state changes with the `/v1/test_helpers/treasury/outbound_transfers` endpoints. These methods can only be called on test mode objects.

  Related guide: [Moving money with Treasury using OutboundTransfer objects](https://docs.stripe.com/docs/treasury/moving-money/financial-accounts/out-of/outbound-transfers)
  """
  alias Stripe.Client

  @doc """
  Cancel an OutboundTransfer

  An OutboundTransfer can be canceled if the funds have not yet been paid out.
  """
  @spec cancel(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Treasury.OutboundTransfer.t()} | {:error, Stripe.Error.t()}
  def cancel(client, outbound_transfer, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/treasury/outbound_transfers/#{outbound_transfer}/cancel",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Create an OutboundTransfer

  Creates an OutboundTransfer.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Treasury.OutboundTransfer.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/treasury/outbound_transfers",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  List all OutboundTransfers

  Returns a list of OutboundTransfers sent from the specified FinancialAccount.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/treasury/outbound_transfers",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Retrieve an OutboundTransfer

  Retrieves the details of an existing OutboundTransfer by passing the unique OutboundTransfer ID from either the OutboundTransfer creation request or OutboundTransfer list.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Treasury.OutboundTransfer.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, outbound_transfer, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/treasury/outbound_transfers/#{outbound_transfer}",
      Keyword.merge(opts, params: params)
    )
  end
end
