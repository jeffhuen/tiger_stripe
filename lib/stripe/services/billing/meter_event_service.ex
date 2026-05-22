# File generated from our OpenAPI spec
defmodule Stripe.Services.Billing.MeterEventService do
  @moduledoc """
  BillingMeterEvent

  Meter events represent actions that customers take in your system. You can use meter events to bill a customer based on their usage. Meter events are associated with billing meters, which define both the contents of the event’s payload and how to aggregate those events.
  """
  alias Stripe.Client

  @doc """
  Create a billing meter event

  Creates a billing meter event.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Billing.MeterEvent.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v1/billing/meter_events", Keyword.merge(opts, params: params))
  end
end
