# File generated from our OpenAPI spec
defmodule Stripe.Resources.Issuing.Card do
  @moduledoc """
  IssuingCard

  You can [create physical or virtual cards](https://docs.stripe.com/issuing) that are issued to cardholders.
  """

  @typedoc """
  * `brand` - The brand of the card. Max length: 5000.
  * `cancellation_reason` - The reason why the card was canceled. Possible values: `design_rejected`, `lost`, `stolen`. Nullable.
  * `cardholder` - Expandable.
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Supported currencies are `usd` in the US, `eur` in the EU, and `gbp` in the UK. Format: ISO 4217 currency code.
  * `cvc` - The card's CVC. For security reasons, this is only available for virtual cards, and will be omitted unless you explicitly request it with [the `expand` parameter](https://docs.stripe.com/api/expanding_objects). Additionally, it's only available via the ["Retrieve a card" endpoint](https://docs.stripe.com/api/issuing/cards/retrieve), not via "List all cards" or any other endpoint. Max length: 5000.
  * `exp_month` - The expiration month of the card.
  * `exp_year` - The expiration year of the card.
  * `financial_account` - The financial account this card is attached to. Max length: 5000. Nullable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `last4` - The last 4 digits of the card number. Max length: 5000.
  * `latest_fraud_warning` - Stripe’s assessment of whether this card’s details have been compromised. If this property isn't null, cancel and reissue the card to prevent fraudulent activity risk. Nullable. Expandable.
  * `lifecycle_controls` - Rules that control the lifecycle of this card, such as automatic cancellation. Refer to our [documentation](https://stripe.com/issuing/controls/lifecycle-controls) for more details. Nullable. Expandable.
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
  * `number` - The full unredacted card number. For security reasons, this is only available for virtual cards, and will be omitted unless you explicitly request it with [the `expand` parameter](https://docs.stripe.com/api/expanding_objects). Additionally, it's only available via the ["Retrieve a card" endpoint](https://docs.stripe.com/api/issuing/cards/retrieve), not via "List all cards" or any other endpoint. Max length: 5000.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `issuing.card`.
  * `personalization_design` - The personalization design object belonging to this card. Nullable. Expandable.
  * `replaced_by` - The latest card that replaces this card, if any. Nullable. Expandable.
  * `replacement_for` - The card this card replaces, if any. Nullable. Expandable.
  * `replacement_reason` - The reason why the previous card needed to be replaced. Possible values: `damaged`, `expired`, `lost`, `stolen`. Nullable.
  * `second_line` - Text separate from cardholder name, printed on the card. Max length: 5000. Nullable.
  * `shipping` - Where and how the card will be shipped. Nullable. Expandable.
  * `spending_controls` - Expandable.
  * `status` - Whether authorizations can be approved on this card. May be blocked from activating cards depending on past-due Cardholder requirements. Defaults to `inactive`. Possible values: `active`, `canceled`, `inactive`.
  * `type` - The type of the card. Possible values: `physical`, `virtual`.
  * `wallets` - Information relating to digital wallets (like Apple Pay and Google Pay). Nullable. Expandable.
  """
  @type t :: %__MODULE__{
          brand: String.t(),
          cancellation_reason: String.t(),
          cardholder: Stripe.Resources.Issuing.Cardholder.t(),
          created: integer(),
          currency: String.t(),
          cvc: String.t() | nil,
          exp_month: integer(),
          exp_year: integer(),
          financial_account: String.t() | nil,
          id: String.t(),
          last4: String.t(),
          latest_fraud_warning: __MODULE__.LatestFraudWarning.t(),
          lifecycle_controls: __MODULE__.LifecycleControls.t(),
          livemode: boolean(),
          metadata: %{String.t() => String.t()},
          number: String.t() | nil,
          object: String.t(),
          personalization_design: String.t() | Stripe.Resources.Issuing.PersonalizationDesign.t(),
          replaced_by: String.t() | Stripe.Resources.Issuing.Card.t(),
          replacement_for: String.t() | Stripe.Resources.Issuing.Card.t(),
          replacement_reason: String.t(),
          second_line: String.t(),
          shipping: __MODULE__.Shipping.t(),
          spending_controls: __MODULE__.SpendingControls.t(),
          status: String.t(),
          type: String.t(),
          wallets: __MODULE__.Wallets.t()
        }

  defstruct [
    :brand,
    :cancellation_reason,
    :cardholder,
    :created,
    :currency,
    :cvc,
    :exp_month,
    :exp_year,
    :financial_account,
    :id,
    :last4,
    :latest_fraud_warning,
    :lifecycle_controls,
    :livemode,
    :metadata,
    :number,
    :object,
    :personalization_design,
    :replaced_by,
    :replacement_for,
    :replacement_reason,
    :second_line,
    :shipping,
    :spending_controls,
    :status,
    :type,
    :wallets
  ]

  @object_name "issuing.card"
  def object_name, do: @object_name

  def expandable_fields,
    do: [
      "cardholder",
      "latest_fraud_warning",
      "lifecycle_controls",
      "personalization_design",
      "replaced_by",
      "replacement_for",
      "shipping",
      "spending_controls",
      "wallets"
    ]

  defmodule LatestFraudWarning do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `started_at` - Timestamp of the most recent fraud warning. Format: Unix timestamp. Nullable.
    * `type` - The type of fraud warning that most recently took place on this card. This field updates with every new fraud warning, so the value changes over time. If populated, cancel and reissue the card. Possible values: `card_testing_exposure`, `fraud_dispute_filed`, `third_party_reported`, `user_indicated_fraud`. Nullable.
    """
    @type t :: %__MODULE__{
            started_at: integer() | nil,
            type: String.t() | nil
          }
    defstruct [:started_at, :type]
  end

  defmodule LifecycleControls do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `cancel_after`
    """
    @type t :: %__MODULE__{
            cancel_after: __MODULE__.CancelAfter.t() | nil
          }
    defstruct [:cancel_after]

    defmodule CancelAfter do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `payment_count` - The card is automatically cancelled when it makes this number of non-zero payment authorizations and transactions. The count includes penny authorizations, but doesn't include non-payment actions, such as authorization advice.
      """
      @type t :: %__MODULE__{
              payment_count: integer() | nil
            }
      defstruct [:payment_count]
    end

    def __inner_types__ do
      %{
        "cancel_after" => __MODULE__.CancelAfter
      }
    end
  end

  defmodule Shipping do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `address`
    * `address_validation` - Address validation details for the shipment. Nullable.
    * `carrier` - The delivery company that shipped a card. Possible values: `dhl`, `fedex`, `royal_mail`, `usps`. Nullable.
    * `customs` - Additional information that may be required for clearing customs. Nullable.
    * `eta` - A unix timestamp representing a best estimate of when the card will be delivered. Format: Unix timestamp. Nullable.
    * `name` - Recipient name. Max length: 5000.
    * `phone_number` - The phone number of the receiver of the shipment. Our courier partners will use this number to contact you in the event of card delivery issues. For individual shipments to the EU/UK, if this field is empty, we will provide them with the phone number provided when the cardholder was initially created. Max length: 5000. Nullable.
    * `require_signature` - Whether a signature is required for card delivery. This feature is only supported for US users. Standard shipping service does not support signature on delivery. The default value for standard shipping service is false and for express and priority services is true. Nullable.
    * `service` - Shipment service, such as `standard` or `express`. Possible values: `express`, `priority`, `standard`.
    * `status` - The delivery status of the card. Possible values: `canceled`, `delivered`, `failure`, `pending`, `returned`, `shipped`, `submitted`. Nullable.
    * `tracking_number` - A tracking number for a card shipment. Max length: 5000. Nullable.
    * `tracking_url` - A link to the shipping carrier's site where you can view detailed information about a card shipment. Max length: 5000. Nullable.
    * `type` - Packaging options. Possible values: `bulk`, `individual`.
    """
    @type t :: %__MODULE__{
            address: Stripe.Resources.Address.t() | nil,
            address_validation: __MODULE__.AddressValidation.t() | nil,
            carrier: String.t() | nil,
            customs: __MODULE__.Customs.t() | nil,
            eta: integer() | nil,
            name: String.t() | nil,
            phone_number: String.t() | nil,
            require_signature: boolean() | nil,
            service: String.t() | nil,
            status: String.t() | nil,
            tracking_number: String.t() | nil,
            tracking_url: String.t() | nil,
            type: String.t() | nil
          }
    defstruct [
      :address,
      :address_validation,
      :carrier,
      :customs,
      :eta,
      :name,
      :phone_number,
      :require_signature,
      :service,
      :status,
      :tracking_number,
      :tracking_url,
      :type
    ]

    defmodule AddressValidation do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `mode` - The address validation capabilities to use. Possible values: `disabled`, `normalization_only`, `validation_and_normalization`.
      * `normalized_address` - The normalized shipping address. Nullable.
      * `result` - The validation result for the shipping address. Possible values: `indeterminate`, `likely_deliverable`, `likely_undeliverable`. Nullable.
      """
      @type t :: %__MODULE__{
              mode: String.t() | nil,
              normalized_address: Stripe.Resources.Address.t() | nil,
              result: String.t() | nil
            }
      defstruct [:mode, :normalized_address, :result]
    end

    defmodule Customs do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `eori_number` - A registration number used for customs in Europe. See [https://www.gov.uk/eori](https://www.gov.uk/eori) for the UK and [https://ec.europa.eu/taxation_customs/business/customs-procedures-import-and-export/customs-procedures/economic-operators-registration-and-identification-number-eori_en](https://ec.europa.eu/taxation_customs/business/customs-procedures-import-and-export/customs-procedures/economic-operators-registration-and-identification-number-eori_en) for the EU. Max length: 5000. Nullable.
      """
      @type t :: %__MODULE__{
              eori_number: String.t() | nil
            }
      defstruct [:eori_number]
    end

    def __inner_types__ do
      %{
        "address_validation" => __MODULE__.AddressValidation,
        "customs" => __MODULE__.Customs
      }
    end
  end

  defmodule SpendingControls do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `allowed_categories` - Array of strings containing [categories](https://docs.stripe.com/api#issuing_authorization_object-merchant_data-category) of authorizations to allow. All other categories will be blocked. Cannot be set with `blocked_categories`. Nullable.
    * `allowed_merchant_countries` - Array of strings containing representing countries from which authorizations will be allowed. Authorizations from merchants in all other countries will be declined. Country codes should be ISO 3166 alpha-2 country codes (e.g. `US`). Cannot be set with `blocked_merchant_countries`. Provide an empty value to unset this control. Nullable.
    * `blocked_categories` - Array of strings containing [categories](https://docs.stripe.com/api#issuing_authorization_object-merchant_data-category) of authorizations to decline. All other categories will be allowed. Cannot be set with `allowed_categories`. Nullable.
    * `blocked_merchant_countries` - Array of strings containing representing countries from which authorizations will be declined. Country codes should be ISO 3166 alpha-2 country codes (e.g. `US`). Cannot be set with `allowed_merchant_countries`. Provide an empty value to unset this control. Nullable.
    * `spending_limits` - Limit spending with amount-based rules that apply across any cards this card replaced (i.e., its `replacement_for` card and _that_ card's `replacement_for` card, up the chain). Nullable.
    * `spending_limits_currency` - Currency of the amounts within `spending_limits`. Always the same as the currency of the card. Format: ISO 4217 currency code. Nullable.
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
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `amount` - Maximum amount allowed to spend per interval. This amount is in the card's currency and in the [smallest currency unit](https://docs.stripe.com/currencies#zero-decimal).
      * `categories` - Array of strings containing [categories](https://docs.stripe.com/api#issuing_authorization_object-merchant_data-category) this limit applies to. Omitting this field will apply the limit to all categories. Nullable.
      * `interval` - Interval (or event) to which the amount applies. Possible values: `all_time`, `daily`, `monthly`, `per_authorization`, `weekly`, `yearly`.
      """
      @type t :: %__MODULE__{
              amount: integer() | nil,
              categories: [String.t()] | nil,
              interval: String.t() | nil
            }
      defstruct [:amount, :categories, :interval]
    end

    def __inner_types__ do
      %{
        "spending_limits" => __MODULE__.SpendingLimits
      }
    end
  end

  defmodule Wallets do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `apple_pay`
    * `google_pay`
    * `primary_account_identifier` - Unique identifier for a card used with digital wallets Max length: 5000. Nullable.
    """
    @type t :: %__MODULE__{
            apple_pay: __MODULE__.ApplePay.t() | nil,
            google_pay: __MODULE__.GooglePay.t() | nil,
            primary_account_identifier: String.t() | nil
          }
    defstruct [:apple_pay, :google_pay, :primary_account_identifier]

    defmodule ApplePay do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `eligible` - Apple Pay Eligibility
      * `ineligible_reason` - Reason the card is ineligible for Apple Pay Possible values: `missing_agreement`, `missing_cardholder_contact`, `unsupported_region`. Nullable.
      """
      @type t :: %__MODULE__{
              eligible: boolean() | nil,
              ineligible_reason: String.t() | nil
            }
      defstruct [:eligible, :ineligible_reason]
    end

    defmodule GooglePay do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `eligible` - Google Pay Eligibility
      * `ineligible_reason` - Reason the card is ineligible for Google Pay Possible values: `missing_agreement`, `missing_cardholder_contact`, `unsupported_region`. Nullable.
      """
      @type t :: %__MODULE__{
              eligible: boolean() | nil,
              ineligible_reason: String.t() | nil
            }
      defstruct [:eligible, :ineligible_reason]
    end

    def __inner_types__ do
      %{
        "apple_pay" => __MODULE__.ApplePay,
        "google_pay" => __MODULE__.GooglePay
      }
    end
  end

  def __inner_types__ do
    %{
      "cardholder" => Stripe.Resources.Issuing.Cardholder,
      "latest_fraud_warning" => __MODULE__.LatestFraudWarning,
      "lifecycle_controls" => __MODULE__.LifecycleControls,
      "shipping" => __MODULE__.Shipping,
      "spending_controls" => __MODULE__.SpendingControls,
      "wallets" => __MODULE__.Wallets
    }
  end
end
