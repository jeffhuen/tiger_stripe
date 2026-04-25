# File generated from our OpenAPI spec
defmodule Stripe.Params.PaymentRecordReportPaymentParams do
  @moduledoc "Parameters for payment record report payment."

  @typedoc """
  * `amount_requested` - The amount you initially requested for this payment.
  * `customer_details` - Customer information for this payment.
  * `customer_presence` - Indicates whether the customer was present in your checkout flow during this payment. Possible values: `off_session`, `on_session`.
  * `description` - An arbitrary string attached to the object. Often useful for displaying to users. Max length: 5000.
  * `expand` - Specifies which fields in the response should be expanded.
  * `failed` - Information about the payment attempt failure.
  * `guaranteed` - Information about the payment attempt guarantee.
  * `initiated_at` - When the reported payment was initiated. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `outcome` - The outcome of the reported payment. Possible values: `failed`, `guaranteed`.
  * `payment_method_details` - Information about the Payment Method debited for this payment.
  * `processor_details` - Processor information for this payment.
  * `shipping_details` - Shipping information for this payment.
  """
  @type t :: %__MODULE__{
          amount_requested: amount_requested(),
          customer_details: customer_details() | nil,
          customer_presence: String.t() | nil,
          description: String.t() | nil,
          expand: [String.t()] | nil,
          failed: failed() | nil,
          guaranteed: guaranteed() | nil,
          initiated_at: integer(),
          metadata: map() | nil,
          outcome: String.t() | nil,
          payment_method_details: payment_method_details(),
          processor_details: processor_details() | nil,
          shipping_details: shipping_details() | nil
        }

  defstruct [
    :amount_requested,
    :customer_details,
    :customer_presence,
    :description,
    :expand,
    :failed,
    :guaranteed,
    :initiated_at,
    :metadata,
    :outcome,
    :payment_method_details,
    :processor_details,
    :shipping_details
  ]

  @typedoc """
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `value` - A positive integer representing the amount in the currency's [minor unit](https://docs.stripe.com/currencies#zero-decimal). For example, `100` can represent 1 USD or 100 JPY.
  """
  @type amount_requested :: %{
          optional(:currency) => String.t() | nil,
          optional(:value) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `customer` - The customer who made the payment. Max length: 5000.
  * `email` - The customer's phone number.
  * `name` - The customer's name. Max length: 5000.
  * `phone` - The customer's phone number.
  """
  @type customer_details :: %{
          optional(:customer) => String.t() | nil,
          optional(:email) => String.t() | nil,
          optional(:name) => String.t() | nil,
          optional(:phone) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `failed_at` - When the reported payment failed. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  """
  @type failed :: %{
          optional(:failed_at) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `guaranteed_at` - When the reported payment was guaranteed. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  """
  @type guaranteed :: %{
          optional(:guaranteed_at) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `billing_details` - The billing details associated with the method of payment.
  * `custom` - Information about the custom (user-defined) payment method used to make this payment.
  * `payment_method` - ID of the Stripe Payment Method used to make this payment. Max length: 5000.
  * `type` - The type of the payment method details. An additional hash is included on the payment_method_details with a name matching this value. It contains additional information specific to the type. Possible values: `custom`.
  """
  @type payment_method_details :: %{
          optional(:billing_details) => payment_method_details_billing_details() | nil,
          optional(:custom) => payment_method_details_custom() | nil,
          optional(:payment_method) => String.t() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `address` - The billing address associated with the method of payment.
  * `email` - The billing email associated with the method of payment.
  * `name` - The billing name associated with the method of payment. Max length: 5000.
  * `phone` - The billing phone number associated with the method of payment.
  """
  @type payment_method_details_billing_details :: %{
          optional(:address) => payment_method_details_billing_details_address() | nil,
          optional(:email) => String.t() | nil,
          optional(:name) => String.t() | nil,
          optional(:phone) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `city` - City, district, suburb, town, or village. Max length: 5000.
  * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)). Max length: 5000.
  * `line1` - Address line 1, such as the street, PO Box, or company name. Max length: 5000.
  * `line2` - Address line 2, such as the apartment, suite, unit, or building. Max length: 5000.
  * `postal_code` - ZIP or postal code. Max length: 5000.
  * `state` - State, county, province, or region ([ISO 3166-2](https://en.wikipedia.org/wiki/ISO_3166-2)). Max length: 5000.
  """
  @type payment_method_details_billing_details_address :: %{
          optional(:city) => String.t() | nil,
          optional(:country) => String.t() | nil,
          optional(:line1) => String.t() | nil,
          optional(:line2) => String.t() | nil,
          optional(:postal_code) => String.t() | nil,
          optional(:state) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `display_name` - Display name for the custom (user-defined) payment method type used to make this payment. Max length: 5000.
  * `type` - The custom payment method type associated with this payment. Max length: 5000.
  """
  @type payment_method_details_custom :: %{
          optional(:display_name) => String.t() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `custom` - Information about the custom processor used to make this payment.
  * `type` - The type of the processor details. An additional hash is included on processor_details with a name matching this value. It contains additional information specific to the processor. Possible values: `custom`.
  """
  @type processor_details :: %{
          optional(:custom) => processor_details_custom() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `payment_reference` - An opaque string for manual reconciliation of this payment, for example a check number or a payment processor ID. Max length: 5000.
  """
  @type processor_details_custom :: %{
          optional(:payment_reference) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `address` - The physical shipping address.
  * `name` - The shipping recipient's name. Max length: 5000.
  * `phone` - The shipping recipient's phone number.
  """
  @type shipping_details :: %{
          optional(:address) => shipping_details_address() | nil,
          optional(:name) => String.t() | nil,
          optional(:phone) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `city` - City, district, suburb, town, or village. Max length: 5000.
  * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)). Max length: 5000.
  * `line1` - Address line 1, such as the street, PO Box, or company name. Max length: 5000.
  * `line2` - Address line 2, such as the apartment, suite, unit, or building. Max length: 5000.
  * `postal_code` - ZIP or postal code. Max length: 5000.
  * `state` - State, county, province, or region ([ISO 3166-2](https://en.wikipedia.org/wiki/ISO_3166-2)). Max length: 5000.
  """
  @type shipping_details_address :: %{
          optional(:city) => String.t() | nil,
          optional(:country) => String.t() | nil,
          optional(:line1) => String.t() | nil,
          optional(:line2) => String.t() | nil,
          optional(:postal_code) => String.t() | nil,
          optional(:state) => String.t() | nil,
          optional(String.t()) => term()
        }
end
