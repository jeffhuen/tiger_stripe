# File generated from our OpenAPI spec
defmodule Stripe.Params.SubscriptionScheduleCancelParams do
  @moduledoc "Parameters for subscription schedule cancel."

  @typedoc """
  * `expand` - Specifies which fields in the response should be expanded.
  * `invoice_now` - If the subscription schedule is `active`, indicates if a final invoice will be generated that contains any un-invoiced metered usage and new/pending proration invoice items. Defaults to `true`.
  * `prorate` - If the subscription schedule is `active`, indicates if the cancellation should be prorated. Defaults to `true`.
  """
  @type t :: %__MODULE__{}

  defstruct [:expand, :invoice_now, :prorate]
end
