# File generated from our OpenAPI spec
defmodule Stripe.Services.Terminal.LocationService do
  @moduledoc """
  TerminalLocationLocation

  A Location represents a grouping of readers.

  Related guide: [Fleet management](https://docs.stripe.com/terminal/fleet/locations)
  """
  alias Stripe.Client

  @doc """
  Create a Location

  Creates a new `Location` object.
  For further details, including which address fields are required in each country, see the [Manage locations](https://docs.stripe.com/docs/terminal/fleet/locations) guide.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Terminal.Location.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v1/terminal/locations", Keyword.merge(opts, params: params))
  end

  @doc """
  Delete a Location

  Deletes a `Location` object.
  """
  @spec delete(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Terminal.Location.t()} | {:error, Stripe.Error.t()}
  def delete(client, location, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :delete,
      "/v1/terminal/locations/#{location}",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  List all Locations

  Returns a list of `Location` objects.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/terminal/locations", Keyword.merge(opts, params: params))
  end

  @doc """
  Retrieve a Location

  Retrieves a `Location` object.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Terminal.Location.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, location, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/terminal/locations/#{location}",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Update a Location

  Updates a `Location` object by setting the values of the parameters passed. Any parameters not provided will be left unchanged.
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Terminal.Location.t()} | {:error, Stripe.Error.t()}
  def update(client, location, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/terminal/locations/#{location}",
      Keyword.merge(opts, params: params)
    )
  end
end
