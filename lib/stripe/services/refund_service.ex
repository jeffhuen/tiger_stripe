# File generated from our OpenAPI spec
defmodule Stripe.Services.RefundService do
  @moduledoc """
  Refund

  Refund objects allow you to refund a previously created charge that isn't
  refunded yet. Funds are refunded to the credit or debit card that's
  initially charged.

  Related guide: [Refunds](https://docs.stripe.com/refunds)
  """
  alias Stripe.Client

  @doc """
  Cancel a refund

  Cancels a refund with a status of `requires_action`.

  You can’t cancel refunds in other states. Only refunds for payment methods that require customer action can enter the `requires_action` state.
  """
  @spec cancel(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Refund.t()} | {:error, Stripe.Error.t()}
  def cancel(client, refund, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/refunds/#{refund}/cancel",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Create customer balance refund

  When you create a new refund, you must specify a Charge or a PaymentIntent object on which to create it.

  Creating a new refund will refund a charge that has previously been created but not yet refunded.
  Funds will be refunded to the credit or debit card that was originally charged.

  You can optionally refund only part of a charge.
  You can do so multiple times, until the entire charge has been refunded.

  Once entirely refunded, a charge can’t be refunded again.
  This method will raise an error when called on an already-refunded charge,
  or when trying to refund more money than is left on a charge.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Refund.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v1/refunds", Keyword.merge(opts, params: params))
  end

  @doc """
  List all refunds

  Returns a list of all refunds you created. We return the refunds in sorted order, with the most recent refunds appearing first. The 10 most recent refunds are always available by default on the Charge object.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/refunds", Keyword.merge(opts, params: params))
  end

  @doc """
  Retrieve a refund

  Retrieves the details of an existing refund.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Refund.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, refund, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/refunds/#{refund}", Keyword.merge(opts, params: params))
  end

  @doc """
  Update a refund

  Updates the refund that you specify by setting the values of the passed parameters. Any parameters that you don’t provide remain unchanged.

  This request only accepts `metadata` as an argument.
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Refund.t()} | {:error, Stripe.Error.t()}
  def update(client, refund, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v1/refunds/#{refund}", Keyword.merge(opts, params: params))
  end
end
