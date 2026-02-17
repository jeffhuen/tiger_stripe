# File generated from our OpenAPI spec
defmodule Stripe.Params.PromotionCodeUpdateParams do
  @moduledoc "Parameters for promotion code update."

  @typedoc """
  * `active` - Whether the promotion code is currently active. A promotion code can only be reactivated when the coupon is still valid and the promotion code is otherwise redeemable.
  * `expand` - Specifies which fields in the response should be expanded.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `restrictions` - Settings that restrict the redemption of the promotion code.
  """
  @type t :: %__MODULE__{
          active: boolean() | nil,
          expand: [String.t()] | nil,
          metadata: map() | nil,
          restrictions: __MODULE__.Restrictions.t() | nil
        }

  defstruct [:active, :expand, :metadata, :restrictions]

  defmodule Restrictions do
    @moduledoc "Nested parameters."

    @typedoc """
    * `currency_options` - Promotion codes defined in each available currency option. Each key must be a three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html) and a [supported currency](https://stripe.com/docs/currencies).
    """
    @type t :: %__MODULE__{
            currency_options: %{String.t() => __MODULE__.CurrencyOptions.t()} | nil
          }
    defstruct [:currency_options]

    defmodule CurrencyOptions do
      @moduledoc "Nested parameters."

      @typedoc """
      * `minimum_amount` - Minimum amount required to redeem this Promotion Code into a Coupon (e.g., a purchase must be $100 or more to work).
      """
      @type t :: %__MODULE__{
              minimum_amount: integer() | nil
            }
      defstruct [:minimum_amount]
    end
  end
end
