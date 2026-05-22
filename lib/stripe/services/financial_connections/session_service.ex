# File generated from our OpenAPI spec
defmodule Stripe.Services.FinancialConnections.SessionService do
  @moduledoc """
  BankConnectionsResourceLinkAccountSession

  A Financial Connections Session is the secure way to programmatically launch the client-side Stripe.js modal that lets your users link their accounts.
  """
  alias Stripe.Client

  @doc """
  Create a Session

  To launch the Financial Connections authorization flow, create a `Session`. The session’s `client_secret` can be used to launch the flow using Stripe.js.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.FinancialConnections.Session.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/financial_connections/sessions",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Retrieve a Session

  Retrieves the details of a Financial Connections `Session`
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.FinancialConnections.Session.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, session, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/financial_connections/sessions/#{session}",
      Keyword.merge(opts, params: params)
    )
  end
end
