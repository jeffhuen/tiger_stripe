# File generated from our OpenAPI spec
defmodule Stripe.Params.SubscriptionPauseParams do
  @moduledoc "Parameters for subscription pause."

  @typedoc """
  * `bill_for` - Controls what to bill for when pausing the subscription.
  * `expand` - Specifies which fields in the response should be expanded.
  * `invoicing_behavior` - Determines how to handle debits and credits when pausing. Defaults to `pending_invoice_item`. Possible values: `invoice`, `pending_invoice_item`.
  * `type` - The type of pause to apply. Defaults to `subscription`. Possible values: `subscription`.
  """
  @type t :: %__MODULE__{}

  defstruct [:bill_for, :expand, :invoicing_behavior, :type]
end
