# File generated from our OpenAPI spec
defmodule Stripe.Services.Treasury.OutboundPaymentService do
  @moduledoc """
  TreasuryOutboundPaymentsResourceOutboundPayment

  Use [OutboundPayments](https://docs.stripe.com/docs/treasury/moving-money/financial-accounts/out-of/outbound-payments) to send funds to another party's external bank account or [FinancialAccount](https://api.stripe.com#financial_accounts). To send money to an account belonging to the same user, use an [OutboundTransfer](https://api.stripe.com#outbound_transfers).

  Simulate OutboundPayment state changes with the `/v1/test_helpers/treasury/outbound_payments` endpoints. These methods can only be called on test mode objects.

  Related guide: [Moving money with Treasury using OutboundPayment objects](https://docs.stripe.com/docs/treasury/moving-money/financial-accounts/out-of/outbound-payments)
  """
  alias Stripe.Client

  @doc """
  Cancel an OutboundPayment

  Cancel an OutboundPayment.
  """
  @spec cancel(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Treasury.OutboundPayment.t()} | {:error, Stripe.Error.t()}
  def cancel(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/treasury/outbound_payments/#{id}/cancel",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Create an OutboundPayment

  Creates an OutboundPayment.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Treasury.OutboundPayment.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/treasury/outbound_payments",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  List all OutboundPayments

  Returns a list of OutboundPayments sent from the specified FinancialAccount.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/treasury/outbound_payments",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Retrieve an OutboundPayment

  Retrieves the details of an existing OutboundPayment by passing the unique OutboundPayment ID from either the OutboundPayment creation request or OutboundPayment list.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Treasury.OutboundPayment.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/treasury/outbound_payments/#{id}",
      Keyword.merge(opts, params: params)
    )
  end
end
