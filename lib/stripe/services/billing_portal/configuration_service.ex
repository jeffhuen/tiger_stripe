# File generated from our OpenAPI spec
defmodule Stripe.Services.BillingPortal.ConfigurationService do
  @moduledoc """
  PortalConfiguration

  A portal configuration describes the functionality and behavior you embed in a portal session. Related guide: [Configure the customer portal](https://stripe.com/customer-management/configure-portal).
  """
  alias Stripe.Client

  @doc """
  Create a portal configuration

  Creates a configuration that describes the functionality and behavior of a PortalSession
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.BillingPortal.Configuration.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/billing_portal/configurations",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  List portal configurations

  Returns a list of configurations that describe the functionality of the customer portal.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/billing_portal/configurations",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Retrieve a portal configuration

  Retrieves a configuration that describes the functionality of the customer portal.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.BillingPortal.Configuration.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, configuration, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/billing_portal/configurations/#{configuration}",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Update a portal configuration

  Updates a configuration that describes the functionality of the customer portal.
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.BillingPortal.Configuration.t()} | {:error, Stripe.Error.t()}
  def update(client, configuration, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/billing_portal/configurations/#{configuration}",
      Keyword.merge(opts, params: params)
    )
  end
end
