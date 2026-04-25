# File generated from our OpenAPI spec
defmodule Stripe.Params.Issuing.CardUpdateParams do
  @moduledoc "Parameters for card update."

  @typedoc """
  * `cancellation_reason` - Reason why the `status` of this card is `canceled`. Possible values: `lost`, `stolen`.
  * `expand` - Specifies which fields in the response should be expanded.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `personalization_design` - Max length: 5000.
  * `pin` - The desired new PIN for this card.
  * `shipping` - Updated shipping information for the card.
  * `spending_controls` - Rules that control spending for this card. Refer to our [documentation](https://docs.stripe.com/issuing/controls/spending-controls) for more details.
  * `status` - Dictates whether authorizations can be approved on this card. May be blocked from activating cards depending on past-due Cardholder requirements. Defaults to `inactive`. If this card is being canceled because it was lost or stolen, this information should be provided as `cancellation_reason`. Possible values: `active`, `canceled`, `inactive`.
  """
  @type t :: %__MODULE__{
          cancellation_reason: String.t() | nil,
          expand: [String.t()] | nil,
          metadata: map() | nil,
          personalization_design: String.t() | nil,
          pin: pin() | nil,
          shipping: shipping() | nil,
          spending_controls: spending_controls() | nil,
          status: String.t() | nil
        }

  defstruct [
    :cancellation_reason,
    :expand,
    :metadata,
    :personalization_design,
    :pin,
    :shipping,
    :spending_controls,
    :status
  ]

  @typedoc """
  * `encrypted_number` - The card's desired new PIN, encrypted under Stripe's public key. Max length: 5000.
  """
  @type pin :: %{
          optional(:encrypted_number) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `address` - The address that the card is shipped to.
  * `address_validation` - Address validation settings.
  * `customs` - Customs information for the shipment.
  * `name` - The name printed on the shipping label when shipping the card. Max length: 5000.
  * `phone_number` - Phone number of the recipient of the shipment.
  * `require_signature` - Whether a signature is required for card delivery.
  * `service` - Shipment service. Possible values: `express`, `priority`, `standard`.
  * `type` - Packaging options. Possible values: `bulk`, `individual`.
  """
  @type shipping :: %{
          optional(:address) => shipping_address() | nil,
          optional(:address_validation) => shipping_address_validation() | nil,
          optional(:customs) => shipping_customs() | nil,
          optional(:name) => String.t() | nil,
          optional(:phone_number) => String.t() | nil,
          optional(:require_signature) => boolean() | nil,
          optional(:service) => String.t() | nil,
          optional(:type) => String.t() | nil,
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
  @type shipping_address :: %{
          optional(:city) => String.t() | nil,
          optional(:country) => String.t() | nil,
          optional(:line1) => String.t() | nil,
          optional(:line2) => String.t() | nil,
          optional(:postal_code) => String.t() | nil,
          optional(:state) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `mode` - The address validation capabilities to use. Possible values: `disabled`, `normalization_only`, `validation_and_normalization`.
  """
  @type shipping_address_validation :: %{
          optional(:mode) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `eori_number` - The Economic Operators Registration and Identification (EORI) number to use for Customs. Required for bulk shipments to Europe. Max length: 5000.
  """
  @type shipping_customs :: %{
          optional(:eori_number) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `allowed_categories` - Array of strings containing [categories](https://docs.stripe.com/api#issuing_authorization_object-merchant_data-category) of authorizations to allow. All other categories will be blocked. Cannot be set with `blocked_categories`.
  * `allowed_merchant_countries` - Array of strings containing representing countries from which authorizations will be allowed. Authorizations from merchants in all other countries will be declined. Country codes should be ISO 3166 alpha-2 country codes (e.g. `US`). Cannot be set with `blocked_merchant_countries`. Provide an empty value to unset this control.
  * `blocked_categories` - Array of strings containing [categories](https://docs.stripe.com/api#issuing_authorization_object-merchant_data-category) of authorizations to decline. All other categories will be allowed. Cannot be set with `allowed_categories`.
  * `blocked_merchant_countries` - Array of strings containing representing countries from which authorizations will be declined. Country codes should be ISO 3166 alpha-2 country codes (e.g. `US`). Cannot be set with `allowed_merchant_countries`. Provide an empty value to unset this control.
  * `spending_limits` - Limit spending with amount-based rules that apply across any cards this card replaced (i.e., its `replacement_for` card and _that_ card's `replacement_for` card, up the chain).
  """
  @type spending_controls :: %{
          optional(:allowed_categories) => [String.t()] | nil,
          optional(:allowed_merchant_countries) => [String.t()] | nil,
          optional(:blocked_categories) => [String.t()] | nil,
          optional(:blocked_merchant_countries) => [String.t()] | nil,
          optional(:spending_limits) => [spending_controls_spending_limits()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `amount` - Maximum amount allowed to spend per interval.
  * `categories` - Array of strings containing [categories](https://docs.stripe.com/api#issuing_authorization_object-merchant_data-category) this limit applies to. Omitting this field will apply the limit to all categories.
  * `interval` - Interval (or event) to which the amount applies. Possible values: `all_time`, `daily`, `monthly`, `per_authorization`, `weekly`, `yearly`.
  """
  @type spending_controls_spending_limits :: %{
          optional(:amount) => integer() | nil,
          optional(:categories) => [String.t()] | nil,
          optional(:interval) => String.t() | nil,
          optional(String.t()) => term()
        }
end
