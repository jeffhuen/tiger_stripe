# File generated from our OpenAPI spec
defmodule Stripe.Services.Treasury.ReceivedCreditService do
  @moduledoc """
  TreasuryReceivedCreditsResourceReceivedCredit

  ReceivedCredits represent funds sent to a [FinancialAccount](https://api.stripe.com#financial_accounts) (for example, via ACH or wire). These money movements are not initiated from the FinancialAccount.
  """
  alias Stripe.Client

  @doc """
  List all ReceivedCredits

  Returns a list of ReceivedCredits.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/treasury/received_credits",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Retrieve a ReceivedCredit

  Retrieves the details of an existing ReceivedCredit by passing the unique ReceivedCredit ID from the ReceivedCredit list.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Treasury.ReceivedCredit.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/treasury/received_credits/#{id}",
      Keyword.merge(opts, params: params)
    )
  end
end
