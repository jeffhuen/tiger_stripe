# File generated from our OpenAPI spec
defmodule Stripe.Services.Treasury.CreditReversalService do
  @moduledoc """
  TreasuryReceivedCreditsResourceCreditReversal

  You can reverse some [ReceivedCredits](https://api.stripe.com#received_credits) depending on their network and source flow. Reversing a ReceivedCredit leads to the creation of a new object known as a CreditReversal.
  """
  alias Stripe.Client

  @doc """
  Create a CreditReversal

  Reverses a ReceivedCredit and creates a CreditReversal object.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Treasury.CreditReversal.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/treasury/credit_reversals",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  List all CreditReversals

  Returns a list of CreditReversals.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/treasury/credit_reversals",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Retrieve a CreditReversal

  Retrieves the details of an existing CreditReversal by passing the unique CreditReversal ID from either the CreditReversal creation request or CreditReversal list
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Treasury.CreditReversal.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, credit_reversal, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/treasury/credit_reversals/#{credit_reversal}",
      Keyword.merge(opts, params: params)
    )
  end
end
