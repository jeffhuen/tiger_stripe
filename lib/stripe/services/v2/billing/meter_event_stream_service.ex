# File generated from our OpenAPI spec
defmodule Stripe.Services.V2.Billing.MeterEventStreamService do
  @moduledoc """
  MeterEventStream API operations.
  """
  alias Stripe.Client

  @doc """
  Create a billing meter event with asynchronous validation

  Creates meter events. Events are processed asynchronously, including validation. Requires a meter event session for authentication. Supports up to 10,000 requests per second in livemode. For even higher rate-limits, contact sales.
  """
  @spec create_stream(Client.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
  def create_stream(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v2/billing/meter_event_stream",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end
end
