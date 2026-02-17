# File generated from our OpenAPI spec
defmodule Stripe.Params.ShippingRateCreateParams do
  @moduledoc "Parameters for shipping rate create."

  @typedoc """
  * `delivery_estimate` - The estimated range for how long shipping will take, meant to be displayable to the customer. This will appear on CheckoutSessions.
  * `display_name` - The name of the shipping rate, meant to be displayable to the customer. This will appear on CheckoutSessions. Max length: 100.
  * `expand` - Specifies which fields in the response should be expanded.
  * `fixed_amount` - Describes a fixed amount to charge for shipping. Must be present if type is `fixed_amount`.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `tax_behavior` - Specifies whether the rate is considered inclusive of taxes or exclusive of taxes. One of `inclusive`, `exclusive`, or `unspecified`. Possible values: `exclusive`, `inclusive`, `unspecified`.
  * `tax_code` - A [tax code](https://docs.stripe.com/tax/tax-categories) ID. The Shipping tax code is `txcd_92010001`.
  * `type` - The type of calculation to use on the shipping rate. Possible values: `fixed_amount`.
  """
  @type t :: %__MODULE__{
          delivery_estimate: __MODULE__.DeliveryEstimate.t() | nil,
          display_name: String.t(),
          expand: [String.t()] | nil,
          fixed_amount: __MODULE__.FixedAmount.t() | nil,
          metadata: %{String.t() => String.t()} | nil,
          tax_behavior: String.t() | nil,
          tax_code: String.t() | nil,
          type: String.t() | nil
        }

  defstruct [
    :delivery_estimate,
    :display_name,
    :expand,
    :fixed_amount,
    :metadata,
    :tax_behavior,
    :tax_code,
    :type
  ]

  defmodule DeliveryEstimate do
    @moduledoc "Nested parameters."

    @typedoc """
    * `maximum` - The upper bound of the estimated range. If empty, represents no upper bound i.e., infinite.
    * `minimum` - The lower bound of the estimated range. If empty, represents no lower bound.
    """
    @type t :: %__MODULE__{
            maximum: __MODULE__.Maximum.t() | nil,
            minimum: __MODULE__.Minimum.t() | nil
          }
    defstruct [:maximum, :minimum]

    defmodule Maximum do
      @moduledoc "Nested parameters."

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
      @moduledoc "Nested parameters."

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
  end

  defmodule FixedAmount do
    @moduledoc "Nested parameters."

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
      @moduledoc "Nested parameters."

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
  end
end
