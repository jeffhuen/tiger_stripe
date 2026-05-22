# File generated from our OpenAPI spec
defmodule Stripe.Services.BalanceSettingsService do
  @moduledoc """
  BalanceSettingsResourceBalanceSettings

  Options for customizing account balances and payout settings for a Stripe platform’s connected accounts.
  """
  alias Stripe.Client

  @doc """
  Retrieve balance settings

  Retrieves balance settings for a given connected account.
  Related guide: [Making API calls for connected accounts](https://stripe.com/connect/authentication)
  """
  @spec retrieve(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.BalanceSettings.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/balance_settings", Keyword.merge(opts, params: params))
  end

  @doc """
  Update balance settings

  Updates balance settings for a given connected account.
  Related guide: [Making API calls for connected accounts](https://stripe.com/connect/authentication)
  """
  @spec update(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.BalanceSettings.t()} | {:error, Stripe.Error.t()}
  def update(client, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v1/balance_settings", Keyword.merge(opts, params: params))
  end
end
