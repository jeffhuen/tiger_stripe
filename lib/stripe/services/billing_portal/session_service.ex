# File generated from our OpenAPI spec
defmodule Stripe.Services.BillingPortal.SessionService do
  @moduledoc """
  PortalSession

  The Billing customer portal is a Stripe-hosted UI for subscription and
  billing management.

  A portal configuration describes the functionality and features that you
  want to provide to your customers through the portal.

  A portal session describes the instantiation of the customer portal for
  a particular customer. By visiting the session's URL, the customer
  can manage their subscriptions and billing details. For security reasons,
  sessions are short-lived and will expire if the customer does not visit the URL.
  Create sessions on-demand when customers intend to manage their subscriptions
  and billing details.

  Related guide: [Customer management](https://stripe.com/customer-management)
  """
  alias Stripe.Client

  @doc """
  Create a portal session

  Creates a session of the customer portal.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.BillingPortal.Session.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/billing_portal/sessions",
      Keyword.merge(opts, params: params)
    )
  end
end
