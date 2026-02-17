# File generated from our OpenAPI spec
defmodule Stripe.Params.TestHelpers.Issuing.AuthorizationCaptureParams do
  @moduledoc "Parameters for authorization capture."

  @typedoc """
  * `capture_amount` - The amount to capture from the authorization. If not provided, the full amount of the authorization will be captured. This amount is in the authorization currency and in the [smallest currency unit](https://docs.stripe.com/currencies#zero-decimal).
  * `close_authorization` - Whether to close the authorization after capture. Defaults to true. Set to false to enable multi-capture flows.
  * `expand` - Specifies which fields in the response should be expanded.
  * `purchase_details` - Additional purchase information that is optionally provided by the merchant.
  """
  @type t :: %__MODULE__{
          capture_amount: integer() | nil,
          close_authorization: boolean() | nil,
          expand: [String.t()] | nil,
          purchase_details: __MODULE__.PurchaseDetails.t() | nil
        }

  defstruct [:capture_amount, :close_authorization, :expand, :purchase_details]

  defmodule PurchaseDetails do
    @moduledoc "Nested parameters."

    @typedoc """
    * `fleet` - Fleet-specific information for transactions using Fleet cards.
    * `flight` - Information about the flight that was purchased with this transaction.
    * `fuel` - Information about fuel that was purchased with this transaction.
    * `lodging` - Information about lodging that was purchased with this transaction.
    * `receipt` - The line items in the purchase.
    * `reference` - A merchant-specific order number. Max length: 5000.
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
      @moduledoc "Nested parameters."

      @typedoc """
      * `cardholder_prompt_data` - Answers to prompts presented to the cardholder at the point of sale. Prompted fields vary depending on the configuration of your physical fleet cards. Typical points of sale support only numeric entry.
      * `purchase_type` - The type of purchase. One of `fuel_purchase`, `non_fuel_purchase`, or `fuel_and_non_fuel_purchase`. Possible values: `fuel_and_non_fuel_purchase`, `fuel_purchase`, `non_fuel_purchase`. Max length: 5000.
      * `reported_breakdown` - More information about the total amount. This information is not guaranteed to be accurate as some merchants may provide unreliable data.
      * `service_type` - The type of fuel service. One of `non_fuel_transaction`, `full_service`, or `self_service`. Possible values: `full_service`, `non_fuel_transaction`, `self_service`. Max length: 5000.
      """
      @type t :: %__MODULE__{
              cardholder_prompt_data: __MODULE__.CardholderPromptData.t() | nil,
              purchase_type: String.t() | nil,
              reported_breakdown: __MODULE__.ReportedBreakdown.t() | nil,
              service_type: String.t() | nil
            }
      defstruct [:cardholder_prompt_data, :purchase_type, :reported_breakdown, :service_type]

      defmodule CardholderPromptData do
        @moduledoc "Nested parameters."

        @typedoc """
        * `driver_id` - Driver ID. Max length: 5000.
        * `odometer` - Odometer reading.
        * `unspecified_id` - An alphanumeric ID. This field is used when a vehicle ID, driver ID, or generic ID is entered by the cardholder, but the merchant or card network did not specify the prompt type. Max length: 5000.
        * `user_id` - User ID. Max length: 5000.
        * `vehicle_number` - Vehicle number. Max length: 5000.
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
        @moduledoc "Nested parameters."

        @typedoc """
        * `fuel` - Breakdown of fuel portion of the purchase.
        * `non_fuel` - Breakdown of non-fuel portion of the purchase.
        * `tax` - Information about tax included in this transaction.
        """
        @type t :: %__MODULE__{
                fuel: __MODULE__.Fuel.t() | nil,
                non_fuel: __MODULE__.NonFuel.t() | nil,
                tax: __MODULE__.Tax.t() | nil
              }
        defstruct [:fuel, :non_fuel, :tax]

        defmodule Fuel do
          @moduledoc "Nested parameters."

          @typedoc """
          * `gross_amount_decimal` - Gross fuel amount that should equal Fuel Volume multipled by Fuel Unit Cost, inclusive of taxes. Format: decimal string.
          """
          @type t :: %__MODULE__{
                  gross_amount_decimal: String.t() | nil
                }
          defstruct [:gross_amount_decimal]
        end

        defmodule NonFuel do
          @moduledoc "Nested parameters."

          @typedoc """
          * `gross_amount_decimal` - Gross non-fuel amount that should equal the sum of the line items, inclusive of taxes. Format: decimal string.
          """
          @type t :: %__MODULE__{
                  gross_amount_decimal: String.t() | nil
                }
          defstruct [:gross_amount_decimal]
        end

        defmodule Tax do
          @moduledoc "Nested parameters."

          @typedoc """
          * `local_amount_decimal` - Amount of state or provincial Sales Tax included in the transaction amount. Null if not reported by merchant or not subject to tax. Format: decimal string.
          * `national_amount_decimal` - Amount of national Sales Tax or VAT included in the transaction amount. Null if not reported by merchant or not subject to tax. Format: decimal string.
          """
          @type t :: %__MODULE__{
                  local_amount_decimal: String.t() | nil,
                  national_amount_decimal: String.t() | nil
                }
          defstruct [:local_amount_decimal, :national_amount_decimal]
        end
      end
    end

    defmodule Flight do
      @moduledoc "Nested parameters."

      @typedoc """
      * `departure_at` - The time that the flight departed. Format: Unix timestamp.
      * `passenger_name` - The name of the passenger. Max length: 5000.
      * `refundable` - Whether the ticket is refundable.
      * `segments` - The legs of the trip.
      * `travel_agency` - The travel agency that issued the ticket. Max length: 5000.
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
        @moduledoc "Nested parameters."

        @typedoc """
        * `arrival_airport_code` - The three-letter IATA airport code of the flight's destination. Max length: 3.
        * `carrier` - The airline carrier code. Max length: 5000.
        * `departure_airport_code` - The three-letter IATA airport code that the flight departed from. Max length: 3.
        * `flight_number` - The flight number. Max length: 5000.
        * `service_class` - The flight's service class. Max length: 5000.
        * `stopover_allowed` - Whether a stopover is allowed on this flight.
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
    end

    defmodule Fuel do
      @moduledoc "Nested parameters."

      @typedoc """
      * `industry_product_code` - [Conexxus Payment System Product Code](https://www.conexxus.org/conexxus-payment-system-product-codes) identifying the primary fuel product purchased. Max length: 5000.
      * `quantity_decimal` - The quantity of `unit`s of fuel that was dispensed, represented as a decimal string with at most 12 decimal places. Format: decimal string.
      * `type` - The type of fuel that was purchased. One of `diesel`, `unleaded_plus`, `unleaded_regular`, `unleaded_super`, or `other`. Possible values: `diesel`, `other`, `unleaded_plus`, `unleaded_regular`, `unleaded_super`. Max length: 5000.
      * `unit` - The units for `quantity_decimal`. One of `charging_minute`, `imperial_gallon`, `kilogram`, `kilowatt_hour`, `liter`, `pound`, `us_gallon`, or `other`. Possible values: `charging_minute`, `imperial_gallon`, `kilogram`, `kilowatt_hour`, `liter`, `other`, `pound`, `us_gallon`. Max length: 5000.
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
      @moduledoc "Nested parameters."

      @typedoc """
      * `check_in_at` - The time of checking into the lodging. Format: Unix timestamp.
      * `nights` - The number of nights stayed at the lodging.
      """
      @type t :: %__MODULE__{
              check_in_at: integer() | nil,
              nights: integer() | nil
            }
      defstruct [:check_in_at, :nights]
    end

    defmodule Receipt do
      @moduledoc "Nested parameters."

      @typedoc """
      * `description` - Max length: 26.
      * `quantity` - Format: decimal string.
      * `total`
      * `unit_cost`
      """
      @type t :: %__MODULE__{
              description: String.t() | nil,
              quantity: String.t() | nil,
              total: integer() | nil,
              unit_cost: integer() | nil
            }
      defstruct [:description, :quantity, :total, :unit_cost]
    end
  end
end
