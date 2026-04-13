# File generated from our OpenAPI spec
defmodule Stripe.Resources.Issuing.Transaction do
  @moduledoc """
  IssuingTransaction

  Any use of an [issued card](https://docs.stripe.com/issuing) that results in funds entering or leaving
  your Stripe account, such as a completed purchase or refund, is represented by an Issuing
  `Transaction` object.

  Related guide: [Issued card transactions](https://docs.stripe.com/issuing/purchases/transactions)
  """

  @typedoc """
  * `amount` - The transaction amount, which will be reflected in your balance. This amount is in your currency and in the [smallest currency unit](https://docs.stripe.com/currencies#zero-decimal).
  * `amount_details` - Detailed breakdown of amount components. These amounts are denominated in `currency` and in the [smallest currency unit](https://docs.stripe.com/currencies#zero-decimal). Nullable. Expandable.
  * `authorization` - The `Authorization` object that led to this transaction. Nullable. Expandable.
  * `balance_transaction` - ID of the [balance transaction](https://docs.stripe.com/api/balance_transactions) associated with this transaction. Nullable. Expandable.
  * `card` - The card used to make this transaction. Expandable.
  * `cardholder` - The cardholder to whom this transaction belongs. Nullable. Expandable.
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `dispute` - If you've disputed the transaction, the ID of the dispute. Nullable. Expandable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `merchant_amount` - The amount that the merchant will receive, denominated in `merchant_currency` and in the [smallest currency unit](https://docs.stripe.com/currencies#zero-decimal). It will be different from `amount` if the merchant is taking payment in a different currency.
  * `merchant_currency` - The currency with which the merchant is taking payment. Format: ISO 4217 currency code.
  * `merchant_data` - Expandable.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
  * `network_data` - Details about the transaction, such as processing dates, set by the card network. Nullable. Expandable.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `issuing.transaction`.
  * `purchase_details` - Additional purchase information that is optionally provided by the merchant. Nullable. Expandable.
  * `token` - [Token](https://docs.stripe.com/api/issuing/tokens/object) object used for this transaction. If a network token was not used for this transaction, this field will be null. Nullable. Expandable.
  * `treasury` - [Treasury](https://docs.stripe.com/api/treasury) details related to this transaction if it was created on a [FinancialAccount](/docs/api/treasury/financial_accounts Nullable. Expandable.
  * `type` - The nature of the transaction. Possible values: `capture`, `refund`.
  * `wallet` - The digital wallet used for this transaction. One of `apple_pay`, `google_pay`, or `samsung_pay`. Possible values: `apple_pay`, `google_pay`, `samsung_pay`. Nullable.
  """
  @type t :: %__MODULE__{
          amount: integer(),
          amount_details: __MODULE__.AmountDetails.t(),
          authorization: String.t() | Stripe.Resources.Issuing.Authorization.t(),
          balance_transaction: String.t() | Stripe.Resources.BalanceTransaction.t(),
          card: String.t() | Stripe.Resources.Issuing.Card.t(),
          cardholder: String.t() | Stripe.Resources.Issuing.Cardholder.t(),
          created: integer(),
          currency: String.t(),
          dispute: String.t() | Stripe.Resources.Issuing.Dispute.t(),
          id: String.t(),
          livemode: boolean(),
          merchant_amount: integer(),
          merchant_currency: String.t(),
          merchant_data: __MODULE__.MerchantData.t(),
          metadata: %{String.t() => String.t()},
          network_data: __MODULE__.NetworkData.t(),
          object: String.t(),
          purchase_details: __MODULE__.PurchaseDetails.t() | nil,
          token: String.t() | Stripe.Resources.Issuing.Token.t() | nil,
          treasury: __MODULE__.Treasury.t() | nil,
          type: String.t(),
          wallet: String.t()
        }

  defstruct [
    :amount,
    :amount_details,
    :authorization,
    :balance_transaction,
    :card,
    :cardholder,
    :created,
    :currency,
    :dispute,
    :id,
    :livemode,
    :merchant_amount,
    :merchant_currency,
    :merchant_data,
    :metadata,
    :network_data,
    :object,
    :purchase_details,
    :token,
    :treasury,
    :type,
    :wallet
  ]

  @object_name "issuing.transaction"
  def object_name, do: @object_name

  def expandable_fields,
    do: [
      "amount_details",
      "authorization",
      "balance_transaction",
      "card",
      "cardholder",
      "dispute",
      "merchant_data",
      "network_data",
      "purchase_details",
      "token",
      "treasury"
    ]

  defmodule AmountDetails do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `atm_fee` - The fee charged by the ATM for the cash withdrawal. Nullable.
    * `cashback_amount` - The amount of cash requested by the cardholder. Nullable.
    """
    @type t :: %__MODULE__{
            atm_fee: integer() | nil,
            cashback_amount: integer() | nil
          }
    defstruct [:atm_fee, :cashback_amount]
  end

  defmodule MerchantData do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `category` - A categorization of the seller's type of business. See our [merchant categories guide](https://docs.stripe.com/issuing/merchant-categories) for a list of possible values. Max length: 5000.
    * `category_code` - The merchant category code for the seller’s business Max length: 5000.
    * `city` - City where the seller is located Max length: 5000. Nullable.
    * `country` - Country where the seller is located Max length: 5000. Nullable.
    * `name` - Name of the seller Max length: 5000. Nullable.
    * `network_id` - Identifier assigned to the seller by the card network. Different card networks may assign different network_id fields to the same merchant. Max length: 5000.
    * `postal_code` - Postal code where the seller is located Max length: 5000. Nullable.
    * `state` - State where the seller is located Max length: 5000. Nullable.
    * `tax_id` - The seller's tax identification number. Currently populated for French merchants only. Max length: 5000. Nullable.
    * `terminal_id` - An ID assigned by the seller to the location of the sale. Max length: 5000. Nullable.
    * `url` - URL provided by the merchant on a 3DS request Max length: 5000. Nullable.
    """
    @type t :: %__MODULE__{
            category: String.t() | nil,
            category_code: String.t() | nil,
            city: String.t() | nil,
            country: String.t() | nil,
            name: String.t() | nil,
            network_id: String.t() | nil,
            postal_code: String.t() | nil,
            state: String.t() | nil,
            tax_id: String.t() | nil,
            terminal_id: String.t() | nil,
            url: String.t() | nil
          }
    defstruct [
      :category,
      :category_code,
      :city,
      :country,
      :name,
      :network_id,
      :postal_code,
      :state,
      :tax_id,
      :terminal_id,
      :url
    ]
  end

  defmodule NetworkData do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `authorization_code` - A code created by Stripe which is shared with the merchant to validate the authorization. This field will be populated if the authorization message was approved. The code typically starts with the letter "S", followed by a six-digit number. For example, "S498162". Please note that the code is not guaranteed to be unique across authorizations. Max length: 5000. Nullable.
    * `processing_date` - The date the transaction was processed by the card network. This can be different from the date the seller recorded the transaction depending on when the acquirer submits the transaction to the network. Max length: 5000. Nullable.
    * `transaction_id` - Unique identifier for the authorization assigned by the card network used to match subsequent messages, disputes, and transactions. Max length: 5000. Nullable.
    """
    @type t :: %__MODULE__{
            authorization_code: String.t() | nil,
            processing_date: String.t() | nil,
            transaction_id: String.t() | nil
          }
    defstruct [:authorization_code, :processing_date, :transaction_id]
  end

  defmodule PurchaseDetails do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `fleet` - Fleet-specific information for transactions using Fleet cards. Nullable.
    * `flight` - Information about the flight that was purchased with this transaction. Nullable.
    * `fuel` - Information about fuel that was purchased with this transaction. Nullable.
    * `lodging` - Information about lodging that was purchased with this transaction. Nullable.
    * `receipt` - The line items in the purchase. Nullable.
    * `reference` - A merchant-specific order number. Max length: 5000. Nullable.
    """
    @type t :: %__MODULE__{
            fleet: __MODULE__.Fleet.t() | nil,
            flight: __MODULE__.Flight.t() | nil,
            fuel: __MODULE__.Fuel.t() | nil,
            lodging: __MODULE__.Lodging.t() | nil,
            receipt: [__MODULE__.Receipt.t()] | nil,
            reference: String.t() | nil
          }
    defstruct [:fleet, :flight, :fuel, :lodging, :receipt, :reference]

    defmodule Fleet do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `cardholder_prompt_data` - Answers to prompts presented to cardholder at point of sale. Nullable.
      * `purchase_type` - The type of purchase. One of `fuel_purchase`, `non_fuel_purchase`, or `fuel_and_non_fuel_purchase`. Max length: 5000. Nullable.
      * `reported_breakdown` - More information about the total amount. This information is not guaranteed to be accurate as some merchants may provide unreliable data. Nullable.
      * `service_type` - The type of fuel service. One of `non_fuel_transaction`, `full_service`, or `self_service`. Max length: 5000. Nullable.
      """
      @type t :: %__MODULE__{
              cardholder_prompt_data: __MODULE__.CardholderPromptData.t() | nil,
              purchase_type: String.t() | nil,
              reported_breakdown: __MODULE__.ReportedBreakdown.t() | nil,
              service_type: String.t() | nil
            }
      defstruct [:cardholder_prompt_data, :purchase_type, :reported_breakdown, :service_type]

      defmodule CardholderPromptData do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `driver_id` - Driver ID. Max length: 5000. Nullable.
        * `odometer` - Odometer reading. Nullable.
        * `unspecified_id` - An alphanumeric ID. This field is used when a vehicle ID, driver ID, or generic ID is entered by the cardholder, but the merchant or card network did not specify the prompt type. Max length: 5000. Nullable.
        * `user_id` - User ID. Max length: 5000. Nullable.
        * `vehicle_number` - Vehicle number. Max length: 5000. Nullable.
        """
        @type t :: %__MODULE__{
                driver_id: String.t() | nil,
                odometer: integer() | nil,
                unspecified_id: String.t() | nil,
                user_id: String.t() | nil,
                vehicle_number: String.t() | nil
              }
        defstruct [:driver_id, :odometer, :unspecified_id, :user_id, :vehicle_number]
      end

      defmodule ReportedBreakdown do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `fuel` - Breakdown of fuel portion of the purchase. Nullable.
        * `non_fuel` - Breakdown of non-fuel portion of the purchase. Nullable.
        * `tax` - Information about tax included in this transaction. Nullable.
        """
        @type t :: %__MODULE__{
                fuel: __MODULE__.Fuel.t() | nil,
                non_fuel: __MODULE__.NonFuel.t() | nil,
                tax: __MODULE__.Tax.t() | nil
              }
        defstruct [:fuel, :non_fuel, :tax]

        defmodule Fuel do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `gross_amount_decimal` - Gross fuel amount that should equal Fuel Volume multipled by Fuel Unit Cost, inclusive of taxes. Format: decimal string. Nullable.
          """
          @type t :: %__MODULE__{
                  gross_amount_decimal: String.t() | nil
                }
          defstruct [:gross_amount_decimal]
        end

        defmodule NonFuel do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `gross_amount_decimal` - Gross non-fuel amount that should equal the sum of the line items, inclusive of taxes. Format: decimal string. Nullable.
          """
          @type t :: %__MODULE__{
                  gross_amount_decimal: String.t() | nil
                }
          defstruct [:gross_amount_decimal]
        end

        defmodule Tax do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `local_amount_decimal` - Amount of state or provincial Sales Tax included in the transaction amount. Null if not reported by merchant or not subject to tax. Format: decimal string. Nullable.
          * `national_amount_decimal` - Amount of national Sales Tax or VAT included in the transaction amount. Null if not reported by merchant or not subject to tax. Format: decimal string. Nullable.
          """
          @type t :: %__MODULE__{
                  local_amount_decimal: String.t() | nil,
                  national_amount_decimal: String.t() | nil
                }
          defstruct [:local_amount_decimal, :national_amount_decimal]
        end

        def __inner_types__ do
          %{
            "fuel" => __MODULE__.Fuel,
            "non_fuel" => __MODULE__.NonFuel,
            "tax" => __MODULE__.Tax
          }
        end
      end

      def __inner_types__ do
        %{
          "cardholder_prompt_data" => __MODULE__.CardholderPromptData,
          "reported_breakdown" => __MODULE__.ReportedBreakdown
        }
      end
    end

    defmodule Flight do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `departure_at` - The time that the flight departed. Nullable.
      * `passenger_name` - The name of the passenger. Max length: 5000. Nullable.
      * `refundable` - Whether the ticket is refundable. Nullable.
      * `segments` - The legs of the trip. Nullable.
      * `travel_agency` - The travel agency that issued the ticket. Max length: 5000. Nullable.
      """
      @type t :: %__MODULE__{
              departure_at: integer() | nil,
              passenger_name: String.t() | nil,
              refundable: boolean() | nil,
              segments: [__MODULE__.Segments.t()] | nil,
              travel_agency: String.t() | nil
            }
      defstruct [:departure_at, :passenger_name, :refundable, :segments, :travel_agency]

      defmodule Segments do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `arrival_airport_code` - The three-letter IATA airport code of the flight's destination. Max length: 5000. Nullable.
        * `carrier` - The airline carrier code. Max length: 5000. Nullable.
        * `departure_airport_code` - The three-letter IATA airport code that the flight departed from. Max length: 5000. Nullable.
        * `flight_number` - The flight number. Max length: 5000. Nullable.
        * `service_class` - The flight's service class. Max length: 5000. Nullable.
        * `stopover_allowed` - Whether a stopover is allowed on this flight. Nullable.
        """
        @type t :: %__MODULE__{
                arrival_airport_code: String.t() | nil,
                carrier: String.t() | nil,
                departure_airport_code: String.t() | nil,
                flight_number: String.t() | nil,
                service_class: String.t() | nil,
                stopover_allowed: boolean() | nil
              }
        defstruct [
          :arrival_airport_code,
          :carrier,
          :departure_airport_code,
          :flight_number,
          :service_class,
          :stopover_allowed
        ]
      end

      def __inner_types__ do
        %{
          "segments" => __MODULE__.Segments
        }
      end
    end

    defmodule Fuel do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `industry_product_code` - [Conexxus Payment System Product Code](https://www.conexxus.org/conexxus-payment-system-product-codes) identifying the primary fuel product purchased. Max length: 5000. Nullable.
      * `quantity_decimal` - The quantity of `unit`s of fuel that was dispensed, represented as a decimal string with at most 12 decimal places. Format: decimal string. Nullable.
      * `type` - The type of fuel that was purchased. One of `diesel`, `unleaded_plus`, `unleaded_regular`, `unleaded_super`, or `other`. Max length: 5000.
      * `unit` - The units for `quantity_decimal`. One of `charging_minute`, `imperial_gallon`, `kilogram`, `kilowatt_hour`, `liter`, `pound`, `us_gallon`, or `other`. Max length: 5000.
      * `unit_cost_decimal` - The cost in cents per each unit of fuel, represented as a decimal string with at most 12 decimal places. Format: decimal string.
      """
      @type t :: %__MODULE__{
              industry_product_code: String.t() | nil,
              quantity_decimal: String.t() | nil,
              type: String.t() | nil,
              unit: String.t() | nil,
              unit_cost_decimal: String.t() | nil
            }
      defstruct [:industry_product_code, :quantity_decimal, :type, :unit, :unit_cost_decimal]
    end

    defmodule Lodging do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `check_in_at` - The time of checking into the lodging. Nullable.
      * `nights` - The number of nights stayed at the lodging. Nullable.
      """
      @type t :: %__MODULE__{
              check_in_at: integer() | nil,
              nights: integer() | nil
            }
      defstruct [:check_in_at, :nights]
    end

    defmodule Receipt do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `description` - The description of the item. The maximum length of this field is 26 characters. Max length: 5000. Nullable.
      * `quantity` - The quantity of the item. Nullable.
      * `total` - The total for this line item in cents. Nullable.
      * `unit_cost` - The unit cost of the item in cents. Nullable.
      """
      @type t :: %__MODULE__{
              description: String.t() | nil,
              quantity: float() | nil,
              total: integer() | nil,
              unit_cost: integer() | nil
            }
      defstruct [:description, :quantity, :total, :unit_cost]
    end

    def __inner_types__ do
      %{
        "fleet" => __MODULE__.Fleet,
        "flight" => __MODULE__.Flight,
        "fuel" => __MODULE__.Fuel,
        "lodging" => __MODULE__.Lodging,
        "receipt" => __MODULE__.Receipt
      }
    end
  end

  defmodule Treasury do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `received_credit` - The Treasury [ReceivedCredit](https://docs.stripe.com/api/treasury/received_credits) representing this Issuing transaction if it is a refund Max length: 5000. Nullable.
    * `received_debit` - The Treasury [ReceivedDebit](https://docs.stripe.com/api/treasury/received_debits) representing this Issuing transaction if it is a capture Max length: 5000. Nullable.
    """
    @type t :: %__MODULE__{
            received_credit: String.t() | nil,
            received_debit: String.t() | nil
          }
    defstruct [:received_credit, :received_debit]
  end

  def __inner_types__ do
    %{
      "amount_details" => __MODULE__.AmountDetails,
      "merchant_data" => __MODULE__.MerchantData,
      "network_data" => __MODULE__.NetworkData,
      "purchase_details" => __MODULE__.PurchaseDetails,
      "treasury" => __MODULE__.Treasury
    }
  end
end
