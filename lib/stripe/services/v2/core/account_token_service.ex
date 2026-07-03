# File generated from our OpenAPI spec
defmodule Stripe.Services.V2.Core.AccountTokenService do
  @moduledoc """
  Account Token

  Account tokens are single-use tokens which tokenize an account's contact_email, display_name, contact_phone, and identity.
  """
  alias Stripe.Client

  @doc """
  Create an account token

  Create an account token with a publishable key and pass it to the Accounts v2 API to
  create or update an account without its data touching your server.
  Learn more about [account tokens](https://docs.stripe.com/connect/account-tokens).
  In live mode, you can only create account tokens with your application's publishable key.
  In test mode, you can create account tokens with your secret key or publishable key.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.V2.Core.AccountToken.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v2/core/account_tokens",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end

  @doc """
  Retrieve an account token

  Retrieves an Account Token.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.V2.Core.AccountToken.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v2/core/account_tokens/#{id}",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end
end
