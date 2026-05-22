# File generated from our OpenAPI spec
defmodule Stripe.Services.Terminal.ConnectionTokenService do
  @moduledoc """
  TerminalConnectionToken

  A Connection Token is used by the Stripe Terminal SDK to connect to a reader.

  Related guide: [Fleet management](https://docs.stripe.com/terminal/fleet/locations)
  """
  alias Stripe.Client

  @doc """
  Create a Connection Token

  To connect to a reader the Stripe Terminal SDK needs to retrieve a short-lived connection token from Stripe, proxied through your server. On your backend, add an endpoint that creates and returns a connection token.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Terminal.ConnectionToken.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/terminal/connection_tokens",
      Keyword.merge(opts, params: params)
    )
  end
end
