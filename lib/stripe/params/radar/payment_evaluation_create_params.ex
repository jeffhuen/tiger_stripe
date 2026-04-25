# File generated from our OpenAPI spec
defmodule Stripe.Params.Radar.PaymentEvaluationCreateParams do
  @moduledoc "Parameters for payment evaluation create."

  @typedoc """
  * `client_device_metadata_details` - Details about the Client Device Metadata to associate with the payment evaluation.
  * `customer_details` - Details about the customer associated with the payment evaluation.
  * `expand` - Specifies which fields in the response should be expanded.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `payment_details` - Details about the payment.
  """
  @type t :: %__MODULE__{
          client_device_metadata_details: client_device_metadata_details() | nil,
          customer_details: customer_details(),
          expand: [String.t()] | nil,
          metadata: %{String.t() => String.t()} | nil,
          payment_details: payment_details()
        }

  defstruct [
    :client_device_metadata_details,
    :customer_details,
    :expand,
    :metadata,
    :payment_details
  ]

  @typedoc """
  * `radar_session` - ID for the Radar Session to associate with the payment evaluation. A [Radar Session](https://docs.stripe.com/radar/radar-session) is a snapshot of the browser metadata and device details that help Radar make more accurate predictions on your payments. Max length: 5000.
  """
  @type client_device_metadata_details :: %{
          optional(:radar_session) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `customer` - The ID of the customer associated with the payment evaluation. Max length: 5000.
  * `customer_account` - The ID of the Account representing the customer associated with the payment evaluation. Max length: 5000.
  * `email` - The customer's email address.
  * `name` - The customer's full name or business name. Max length: 5000.
  * `phone` - The customer's phone number.
  """
  @type customer_details :: %{
          optional(:customer) => String.t() | nil,
          optional(:customer_account) => String.t() | nil,
          optional(:email) => String.t() | nil,
          optional(:name) => String.t() | nil,
          optional(:phone) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `amount` - The intended amount to collect with this payment. A positive integer representing how much to charge in the [smallest currency unit](https://docs.stripe.com/currencies#zero-decimal) (for example, 100 cents to charge 1.00 USD or 100 to charge 100 Yen, a zero-decimal currency).
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `description` - An arbitrary string attached to the object. Often useful for displaying to users. Max length: 5000.
  * `money_movement_details` - Details about the payment's customer presence and type.
  * `payment_method_details` - Details about the payment method to use for the payment.
  * `shipping_details` - Shipping details for the payment evaluation.
  * `statement_descriptor` - Payment statement descriptor. Max length: 5000.
  """
  @type payment_details :: %{
          optional(:amount) => integer() | nil,
          optional(:currency) => String.t() | nil,
          optional(:description) => String.t() | nil,
          optional(:money_movement_details) => payment_details_money_movement_details() | nil,
          optional(:payment_method_details) => payment_details_payment_method_details() | nil,
          optional(:shipping_details) => payment_details_shipping_details() | nil,
          optional(:statement_descriptor) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `card` - Describes card money movement details for the payment evaluation.
  * `money_movement_type` - Describes the type of money movement. Currently only `card` is supported. Possible values: `card`.
  """
  @type payment_details_money_movement_details :: %{
          optional(:card) => payment_details_money_movement_details_card() | nil,
          optional(:money_movement_type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `customer_presence` - Describes the presence of the customer during the payment. Possible values: `off_session`, `on_session`.
  * `payment_type` - Describes the type of payment. Possible values: `one_off`, `recurring`, `setup_one_off`, `setup_recurring`.
  """
  @type payment_details_money_movement_details_card :: %{
          optional(:customer_presence) => String.t() | nil,
          optional(:payment_type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `billing_details` - Billing information associated with the payment evaluation.
  * `payment_method` - ID of the payment method used in this payment evaluation. Max length: 5000.
  """
  @type payment_details_payment_method_details :: %{
          optional(:billing_details) =>
            payment_details_payment_method_details_billing_details() | nil,
          optional(:payment_method) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `address` - Billing address.
  * `email` - Email address.
  * `name` - Full name. Max length: 5000.
  * `phone` - Billing phone number (including extension).
  """
  @type payment_details_payment_method_details_billing_details :: %{
          optional(:address) =>
            payment_details_payment_method_details_billing_details_address() | nil,
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
  @type payment_details_payment_method_details_billing_details_address :: %{
          optional(:city) => String.t() | nil,
          optional(:country) => String.t() | nil,
          optional(:line1) => String.t() | nil,
          optional(:line2) => String.t() | nil,
          optional(:postal_code) => String.t() | nil,
          optional(:state) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `address` - Shipping address.
  * `name` - Shipping name. Max length: 5000.
  * `phone` - Shipping phone number.
  """
  @type payment_details_shipping_details :: %{
          optional(:address) => payment_details_shipping_details_address() | nil,
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
  @type payment_details_shipping_details_address :: %{
          optional(:city) => String.t() | nil,
          optional(:country) => String.t() | nil,
          optional(:line1) => String.t() | nil,
          optional(:line2) => String.t() | nil,
          optional(:postal_code) => String.t() | nil,
          optional(:state) => String.t() | nil,
          optional(String.t()) => term()
        }
end
