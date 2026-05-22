# File generated from our OpenAPI spec
defmodule Stripe.Services.Billing.MeterEventSummaryService do
  @moduledoc """
  BillingMeterEventSummary

  A billing meter event summary represents an aggregated view of a customer's billing meter events within a specified timeframe. It indicates how much
  usage was accrued by a customer for that period.

  Note: Meters events are aggregated asynchronously so the meter event summaries provide an eventually consistent view of the reported usage.
  """
  alias Stripe.Client

  @doc """
  List billing meter event summaries

  Retrieve a list of billing meter event summaries.
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/billing/meters/#{id}/event_summaries",
      Keyword.merge(opts, params: params)
    )
  end
end
