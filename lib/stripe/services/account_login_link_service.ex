# File generated from our OpenAPI spec
defmodule Stripe.Services.AccountLoginLinkService do
  @moduledoc """
  AccountLoginLink API operations.
  """
  alias Stripe.Client

  @doc """
  Create a login link

  Creates a login link for a connected account to access the Express Dashboard.

  **You can only create login links for accounts that use the [Express Dashboard](https://stripe.com/connect/express-dashboard) and are connected to your platform**.
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.LoginLink.t()} | {:error, Stripe.Error.t()}
  def create(client, account, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/accounts/#{account}/login_links",
      Keyword.merge(opts, params: params)
    )
  end
end
