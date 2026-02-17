# File generated from our OpenAPI spec
defmodule Stripe.Params.Issuing.CardholderUpdateParams do
  @moduledoc "Parameters for cardholder update."

  @typedoc """
  * `billing` - The cardholder's billing address.
  * `company` - Additional information about a `company` cardholder.
  * `email` - The cardholder's email address.
  * `expand` - Specifies which fields in the response should be expanded.
  * `individual` - Additional information about an `individual` cardholder.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `phone_number` - The cardholder's phone number. This is required for all cardholders who will be creating EU cards. See the [3D Secure documentation](https://docs.stripe.com/issuing/3d-secure) for more details.
  * `preferred_locales` - The cardholder’s preferred locales (languages), ordered by preference. Locales can be `de`, `en`, `es`, `fr`, or `it`.
  This changes the language of the [3D Secure flow](https://docs.stripe.com/issuing/3d-secure) and one-time password messages sent to the cardholder.
  * `spending_controls` - Rules that control spending across this cardholder's cards. Refer to our [documentation](https://docs.stripe.com/issuing/controls/spending-controls) for more details.
  * `status` - Specifies whether to permit authorizations on this cardholder's cards. Possible values: `active`, `inactive`.
  """
  @type t :: %__MODULE__{
          billing: __MODULE__.Billing.t() | nil,
          company: __MODULE__.Company.t() | nil,
          email: String.t() | nil,
          expand: [String.t()] | nil,
          individual: __MODULE__.Individual.t() | nil,
          metadata: %{String.t() => String.t()} | nil,
          phone_number: String.t() | nil,
          preferred_locales: [String.t()] | nil,
          spending_controls: __MODULE__.SpendingControls.t() | nil,
          status: String.t() | nil
        }

  defstruct [
    :billing,
    :company,
    :email,
    :expand,
    :individual,
    :metadata,
    :phone_number,
    :preferred_locales,
    :spending_controls,
    :status
  ]

  defmodule Billing do
    @moduledoc "Nested parameters."

    @typedoc """
    * `address` - The cardholder’s billing address.
    """
    @type t :: %__MODULE__{
            address: __MODULE__.Address.t() | nil
          }
    defstruct [:address]

    defmodule Address do
      @moduledoc "Nested parameters."

      @typedoc """
      * `city` - City, district, suburb, town, or village. Max length: 5000.
      * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)). Max length: 5000.
      * `line1` - Address line 1, such as the street, PO Box, or company name. Max length: 5000.
      * `line2` - Address line 2, such as the apartment, suite, unit, or building. Max length: 5000.
      * `postal_code` - ZIP or postal code. Max length: 5000.
      * `state` - State, county, province, or region ([ISO 3166-2](https://en.wikipedia.org/wiki/ISO_3166-2)). Max length: 5000.
      """
      @type t :: %__MODULE__{
              city: String.t() | nil,
              country: String.t() | nil,
              line1: String.t() | nil,
              line2: String.t() | nil,
              postal_code: String.t() | nil,
              state: String.t() | nil
            }
      defstruct [:city, :country, :line1, :line2, :postal_code, :state]
    end
  end

  defmodule Company do
    @moduledoc "Nested parameters."

    @typedoc """
    * `tax_id` - The entity's business ID number. Max length: 5000.
    """
    @type t :: %__MODULE__{
            tax_id: String.t() | nil
          }
    defstruct [:tax_id]
  end

  defmodule Individual do
    @moduledoc "Nested parameters."

    @typedoc """
    * `card_issuing` - Information related to the card_issuing program for this cardholder.
    * `dob` - The date of birth of this cardholder. Cardholders must be older than 13 years old.
    * `first_name` - The first name of this cardholder. Required before activating Cards. This field cannot contain any numbers, special characters (except periods, commas, hyphens, spaces and apostrophes) or non-latin letters.
    * `last_name` - The last name of this cardholder. Required before activating Cards. This field cannot contain any numbers, special characters (except periods, commas, hyphens, spaces and apostrophes) or non-latin letters.
    * `verification` - Government-issued ID document for this cardholder.
    """
    @type t :: %__MODULE__{
            card_issuing: __MODULE__.CardIssuing.t() | nil,
            dob: __MODULE__.Dob.t() | nil,
            first_name: String.t() | nil,
            last_name: String.t() | nil,
            verification: __MODULE__.Verification.t() | nil
          }
    defstruct [:card_issuing, :dob, :first_name, :last_name, :verification]

    defmodule CardIssuing do
      @moduledoc "Nested parameters."

      @typedoc """
      * `user_terms_acceptance` - Information about cardholder acceptance of Celtic [Authorized User Terms](https://stripe.com/docs/issuing/cards#accept-authorized-user-terms). Required for cards backed by a Celtic program.
      """
      @type t :: %__MODULE__{
              user_terms_acceptance: __MODULE__.UserTermsAcceptance.t() | nil
            }
      defstruct [:user_terms_acceptance]

      defmodule UserTermsAcceptance do
        @moduledoc "Nested parameters."

        @typedoc """
        * `date` - The Unix timestamp marking when the cardholder accepted the Authorized User Terms. Required for Celtic Spend Card users. Format: Unix timestamp.
        * `ip` - The IP address from which the cardholder accepted the Authorized User Terms. Required for Celtic Spend Card users.
        * `user_agent` - The user agent of the browser from which the cardholder accepted the Authorized User Terms.
        """
        @type t :: %__MODULE__{
                date: integer() | nil,
                ip: String.t() | nil,
                user_agent: map() | nil
              }
        defstruct [:date, :ip, :user_agent]
      end
    end

    defmodule Dob do
      @moduledoc "Nested parameters."

      @typedoc """
      * `day` - The day of birth, between 1 and 31.
      * `month` - The month of birth, between 1 and 12.
      * `year` - The four-digit year of birth.
      """
      @type t :: %__MODULE__{
              day: integer() | nil,
              month: integer() | nil,
              year: integer() | nil
            }
      defstruct [:day, :month, :year]
    end

    defmodule Verification do
      @moduledoc "Nested parameters."

      @typedoc """
      * `document` - An identifying document, either a passport or local ID card.
      """
      @type t :: %__MODULE__{
              document: __MODULE__.Document.t() | nil
            }
      defstruct [:document]

      defmodule Document do
        @moduledoc "Nested parameters."

        @typedoc """
        * `back` - The back of an ID returned by a [file upload](https://api.stripe.com#create_file) with a `purpose` value of `identity_document`. Max length: 5000.
        * `front` - The front of an ID returned by a [file upload](https://api.stripe.com#create_file) with a `purpose` value of `identity_document`. Max length: 5000.
        """
        @type t :: %__MODULE__{
                back: String.t() | nil,
                front: String.t() | nil
              }
        defstruct [:back, :front]
      end
    end
  end

  defmodule SpendingControls do
    @moduledoc "Nested parameters."

    @typedoc """
    * `allowed_categories` - Array of strings containing [categories](https://docs.stripe.com/api#issuing_authorization_object-merchant_data-category) of authorizations to allow. All other categories will be blocked. Cannot be set with `blocked_categories`.
    * `allowed_merchant_countries` - Array of strings containing representing countries from which authorizations will be allowed. Authorizations from merchants in all other countries will be declined. Country codes should be ISO 3166 alpha-2 country codes (e.g. `US`). Cannot be set with `blocked_merchant_countries`. Provide an empty value to unset this control.
    * `blocked_categories` - Array of strings containing [categories](https://docs.stripe.com/api#issuing_authorization_object-merchant_data-category) of authorizations to decline. All other categories will be allowed. Cannot be set with `allowed_categories`.
    * `blocked_merchant_countries` - Array of strings containing representing countries from which authorizations will be declined. Country codes should be ISO 3166 alpha-2 country codes (e.g. `US`). Cannot be set with `allowed_merchant_countries`. Provide an empty value to unset this control.
    * `spending_limits` - Limit spending with amount-based rules that apply across this cardholder's cards.
    * `spending_limits_currency` - Currency of amounts within `spending_limits`. Defaults to your merchant country's currency.
    """
    @type t :: %__MODULE__{
            allowed_categories: [String.t()] | nil,
            allowed_merchant_countries: [String.t()] | nil,
            blocked_categories: [String.t()] | nil,
            blocked_merchant_countries: [String.t()] | nil,
            spending_limits: [__MODULE__.SpendingLimits.t()] | nil,
            spending_limits_currency: String.t() | nil
          }
    defstruct [
      :allowed_categories,
      :allowed_merchant_countries,
      :blocked_categories,
      :blocked_merchant_countries,
      :spending_limits,
      :spending_limits_currency
    ]

    defmodule SpendingLimits do
      @moduledoc "Nested parameters."

      @typedoc """
      * `amount` - Maximum amount allowed to spend per interval.
      * `categories` - Array of strings containing [categories](https://docs.stripe.com/api#issuing_authorization_object-merchant_data-category) this limit applies to. Omitting this field will apply the limit to all categories.
      * `interval` - Interval (or event) to which the amount applies. Possible values: `all_time`, `daily`, `monthly`, `per_authorization`, `weekly`, `yearly`.
      """
      @type t :: %__MODULE__{
              amount: integer() | nil,
              categories: [String.t()] | nil,
              interval: String.t() | nil
            }
      defstruct [:amount, :categories, :interval]
    end
  end
end
