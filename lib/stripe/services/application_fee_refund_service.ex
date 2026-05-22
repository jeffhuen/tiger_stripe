# File generated from our OpenAPI spec
defmodule Stripe.Services.ApplicationFeeRefundService do
  @moduledoc """
  ApplicationFeeRefund API operations.
  """
  alias Stripe.Client

  @doc """
  Create an application fee refund

  Refunds an application fee that has previously been collected but not yet refunded.
  Funds will be refunded to the Stripe account from which the fee was originally collected.

  You can optionally refund only part of an application fee.
  You can do so multiple times, until the entire fee has been refunded.

  Once entirely refunded, an application fee can’t be refunded again.
  This method will raise an error when called on an already-refunded application fee,
  or when trying to refund more money than is left on an application fee.
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.FeeRefund.t()} | {:error, Stripe.Error.t()}
  def create(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/application_fees/#{id}/refunds",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  List all application fee refunds

  You can see a list of the refunds belonging to a specific application fee. Note that the 10 most recent refunds are always available by default on the application fee object. If you need more than those 10, you can use this API method and the `limit` and `starting_after` parameters to page through additional refunds.
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/application_fees/#{id}/refunds",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Retrieve an application fee refund

  By default, you can see the 10 most recent refunds stored directly on the application fee object, but you can also retrieve details about a specific refund stored on the application fee.
  """
  @spec retrieve(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.FeeRefund.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, fee, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/application_fees/#{fee}/refunds/#{id}",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Update an application fee refund

  Updates the specified application fee refund by setting the values of the parameters passed. Any parameters not provided will be left unchanged.

  This request only accepts metadata as an argument.
  """
  @spec update(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.FeeRefund.t()} | {:error, Stripe.Error.t()}
  def update(client, fee, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/application_fees/#{fee}/refunds/#{id}",
      Keyword.merge(opts, params: params)
    )
  end
end
