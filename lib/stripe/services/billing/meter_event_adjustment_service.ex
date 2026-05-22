# File generated from our OpenAPI spec
defmodule Stripe.Services.Billing.MeterEventAdjustmentService do
  @moduledoc """
  BillingMeterEventAdjustment

  A billing meter event adjustment is a resource that allows you to cancel a meter event. For example, you might create a billing meter event adjustment to cancel a meter event that was created in error or attached to the wrong customer.
  """
  alias Stripe.Client

  @doc """
  Create a billing meter event adjustment

  Creates a billing meter event adjustment.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Billing.MeterEventAdjustment.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/billing/meter_event_adjustments",
      Keyword.merge(opts, params: params)
    )
  end
end
