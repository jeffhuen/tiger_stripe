# File generated from our OpenAPI spec
defmodule Stripe.Services.Climate.ProductService do
  @moduledoc """
  ClimateRemovalsProducts

  A Climate product represents a type of carbon removal unit available for reservation.
  You can retrieve it to see the current price and availability.
  """
  alias Stripe.Client

  @doc """
  List products

  Lists all available Climate product objects.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/climate/products", Keyword.merge(opts, params: params))
  end

  @doc """
  Retrieve a product

  Retrieves the details of a Climate product with the given ID.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Climate.Product.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, product, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/climate/products/#{product}",
      Keyword.merge(opts, params: params)
    )
  end
end
