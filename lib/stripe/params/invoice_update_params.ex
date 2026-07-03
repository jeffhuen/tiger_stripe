# File generated from our OpenAPI spec
defmodule Stripe.Params.InvoiceUpdateParams do
  @moduledoc "Parameters for invoice update."

  @typedoc """
  * `account_tax_ids` - The account tax IDs associated with the invoice. Only editable when the invoice is a draft.
  * `application_fee_amount` - A fee in cents (or local equivalent) that will be applied to the invoice and transferred to the application owner's Stripe account. The request must be made with an OAuth key or the Stripe-Account header in order to take an application fee. For more information, see the application fees [documentation](https://docs.stripe.com/billing/invoices/connect#collecting-fees).
  * `auto_advance` - Controls whether Stripe performs [automatic collection](https://docs.stripe.com/invoicing/integration/automatic-advancement-collection) of the invoice.
  * `automatic_tax` - Settings for automatic tax lookup for this invoice.
  * `automatically_finalizes_at` - The time when this invoice should be scheduled to finalize (up to 5 years in the future). The invoice is finalized at this time if it's still in draft state. To turn off automatic finalization, set `auto_advance` to false. Format: Unix timestamp.
  * `collection_method` - Either `charge_automatically` or `send_invoice`. This field can be updated only on `draft` invoices. Possible values: `charge_automatically`, `send_invoice`.
  * `custom_fields` - A list of up to 4 custom fields to be displayed on the invoice. If a value for `custom_fields` is specified, the list specified will replace the existing custom field list on this invoice. Pass an empty string to remove previously-defined fields.
  * `days_until_due` - The number of days from which the invoice is created until it is due. Only valid for invoices where `collection_method=send_invoice`. This field can only be updated on `draft` invoices.
  * `default_payment_method` - ID of the default payment method for the invoice. It must belong to the customer associated with the invoice. If not set, defaults to the subscription's default payment method, if any, or to the default payment method in the customer's invoice settings. Max length: 5000.
  * `default_source` - ID of the default payment source for the invoice. It must belong to the customer associated with the invoice and be in a chargeable state. If not set, defaults to the subscription's default source, if any, or to the customer's default source.
  * `default_tax_rates` - The tax rates that will apply to any line item that does not have `tax_rates` set. Pass an empty string to remove previously-defined tax rates.
  * `description` - An arbitrary string attached to the object. Often useful for displaying to users. Referenced as 'memo' in the Dashboard. Max length: 1500.
  * `discounts` - The discounts that will apply to the invoice. Pass an empty string to remove previously-defined discounts.
  * `due_date` - The date on which payment for this invoice is due. Only valid for invoices where `collection_method=send_invoice`. This field can only be updated on `draft` invoices. Format: Unix timestamp.
  * `effective_at` - The date when this invoice is in effect. Same as `finalized_at` unless overwritten. When defined, this value replaces the system-generated 'Date of issue' printed on the invoice PDF and receipt.
  * `expand` - Specifies which fields in the response should be expanded.
  * `footer` - Footer to be displayed on the invoice. Max length: 5000.
  * `issuer` - The connected account that issues the invoice. The invoice is presented with the branding and support information of the specified account.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `number` - Set the number for this invoice. If no number is present then a number will be assigned automatically when the invoice is finalized. In many markets, regulations require invoices to be unique, sequential and / or gapless. You are responsible for ensuring this is true across all your different invoicing systems in the event that you edit the invoice number using our API. If you use only Stripe for your invoices and do not change invoice numbers, Stripe handles this aspect of compliance for you automatically.
  * `on_behalf_of` - The account (if any) for which the funds of the invoice payment are intended. If set, the invoice will be presented with the branding and support information of the specified account. See the [Invoices with Connect](https://docs.stripe.com/billing/invoices/connect) documentation for details.
  * `payment_settings` - Configuration settings for the PaymentIntent that is generated when the invoice is finalized.
  * `rendering` - The rendering-related settings that control how the invoice is displayed on customer-facing surfaces such as PDF and Hosted Invoice Page.
  * `shipping_cost` - Settings for the cost of shipping for this invoice.
  * `shipping_details` - Shipping details for the invoice. The Invoice PDF will use the `shipping_details` value if it is set, otherwise the PDF will render the shipping address from the customer.
  * `statement_descriptor` - Extra information about a charge for the customer's credit card statement. It must contain at least one letter. If not specified and this invoice is part of a subscription, the default `statement_descriptor` will be set to the first subscription item's product's `statement_descriptor`. Max length: 22.
  * `transfer_data` - If specified, the funds from the invoice will be transferred to the destination and the ID of the resulting transfer will be found on the invoice's charge. This will be unset if you POST an empty value.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :account_tax_ids,
    :application_fee_amount,
    :auto_advance,
    :automatic_tax,
    :automatically_finalizes_at,
    :collection_method,
    :custom_fields,
    :days_until_due,
    :default_payment_method,
    :default_source,
    :default_tax_rates,
    :description,
    :discounts,
    :due_date,
    :effective_at,
    :expand,
    :footer,
    :issuer,
    :metadata,
    :number,
    :on_behalf_of,
    :payment_settings,
    :rendering,
    :shipping_cost,
    :shipping_details,
    :statement_descriptor,
    :transfer_data
  ]
end
