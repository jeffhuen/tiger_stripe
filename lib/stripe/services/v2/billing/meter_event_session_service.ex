# File generated from our OpenAPI spec
defmodule Stripe.Services.V2.Billing.MeterEventSessionService do
  @moduledoc """
  Meter Event Session

  A Meter Event Session is an authentication session for the high-throughput meter event API. Meter Event Sessions provide temporary authentication tokens with expiration times, enabling secure and efficient bulk submission of usage events.
  """
  alias Stripe.Client

  @doc """
  Create a Meter Event Stream Authentication Session

  Creates a meter event session to send usage on the high-throughput meter event stream. Authentication tokens are only valid for 15 minutes, so you need to create a new meter event session when your token expires.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.V2.Billing.MeterEventSession.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v2/billing/meter_event_session",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end
end
