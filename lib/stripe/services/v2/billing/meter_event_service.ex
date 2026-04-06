# File generated from our OpenAPI spec
defmodule Stripe.Services.V2.Billing.MeterEventService do
  @moduledoc """
  Meter Event

  A Meter Event is a usage record that captures billable activity for usage-based billing. Meter Events contain an event name, timestamp, and payload with customer mapping and usage value, enabling accurate usage tracking and billing.
  """
  alias Stripe.Client

  @doc """
  Create a Meter Event with synchronous validation

  Creates a meter event. Events are validated synchronously, but are processed asynchronously. Supports up to 1,000 events per second in livemode. For higher rate-limits, please use meter event streams instead.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v2/billing/meter_events",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end
end
