# File generated from our OpenAPI spec
defmodule Stripe.Services.Terminal.ConfigurationService do
  @moduledoc """
  TerminalConfigurationConfiguration

  A Configurations object represents how features should be configured for terminal readers.
  For information about how to use it, see the [Terminal configurations documentation](https://docs.stripe.com/terminal/fleet/configurations-overview).
  """
  alias Stripe.Client

  @doc """
  Create a Configuration

  Creates a new `Configuration` object.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Terminal.Configuration.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/terminal/configurations",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Delete a Configuration

  Deletes a `Configuration` object.
  """
  @spec delete(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Terminal.Configuration.t()} | {:error, Stripe.Error.t()}
  def delete(client, configuration, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :delete,
      "/v1/terminal/configurations/#{configuration}",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  List all Configurations

  Returns a list of `Configuration` objects.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/terminal/configurations",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Retrieve a Configuration

  Retrieves a `Configuration` object.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Terminal.Configuration.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, configuration, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/terminal/configurations/#{configuration}",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Update a Configuration

  Updates a new `Configuration` object.
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Terminal.Configuration.t()} | {:error, Stripe.Error.t()}
  def update(client, configuration, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/terminal/configurations/#{configuration}",
      Keyword.merge(opts, params: params)
    )
  end
end
