# File generated from our OpenAPI spec
defmodule Stripe.Services.CouponService do
  @moduledoc """
  Coupon

  A coupon contains information about a percent-off or amount-off discount you
  might want to apply to a customer. Coupons may be applied to [subscriptions](https://api.stripe.com#subscriptions), [invoices](https://api.stripe.com#invoices),
  [checkout sessions](https://docs.stripe.com/api/checkout/sessions), [quotes](https://api.stripe.com#quotes), and more. Coupons do not work with conventional one-off [charges](https://api.stripe.com#create_charge) or [payment intents](https://docs.stripe.com/api/payment_intents).
  """
  alias Stripe.Client

  @doc """
  Create a coupon

  You can create coupons easily via the [coupon management](https://dashboard.stripe.com/coupons) page of the Stripe dashboard. Coupon creation is also accessible via the API if you need to create coupons on the fly.

  A coupon has either a `percent_off` or an `amount_off` and `currency`. If you set an `amount_off`, that amount will be subtracted from any invoice’s subtotal. For example, an invoice with a subtotal of 100 will have a final total of 0 if a coupon with an `amount_off` of 200 is applied to it and an invoice with a subtotal of 300 will have a final total of 100 if a coupon with an `amount_off` of 200 is applied to it.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v1/coupons", Keyword.merge(opts, params: params))
  end

  @doc """
  Delete a coupon

  You can delete coupons via the [coupon management](https://dashboard.stripe.com/coupons) page of the Stripe dashboard. However, deleting a coupon does not affect any customers who have already applied the coupon; it means that new customers can’t redeem the coupon. You can also delete coupons via the API.
  """
  @spec delete(Client.t(), String.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
  def delete(client, coupon, params \\ %{}, opts \\ []) do
    Client.request(client, :delete, "/v1/coupons/#{coupon}", Keyword.merge(opts, params: params))
  end

  @doc """
  List all coupons

  Returns a list of your coupons.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/coupons", Keyword.merge(opts, params: params))
  end

  @doc """
  Retrieve a coupon

  Retrieves the coupon with the given ID.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
  def retrieve(client, coupon, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/coupons/#{coupon}", Keyword.merge(opts, params: params))
  end

  @doc """
  Update a coupon

  Updates the metadata of a coupon. Other coupon details (currency, duration, amount_off) are, by design, not editable.
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
  def update(client, coupon, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v1/coupons/#{coupon}", Keyword.merge(opts, params: params))
  end
end
