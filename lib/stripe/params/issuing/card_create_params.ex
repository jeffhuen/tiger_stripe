# File generated from our OpenAPI spec
defmodule Stripe.Params.Issuing.CardCreateParams do
  @moduledoc "Parameters for card create."

  @typedoc """
  * `cardholder` - The [Cardholder](https://docs.stripe.com/api#issuing_cardholder_object) object with which the card will be associated. Max length: 5000.
  * `currency` - The currency for the card.
  * `exp_month` - The desired expiration month (1-12) for this card if [specifying a custom expiration date](https://stripe.com/issuing/cards/virtual/issue-cards?testing-method=with-code#exp-dates).
  * `exp_year` - The desired 4-digit expiration year for this card if [specifying a custom expiration date](https://stripe.com/issuing/cards/virtual/issue-cards?testing-method=with-code#exp-dates).
  * `expand` - Specifies which fields in the response should be expanded.
  * `financial_account` - The new financial account ID the card will be associated with. This field allows a card to be reassigned to a different financial account.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `personalization_design` - The personalization design object belonging to this card. Max length: 5000.
  * `pin` - The desired PIN for this card.
  * `replacement_for` - The card this is meant to be a replacement for (if any). Max length: 5000.
  * `replacement_reason` - If `replacement_for` is specified, this should indicate why that card is being replaced. Possible values: `damaged`, `expired`, `lost`, `stolen`.
  * `second_line` - The second line to print on the card. Max length: 24 characters.
  * `shipping` - The address where the card will be shipped.
  * `spending_controls` - Rules that control spending for this card. Refer to our [documentation](https://docs.stripe.com/issuing/controls/spending-controls) for more details.
  * `status` - Whether authorizations can be approved on this card. May be blocked from activating cards depending on past-due Cardholder requirements. Defaults to `inactive`. Possible values: `active`, `inactive`.
  * `type` - The type of card to issue. Possible values are `physical` or `virtual`. Possible values: `physical`, `virtual`.
  """
  @type t :: %__MODULE__{
          cardholder: String.t() | nil,
          currency: String.t(),
          exp_month: integer() | nil,
          exp_year: integer() | nil,
          expand: [String.t()] | nil,
          financial_account: String.t() | nil,
          metadata: %{String.t() => String.t()} | nil,
          personalization_design: String.t() | nil,
          pin: __MODULE__.Pin.t() | nil,
          replacement_for: String.t() | nil,
          replacement_reason: String.t() | nil,
          second_line: map() | nil,
          shipping: __MODULE__.Shipping.t() | nil,
          spending_controls: __MODULE__.SpendingControls.t() | nil,
          status: String.t() | nil,
          type: String.t()
        }

  defstruct [
    :cardholder,
    :currency,
    :exp_month,
    :exp_year,
    :expand,
    :financial_account,
    :metadata,
    :personalization_design,
    :pin,
    :replacement_for,
    :replacement_reason,
    :second_line,
    :shipping,
    :spending_controls,
    :status,
    :type
  ]

  defmodule Pin do
    @moduledoc "Nested parameters."

    @typedoc """
    * `encrypted_number` - The card's desired new PIN, encrypted under Stripe's public key. Max length: 5000.
    """
    @type t :: %__MODULE__{
            encrypted_number: String.t() | nil
          }
    defstruct [:encrypted_number]
  end

  defmodule Shipping do
    @moduledoc "Nested parameters."

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
    @type t :: %__MODULE__{
            address: __MODULE__.Address.t() | nil,
            address_validation: __MODULE__.AddressValidation.t() | nil,
            customs: __MODULE__.Customs.t() | nil,
            name: String.t() | nil,
            phone_number: String.t() | nil,
            require_signature: boolean() | nil,
            service: String.t() | nil,
            type: String.t() | nil
          }
    defstruct [
      :address,
      :address_validation,
      :customs,
      :name,
      :phone_number,
      :require_signature,
      :service,
      :type
    ]

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

    defmodule AddressValidation do
      @moduledoc "Nested parameters."

      @typedoc """
      * `mode` - The address validation capabilities to use. Possible values: `disabled`, `normalization_only`, `validation_and_normalization`.
      """
      @type t :: %__MODULE__{
              mode: String.t() | nil
            }
      defstruct [:mode]
    end

    defmodule Customs do
      @moduledoc "Nested parameters."

      @typedoc """
      * `eori_number` - The Economic Operators Registration and Identification (EORI) number to use for Customs. Required for bulk shipments to Europe. Max length: 5000.
      """
      @type t :: %__MODULE__{
              eori_number: String.t() | nil
            }
      defstruct [:eori_number]
    end
  end

  defmodule SpendingControls do
    @moduledoc "Nested parameters."

    @typedoc """
    * `allowed_categories` - Array of strings containing [categories](https://docs.stripe.com/api#issuing_authorization_object-merchant_data-category) of authorizations to allow. All other categories will be blocked. Cannot be set with `blocked_categories`.
    * `allowed_merchant_countries` - Array of strings containing representing countries from which authorizations will be allowed. Authorizations from merchants in all other countries will be declined. Country codes should be ISO 3166 alpha-2 country codes (e.g. `US`). Cannot be set with `blocked_merchant_countries`. Provide an empty value to unset this control.
    * `blocked_categories` - Array of strings containing [categories](https://docs.stripe.com/api#issuing_authorization_object-merchant_data-category) of authorizations to decline. All other categories will be allowed. Cannot be set with `allowed_categories`.
    * `blocked_merchant_countries` - Array of strings containing representing countries from which authorizations will be declined. Country codes should be ISO 3166 alpha-2 country codes (e.g. `US`). Cannot be set with `allowed_merchant_countries`. Provide an empty value to unset this control.
    * `spending_limits` - Limit spending with amount-based rules that apply across any cards this card replaced (i.e., its `replacement_for` card and _that_ card's `replacement_for` card, up the chain).
    """
    @type t :: %__MODULE__{
            allowed_categories: [String.t()] | nil,
            allowed_merchant_countries: [String.t()] | nil,
            blocked_categories: [String.t()] | nil,
            blocked_merchant_countries: [String.t()] | nil,
            spending_limits: [__MODULE__.SpendingLimits.t()] | nil
          }
    defstruct [
      :allowed_categories,
      :allowed_merchant_countries,
      :blocked_categories,
      :blocked_merchant_countries,
      :spending_limits
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
