# File generated from our OpenAPI spec
defmodule Stripe.Services.V2.Billing.MeterEventAdjustmentService do
  @moduledoc """
  Meter Event Adjustment

  A Meter Event Adjustment is used to cancel or modify previously recorded meter events. Meter Event Adjustments allow you to correct billing data by canceling individual events or event ranges, with tracking of adjustment status and creation time.
  """
  alias Stripe.Client

  @doc """
  Create a Meter Event Adjustment

  Creates a meter event adjustment to cancel a previously sent meter event.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.V2.Billing.MeterEventAdjustment.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v2/billing/meter_event_adjustments",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end
end
