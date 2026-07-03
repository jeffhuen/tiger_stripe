# File generated from our OpenAPI spec
defmodule Stripe.Params.CreditNotePreviewParams do
  @moduledoc "Parameters for credit note preview."

  @typedoc """
  * `amount` - The integer amount in cents (or local equivalent) representing the total amount of the credit note. One of `amount`, `lines`, or `shipping_cost` must be provided.
  * `credit_amount` - The integer amount in cents (or local equivalent) representing the amount to credit the customer's balance, which will be automatically applied to their next invoice.
  * `effective_at` - The date when this credit note is in effect. Same as `created` unless overwritten. When defined, this value replaces the system-generated 'Date of issue' printed on the credit note PDF. Format: Unix timestamp.
  * `email_type` - Type of email to send to the customer, one of `credit_note` or `none` and the default is `credit_note`. Possible values: `credit_note`, `none`.
  * `expand` - Specifies which fields in the response should be expanded.
  * `invoice` - ID of the invoice. Max length: 5000.
  * `lines` - Line items that make up the credit note. One of `amount`, `lines`, or `shipping_cost` must be provided.
  * `memo` - The credit note's memo appears on the credit note PDF. Max length: 5000.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `out_of_band_amount` - The integer amount in cents (or local equivalent) representing the amount that is credited outside of Stripe.
  * `reason` - Reason for issuing this credit note, one of `duplicate`, `fraudulent`, `order_change`, or `product_unsatisfactory` Possible values: `duplicate`, `fraudulent`, `order_change`, `product_unsatisfactory`.
  * `refund_amount` - The integer amount in cents (or local equivalent) representing the amount to refund. If set, a refund will be created for the charge associated with the invoice.
  * `refunds` - Refunds to link to this credit note.
  * `shipping_cost` - When shipping_cost contains the shipping_rate from the invoice, the shipping_cost is included in the credit note. One of `amount`, `lines`, or `shipping_cost` must be provided.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :amount,
    :credit_amount,
    :effective_at,
    :email_type,
    :expand,
    :invoice,
    :lines,
    :memo,
    :metadata,
    :out_of_band_amount,
    :reason,
    :refund_amount,
    :refunds,
    :shipping_cost
  ]
end
