# File generated from our OpenAPI spec
defmodule Stripe.Services.V2.Core.AccountTokenService do
  @moduledoc """
  Account Token

  Account tokens are single-use tokens which tokenize company/individual/business information, and are used for creating or updating an Account.
  """
  alias Stripe.Client

  @doc """
  Create an account token

  Creates an Account Token.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
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
          {:ok, term()} | {:error, Stripe.Error.t()}
  def retrieve(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v2/core/account_tokens/#{id}",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end
end
