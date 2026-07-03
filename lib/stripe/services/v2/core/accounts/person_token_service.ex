# File generated from our OpenAPI spec
defmodule Stripe.Services.V2.Core.Accounts.PersonTokenService do
  @moduledoc """
  PersonToken API operations.
  """
  alias Stripe.Client

  @doc """
  Create a person token

  Creates a single-use token that represents the details for a person. Use this when you create or update persons associated with an Account v2. Learn more about [account tokens](https://docs.stripe.com/connect/account-tokens).
  You can only create person tokens with your application's publishable key and in live mode. You can use your application's secret key to create person tokens only in test mode.
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.V2.Core.AccountPersonToken.t()} | {:error, Stripe.Error.t()}
  def create(client, account_id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v2/core/accounts/#{account_id}/person_tokens",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end

  @doc """
  Retrieve a person token

  Retrieves a Person Token associated with an Account.
  """
  @spec retrieve(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.V2.Core.AccountPersonToken.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, account_id, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v2/core/accounts/#{account_id}/person_tokens/#{id}",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end
end
