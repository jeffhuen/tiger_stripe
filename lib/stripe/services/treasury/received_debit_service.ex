# File generated from our OpenAPI spec
defmodule Stripe.Services.Treasury.ReceivedDebitService do
  @moduledoc """
  ReceivedDebit

  Legacy ReceivedDebits are part of the v1 version of Treasury for platforms and do not support many of the features introduced in [Treasury for platforms v2](https://docs.stripe.com/treasury/connect). Use [Received Debits](https://docs.stripe.com/api/v2/money-management/received-debits?api-version=preview) instead of building a new v1 integration.

  ReceivedDebits represent funds pulled from a [FinancialAccount](https://docs.stripe.com/api#financial_accounts). These are not initiated from the FinancialAccount.
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
