# File generated from our OpenAPI spec
defmodule Stripe.Params.SubscriptionScheduleReleaseParams do
  @moduledoc "Parameters for subscription schedule release."

  @typedoc """
  * `expand` - Specifies which fields in the response should be expanded.
  * `preserve_cancel_date` - Keep any cancellation on the subscription that the schedule has set
  """
  @type t :: %__MODULE__{}

  defstruct [:expand, :preserve_cancel_date]
end
