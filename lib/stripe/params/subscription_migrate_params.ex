# File generated from our OpenAPI spec
defmodule Stripe.Params.SubscriptionMigrateParams do
  @moduledoc "Parameters for subscription migrate."

  @typedoc """
  * `billing_mode` - Controls how prorations and invoices for subscriptions are calculated and orchestrated.
  * `expand` - Specifies which fields in the response should be expanded.
  """
  @type t :: %__MODULE__{
          billing_mode: billing_mode(),
          expand: [String.t()] | nil
        }

  defstruct [:billing_mode, :expand]

  @typedoc """
  * `flexible` - Configure behavior for flexible billing mode.
  * `type` - Controls the calculation and orchestration of prorations and invoices for subscriptions. Possible values: `flexible`.
  """
  @type billing_mode :: %{
          optional(:flexible) => billing_mode_flexible() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `proration_discounts` - Controls how invoices and invoice items display proration amounts and discount amounts. Possible values: `included`, `itemized`.
  """
  @type billing_mode_flexible :: %{
          optional(:proration_discounts) => String.t() | nil,
          optional(String.t()) => term()
        }
end
