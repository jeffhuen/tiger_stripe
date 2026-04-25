# File generated from our OpenAPI spec
defmodule Stripe.Services.V2.Billing.MeterEventAdjustmentService do
  @moduledoc """
  Meter Event Adjustment
  """
  alias Stripe.Client

  @doc """
  Create a billing meter event adjustment

  Creates a meter event adjustment to cancel a previously sent meter event.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v2/billing/meter_event_adjustments",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end
end
