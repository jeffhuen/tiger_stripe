# File generated from our OpenAPI spec
defmodule Stripe.Params.CustomerCreateParams do
  @moduledoc "Parameters for customer create."

  @typedoc """
  * `address` - The customer's address. Learn about [country-specific requirements for calculating tax](https://docs.stripe.com/invoicing/taxes?dashboard-or-api=dashboard#set-up-customer).
  * `balance` - An integer amount in cents (or local equivalent) that represents the customer's current balance, which affect the customer's future invoices. A negative amount represents a credit that decreases the amount due on an invoice; a positive amount increases the amount due on an invoice.
  * `business_name` - The customer's business name. This may be up to *150 characters*.
  * `cash_balance` - Balance information and default balance settings for this customer.
  * `description` - An arbitrary string that you can attach to a customer object. It is displayed alongside the customer in the dashboard. Max length: 5000.
  * `email` - Customer's email address. It's displayed alongside the customer in your dashboard and can be useful for searching and tracking. This may be up to *512 characters*. Max length: 512.
  * `expand` - Specifies which fields in the response should be expanded.
  * `individual_name` - The customer's full name. This may be up to *150 characters*.
  * `invoice_prefix` - The prefix for the customer used to generate unique invoice numbers. Must be 3–12 uppercase letters or numbers. Max length: 5000.
  * `invoice_settings` - Default invoice settings for this customer.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `name` - The customer's full name or business name. Max length: 256.
  * `next_invoice_sequence` - The sequence to be used on the customer's next invoice. Defaults to 1.
  * `payment_method` - Max length: 5000.
  * `phone` - The customer's phone number. Max length: 20.
  * `preferred_locales` - Customer's preferred languages, ordered by preference.
  * `shipping` - The customer's shipping information. Appears on invoices emailed to this customer.
  * `source` - Max length: 5000.
  * `tax` - Tax details about the customer.
  * `tax_exempt` - The customer's tax exemption. One of `none`, `exempt`, or `reverse`. Possible values: `exempt`, `none`, `reverse`.
  * `tax_id_data` - The customer's tax IDs.
  * `test_clock` - ID of the test clock to attach to the customer. Max length: 5000.
  * `validate`
  """
  @type t :: %__MODULE__{}

  defstruct [
    :address,
    :balance,
    :business_name,
    :cash_balance,
    :description,
    :email,
    :expand,
    :individual_name,
    :invoice_prefix,
    :invoice_settings,
    :metadata,
    :name,
    :next_invoice_sequence,
    :payment_method,
    :phone,
    :preferred_locales,
    :shipping,
    :source,
    :tax,
    :tax_exempt,
    :tax_id_data,
    :test_clock,
    :validate
  ]
end
