# File generated from our OpenAPI spec
defmodule Stripe.Services.SetupIntentService do
  @moduledoc """
  SetupIntent

  A SetupIntent guides you through the process of setting up and saving a customer's payment credentials for future payments.
  For example, you can use a SetupIntent to set up and save your customer's card without immediately collecting a payment.
  Later, you can use [PaymentIntents](https://api.stripe.com#payment_intents) to drive the payment flow.

  Create a SetupIntent when you're ready to collect your customer's payment credentials.
  Don't maintain long-lived, unconfirmed SetupIntents because they might not be valid.
  The SetupIntent transitions through multiple [statuses](https://docs.stripe.com/payments/intents#intent-statuses) as it guides
  you through the setup process.

  Successful SetupIntents result in payment credentials that are optimized for future payments.
  For example, cardholders in [certain regions](https://stripe.com/guides/strong-customer-authentication) might need to be run through
  [Strong Customer Authentication](https://docs.stripe.com/strong-customer-authentication) during payment method collection
  to streamline later [off-session payments](https://docs.stripe.com/payments/setup-intents).
  If you use the SetupIntent with a [Customer](https://api.stripe.com#setup_intent_object-customer),
  it automatically attaches the resulting payment method to that Customer after successful setup.
  We recommend using SetupIntents or [setup_future_usage](https://api.stripe.com#payment_intent_object-setup_future_usage) on
  PaymentIntents to save payment methods to prevent saving invalid or unoptimized payment methods.

  By using SetupIntents, you can reduce friction for your customers, even as regulations change over time.

  Related guide: [Setup Intents API](https://docs.stripe.com/payments/setup-intents)
  """
  alias Stripe.Client

  @doc """
  Cancel a SetupIntent

  You can cancel a SetupIntent object when it’s in one of these statuses: `requires_payment_method`, `requires_confirmation`, or `requires_action`. 

  After you cancel it, setup is abandoned and any operations on the SetupIntent fail with an error. You can’t cancel the SetupIntent for a Checkout Session. [Expire the Checkout Session](https://docs.stripe.com/docs/api/checkout/sessions/expire) instead.
  """
  @spec cancel(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.SetupIntent.t()} | {:error, Stripe.Error.t()}
  def cancel(client, intent, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/setup_intents/#{intent}/cancel",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Confirm a SetupIntent

  Confirm that your customer intends to set up the current or
  provided payment method. For example, you would confirm a SetupIntent
  when a customer hits the “Save” button on a payment method management
  page on your website.

  If the selected payment method does not require any additional
  steps from the customer, the SetupIntent will transition to the
  `succeeded` status.

  Otherwise, it will transition to the `requires_action` status and
  suggest additional actions via `next_action`. If setup fails,
  the SetupIntent will transition to the
  `requires_payment_method` status or the `canceled` status if the
  confirmation limit is reached.
  """
  @spec confirm(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.SetupIntent.t()} | {:error, Stripe.Error.t()}
  def confirm(client, intent, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/setup_intents/#{intent}/confirm",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Create a SetupIntent

  Creates a SetupIntent object.

  After you create the SetupIntent, attach a payment method and [confirm](https://docs.stripe.com/docs/api/setup_intents/confirm)
  it to collect any required permissions to charge the payment method later.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.SetupIntent.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v1/setup_intents", Keyword.merge(opts, params: params))
  end

  @doc """
  List all SetupIntents

  Returns a list of SetupIntents.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/setup_intents", Keyword.merge(opts, params: params))
  end

  @doc """
  Retrieve a SetupIntent

  Retrieves the details of a SetupIntent that has previously been created. 

  Client-side retrieval using a publishable key is allowed when the `client_secret` is provided in the query string. 

  When retrieved with a publishable key, only a subset of properties will be returned. Please refer to the [SetupIntent](#setup_intent_object) object reference for more details.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.SetupIntent.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, intent, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/setup_intents/#{intent}",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Update a SetupIntent

  Updates a SetupIntent object.
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.SetupIntent.t()} | {:error, Stripe.Error.t()}
  def update(client, intent, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/setup_intents/#{intent}",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Verify microdeposits on a SetupIntent

  Verifies microdeposits on a SetupIntent object.
  """
  @spec verify_microdeposits(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.SetupIntent.t()} | {:error, Stripe.Error.t()}
  def verify_microdeposits(client, intent, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/setup_intents/#{intent}/verify_microdeposits",
      Keyword.merge(opts, params: params)
    )
  end
end
