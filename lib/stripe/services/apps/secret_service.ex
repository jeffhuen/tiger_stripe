# File generated from our OpenAPI spec
defmodule Stripe.Services.Apps.SecretService do
  @moduledoc """
  SecretServiceResourceSecret

  Secret Store is an API that allows Stripe Apps developers to securely persist secrets for use by UI Extensions and app backends.

  The primary resource in Secret Store is a `secret`. Other apps can't view secrets created by an app. Additionally, secrets are scoped to provide further permission control.

  All Dashboard users and the app backend share `account` scoped secrets. Use the `account` scope for secrets that don't change per-user, like a third-party API key.

  A `user` scoped secret is accessible by the app backend and one specific Dashboard user. Use the `user` scope for per-user secrets like per-user OAuth tokens, where different users might have different permissions.

  Related guide: [Store data between page reloads](https://docs.stripe.com/stripe-apps/store-auth-data-custom-objects)
  """
  alias Stripe.Client

  @doc """
  Set a Secret

  Create or replace a secret in the secret store.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Apps.Secret.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v1/apps/secrets", Keyword.merge(opts, params: params))
  end

  @doc """
  Delete a Secret

  Deletes a secret from the secret store by name and scope.
  """
  @spec delete_where(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Apps.Secret.t()} | {:error, Stripe.Error.t()}
  def delete_where(client, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v1/apps/secrets/delete", Keyword.merge(opts, params: params))
  end

  @doc """
  Find a Secret

  Finds a secret in the secret store by name and scope.
  """
  @spec find(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Apps.Secret.t()} | {:error, Stripe.Error.t()}
  def find(client, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/apps/secrets/find", Keyword.merge(opts, params: params))
  end

  @doc """
  List secrets

  List all secrets stored on the given scope.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/apps/secrets", Keyword.merge(opts, params: params))
  end
end
