# File generated from our OpenAPI spec
defmodule Stripe.Params.PaymentMethodUpdateParams do
  @moduledoc "Parameters for payment method update."

  @typedoc """
  * `allow_redisplay` - This field indicates whether this payment method can be shown again to its customer in a checkout flow. Stripe products such as Checkout and Elements use this field to determine whether a payment method can be shown as a saved payment method in a checkout flow. The field defaults to `unspecified`. Possible values: `always`, `limited`, `unspecified`.
  * `billing_details` - Billing information associated with the PaymentMethod that may be used or required by particular types of payment methods.
  * `card` - If this is a `card` PaymentMethod, this hash contains the user's card details.
  * `expand` - Specifies which fields in the response should be expanded.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `payto` - If this is a `payto` PaymentMethod, this hash contains details about the PayTo payment method.
  * `us_bank_account` - If this is an `us_bank_account` PaymentMethod, this hash contains details about the US bank account payment method.
  """
  @type t :: %__MODULE__{
          allow_redisplay: String.t() | nil,
          billing_details: billing_details() | nil,
          card: card() | nil,
          expand: [String.t()] | nil,
          metadata: map() | nil,
          payto: payto() | nil,
          us_bank_account: us_bank_account() | nil
        }

  defstruct [
    :allow_redisplay,
    :billing_details,
    :card,
    :expand,
    :metadata,
    :payto,
    :us_bank_account
  ]

  @typedoc """
  * `address` - Billing address.
  * `email` - Email address.
  * `name` - Full name.
  * `phone` - Billing phone number (including extension).
  * `tax_id` - Taxpayer identification number. Used only for transactions between LATAM buyers and non-LATAM sellers. Max length: 5000.
  """
  @type billing_details :: %{
          optional(:address) => map() | nil,
          optional(:email) => map() | nil,
          optional(:name) => map() | nil,
          optional(:phone) => map() | nil,
          optional(:tax_id) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `exp_month` - Two-digit number representing the card's expiration month.
  * `exp_year` - Four-digit number representing the card's expiration year.
  * `networks` - Contains information about card networks used to process the payment.
  """
  @type card :: %{
          optional(:exp_month) => integer() | nil,
          optional(:exp_year) => integer() | nil,
          optional(:networks) => card_networks() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `preferred` - The customer's preferred card network for co-branded cards. Supports `cartes_bancaires`, `mastercard`, or `visa`. Selection of a network that does not apply to the card will be stored as `invalid_preference` on the card. Possible values: `cartes_bancaires`, `mastercard`, `visa`.
  """
  @type card_networks :: %{
          optional(:preferred) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `account_number` - The account number for the bank account. Max length: 5000.
  * `bsb_number` - Bank-State-Branch number of the bank account. Max length: 5000.
  * `pay_id` - The PayID alias for the bank account. Max length: 5000.
  """
  @type payto :: %{
          optional(:account_number) => String.t() | nil,
          optional(:bsb_number) => String.t() | nil,
          optional(:pay_id) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `account_holder_type` - Bank account holder type. Possible values: `company`, `individual`.
  * `account_type` - Bank account type. Possible values: `checking`, `savings`.
  """
  @type us_bank_account :: %{
          optional(:account_holder_type) => String.t() | nil,
          optional(:account_type) => String.t() | nil,
          optional(String.t()) => term()
        }
end
