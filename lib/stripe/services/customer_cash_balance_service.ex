# File generated from our OpenAPI spec
defmodule Stripe.Services.CustomerCashBalanceService do
  @moduledoc """
  CustomerCashBalance API operations.
  """
  alias Stripe.Client

  @doc """
  Retrieve a cash balance

  Retrieves a customer’s cash balance.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.CashBalance.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, customer, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/customers/#{customer}/cash_balance",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Update a cash balance's settings

  Changes the settings on a customer’s cash balance.
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.CashBalance.t()} | {:error, Stripe.Error.t()}
  def update(client, customer, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/customers/#{customer}/cash_balance",
      Keyword.merge(opts, params: params)
    )
  end
end
