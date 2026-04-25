# File generated from our OpenAPI spec
defmodule Stripe.Services.PaymentIntentService do
  @moduledoc """
  PaymentIntent

  A PaymentIntent guides you through the process of collecting a payment from your customer.
  We recommend that you create exactly one PaymentIntent for each order or
  customer session in your system. You can reference the PaymentIntent later to
  see the history of payment attempts for a particular session.

  A PaymentIntent transitions through
  [multiple statuses](https://stripe.com/payments/paymentintents/lifecycle)
  throughout its lifetime as it interfaces with Stripe.js to perform
  authentication flows and ultimately creates at most one successful charge.

  Related guide: [Payment Intents API](https://docs.stripe.com/payments/payment-intents)
  """
  alias Stripe.Client

  @doc """
  Reconcile a customer_balance PaymentIntent

  Manually reconcile the remaining amount for a `customer_balance` PaymentIntent.
  """
  @spec apply_customer_balance(Client.t(), String.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
  def apply_customer_balance(client, intent, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/payment_intents/#{intent}/apply_customer_balance",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Cancel a PaymentIntent

  You can cancel a PaymentIntent object when it’s in one of these statuses: `requires_payment_method`, `requires_capture`, `requires_confirmation`, `requires_action` or, [in rare cases](https://docs.stripe.com/docs/payments/intents), `processing`. 

  After it’s canceled, no additional charges are made by the PaymentIntent and any operations on the PaymentIntent fail with an error. For PaymentIntents with a `status` of `requires_capture`, the remaining `amount_capturable` is automatically refunded. 

  You can’t cancel the PaymentIntent for a Checkout Session. [Expire the Checkout Session](https://docs.stripe.com/docs/api/checkout/sessions/expire) instead.
  """
  @spec cancel(Client.t(), String.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
  def cancel(client, intent, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/payment_intents/#{intent}/cancel",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Capture a PaymentIntent

  Capture the funds of an existing uncaptured PaymentIntent when its status is `requires_capture`.

  Uncaptured PaymentIntents are cancelled a set number of days (7 by default) after their creation.

  Learn more about [separate authorization and capture](https://docs.stripe.com/docs/payments/capture-later).
  """
  @spec capture(Client.t(), String.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
  def capture(client, intent, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/payment_intents/#{intent}/capture",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Confirm a PaymentIntent

  Confirm that your customer intends to pay with current or provided
  payment method. Upon confirmation, the PaymentIntent will attempt to initiate
  a payment.

  If the selected payment method requires additional authentication steps, the
  PaymentIntent will transition to the `requires_action` status and
  suggest additional actions via `next_action`. If payment fails,
  the PaymentIntent transitions to the `requires_payment_method` status or the
  `canceled` status if the confirmation limit is reached. If
  payment succeeds, the PaymentIntent will transition to the `succeeded`
  status (or `requires_capture`, if `capture_method` is set to `manual`).

  If the `confirmation_method` is `automatic`, payment may be attempted
  using our [client SDKs](https://docs.stripe.com/docs/stripe-js/reference#stripe-handle-card-payment)
  and the PaymentIntent’s [client_secret](#payment_intent_object-client_secret).
  After `next_action`s are handled by the client, no additional
  confirmation is required to complete the payment.

  If the `confirmation_method` is `manual`, all payment attempts must be
  initiated using a secret key.

  If any actions are required for the payment, the PaymentIntent will
  return to the `requires_confirmation` state
  after those actions are completed. Your server needs to then
  explicitly re-confirm the PaymentIntent to initiate the next payment
  attempt.

  There is a variable upper limit on how many times a PaymentIntent can be confirmed.
  After this limit is reached, any further calls to this endpoint will
  transition the PaymentIntent to the `canceled` state.
  """
  @spec confirm(Client.t(), String.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
  def confirm(client, intent, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/payment_intents/#{intent}/confirm",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Create a PaymentIntent

  Creates a PaymentIntent object.

  After the PaymentIntent is created, attach a payment method and [confirm](https://docs.stripe.com/docs/api/payment_intents/confirm)
  to continue the payment. Learn more about [the available payment flows
  with the Payment Intents API](https://docs.stripe.com/docs/payments/payment-intents).

  When you use `confirm=true` during creation, it’s equivalent to creating
  and confirming the PaymentIntent in the same call. You can use any parameters
  available in the [confirm API](https://docs.stripe.com/docs/api/payment_intents/confirm) when you supply
  `confirm=true`.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v1/payment_intents", Keyword.merge(opts, params: params))
  end

  @doc """
  Increment an authorization

  Perform an incremental authorization on an eligible
  [PaymentIntent](https://docs.stripe.com/docs/api/payment_intents/object). To be eligible, the
  PaymentIntent’s status must be `requires_capture` and
  [incremental_authorization_supported](https://docs.stripe.com/docs/api/charges/object#charge_object-payment_method_details-card_present-incremental_authorization_supported)
  must be `true`.

  Incremental authorizations attempt to increase the authorized amount on
  your customer’s card to the new, higher `amount` provided. Similar to the
  initial authorization, incremental authorizations can be declined. A
  single PaymentIntent can call this endpoint multiple times to further
  increase the authorized amount.

  If the incremental authorization succeeds, the PaymentIntent object
  returns with the updated
  [amount](https://docs.stripe.com/docs/api/payment_intents/object#payment_intent_object-amount).
  If the incremental authorization fails, a
  [card_declined](https://docs.stripe.com/docs/error-codes#card-declined) error returns, and no other
  fields on the PaymentIntent or Charge update. The PaymentIntent
  object remains capturable for the previously authorized amount.

  Each PaymentIntent can have a maximum of 10 incremental authorization attempts, including declines.
  After it’s captured, a PaymentIntent can no longer be incremented.

  Learn more about [incremental authorizations](https://docs.stripe.com/docs/terminal/features/incremental-authorizations).
  """
  @spec increment_authorization(Client.t(), String.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
  def increment_authorization(client, intent, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/payment_intents/#{intent}/increment_authorization",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  List all PaymentIntents

  Returns a list of PaymentIntents.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/payment_intents", Keyword.merge(opts, params: params))
  end

  @doc """
  Retrieve a PaymentIntent

  Retrieves the details of a PaymentIntent that has previously been created. 

  You can retrieve a PaymentIntent client-side using a publishable key when the `client_secret` is in the query string. 

  If you retrieve a PaymentIntent with a publishable key, it only returns a subset of properties. Refer to the [payment intent](#payment_intent_object) object reference for more details.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
  def retrieve(client, intent, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/payment_intents/#{intent}",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Search PaymentIntents

  Search for PaymentIntents you’ve previously created using Stripe’s [Search Query Language](https://docs.stripe.com/docs/search#search-query-language).
  Don’t use search in read-after-write flows where strict consistency is necessary. Under normal operating
  conditions, data is searchable in less than a minute. Occasionally, propagation of new or updated data can be up
  to an hour behind during outages. Search functionality is not available to merchants in India.
  """
  @spec search(Client.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
  def search(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/payment_intents/search",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Update a PaymentIntent

  Updates properties on a PaymentIntent object without confirming.

  Depending on which properties you update, you might need to confirm the
  PaymentIntent again. For example, updating the `payment_method`
  always requires you to confirm the PaymentIntent again. If you prefer to
  update and confirm at the same time, we recommend updating properties through
  the [confirm API](https://docs.stripe.com/docs/api/payment_intents/confirm) instead.
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
  def update(client, intent, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/payment_intents/#{intent}",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Verify microdeposits on a PaymentIntent

  Verifies microdeposits on a PaymentIntent object.
  """
  @spec verify_microdeposits(Client.t(), String.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
  def verify_microdeposits(client, intent, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/payment_intents/#{intent}/verify_microdeposits",
      Keyword.merge(opts, params: params)
    )
  end
end
