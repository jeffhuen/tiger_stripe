# File generated from our OpenAPI spec
defmodule Stripe.Services.Climate.OrderService do
  @moduledoc """
  ClimateRemovalsOrders

  Orders represent your intent to purchase a particular Climate product. When you create an order, the
  payment is deducted from your merchant balance.
  """
  alias Stripe.Client

  @doc """
  Cancel an order

  Cancels a Climate order. You can cancel an order within 24 hours of creation. Stripe refunds the
  reservation `amount_subtotal`, but not the `amount_fees` for user-triggered cancellations. Frontier
  might cancel reservations if suppliers fail to deliver. If Frontier cancels the reservation, Stripe
  provides 90 days advance notice and refunds the `amount_total`.
  """
  @spec cancel(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Climate.Order.t()} | {:error, Stripe.Error.t()}
  def cancel(client, order, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/climate/orders/#{order}/cancel",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Create an order

  Creates a Climate order object for a given Climate product. The order will be processed immediately
  after creation and payment will be deducted your Stripe balance.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Climate.Order.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v1/climate/orders", Keyword.merge(opts, params: params))
  end

  @doc """
  List orders

  Lists all Climate order objects. The orders are returned sorted by creation date, with the
  most recently created orders appearing first.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/climate/orders", Keyword.merge(opts, params: params))
  end

  @doc """
  Retrieve an order

  Retrieves the details of a Climate order object with the given ID.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Climate.Order.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, order, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/climate/orders/#{order}",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Update an order

  Updates the specified order by setting the values of the parameters passed.
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Climate.Order.t()} | {:error, Stripe.Error.t()}
  def update(client, order, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/climate/orders/#{order}",
      Keyword.merge(opts, params: params)
    )
  end
end
