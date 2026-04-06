# File generated from our OpenAPI spec
defmodule Stripe.Resources.ShippingRate do
  @moduledoc """
  ShippingRate

  Shipping rates describe the price of shipping presented to your customers and
  applied to a purchase. For more information, see [Charge for shipping](https://docs.stripe.com/payments/during-payment/charge-shipping).
  """

  @typedoc """
  * `active` - Whether the shipping rate can be used for new purchases. Defaults to `true`.
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `delivery_estimate` - The estimated range for how long shipping will take, meant to be displayable to the customer. This will appear on CheckoutSessions. Nullable. Expandable.
  * `display_name` - The name of the shipping rate, meant to be displayable to the customer. This will appear on CheckoutSessions. Max length: 5000. Nullable.
  * `fixed_amount` - Expandable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `shipping_rate`.
  * `tax_behavior` - Specifies whether the rate is considered inclusive of taxes or exclusive of taxes. One of `inclusive`, `exclusive`, or `unspecified`. Possible values: `exclusive`, `inclusive`, `unspecified`. Nullable.
  * `tax_code` - A [tax code](https://docs.stripe.com/tax/tax-categories) ID. The Shipping tax code is `txcd_92010001`. Nullable. Expandable.
  * `type` - The type of calculation to use on the shipping rate. Possible values: `fixed_amount`.
  """
  @type t :: %__MODULE__{
          active: boolean(),
          created: integer(),
          delivery_estimate: __MODULE__.DeliveryEstimate.t(),
          display_name: String.t(),
          fixed_amount: __MODULE__.FixedAmount.t() | nil,
          id: String.t(),
          livemode: boolean(),
          metadata: %{String.t() => String.t()},
          object: String.t(),
          tax_behavior: String.t(),
          tax_code: String.t() | Stripe.Resources.TaxCode.t(),
          type: String.t()
        }

  defstruct [
    :active,
    :created,
    :delivery_estimate,
    :display_name,
    :fixed_amount,
    :id,
    :livemode,
    :metadata,
    :object,
    :tax_behavior,
    :tax_code,
    :type
  ]

  @object_name "shipping_rate"
  def object_name, do: @object_name

  def expandable_fields, do: ["delivery_estimate", "fixed_amount", "tax_code"]

  defmodule DeliveryEstimate do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `maximum` - The upper bound of the estimated range. If empty, represents no upper bound i.e., infinite. Nullable.
    * `minimum` - The lower bound of the estimated range. If empty, represents no lower bound. Nullable.
    """
    @type t :: %__MODULE__{
            maximum: __MODULE__.Maximum.t() | nil,
            minimum: __MODULE__.Minimum.t() | nil
          }
    defstruct [:maximum, :minimum]

    defmodule Maximum do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `unit` - A unit of time. Possible values: `business_day`, `day`, `hour`, `month`, `week`.
      * `value` - Must be greater than 0.
      """
      @type t :: %__MODULE__{
              unit: String.t() | nil,
              value: integer() | nil
            }
      defstruct [:unit, :value]
    end

    defmodule Minimum do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `unit` - A unit of time. Possible values: `business_day`, `day`, `hour`, `month`, `week`.
      * `value` - Must be greater than 0.
      """
      @type t :: %__MODULE__{
              unit: String.t() | nil,
              value: integer() | nil
            }
      defstruct [:unit, :value]
    end

    def __inner_types__ do
      %{
        "maximum" => __MODULE__.Maximum,
        "minimum" => __MODULE__.Minimum
      }
    end
  end

  defmodule FixedAmount do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `amount` - A non-negative integer in cents representing how much to charge.
    * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
    * `currency_options` - Shipping rates defined in each available currency option. Each key must be a three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html) and a [supported currency](https://stripe.com/docs/currencies).
    """
    @type t :: %__MODULE__{
            amount: integer() | nil,
            currency: String.t() | nil,
            currency_options: %{String.t() => __MODULE__.CurrencyOptions.t()} | nil
          }
    defstruct [:amount, :currency, :currency_options]

    defmodule CurrencyOptions do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `amount` - A non-negative integer in cents representing how much to charge.
      * `tax_behavior` - Specifies whether the rate is considered inclusive of taxes or exclusive of taxes. One of `inclusive`, `exclusive`, or `unspecified`. Possible values: `exclusive`, `inclusive`, `unspecified`.
      """
      @type t :: %__MODULE__{
              amount: integer() | nil,
              tax_behavior: String.t() | nil
            }
      defstruct [:amount, :tax_behavior]
    end

    def __inner_types__ do
      %{
        "currency_options" => __MODULE__.CurrencyOptions
      }
    end
  end

  def __inner_types__ do
    %{
      "delivery_estimate" => __MODULE__.DeliveryEstimate,
      "fixed_amount" => __MODULE__.FixedAmount
    }
  end
end
