# File generated from our OpenAPI spec
defmodule Stripe.Services.AccountSessionService do
  @moduledoc """
  ConnectEmbeddedMethodAccountSessionCreateMethodAccountSession

  An AccountSession allows a Connect platform to grant access to a connected account in Connect embedded components.

  We recommend that you create an AccountSession each time you need to display an embedded component
  to your user. Do not save AccountSessions to your database as they expire relatively
  quickly, and cannot be used more than once.

  Related guide: [Connect embedded components](https://docs.stripe.com/connect/get-started-connect-embedded-components)
  """
  alias Stripe.Client

  @doc """
  Create an Account Session

  Creates a AccountSession object that includes a single-use token that the platform can use on their front-end to grant client-side API access.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.AccountSession.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v1/account_sessions", Keyword.merge(opts, params: params))
  end
end
