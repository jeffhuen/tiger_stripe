# File generated from our OpenAPI spec
defmodule Stripe.Services.SubscriptionService do
  @moduledoc """
  Subscription

  Subscriptions allow you to charge a customer on a recurring basis.

  Related guide: [Creating subscriptions](https://docs.stripe.com/billing/subscriptions/creating)
  """
  alias Stripe.Client

  @doc """
  Cancel a subscription

  Cancels a customer’s subscription immediately. The customer won’t be charged again for the subscription. After it’s canceled, you can no longer update the subscription or its [metadata](https://stripe.com/metadata).

  Any pending invoice items that you’ve created are still charged at the end of the period, unless manually [deleted](#delete_invoiceitem). If you’ve set the subscription to cancel at the end of the period, any pending prorations are also left in place and collected at the end of the period. But if the subscription is set to cancel immediately, pending prorations are removed if `invoice_now` and `prorate` are both set to true.

  By default, upon subscription cancellation, Stripe stops automatic collection of all finalized invoices for the customer. This is intended to prevent unexpected payment attempts after the customer has canceled a subscription. However, you can resume automatic collection of the invoices manually after subscription cancellation to have us proceed. Or, you could check for unpaid invoices before allowing the customer to cancel the subscription at all.
  """
  @spec cancel(Client.t(), String.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
  def cancel(client, subscription_exposed_id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :delete,
      "/v1/subscriptions/#{subscription_exposed_id}",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Create a subscription

  Creates a new subscription on an existing customer. Each customer can have up to 500 active or scheduled subscriptions.

  When you create a subscription with `collection_method=charge_automatically`, the first invoice is finalized as part of the request.
  The `payment_behavior` parameter determines the exact behavior of the initial payment.

  To start subscriptions where the first invoice always begins in a `draft` status, use [subscription schedules](https://docs.stripe.com/docs/billing/subscriptions/subscription-schedules#managing) instead.
  Schedules provide the flexibility to model more complex billing configurations that change over time.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v1/subscriptions", Keyword.merge(opts, params: params))
  end

  @doc """
  Delete a subscription discount

  Removes the currently applied discount on a subscription.
  """
  @spec delete_discount(Client.t(), String.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
  def delete_discount(client, subscription_exposed_id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :delete,
      "/v1/subscriptions/#{subscription_exposed_id}/discount",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  List subscriptions

  By default, returns a list of subscriptions that have not been canceled. In order to list canceled subscriptions, specify `status=canceled`.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/subscriptions", Keyword.merge(opts, params: params))
  end

  @doc """
  Migrate a subscription

  Upgrade the billing_mode of an existing subscription.
  """
  @spec migrate(Client.t(), String.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
  def migrate(client, subscription, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/subscriptions/#{subscription}/migrate",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Resume a subscription

  Initiates resumption of a paused subscription, optionally resetting the billing cycle anchor and creating prorations. If a resumption invoice is generated, it must be paid or marked uncollectible before the subscription will be unpaused. If payment succeeds the subscription will become `active`, and if payment fails the subscription will be `past_due`. The resumption invoice will void automatically if not paid by the expiration date.
  """
  @spec resume(Client.t(), String.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
  def resume(client, subscription, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/subscriptions/#{subscription}/resume",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Retrieve a subscription

  Retrieves the subscription with the given ID.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
  def retrieve(client, subscription_exposed_id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/subscriptions/#{subscription_exposed_id}",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Search subscriptions

  Search for subscriptions you’ve previously created using Stripe’s [Search Query Language](https://docs.stripe.com/docs/search#search-query-language).
  Don’t use search in read-after-write flows where strict consistency is necessary. Under normal operating
  conditions, data is searchable in less than a minute. Occasionally, propagation of new or updated data can be up
  to an hour behind during outages. Search functionality is not available to merchants in India.
  """
  @spec search(Client.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
  def search(client, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/subscriptions/search", Keyword.merge(opts, params: params))
  end

  @doc """
  Update a subscription

  Updates an existing subscription to match the specified parameters.
  When changing prices or quantities, we optionally prorate the price we charge next month to make up for any price changes.
  To preview how the proration is calculated, use the [create preview](https://docs.stripe.com/docs/api/invoices/create_preview) endpoint.

  By default, we prorate subscription changes. For example, if a customer signs up on May 1 for a 100 price, they’ll be billed 100 immediately. If on May 15 they switch to a 200 price, then on June 1 they’ll be billed 250 (200 for a renewal of her subscription, plus a 50 prorating adjustment for half of the previous month’s 100 difference). Similarly, a downgrade generates a credit that is applied to the next invoice. We also prorate when you make quantity changes.

  Switching prices does not normally change the billing date or generate an immediate charge unless:

  * The billing interval is changed (for example, from monthly to yearly).
  * The subscription moves from free to paid.
  * A trial starts or ends.

  In these cases, we apply a credit for the unused time on the previous price, immediately charge the customer using the new price, and reset the billing date. Learn about how [Stripe immediately attempts payment for subscription changes](https://docs.stripe.com/docs/billing/subscriptions/upgrade-downgrade#immediate-payment).

  If you want to charge for an upgrade immediately, pass `proration_behavior` as `always_invoice` to create prorations, automatically invoice the customer for those proration adjustments, and attempt to collect payment. If you pass `create_prorations`, the prorations are created but not automatically invoiced. If you want to bill the customer for the prorations before the subscription’s renewal date, you need to manually [invoice the customer](https://docs.stripe.com/docs/api/invoices/create).

  If you don’t want to prorate, set the `proration_behavior` option to `none`. With this option, the customer is billed 100 on May 1 and 200 on June 1. Similarly, if you set `proration_behavior` to `none` when switching between different billing intervals (for example, from monthly to yearly), we don’t generate any credits for the old subscription’s unused time. We still reset the billing date and bill immediately for the new subscription.

  Updating the quantity on a subscription many times in an hour may result in [rate limiting](https://docs.stripe.com/docs/rate-limits). If you need to bill for a frequently changing quantity, consider integrating [usage-based billing](https://docs.stripe.com/docs/billing/subscriptions/usage-based) instead.
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
  def update(client, subscription_exposed_id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/subscriptions/#{subscription_exposed_id}",
      Keyword.merge(opts, params: params)
    )
  end
end
