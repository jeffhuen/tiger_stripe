# File generated from our OpenAPI spec
defmodule Stripe.Services.Tax.SettingsService do
  @moduledoc """
  TaxProductResourceTaxSettings

  You can use Tax `Settings` to manage configurations used by Stripe Tax calculations.

  Related guide: [Using the Settings API](https://docs.stripe.com/tax/settings-api)
  """
  alias Stripe.Client

  @doc """
  Retrieve settings

  Retrieves Tax `Settings` for a merchant.
  """
  @spec retrieve(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Tax.Settings.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/tax/settings", Keyword.merge(opts, params: params))
  end

  @doc """
  Update settings

  Updates Tax `Settings` parameters used in tax calculations. All parameters are editable but none can be removed once set.
  """
  @spec update(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Tax.Settings.t()} | {:error, Stripe.Error.t()}
  def update(client, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v1/tax/settings", Keyword.merge(opts, params: params))
  end
end
