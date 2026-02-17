# File generated from our OpenAPI spec
defmodule Stripe.Params.CreditNotePreviewLinesPreviewLinesParams do
  @moduledoc "Parameters for credit note preview lines preview lines."

  @typedoc """
  * `amount` - The integer amount in cents (or local equivalent) representing the total amount of the credit note. One of `amount`, `lines`, or `shipping_cost` must be provided.
  * `credit_amount` - The integer amount in cents (or local equivalent) representing the amount to credit the customer's balance, which will be automatically applied to their next invoice.
  * `effective_at` - The date when this credit note is in effect. Same as `created` unless overwritten. When defined, this value replaces the system-generated 'Date of issue' printed on the credit note PDF. Format: Unix timestamp.
  * `email_type` - Type of email to send to the customer, one of `credit_note` or `none` and the default is `credit_note`. Possible values: `credit_note`, `none`.
  * `ending_before` - A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. Max length: 5000.
  * `expand` - Specifies which fields in the response should be expanded.
  * `invoice` - ID of the invoice. Max length: 5000.
  * `limit` - A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
  * `lines` - Line items that make up the credit note. One of `amount`, `lines`, or `shipping_cost` must be provided.
  * `memo` - The credit note's memo appears on the credit note PDF. Max length: 5000.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `out_of_band_amount` - The integer amount in cents (or local equivalent) representing the amount that is credited outside of Stripe.
  * `reason` - Reason for issuing this credit note, one of `duplicate`, `fraudulent`, `order_change`, or `product_unsatisfactory` Possible values: `duplicate`, `fraudulent`, `order_change`, `product_unsatisfactory`.
  * `refund_amount` - The integer amount in cents (or local equivalent) representing the amount to refund. If set, a refund will be created for the charge associated with the invoice.
  * `refunds` - Refunds to link to this credit note.
  * `shipping_cost` - When shipping_cost contains the shipping_rate from the invoice, the shipping_cost is included in the credit note. One of `amount`, `lines`, or `shipping_cost` must be provided.
  * `starting_after` - A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. Max length: 5000.
  """
  @type t :: %__MODULE__{
          amount: integer() | nil,
          credit_amount: integer() | nil,
          effective_at: integer() | nil,
          email_type: String.t() | nil,
          ending_before: String.t() | nil,
          expand: [String.t()] | nil,
          invoice: String.t(),
          limit: integer() | nil,
          lines: [__MODULE__.Lines.t()] | nil,
          memo: String.t() | nil,
          metadata: %{String.t() => String.t()} | nil,
          out_of_band_amount: integer() | nil,
          reason: String.t() | nil,
          refund_amount: integer() | nil,
          refunds: [__MODULE__.Refunds.t()] | nil,
          shipping_cost: __MODULE__.ShippingCost.t() | nil,
          starting_after: String.t() | nil
        }

  defstruct [
    :amount,
    :credit_amount,
    :effective_at,
    :email_type,
    :ending_before,
    :expand,
    :invoice,
    :limit,
    :lines,
    :memo,
    :metadata,
    :out_of_band_amount,
    :reason,
    :refund_amount,
    :refunds,
    :shipping_cost,
    :starting_after
  ]

  defmodule Lines do
    @moduledoc "Nested parameters."

    @typedoc """
    * `amount` - The line item amount to credit. Only valid when `type` is `invoice_line_item`. If invoice is set up with `automatic_tax[enabled]=true`, this amount is tax exclusive
    * `description` - The description of the credit note line item. Only valid when the `type` is `custom_line_item`. Max length: 5000.
    * `invoice_line_item` - The invoice line item to credit. Only valid when the `type` is `invoice_line_item`. Max length: 5000.
    * `quantity` - The line item quantity to credit.
    * `tax_amounts` - A list of up to 10 tax amounts for the credit note line item. Cannot be mixed with `tax_rates`.
    * `tax_rates` - The tax rates which apply to the credit note line item. Only valid when the `type` is `custom_line_item` and cannot be mixed with `tax_amounts`.
    * `type` - Type of the credit note line item, one of `invoice_line_item` or `custom_line_item` Possible values: `custom_line_item`, `invoice_line_item`.
    * `unit_amount` - The integer unit amount in cents (or local equivalent) of the credit note line item. This `unit_amount` will be multiplied by the quantity to get the full amount to credit for this line item. Only valid when `type` is `custom_line_item`.
    * `unit_amount_decimal` - Same as `unit_amount`, but accepts a decimal value in cents (or local equivalent) with at most 12 decimal places. Only one of `unit_amount` and `unit_amount_decimal` can be set. Format: decimal string.
    """
    @type t :: %__MODULE__{
            amount: integer() | nil,
            description: String.t() | nil,
            invoice_line_item: String.t() | nil,
            quantity: integer() | nil,
            tax_amounts: map() | nil,
            tax_rates: map() | nil,
            type: String.t() | nil,
            unit_amount: integer() | nil,
            unit_amount_decimal: String.t() | nil
          }
    defstruct [
      :amount,
      :description,
      :invoice_line_item,
      :quantity,
      :tax_amounts,
      :tax_rates,
      :type,
      :unit_amount,
      :unit_amount_decimal
    ]
  end

  defmodule Refunds do
    @moduledoc "Nested parameters."

    @typedoc """
    * `amount_refunded` - Amount of the refund that applies to this credit note, in cents (or local equivalent). Defaults to the entire refund amount.
    * `payment_record_refund` - The PaymentRecord refund details to link to this credit note. Required when `type` is `payment_record_refund`.
    * `refund` - ID of an existing refund to link this credit note to. Required when `type` is `refund`.
    * `type` - Type of the refund, one of `refund` or `payment_record_refund`. Defaults to `refund`. Possible values: `payment_record_refund`, `refund`.
    """
    @type t :: %__MODULE__{
            amount_refunded: integer() | nil,
            payment_record_refund: __MODULE__.PaymentRecordRefund.t() | nil,
            refund: String.t() | nil,
            type: String.t() | nil
          }
    defstruct [:amount_refunded, :payment_record_refund, :refund, :type]

    defmodule PaymentRecordRefund do
      @moduledoc "Nested parameters."

      @typedoc """
      * `payment_record` - The ID of the PaymentRecord with the refund to link to this credit note. Max length: 5000.
      * `refund_group` - The PaymentRecord refund group to link to this credit note. For refunds processed off-Stripe, this will correspond to the `processor_details.custom.refund_reference` field provided when reporting the refund on the PaymentRecord. Max length: 5000.
      """
      @type t :: %__MODULE__{
              payment_record: String.t() | nil,
              refund_group: String.t() | nil
            }
      defstruct [:payment_record, :refund_group]
    end
  end

  defmodule ShippingCost do
    @moduledoc "Nested parameters."

    @typedoc """
    * `shipping_rate` - The ID of the shipping rate to use for this order. Max length: 5000.
    """
    @type t :: %__MODULE__{
            shipping_rate: String.t() | nil
          }
    defstruct [:shipping_rate]
  end
end
