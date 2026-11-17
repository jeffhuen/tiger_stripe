# File generated from our OpenAPI spec
defmodule Stripe.Services.V2.MoneyManagement.InboundTransferService do
  @moduledoc """
  Inbound Transfer

  An InboundTransfer object, representing a money movement from a
  user owned PaymentMethod to a FinancialAccount belonging to the same user.
  """
  alias Stripe.Client

  @doc """
  Create an Inbound Transfer

  Creates an InboundTransfer to pull funds from a bank account into a financial account. Per-transfer and rolling weekly limits vary by account and payment rail. See [transfer limits](https://stripe.com/treasury/add-funds#transfer-limits).
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.V2.MoneyManagement.InboundTransfer.t()}
          | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v2/money_management/inbound_transfers",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end

  @doc """
  List Inbound Transfers

  Retrieves a list of InboundTransfers.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.V2.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v2/money_management/inbound_transfers",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end

  @doc """
  Retrieve an Inbound Transfer

  Retrieve an InboundTransfer by ID.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.V2.MoneyManagement.InboundTransfer.t()}
          | {:error, Stripe.Error.t()}
  def retrieve(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v2/money_management/inbound_transfers/#{id}",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end
end
