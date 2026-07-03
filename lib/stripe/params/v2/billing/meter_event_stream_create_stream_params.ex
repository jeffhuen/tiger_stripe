# File generated from our OpenAPI spec
defmodule Stripe.Params.V2.Billing.MeterEventStreamCreateStreamParams do
  @moduledoc "Parameters for meter event stream create stream."

  @typedoc """
  * `events` - List of meter events to include in the request. Supports up to 100 events per request.
  """
  @type t :: %__MODULE__{}

  defstruct [:events]
end
