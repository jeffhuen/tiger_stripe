# File generated from our OpenAPI spec
defmodule Stripe.Services.V2.MoneyManagement.OutboundPaymentService do
  @moduledoc """
  Outbound Payment

  OutboundPayment represents a single money movement from one FinancialAccount you own to a payout method someone else owns.
  """
  alias Stripe.Client

  @doc """
  Cancel an Outbound Payment

  Cancels an OutboundPayment. Only processing OutboundPayments can be canceled.
  """
  @spec cancel(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.V2.MoneyManagement.OutboundPayment.t()}
          | {:error, Stripe.Error.t()}
  def cancel(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v2/money_management/outbound_payments/#{id}/cancel",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end

  @doc """
  Create an Outbound Payment

  Creates an OutboundPayment.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.V2.MoneyManagement.OutboundPayment.t()}
          | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v2/money_management/outbound_payments",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end

  @doc """
  List Outbound Payments

  Returns a list of OutboundPayments that match the provided filters.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.V2.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v2/money_management/outbound_payments",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end

  @doc """
  Retrieve an Outbound Payment

  Retrieves the details of an existing OutboundPayment by passing the unique OutboundPayment ID from either the OutboundPayment create or list response.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.V2.MoneyManagement.OutboundPayment.t()}
          | {:error, Stripe.Error.t()}
  def retrieve(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v2/money_management/outbound_payments/#{id}",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end
end
