# File generated from our OpenAPI spec
defmodule Stripe.Services.BalanceService do
  @moduledoc """
  Balance

  This is an object representing your Stripe balance. You can retrieve it to see
  the balance currently on your Stripe account.

  The top-level `available` and `pending` comprise your "payments balance."

  Related guide: [Balances and settlement time](https://docs.stripe.com/payments/balances), [Understanding Connect account balances](https://docs.stripe.com/connect/account-balances)
  """
  alias Stripe.Client

  @doc """
  Retrieve balance

  Retrieves the current account balance, based on the authentication that was used to make the request.
  For a sample request, see [Accounting for negative balances](https://docs.stripe.com/docs/connect/account-balances#accounting-for-negative-balances).
  """
  @spec retrieve(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Balance.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/balance", Keyword.merge(opts, params: params))
  end
end
