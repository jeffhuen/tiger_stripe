# File generated from our OpenAPI spec
defmodule Stripe.Services.Checkout.SessionService do
  @moduledoc """
  Session

  A Checkout Session represents your customer's session as they pay for
  one-time purchases or subscriptions through [Checkout](https://docs.stripe.com/payments/checkout)
  or [Payment Links](https://docs.stripe.com/payments/payment-links). We recommend creating a
  new Session each time your customer attempts to pay.

  Once payment is successful, the Checkout Session will contain a reference
  to the [Customer](https://docs.stripe.com/api/customers), and either the successful
  [PaymentIntent](https://docs.stripe.com/api/payment_intents) or an active
  [Subscription](https://docs.stripe.com/api/subscriptions).

  You can create a Checkout Session on your server and redirect to its URL
  to begin Checkout.

  Related guide: [Checkout quickstart](https://docs.stripe.com/checkout/quickstart)
  """
  alias Stripe.Client

  @doc """
  Create a Checkout Session

  Creates a Checkout Session object.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Checkout.Session.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v1/checkout/sessions", Keyword.merge(opts, params: params))
  end

  @doc """
  Expire a Checkout Session

  A Checkout Session can be expired when it is in one of these statuses: `open` 

  After it expires, a customer can’t complete a Checkout Session and customers loading the Checkout Session see a message saying the Checkout Session is expired.
  """
  @spec expire(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Checkout.Session.t()} | {:error, Stripe.Error.t()}
  def expire(client, session, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/checkout/sessions/#{session}/expire",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  List all Checkout Sessions

  Returns a list of Checkout Sessions.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/checkout/sessions", Keyword.merge(opts, params: params))
  end

  @doc """
  Retrieve a Checkout Session

  Retrieves a Checkout Session object.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Checkout.Session.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, session, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/checkout/sessions/#{session}",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Update a Checkout Session

  Updates a Checkout Session object.

  Related guide: [Dynamically update a Checkout Session](https://stripe.com/payments/advanced/dynamic-updates)
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Checkout.Session.t()} | {:error, Stripe.Error.t()}
  def update(client, session, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/checkout/sessions/#{session}",
      Keyword.merge(opts, params: params)
    )
  end
end
