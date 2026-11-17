# File generated from our OpenAPI spec
defmodule Stripe.Services.TestHelpers.CustomerService do
  @moduledoc """
  Customer API operations.
  """
  alias Stripe.Client

  @doc """
  Fund a cash balance in sandbox

  Create a test incoming bank transfer
  """
  @spec fund_cash_balance(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.CustomerCashBalanceTransaction.t()} | {:error, Stripe.Error.t()}
  def fund_cash_balance(client, customer, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/test_helpers/customers/#{customer}/fund_cash_balance",
      Keyword.merge(opts, params: params)
    )
  end
end
