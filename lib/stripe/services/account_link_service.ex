# File generated from our OpenAPI spec
defmodule Stripe.Services.AccountLinkService do
  @moduledoc """
  AccountLink

  Account Links are the means by which a Connect platform grants a connected account permission to access
  Stripe-hosted applications, such as Connect Onboarding.

  Related guide: [Connect Onboarding](https://docs.stripe.com/connect/custom/hosted-onboarding)
  """
  alias Stripe.Client

  @doc """
  Create an account link

  Creates an AccountLink object that includes a single-use Stripe URL that the platform can redirect their user to in order to take them through the Connect Onboarding flow.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.AccountLink.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v1/account_links", Keyword.merge(opts, params: params))
  end
end
