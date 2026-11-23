# File generated from our OpenAPI spec
defmodule Stripe.Services.TestHelpers.Treasury.ReceivedCreditService do
  @moduledoc """
  ReceivedCredit API operations.
  """
  alias Stripe.Client

  @doc """
  Test helper: Create a ReceivedCredit

  Simulates a test `ReceivedCredit` initiated by a third party. In live mode, you can’t directly create `ReceivedCredit` objects initiated by third parties.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Treasury.ReceivedCredit.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/test_helpers/treasury/received_credits",
      Keyword.merge(opts, params: params)
    )
  end
end
