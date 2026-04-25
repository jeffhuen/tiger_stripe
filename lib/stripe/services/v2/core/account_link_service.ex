# File generated from our OpenAPI spec
defmodule Stripe.Services.V2.Core.AccountLinkService do
  @moduledoc """
  Account Link

  Account Links let a platform create a temporary, single-use URL that an account can use to access a Stripe-hosted flow for collecting or updating required information.
  """
  alias Stripe.Client

  @doc """
  Create an Account Link

  Creates an AccountLink object that includes a single-use URL that an account can use to access a Stripe-hosted flow for collecting or updating required information.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v2/core/account_links",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end
end
