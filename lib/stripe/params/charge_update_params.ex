# File generated from our OpenAPI spec
defmodule Stripe.Params.ChargeUpdateParams do
  @moduledoc "Parameters for charge update."

  @typedoc """
  * `customer` - The ID of an existing customer that will be associated with this request. This field may only be updated if there is no existing associated customer with this charge. Max length: 5000.
  * `description` - An arbitrary string which you can attach to a charge object. It is displayed when in the web interface alongside the charge. Note that if you use Stripe to send automatic email receipts to your customers, your receipt emails will include the `description` of the charge(s) that they are describing. Max length: 40000.
  * `expand` - Specifies which fields in the response should be expanded.
  * `fraud_details` - A set of key-value pairs you can attach to a charge giving information about its riskiness. If you believe a charge is fraudulent, include a `user_report` key with a value of `fraudulent`. If you believe a charge is safe, include a `user_report` key with a value of `safe`. Stripe will use the information you send to improve our fraud detection algorithms.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `receipt_email` - This is the email address that the receipt for this charge will be sent to. If this field is updated, then a new email receipt will be sent to the updated address. Max length: 5000.
  * `shipping` - Shipping information for the charge. Helps prevent fraud on charges for physical goods.
  * `transfer_group` - A string that identifies this transaction as part of a group. `transfer_group` may only be provided if it has not been set. See the [Connect documentation](https://docs.stripe.com/connect/separate-charges-and-transfers#transfer-options) for details.
  """
  @type t :: %__MODULE__{
          customer: String.t() | nil,
          description: String.t() | nil,
          expand: [String.t()] | nil,
          fraud_details: __MODULE__.FraudDetails.t() | nil,
          metadata: map() | nil,
          receipt_email: String.t() | nil,
          shipping: __MODULE__.Shipping.t() | nil,
          transfer_group: String.t() | nil
        }

  defstruct [
    :customer,
    :description,
    :expand,
    :fraud_details,
    :metadata,
    :receipt_email,
    :shipping,
    :transfer_group
  ]

  defmodule FraudDetails do
    @moduledoc "Nested parameters."

    @typedoc """
    * `user_report` - Either `safe` or `fraudulent`. Possible values: `fraudulent`, `safe`. Max length: 5000.
    """
    @type t :: %__MODULE__{
            user_report: String.t() | nil
          }
    defstruct [:user_report]
  end

  defmodule Shipping do
    @moduledoc "Nested parameters."

    @typedoc """
    * `address` - Shipping address.
    * `carrier` - The delivery service that shipped a physical product, such as Fedex, UPS, USPS, etc. Max length: 5000.
    * `name` - Recipient name. Max length: 5000.
    * `phone` - Recipient phone (including extension). Max length: 5000.
    * `tracking_number` - The tracking number for a physical product, obtained from the delivery service. If multiple tracking numbers were generated for this purchase, please separate them with commas. Max length: 5000.
    """
    @type t :: %__MODULE__{
            address: __MODULE__.Address.t() | nil,
            carrier: String.t() | nil,
            name: String.t() | nil,
            phone: String.t() | nil,
            tracking_number: String.t() | nil
          }
    defstruct [:address, :carrier, :name, :phone, :tracking_number]

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
