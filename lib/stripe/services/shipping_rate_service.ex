# File generated from our OpenAPI spec
defmodule Stripe.Services.ShippingRateService do
  @moduledoc """
  ShippingRate

  Shipping rates describe the price of shipping presented to your customers and
  applied to a purchase. For more information, see [Charge for shipping](https://docs.stripe.com/payments/during-payment/charge-shipping).
  """
  alias Stripe.Client

  @doc """
  Create a shipping rate

  Creates a new shipping rate object.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.ShippingRate.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v1/shipping_rates", Keyword.merge(opts, params: params))
  end

  @doc """
  List all shipping rates

  Returns a list of your shipping rates.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/shipping_rates", Keyword.merge(opts, params: params))
  end

  @doc """
  Retrieve a shipping rate

  Returns the shipping rate object with the given ID.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.ShippingRate.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, shipping_rate_token, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/shipping_rates/#{shipping_rate_token}",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Update a shipping rate

  Updates an existing shipping rate object.
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.ShippingRate.t()} | {:error, Stripe.Error.t()}
  def update(client, shipping_rate_token, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/shipping_rates/#{shipping_rate_token}",
      Keyword.merge(opts, params: params)
    )
  end
end
