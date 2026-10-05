# File generated from our OpenAPI spec
defmodule Stripe.Services.Apps.InstallService do
  @moduledoc """
  App Install

  An app install represents a Stripe App that is installed on an account. It reports the permissions,
  content security policy entries, and endpoints that the installing account has authorized, along with any
  that the app's latest version requests but the account has not authorized yet. Use the Install API to
  install, reauthorize, and uninstall apps, and to check the state of existing installs.
  """
  alias Stripe.Client

  @doc """
  Create an app install

  Creates an app install. An account installs its own private app with its own key; public and testing installs are made from the Dashboard. An app developer or embedding platform acting on a connected account through `Stripe-Account` installs or reinstalls its app there. For a private app, creating an install installs the newest completed upload; when that version is already installed with nothing pending, the existing install is returned.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Apps.Install.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v1/apps/installs", Keyword.merge(opts, params: params))
  end

  @doc """
  List all app installs

  Returns a list of app installs. An app developer or embedding platform filtering by its own app sees the installs across the accounts that installed it; other callers see the installs on their own account. The key selects the environment: a live key lists live installs, a sandbox API key lists the installs on that sandbox, and the key of an app’s managed sandbox filtering by `app` lists that app’s installs across every sandbox. For existing accounts that still use legacy test mode, a test mode key lists legacy test mode installs.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/apps/installs", Keyword.merge(opts, params: params))
  end

  @doc """
  Retrieve an app install

  Retrieves an app install. The installing account, the app’s developer (with the keys of the account that owns the app or of the app’s managed sandbox), and the embedding platform that created the install can retrieve it.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Apps.Install.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, id, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/apps/installs/#{id}", Keyword.merge(opts, params: params))
  end

  @doc """
  Uninstall an app install

  Uninstalls an app from the account that installed it.
  """
  @spec uninstall(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Apps.Install.t()} | {:error, Stripe.Error.t()}
  def uninstall(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/apps/installs/#{id}/uninstall",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Update an app install

  Reauthorizes an app install. The installer grants the permissions, content security policy entries, and endpoints that the version being installed requests. An account reauthorizes its own installs on any channel with its own key; app developers and embedding platforms reauthorize installs on connected accounts through `Stripe-Account`. For private apps, the version being installed is the newest completed upload.
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Apps.Install.t()} | {:error, Stripe.Error.t()}
  def update(client, id, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v1/apps/installs/#{id}", Keyword.merge(opts, params: params))
  end
end
