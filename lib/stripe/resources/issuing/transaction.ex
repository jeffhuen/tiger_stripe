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
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
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
          amount_details: amount_details(),
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
          merchant_data: merchant_data(),
          metadata: %{String.t() => String.t()},
          network_data: network_data(),
          object: String.t(),
          purchase_details: purchase_details() | nil,
          token: String.t() | Stripe.Resources.Issuing.Token.t() | nil,
          treasury: treasury() | nil,
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

  @typedoc """
  * `atm_fee` - The fee charged by the ATM for the cash withdrawal. Nullable.
  * `cashback_amount` - The amount of cash requested by the cardholder. Nullable.
  """
  @type amount_details :: %{
          optional(:atm_fee) => integer() | nil,
          optional(:cashback_amount) => integer() | nil,
          optional(String.t()) => term()
        }

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
  @type merchant_data :: %{
          optional(:category) => String.t() | nil,
          optional(:category_code) => String.t() | nil,
          optional(:city) => String.t() | nil,
          optional(:country) => String.t() | nil,
          optional(:name) => String.t() | nil,
          optional(:network_id) => String.t() | nil,
          optional(:postal_code) => String.t() | nil,
          optional(:state) => String.t() | nil,
          optional(:tax_id) => String.t() | nil,
          optional(:terminal_id) => String.t() | nil,
          optional(:url) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `authorization_code` - A code created by Stripe which is shared with the merchant to validate the authorization. This field will be populated if the authorization message was approved. The code typically starts with the letter "S", followed by a six-digit number. For example, "S498162". Please note that the code is not guaranteed to be unique across authorizations. Max length: 5000. Nullable.
  * `processing_date` - The date the transaction was processed by the card network. This can be different from the date the seller recorded the transaction depending on when the acquirer submits the transaction to the network. Max length: 5000. Nullable.
  * `transaction_id` - Unique identifier for the authorization assigned by the card network used to match subsequent messages, disputes, and transactions. Max length: 5000. Nullable.
  """
  @type network_data :: %{
          optional(:authorization_code) => String.t() | nil,
          optional(:processing_date) => String.t() | nil,
          optional(:transaction_id) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `fleet` - Fleet-specific information for transactions using Fleet cards. Nullable.
  * `flight` - Information about the flight that was purchased with this transaction. Nullable.
  * `fuel` - Information about fuel that was purchased with this transaction. Nullable.
  * `lodging` - Information about lodging that was purchased with this transaction. Nullable.
  * `receipt` - The line items in the purchase. Nullable.
  * `reference` - A merchant-specific order number. Max length: 5000. Nullable.
  """
  @type purchase_details :: %{
          optional(:fleet) => purchase_details_fleet() | nil,
          optional(:flight) => purchase_details_flight() | nil,
          optional(:fuel) => purchase_details_fuel() | nil,
          optional(:lodging) => purchase_details_lodging() | nil,
          optional(:receipt) => [purchase_details_receipt()] | nil,
          optional(:reference) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `cardholder_prompt_data` - Answers to prompts presented to cardholder at point of sale. Nullable.
  * `purchase_type` - The type of purchase. One of `fuel_purchase`, `non_fuel_purchase`, or `fuel_and_non_fuel_purchase`. Max length: 5000. Nullable.
  * `reported_breakdown` - More information about the total amount. This information is not guaranteed to be accurate as some merchants may provide unreliable data. Nullable.
  * `service_type` - The type of fuel service. One of `non_fuel_transaction`, `full_service`, or `self_service`. Max length: 5000. Nullable.
  """
  @type purchase_details_fleet :: %{
          optional(:cardholder_prompt_data) =>
            purchase_details_fleet_cardholder_prompt_data() | nil,
          optional(:purchase_type) => String.t() | nil,
          optional(:reported_breakdown) => purchase_details_fleet_reported_breakdown() | nil,
          optional(:service_type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `driver_id` - Driver ID. Max length: 5000. Nullable.
  * `odometer` - Odometer reading. Nullable.
  * `unspecified_id` - An alphanumeric ID. This field is used when a vehicle ID, driver ID, or generic ID is entered by the cardholder, but the merchant or card network did not specify the prompt type. Max length: 5000. Nullable.
  * `user_id` - User ID. Max length: 5000. Nullable.
  * `vehicle_number` - Vehicle number. Max length: 5000. Nullable.
  """
  @type purchase_details_fleet_cardholder_prompt_data :: %{
          optional(:driver_id) => String.t() | nil,
          optional(:odometer) => integer() | nil,
          optional(:unspecified_id) => String.t() | nil,
          optional(:user_id) => String.t() | nil,
          optional(:vehicle_number) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `fuel` - Breakdown of fuel portion of the purchase. Nullable.
  * `non_fuel` - Breakdown of non-fuel portion of the purchase. Nullable.
  * `tax` - Information about tax included in this transaction. Nullable.
  """
  @type purchase_details_fleet_reported_breakdown :: %{
          optional(:fuel) => purchase_details_fleet_reported_breakdown_fuel() | nil,
          optional(:non_fuel) => purchase_details_fleet_reported_breakdown_non_fuel() | nil,
          optional(:tax) => purchase_details_fleet_reported_breakdown_tax() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `gross_amount_decimal` - Gross fuel amount that should equal Fuel Volume multipled by Fuel Unit Cost, inclusive of taxes. Format: decimal string. Nullable.
  """
  @type purchase_details_fleet_reported_breakdown_fuel :: %{
          optional(:gross_amount_decimal) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `gross_amount_decimal` - Gross non-fuel amount that should equal the sum of the line items, inclusive of taxes. Format: decimal string. Nullable.
  """
  @type purchase_details_fleet_reported_breakdown_non_fuel :: %{
          optional(:gross_amount_decimal) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `local_amount_decimal` - Amount of state or provincial Sales Tax included in the transaction amount. Null if not reported by merchant or not subject to tax. Format: decimal string. Nullable.
  * `national_amount_decimal` - Amount of national Sales Tax or VAT included in the transaction amount. Null if not reported by merchant or not subject to tax. Format: decimal string. Nullable.
  """
  @type purchase_details_fleet_reported_breakdown_tax :: %{
          optional(:local_amount_decimal) => String.t() | nil,
          optional(:national_amount_decimal) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `departure_at` - The time that the flight departed. Nullable.
  * `passenger_name` - The name of the passenger. Max length: 5000. Nullable.
  * `refundable` - Whether the ticket is refundable. Nullable.
  * `segments` - The legs of the trip. Nullable.
  * `travel_agency` - The travel agency that issued the ticket. Max length: 5000. Nullable.
  """
  @type purchase_details_flight :: %{
          optional(:departure_at) => integer() | nil,
          optional(:passenger_name) => String.t() | nil,
          optional(:refundable) => boolean() | nil,
          optional(:segments) => [purchase_details_flight_segments()] | nil,
          optional(:travel_agency) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `arrival_airport_code` - The three-letter IATA airport code of the flight's destination. Max length: 5000. Nullable.
  * `carrier` - The airline carrier code. Max length: 5000. Nullable.
  * `departure_airport_code` - The three-letter IATA airport code that the flight departed from. Max length: 5000. Nullable.
  * `flight_number` - The flight number. Max length: 5000. Nullable.
  * `service_class` - The flight's service class. Max length: 5000. Nullable.
  * `stopover_allowed` - Whether a stopover is allowed on this flight. Nullable.
  """
  @type purchase_details_flight_segments :: %{
          optional(:arrival_airport_code) => String.t() | nil,
          optional(:carrier) => String.t() | nil,
          optional(:departure_airport_code) => String.t() | nil,
          optional(:flight_number) => String.t() | nil,
          optional(:service_class) => String.t() | nil,
          optional(:stopover_allowed) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `industry_product_code` - [Conexxus Payment System Product Code](https://www.conexxus.org/conexxus-payment-system-product-codes) identifying the primary fuel product purchased. Max length: 5000. Nullable.
  * `quantity_decimal` - The quantity of `unit`s of fuel that was dispensed, represented as a decimal string with at most 12 decimal places. Format: decimal string. Nullable.
  * `type` - The type of fuel that was purchased. One of `diesel`, `unleaded_plus`, `unleaded_regular`, `unleaded_super`, or `other`. Max length: 5000.
  * `unit` - The units for `quantity_decimal`. One of `charging_minute`, `imperial_gallon`, `kilogram`, `kilowatt_hour`, `liter`, `pound`, `us_gallon`, or `other`. Max length: 5000.
  * `unit_cost_decimal` - The cost in cents per each unit of fuel, represented as a decimal string with at most 12 decimal places. Format: decimal string.
  """
  @type purchase_details_fuel :: %{
          optional(:industry_product_code) => String.t() | nil,
          optional(:quantity_decimal) => String.t() | nil,
          optional(:type) => String.t() | nil,
          optional(:unit) => String.t() | nil,
          optional(:unit_cost_decimal) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `check_in_at` - The time of checking into the lodging. Nullable.
  * `nights` - The number of nights stayed at the lodging. Nullable.
  """
  @type purchase_details_lodging :: %{
          optional(:check_in_at) => integer() | nil,
          optional(:nights) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `description` - The description of the item. The maximum length of this field is 26 characters. Max length: 5000. Nullable.
  * `quantity` - The quantity of the item. Nullable.
  * `total` - The total for this line item in cents. Nullable.
  * `unit_cost` - The unit cost of the item in cents. Nullable.
  """
  @type purchase_details_receipt :: %{
          optional(:description) => String.t() | nil,
          optional(:quantity) => float() | nil,
          optional(:total) => integer() | nil,
          optional(:unit_cost) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `received_credit` - The Treasury [ReceivedCredit](https://docs.stripe.com/api/treasury/received_credits) representing this Issuing transaction if it is a refund Max length: 5000. Nullable.
  * `received_debit` - The Treasury [ReceivedDebit](https://docs.stripe.com/api/treasury/received_debits) representing this Issuing transaction if it is a capture Max length: 5000. Nullable.
  """
  @type treasury :: %{
          optional(:received_credit) => String.t() | nil,
          optional(:received_debit) => String.t() | nil,
          optional(String.t()) => term()
        }

  def __nested_fields__ do
    %{
      "amount_details" => %{
        fields: %{
          "atm_fee" => :scalar,
          "cashback_amount" => :scalar
        }
      },
      "merchant_data" => %{
        fields: %{
          "category" => :scalar,
          "category_code" => :scalar,
          "city" => :scalar,
          "country" => :scalar,
          "name" => :scalar,
          "network_id" => :scalar,
          "postal_code" => :scalar,
          "state" => :scalar,
          "tax_id" => :scalar,
          "terminal_id" => :scalar,
          "url" => :scalar
        }
      },
      "network_data" => %{
        fields: %{
          "authorization_code" => :scalar,
          "processing_date" => :scalar,
          "transaction_id" => :scalar
        }
      },
      "purchase_details" => %{
        fields: %{
          "fleet" => %{
            fields: %{
              "cardholder_prompt_data" => %{
                fields: %{
                  "driver_id" => :scalar,
                  "odometer" => :scalar,
                  "unspecified_id" => :scalar,
                  "user_id" => :scalar,
                  "vehicle_number" => :scalar
                }
              },
              "purchase_type" => :scalar,
              "reported_breakdown" => %{
                fields: %{
                  "fuel" => %{
                    fields: %{
                      "gross_amount_decimal" => :scalar
                    }
                  },
                  "non_fuel" => %{
                    fields: %{
                      "gross_amount_decimal" => :scalar
                    }
                  },
                  "tax" => %{
                    fields: %{
                      "local_amount_decimal" => :scalar,
                      "national_amount_decimal" => :scalar
                    }
                  }
                }
              },
              "service_type" => :scalar
            }
          },
          "flight" => %{
            fields: %{
              "departure_at" => :scalar,
              "passenger_name" => :scalar,
              "refundable" => :scalar,
              "segments" =>
                {:list,
                 %{
                   fields: %{
                     "arrival_airport_code" => :scalar,
                     "carrier" => :scalar,
                     "departure_airport_code" => :scalar,
                     "flight_number" => :scalar,
                     "service_class" => :scalar,
                     "stopover_allowed" => :scalar
                   }
                 }},
              "travel_agency" => :scalar
            }
          },
          "fuel" => %{
            fields: %{
              "industry_product_code" => :scalar,
              "quantity_decimal" => :scalar,
              "type" => :scalar,
              "unit" => :scalar,
              "unit_cost_decimal" => :scalar
            }
          },
          "lodging" => %{
            fields: %{
              "check_in_at" => :scalar,
              "nights" => :scalar
            }
          },
          "receipt" =>
            {:list,
             %{
               fields: %{
                 "description" => :scalar,
                 "quantity" => :scalar,
                 "total" => :scalar,
                 "unit_cost" => :scalar
               }
             }},
          "reference" => :scalar
        }
      },
      "treasury" => %{
        fields: %{
          "received_credit" => :scalar,
          "received_debit" => :scalar
        }
      }
    }
  end
end
