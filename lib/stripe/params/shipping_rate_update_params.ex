# File generated from our OpenAPI spec
defmodule Stripe.Params.ShippingRateUpdateParams do
  @moduledoc "Parameters for shipping rate update."

  @typedoc """
  * `active` - Whether the shipping rate can be used for new purchases. Defaults to `true`.
  * `expand` - Specifies which fields in the response should be expanded.
  * `fixed_amount` - Describes a fixed amount to charge for shipping. Must be present if type is `fixed_amount`.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `tax_behavior` - Specifies whether the rate is considered inclusive of taxes or exclusive of taxes. One of `inclusive`, `exclusive`, or `unspecified`. Possible values: `exclusive`, `inclusive`, `unspecified`.
  """
  @type t :: %__MODULE__{
          active: boolean() | nil,
          expand: [String.t()] | nil,
          fixed_amount: __MODULE__.FixedAmount.t() | nil,
          metadata: map() | nil,
          tax_behavior: String.t() | nil
        }

  defstruct [:active, :expand, :fixed_amount, :metadata, :tax_behavior]

  defmodule FixedAmount do
    @moduledoc "Nested parameters."

    @typedoc """
    * `currency_options` - Shipping rates defined in each available currency option. Each key must be a three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html) and a [supported currency](https://stripe.com/docs/currencies).
    """
    @type t :: %__MODULE__{
            currency_options: %{String.t() => __MODULE__.CurrencyOptions.t()} | nil
          }
    defstruct [:currency_options]

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
