# File generated from our OpenAPI spec
defmodule Stripe.Services.SourceTransactionService do
  @moduledoc """
  SourceTransaction

  Some payment methods have no required amount that a customer must send.
  Customers can be instructed to send any amount, and it can be made up of
  multiple transactions. As such, sources can have multiple associated
  transactions.
  """
  alias Stripe.Client

  @doc """
  List source transactions for a given source.
  """
  @spec source_transactions(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def source_transactions(client, source, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/sources/#{source}/source_transactions",
      Keyword.merge(opts, params: params)
    )
  end
end
