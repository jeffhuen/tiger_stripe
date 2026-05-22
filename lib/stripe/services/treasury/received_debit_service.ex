# File generated from our OpenAPI spec
defmodule Stripe.Services.Treasury.ReceivedDebitService do
  @moduledoc """
  TreasuryReceivedDebitsResourceReceivedDebit

  ReceivedDebits represent funds pulled from a [FinancialAccount](https://api.stripe.com#financial_accounts). These are not initiated from the FinancialAccount.
  """
  alias Stripe.Client

  @doc """
  List all ReceivedDebits

  Returns a list of ReceivedDebits.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/treasury/received_debits",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Retrieve a ReceivedDebit

  Retrieves the details of an existing ReceivedDebit by passing the unique ReceivedDebit ID from the ReceivedDebit list
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Treasury.ReceivedDebit.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/treasury/received_debits/#{id}",
      Keyword.merge(opts, params: params)
    )
  end
end
