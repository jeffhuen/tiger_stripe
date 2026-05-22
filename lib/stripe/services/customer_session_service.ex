# File generated from our OpenAPI spec
defmodule Stripe.Services.CustomerSessionService do
  @moduledoc """
  CustomerSessionResourceCustomerSession

  A Customer Session allows you to grant Stripe's frontend SDKs (like Stripe.js) client-side access
  control over a Customer.

  Related guides: [Customer Session with the Payment Element](https://stripe.com/payments/accept-a-payment-deferred?platform=web&type=payment#save-payment-methods),
  [Customer Session with the Pricing Table](https://stripe.com/payments/checkout/pricing-table#customer-session),
  [Customer Session with the Buy Button](https://stripe.com/payment-links/buy-button#pass-an-existing-customer).
  """
  alias Stripe.Client

  @doc """
  Create a Customer Session

  Creates a Customer Session object that includes a single-use client secret that you can use on your front-end to grant client-side API access for certain customer resources.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.CustomerSession.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v1/customer_sessions", Keyword.merge(opts, params: params))
  end
end
