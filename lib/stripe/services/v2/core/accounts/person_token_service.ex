# File generated from our OpenAPI spec
defmodule Stripe.Services.V2.Core.Accounts.PersonTokenService do
  @moduledoc """
  PersonToken API operations.
  """
  alias Stripe.Client

  @doc """
  Create a Person Token

  Creates a Person Token associated with an Account.
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
  def create(client, account_id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v2/core/accounts/#{account_id}/person_tokens",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end

  @doc """
  Retrieve a Person Token

  Retrieves a Person Token associated with an Account.
  """
  @spec retrieve(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
  def retrieve(client, account_id, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v2/core/accounts/#{account_id}/person_tokens/#{id}",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end
end
