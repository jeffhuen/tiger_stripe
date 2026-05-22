# File generated from our OpenAPI spec
defmodule Stripe.Services.Billing.CreditBalanceSummaryService do
  @moduledoc """
  CreditBalanceSummary

  Indicates the billing credit balance for billing credits granted to a customer.
  """
  alias Stripe.Client

  @doc """
  Retrieve the credit balance summary for a customer

  Retrieves the credit balance summary for a customer.
  """
  @spec retrieve(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Billing.CreditBalanceSummary.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/billing/credit_balance_summary",
      Keyword.merge(opts, params: params)
    )
  end
end
