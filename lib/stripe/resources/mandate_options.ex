# File generated from our OpenAPI spec
defmodule Stripe.Resources.MandateOptions do
  @moduledoc """
  setup_intent_payment_method_options_card_mandate_options
  """

  @typedoc """
  * `amount` - Amount to be charged for future payments.
  * `amount_type` - One of `fixed` or `maximum`. If `fixed`, the `amount` param refers to the exact amount to be charged in future payments. If `maximum`, the amount charged can be up to the value passed for the `amount` param. Possible values: `fixed`, `maximum`.
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `description` - A description of the mandate or subscription that is meant to be displayed to the customer. Max length: 200. Nullable.
  * `end_date` - End date of the mandate or subscription. If not provided, the mandate will be active until canceled. If provided, end date should be after start date. Format: Unix timestamp. Nullable.
  * `interval` - Specifies payment frequency. One of `day`, `week`, `month`, `year`, or `sporadic`. Possible values: `day`, `month`, `sporadic`, `week`, `year`.
  * `interval_count` - The number of intervals between payments. For example, `interval=month` and `interval_count=3` indicates one payment every three months. Maximum of one year interval allowed (1 year, 12 months, or 52 weeks). This parameter is optional when `interval=sporadic`. Nullable.
  * `reference` - Unique identifier for the mandate or subscription. Max length: 80.
  * `start_date` - Start date of the mandate or subscription. Start date should not be lesser than yesterday. Format: Unix timestamp.
  * `supported_types` - Specifies the type of mandates supported. Possible values are `india`. Nullable.
  """
  @type t :: %__MODULE__{
          amount: integer(),
          amount_type: String.t(),
          currency: String.t(),
          description: String.t(),
          end_date: integer(),
          interval: String.t(),
          interval_count: integer(),
          reference: String.t(),
          start_date: integer(),
          supported_types: [String.t()]
        }

  defstruct [
    :amount,
    :amount_type,
    :currency,
    :description,
    :end_date,
    :interval,
    :interval_count,
    :reference,
    :start_date,
    :supported_types
  ]

  @object_name "setup_intent_payment_method_options_card_mandate_options"
  def object_name, do: @object_name
end
