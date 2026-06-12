# File generated from our OpenAPI spec
defmodule Stripe.Params.Issuing.CardholderCreateParams do
  @moduledoc "Parameters for cardholder create."

  @typedoc """
  * `billing` - The cardholder's billing address.
  * `company` - Additional information about a `company` cardholder.
  * `email` - The cardholder's email address.
  * `expand` - Specifies which fields in the response should be expanded.
  * `individual` - Additional information about an `individual` cardholder.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `name` - The cardholder's name. This will be printed on cards issued to them. The maximum length of this field is 24 characters. This field cannot contain any special characters or numbers.
  * `phone_number` - The cardholder's phone number. This will be transformed to [E.164](https://en.wikipedia.org/wiki/E.164) if it is not provided in that format already. This is required for all cardholders who will be creating EU cards. See the [3D Secure documentation](https://docs.stripe.com/issuing/3d-secure#when-is-3d-secure-applied) for more details.
  * `preferred_locales` - The cardholder’s preferred locales (languages), ordered by preference. Locales can be `da`, `de`, `en`, `es`, `fr`, `it`, `pl`, or `sv`.
  This changes the language of the [3D Secure flow](https://docs.stripe.com/issuing/3d-secure) and one-time password messages sent to the cardholder.
  * `spending_controls` - Rules that control spending across this cardholder's cards. Refer to our [documentation](https://docs.stripe.com/issuing/controls/spending-controls) for more details.
  * `status` - Specifies whether to permit authorizations on this cardholder's cards. Defaults to `active`. Possible values: `active`, `inactive`.
  * `type` - One of `individual` or `company`. See [Choose a cardholder type](https://docs.stripe.com/issuing/other/choose-cardholder) for more details. Possible values: `company`, `individual`.
  """
  @type t :: %__MODULE__{
          billing: billing(),
          company: company() | nil,
          email: String.t() | nil,
          expand: [String.t()] | nil,
          individual: individual() | nil,
          metadata: %{String.t() => String.t()} | nil,
          name: String.t(),
          phone_number: String.t() | nil,
          preferred_locales: [String.t()] | nil,
          spending_controls: spending_controls() | nil,
          status: String.t() | nil,
          type: String.t() | nil
        }

  defstruct [
    :billing,
    :company,
    :email,
    :expand,
    :individual,
    :metadata,
    :name,
    :phone_number,
    :preferred_locales,
    :spending_controls,
    :status,
    :type
  ]

  @typedoc """
  * `address` - The cardholder’s billing address.
  """
  @type billing :: %{
          optional(:address) => billing_address() | nil,
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
  @type billing_address :: %{
          optional(:city) => String.t() | nil,
          optional(:country) => String.t() | nil,
          optional(:line1) => String.t() | nil,
          optional(:line2) => String.t() | nil,
          optional(:postal_code) => String.t() | nil,
          optional(:state) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `tax_id` - The entity's business ID number. Max length: 5000.
  """
  @type company :: %{
          optional(:tax_id) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `card_issuing` - Information related to the card_issuing program for this cardholder.
  * `dob` - The date of birth of this cardholder. Cardholders must be older than 13 years old.
  * `first_name` - The first name of this cardholder. Required before activating Cards. This field cannot contain any numbers, special characters (except periods, commas, hyphens, spaces and apostrophes) or non-latin letters.
  * `last_name` - The last name of this cardholder. Required before activating Cards. This field cannot contain any numbers, special characters (except periods, commas, hyphens, spaces and apostrophes) or non-latin letters.
  * `verification` - Government-issued ID document for this cardholder.
  """
  @type individual :: %{
          optional(:card_issuing) => individual_card_issuing() | nil,
          optional(:dob) => individual_dob() | nil,
          optional(:first_name) => String.t() | nil,
          optional(:last_name) => String.t() | nil,
          optional(:verification) => individual_verification() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `user_terms_acceptance` - Information about cardholder acceptance of Celtic [Authorized User Terms](https://stripe.com/docs/issuing/cards#accept-authorized-user-terms). Required for cards backed by a Celtic program.
  """
  @type individual_card_issuing :: %{
          optional(:user_terms_acceptance) =>
            individual_card_issuing_user_terms_acceptance() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `date` - The Unix timestamp marking when the cardholder accepted the Authorized User Terms. Format: Unix timestamp.
  * `ip` - The IP address from which the cardholder accepted the Authorized User Terms.
  * `user_agent` - The user agent of the browser from which the cardholder accepted the Authorized User Terms.
  """
  @type individual_card_issuing_user_terms_acceptance :: %{
          optional(:date) => integer() | nil,
          optional(:ip) => String.t() | nil,
          optional(:user_agent) => map() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `day` - The day of birth, between 1 and 31.
  * `month` - The month of birth, between 1 and 12.
  * `year` - The four-digit year of birth.
  """
  @type individual_dob :: %{
          optional(:day) => integer() | nil,
          optional(:month) => integer() | nil,
          optional(:year) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `document` - An identifying document, either a passport or local ID card.
  """
  @type individual_verification :: %{
          optional(:document) => individual_verification_document() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `back` - The back of an ID returned by a [file upload](https://api.stripe.com#create_file) with a `purpose` value of `identity_document`. Max length: 5000.
  * `front` - The front of an ID returned by a [file upload](https://api.stripe.com#create_file) with a `purpose` value of `identity_document`. Max length: 5000.
  """
  @type individual_verification_document :: %{
          optional(:back) => String.t() | nil,
          optional(:front) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `allowed_categories` - Array of strings containing [categories](https://docs.stripe.com/api#issuing_authorization_object-merchant_data-category) of authorizations to allow. All other categories will be blocked. Cannot be set with `blocked_categories`.
  * `allowed_merchant_countries` - Array of strings containing representing countries from which authorizations will be allowed. Authorizations from merchants in all other countries will be declined. Country codes should be ISO 3166 alpha-2 country codes (e.g. `US`). Cannot be set with `blocked_merchant_countries`. Provide an empty value to unset this control.
  * `blocked_categories` - Array of strings containing [categories](https://docs.stripe.com/api#issuing_authorization_object-merchant_data-category) of authorizations to decline. All other categories will be allowed. Cannot be set with `allowed_categories`.
  * `blocked_merchant_countries` - Array of strings containing representing countries from which authorizations will be declined. Country codes should be ISO 3166 alpha-2 country codes (e.g. `US`). Cannot be set with `allowed_merchant_countries`. Provide an empty value to unset this control.
  * `spending_limits` - Limit spending with amount-based rules that apply across this cardholder's cards.
  * `spending_limits_currency` - Currency of amounts within `spending_limits`. Defaults to your merchant country's currency.
  """
  @type spending_controls :: %{
          optional(:allowed_categories) => [String.t()] | nil,
          optional(:allowed_merchant_countries) => [String.t()] | nil,
          optional(:blocked_categories) => [String.t()] | nil,
          optional(:blocked_merchant_countries) => [String.t()] | nil,
          optional(:spending_limits) => [spending_controls_spending_limits()] | nil,
          optional(:spending_limits_currency) => String.t() | nil,
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
