# File generated from our OpenAPI spec
defmodule Stripe.Services.Treasury.DebitReversalService do
  @moduledoc """
  TreasuryReceivedDebitsResourceDebitReversal

  You can reverse some [ReceivedDebits](https://api.stripe.com#received_debits) depending on their network and source flow. Reversing a ReceivedDebit leads to the creation of a new object known as a DebitReversal.
  """
  alias Stripe.Client

  @doc """
  Create a DebitReversal

  Reverses a ReceivedDebit and creates a DebitReversal object.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Treasury.DebitReversal.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/treasury/debit_reversals",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  List all DebitReversals

  Returns a list of DebitReversals.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/treasury/debit_reversals",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Retrieve a DebitReversal

  Retrieves a DebitReversal object.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Treasury.DebitReversal.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, debit_reversal, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/treasury/debit_reversals/#{debit_reversal}",
      Keyword.merge(opts, params: params)
    )
  end
end
