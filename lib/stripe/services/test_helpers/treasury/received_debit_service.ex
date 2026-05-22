# File generated from our OpenAPI spec
defmodule Stripe.Services.TestHelpers.Treasury.ReceivedDebitService do
  @moduledoc """
  ReceivedDebit API operations.
  """
  alias Stripe.Client

  @doc """
  Test mode: Create a ReceivedDebit

  Use this endpoint to simulate a test mode ReceivedDebit initiated by a third party. In live mode, you can’t directly create ReceivedDebits initiated by third parties.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Treasury.ReceivedDebit.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/test_helpers/treasury/received_debits",
      Keyword.merge(opts, params: params)
    )
  end
end
