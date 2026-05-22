# File generated from our OpenAPI spec
defmodule Stripe.Services.Treasury.FinancialAccountFeaturesService do
  @moduledoc """
  TreasuryFinancialAccountsResourceFinancialAccountFeatures

  Encodes whether a FinancialAccount has access to a particular Feature, with a `status` enum and associated `status_details`.
  Stripe or the platform can control Features via the requested field.
  """
  alias Stripe.Client

  @doc """
  Retrieve FinancialAccount Features

  Retrieves Features information associated with the FinancialAccount.
  """
  @spec retrieve_features(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Treasury.FinancialAccountFeatures.t()}
          | {:error, Stripe.Error.t()}
  def retrieve_features(client, financial_account, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/treasury/financial_accounts/#{financial_account}/features",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Update FinancialAccount Features

  Updates the Features associated with a FinancialAccount.
  """
  @spec update_features(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Treasury.FinancialAccountFeatures.t()}
          | {:error, Stripe.Error.t()}
  def update_features(client, financial_account, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/treasury/financial_accounts/#{financial_account}/features",
      Keyword.merge(opts, params: params)
    )
  end
end
