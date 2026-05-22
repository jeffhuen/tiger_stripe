# File generated from our OpenAPI spec
defmodule Stripe.Services.PromotionCodeService do
  @moduledoc """
  PromotionCode

  A Promotion Code represents a customer-redeemable code for an underlying promotion.
  You can create multiple codes for a single promotion.

  If you enable promotion codes in your [customer portal configuration](https://docs.stripe.com/customer-management/configure-portal), then customers can redeem a code themselves when updating a subscription in the portal.
  Customers can also view the currently active promotion codes and coupons on each of their subscriptions in the portal.
  """
  alias Stripe.Client

  @doc """
  Create a promotion code

  A promotion code points to an underlying promotion. You can optionally restrict the code to a specific customer, redemption limit, and expiration date.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.PromotionCode.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v1/promotion_codes", Keyword.merge(opts, params: params))
  end

  @doc """
  List all promotion codes

  Returns a list of your promotion codes.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/promotion_codes", Keyword.merge(opts, params: params))
  end

  @doc """
  Retrieve a promotion code

  Retrieves the promotion code with the given ID. In order to retrieve a promotion code by the customer-facing `code` use [list](https://docs.stripe.com/docs/api/promotion_codes/list) with the desired `code`.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.PromotionCode.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, promotion_code, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/promotion_codes/#{promotion_code}",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Update a promotion code

  Updates the specified promotion code by setting the values of the parameters passed. Most fields are, by design, not editable.
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.PromotionCode.t()} | {:error, Stripe.Error.t()}
  def update(client, promotion_code, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/promotion_codes/#{promotion_code}",
      Keyword.merge(opts, params: params)
    )
  end
end
