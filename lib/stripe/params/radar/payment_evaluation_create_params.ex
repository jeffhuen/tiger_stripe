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
          client_device_metadata_details: __MODULE__.ClientDeviceMetadataDetails.t() | nil,
          customer_details: __MODULE__.CustomerDetails.t(),
          expand: [String.t()] | nil,
          metadata: %{String.t() => String.t()} | nil,
          payment_details: __MODULE__.PaymentDetails.t()
        }

  defstruct [
    :client_device_metadata_details,
    :customer_details,
    :expand,
    :metadata,
    :payment_details
  ]

  defmodule ClientDeviceMetadataDetails do
    @moduledoc "Nested parameters."

    @typedoc """
    * `radar_session` - ID for the Radar Session to associate with the payment evaluation. A [Radar Session](https://docs.stripe.com/radar/radar-session) is a snapshot of the browser metadata and device details that help Radar make more accurate predictions on your payments. Max length: 5000.
    """
    @type t :: %__MODULE__{
            radar_session: String.t() | nil
          }
    defstruct [:radar_session]
  end

  defmodule CustomerDetails do
    @moduledoc "Nested parameters."

    @typedoc """
    * `customer` - The ID of the customer associated with the payment evaluation. Max length: 5000.
    * `customer_account` - The ID of the Account representing the customer associated with the payment evaluation. Max length: 5000.
    * `email` - The customer's email address.
    * `name` - The customer's full name or business name. Max length: 5000.
    * `phone` - The customer's phone number.
    """
    @type t :: %__MODULE__{
            customer: String.t() | nil,
            customer_account: String.t() | nil,
            email: String.t() | nil,
            name: String.t() | nil,
            phone: String.t() | nil
          }
    defstruct [:customer, :customer_account, :email, :name, :phone]
  end

  defmodule PaymentDetails do
    @moduledoc "Nested parameters."

    @typedoc """
    * `amount` - The intended amount to collect with this payment. A positive integer representing how much to charge in the [smallest currency unit](https://docs.stripe.com/currencies#zero-decimal) (for example, 100 cents to charge 1.00 USD or 100 to charge 100 Yen, a zero-decimal currency).
    * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
    * `description` - An arbitrary string attached to the object. Often useful for displaying to users. Max length: 5000.
    * `money_movement_details` - Details about the payment's customer presence and type.
    * `payment_method_details` - Details about the payment method to use for the payment.
    * `shipping_details` - Shipping details for the payment evaluation.
    * `statement_descriptor` - Payment statement descriptor. Max length: 5000.
    """
    @type t :: %__MODULE__{
            amount: integer() | nil,
            currency: String.t() | nil,
            description: String.t() | nil,
            money_movement_details: __MODULE__.MoneyMovementDetails.t() | nil,
            payment_method_details: __MODULE__.PaymentMethodDetails.t() | nil,
            shipping_details: __MODULE__.ShippingDetails.t() | nil,
            statement_descriptor: String.t() | nil
          }
    defstruct [
      :amount,
      :currency,
      :description,
      :money_movement_details,
      :payment_method_details,
      :shipping_details,
      :statement_descriptor
    ]

    defmodule MoneyMovementDetails do
      @moduledoc "Nested parameters."

      @typedoc """
      * `card` - Describes card money movement details for the payment evaluation.
      * `money_movement_type` - Describes the type of money movement. Currently only `card` is supported. Possible values: `card`.
      """
      @type t :: %__MODULE__{
              card: __MODULE__.Card.t() | nil,
              money_movement_type: String.t() | nil
            }
      defstruct [:card, :money_movement_type]

      defmodule Card do
        @moduledoc "Nested parameters."

        @typedoc """
        * `customer_presence` - Describes the presence of the customer during the payment. Possible values: `off_session`, `on_session`.
        * `payment_type` - Describes the type of payment. Possible values: `one_off`, `recurring`, `setup_one_off`, `setup_recurring`.
        """
        @type t :: %__MODULE__{
                customer_presence: String.t() | nil,
                payment_type: String.t() | nil
              }
        defstruct [:customer_presence, :payment_type]
      end
    end

    defmodule PaymentMethodDetails do
      @moduledoc "Nested parameters."

      @typedoc """
      * `billing_details` - Billing information associated with the payment evaluation.
      * `payment_method` - ID of the payment method used in this payment evaluation. Max length: 5000.
      """
      @type t :: %__MODULE__{
              billing_details: __MODULE__.BillingDetails.t() | nil,
              payment_method: String.t() | nil
            }
      defstruct [:billing_details, :payment_method]

      defmodule BillingDetails do
        @moduledoc "Nested parameters."

        @typedoc """
        * `address` - Billing address.
        * `email` - Email address.
        * `name` - Full name. Max length: 5000.
        * `phone` - Billing phone number (including extension).
        """
        @type t :: %__MODULE__{
                address: __MODULE__.Address.t() | nil,
                email: String.t() | nil,
                name: String.t() | nil,
                phone: String.t() | nil
              }
        defstruct [:address, :email, :name, :phone]

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
    end

    defmodule ShippingDetails do
      @moduledoc "Nested parameters."

      @typedoc """
      * `address` - Shipping address.
      * `name` - Shipping name. Max length: 5000.
      * `phone` - Shipping phone number.
      """
      @type t :: %__MODULE__{
              address: __MODULE__.Address.t() | nil,
              name: String.t() | nil,
              phone: String.t() | nil
            }
      defstruct [:address, :name, :phone]

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
  end
end
