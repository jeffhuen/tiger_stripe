# File generated from our OpenAPI spec
defmodule Stripe.Services.Tax.LocationService do
  @moduledoc """
  Tax location

  Tax locations represent venues for services, tickets, or other product types.
  """
  alias Stripe.Client

  @doc """
  Create a tax location

  Create a tax location to use in calculating taxes for a service, ticket, or other type of product. The resulting object contains the ID, address, type, and description of the tax location.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Tax.Location.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v1/tax/locations", Keyword.merge(opts, params: params))
  end

  @doc """
  List tax locations

  Retrieve a list of all tax locations. Tax locations can represent the venues for services, tickets, or other product types.

  The response includes detailed information for each tax location, such as its address, type, and description.

  You can paginate through the list by using the `limit` parameter to control the number of results returned in each request.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/tax/locations", Keyword.merge(opts, params: params))
  end

  @doc """
  Retrieve a tax location

  Fetch the details of a specific tax location using its unique identifier. Use a tax location to calculate taxes based on the location of the end product, such as a performance, instead of the customer address. For more details, check the [integration guide](https://docs.stripe.com/tax/tax-for-tickets/integration-guide).
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Tax.Location.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, location, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/tax/locations/#{location}",
      Keyword.merge(opts, params: params)
    )
  end
end
