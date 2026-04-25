# File generated from our OpenAPI spec
defmodule Stripe.Services.V2.Billing.MeterEventSessionService do
  @moduledoc """
  Meter Event Session
  """
  alias Stripe.Client

  @doc """
  Create billing meter event stream authentication session

  Creates a meter event session to send usage on the high-throughput meter event stream. Authentication tokens are only valid for 15 minutes, so you will need to create a new meter event session when your token expires.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v2/billing/meter_event_session",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end
end
