# File generated from our OpenAPI spec
defmodule Stripe.Params.PaymentRecordReportPaymentAttemptParams do
  @moduledoc "Parameters for payment record report payment attempt."

  @typedoc """
  * `description` - An arbitrary string attached to the object. Often useful for displaying to users. Max length: 5000.
  * `expand` - Specifies which fields in the response should be expanded.
  * `failed` - Information about the payment attempt failure.
  * `guaranteed` - Information about the payment attempt guarantee.
  * `initiated_at` - When the reported payment was initiated. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `outcome` - The outcome of the reported payment. Possible values: `failed`, `guaranteed`.
  * `payment_method_details` - Information about the Payment Method debited for this payment.
  * `shipping_details` - Shipping information for this payment.
  """
  @type t :: %__MODULE__{
          description: String.t() | nil,
          expand: [String.t()] | nil,
          failed: __MODULE__.Failed.t() | nil,
          guaranteed: __MODULE__.Guaranteed.t() | nil,
          initiated_at: integer(),
          metadata: map() | nil,
          outcome: String.t() | nil,
          payment_method_details: __MODULE__.PaymentMethodDetails.t() | nil,
          shipping_details: __MODULE__.ShippingDetails.t() | nil
        }

  defstruct [
    :description,
    :expand,
    :failed,
    :guaranteed,
    :initiated_at,
    :metadata,
    :outcome,
    :payment_method_details,
    :shipping_details
  ]

  defmodule Failed do
    @moduledoc "Nested parameters."

    @typedoc """
    * `failed_at` - When the reported payment failed. Measured in seconds since the Unix epoch. Format: Unix timestamp.
    """
    @type t :: %__MODULE__{
            failed_at: integer() | nil
          }
    defstruct [:failed_at]
  end

  defmodule Guaranteed do
    @moduledoc "Nested parameters."

    @typedoc """
    * `guaranteed_at` - When the reported payment was guaranteed. Measured in seconds since the Unix epoch. Format: Unix timestamp.
    """
    @type t :: %__MODULE__{
            guaranteed_at: integer() | nil
          }
    defstruct [:guaranteed_at]
  end

  defmodule PaymentMethodDetails do
    @moduledoc "Nested parameters."

    @typedoc """
    * `billing_details` - The billing details associated with the method of payment.
    * `custom` - Information about the custom (user-defined) payment method used to make this payment.
    * `payment_method` - ID of the Stripe Payment Method used to make this payment. Max length: 5000.
    * `type` - The type of the payment method details. An additional hash is included on the payment_method_details with a name matching this value. It contains additional information specific to the type. Possible values: `custom`.
    """
    @type t :: %__MODULE__{
            billing_details: __MODULE__.BillingDetails.t() | nil,
            custom: __MODULE__.Custom.t() | nil,
            payment_method: String.t() | nil,
            type: String.t() | nil
          }
    defstruct [:billing_details, :custom, :payment_method, :type]

    defmodule BillingDetails do
      @moduledoc "Nested parameters."

      @typedoc """
      * `address` - The billing address associated with the method of payment.
      * `email` - The billing email associated with the method of payment.
      * `name` - The billing name associated with the method of payment. Max length: 5000.
      * `phone` - The billing phone number associated with the method of payment.
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

    defmodule Custom do
      @moduledoc "Nested parameters."

      @typedoc """
      * `display_name` - Display name for the custom (user-defined) payment method type used to make this payment. Max length: 5000.
      * `type` - The custom payment method type associated with this payment. Max length: 5000.
      """
      @type t :: %__MODULE__{
              display_name: String.t() | nil,
              type: String.t() | nil
            }
      defstruct [:display_name, :type]
    end
  end

  defmodule ShippingDetails do
    @moduledoc "Nested parameters."

    @typedoc """
    * `address` - The physical shipping address.
    * `name` - The shipping recipient's name. Max length: 5000.
    * `phone` - The shipping recipient's phone number.
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
