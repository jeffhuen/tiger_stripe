# File generated from our OpenAPI spec
defmodule Stripe.Services.SourceService do
  @moduledoc """
  Source

  `Source` objects allow you to accept a variety of payment methods. They
  represent a customer's payment instrument, and can be used with the Stripe API
  just like a `Card` object: once chargeable, they can be charged, or can be
  attached to customers.

  This API is deprecated. Use the [PaymentMethods API](https://docs.stripe.com/api/payment_methods) instead.

  Related guides: [Sources API](https://docs.stripe.com/sources) and [Sources & Customers](https://docs.stripe.com/sources/customers).
  """
  alias Stripe.Client

  @doc """
  Create a source

  Creates a new source object.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Source.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v1/sources", Keyword.merge(opts, params: params))
  end

  @doc """
  Retrieve a source

  Retrieves an existing source object. Supply the unique source ID from a source creation request and Stripe will return the corresponding up-to-date source object information.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Source.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, source, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/sources/#{source}", Keyword.merge(opts, params: params))
  end

  @doc """
  Update a source

  Updates the specified source by setting the values of the parameters passed. Any parameters not provided will be left unchanged.

  This request accepts the `metadata` and `owner` as arguments. It is also possible to update type specific information for selected payment methods. Please refer to our [payment method guides](https://docs.stripe.com/docs/sources) for more detail.
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Source.t()} | {:error, Stripe.Error.t()}
  def update(client, source, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v1/sources/#{source}", Keyword.merge(opts, params: params))
  end

  @doc """
  Verify a given source.
  """
  @spec verify(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Source.t()} | {:error, Stripe.Error.t()}
  def verify(client, source, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/sources/#{source}/verify",
      Keyword.merge(opts, params: params)
    )
  end
end
