# File generated from our OpenAPI spec
defmodule Stripe.Services.FinancialConnections.AccountOwnerService do
  @moduledoc """
  BankConnectionsResourceOwner

  Describes an owner of an account.
  """
  alias Stripe.Client

  @doc """
  List Account Owners

  Lists all owners for a given `Account`
  """
  @spec list_owners(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list_owners(client, account, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/financial_connections/accounts/#{account}/owners",
      Keyword.merge(opts, params: params)
    )
  end
end
