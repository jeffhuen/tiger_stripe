# File generated from our OpenAPI spec
defmodule Stripe.Services.ChargeService do
  @moduledoc """
  Charge

  The `Charge` object represents a single attempt to move money into your Stripe account.
  PaymentIntent confirmation is the most common way to create Charges, but [Account Debits](https://docs.stripe.com/connect/account-debits) may also create Charges.
  Some legacy payment flows create Charges directly, which is not recommended for new integrations.
  """
  alias Stripe.Client

  @doc """
  Capture a payment

  Capture the payment of an existing, uncaptured charge that was created with the `capture` option set to false.

  Uncaptured payments expire a set number of days after they are created ([7 by default](https://docs.stripe.com/docs/charges/placing-a-hold)), after which they are marked as refunded and capture attempts will fail.

  Don’t use this method to capture a PaymentIntent-initiated charge. Use [Capture a PaymentIntent](https://docs.stripe.com/docs/api/payment_intents/capture).
  """
  @spec capture(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Charge.t()} | {:error, Stripe.Error.t()}
  def capture(client, charge, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/charges/#{charge}/capture",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  This method is no longer recommended—use the [Payment Intents API](https://docs.stripe.com/docs/api/payment_intents)
  to initiate a new payment instead. Confirmation of the PaymentIntent creates the `Charge`
  object used to request payment.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Charge.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v1/charges", Keyword.merge(opts, params: params))
  end

  @doc """
  List all charges

  Returns a list of charges you’ve previously created. The charges are returned in sorted order, with the most recent charges appearing first.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/charges", Keyword.merge(opts, params: params))
  end

  @doc """
  Retrieve a charge

  Retrieves the details of a charge that has previously been created. Supply the unique charge ID that was returned from your previous request, and Stripe will return the corresponding charge information. The same information is returned when creating or refunding the charge.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Charge.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, charge, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/charges/#{charge}", Keyword.merge(opts, params: params))
  end

  @doc """
  Search charges

  Search for charges you’ve previously created using Stripe’s [Search Query Language](https://docs.stripe.com/docs/search#search-query-language).
  Don’t use search in read-after-write flows where strict consistency is necessary. Under normal operating
  conditions, data is searchable in less than a minute. Occasionally, propagation of new or updated data can be up
  to an hour behind during outages. Search functionality is not available to merchants in India.
  """
  @spec search(Client.t(), map(), keyword()) ::
          {:ok, Stripe.SearchResult.t()} | {:error, Stripe.Error.t()}
  def search(client, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/charges/search", Keyword.merge(opts, params: params))
  end

  @doc """
  Update a charge

  Updates the specified charge by setting the values of the parameters passed. Any parameters not provided will be left unchanged.
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Charge.t()} | {:error, Stripe.Error.t()}
  def update(client, charge, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v1/charges/#{charge}", Keyword.merge(opts, params: params))
  end
end
