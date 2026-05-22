# File generated from our OpenAPI spec
defmodule Stripe.Services.PaymentLinkService do
  @moduledoc """
  PaymentLink

  A payment link is a shareable URL that will take your customers to a hosted payment page. A payment link can be shared and used multiple times.

  When a customer opens a payment link it will open a new [checkout session](https://docs.stripe.com/api/checkout/sessions) to render the payment page. You can use [checkout session events](https://docs.stripe.com/api/events/types#event_types-checkout.session.completed) to track payments through payment links.

  Related guide: [Payment Links API](https://docs.stripe.com/payment-links)
  """
  alias Stripe.Client

  @doc """
  Create a payment link

  Creates a payment link.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.PaymentLink.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v1/payment_links", Keyword.merge(opts, params: params))
  end

  @doc """
  List all payment links

  Returns a list of your payment links.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/payment_links", Keyword.merge(opts, params: params))
  end

  @doc """
  Retrieve payment link

  Retrieve a payment link.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.PaymentLink.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, payment_link, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/payment_links/#{payment_link}",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Update a payment link

  Updates a payment link.
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.PaymentLink.t()} | {:error, Stripe.Error.t()}
  def update(client, payment_link, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/payment_links/#{payment_link}",
      Keyword.merge(opts, params: params)
    )
  end
end
