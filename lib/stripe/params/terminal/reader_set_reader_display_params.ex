# File generated from our OpenAPI spec
defmodule Stripe.Params.Terminal.ReaderSetReaderDisplayParams do
  @moduledoc "Parameters for reader set reader display."

  @typedoc """
  * `cart` - Cart details to display on the reader screen, including line items, amounts, and currency.
  * `expand` - Specifies which fields in the response should be expanded.
  * `type` - Type of information to display. Only `cart` is currently supported. Possible values: `cart`.
  """
  @type t :: %__MODULE__{
          cart: __MODULE__.Cart.t() | nil,
          expand: [String.t()] | nil,
          type: String.t()
        }

  defstruct [:cart, :expand, :type]

  defmodule Cart do
    @moduledoc "Nested parameters."

    @typedoc """
    * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
    * `line_items` - Array of line items to display.
    * `tax` - The amount of tax in the [smallest currency unit](https://docs.stripe.com/currencies#zero-decimal).
    * `total` - Total balance of cart due in the [smallest currency unit](https://docs.stripe.com/currencies#zero-decimal).
    """
    @type t :: %__MODULE__{
            currency: String.t() | nil,
            line_items: [__MODULE__.LineItems.t()] | nil,
            tax: integer() | nil,
            total: integer() | nil
          }
    defstruct [:currency, :line_items, :tax, :total]

    defmodule LineItems do
      @moduledoc "Nested parameters."

      @typedoc """
      * `amount` - The price of the item in the [smallest currency unit](https://docs.stripe.com/currencies#zero-decimal).
      * `description` - The description or name of the item. Max length: 5000.
      * `quantity` - The quantity of the line item being purchased.
      """
      @type t :: %__MODULE__{
              amount: integer() | nil,
              description: String.t() | nil,
              quantity: integer() | nil
            }
      defstruct [:amount, :description, :quantity]
    end
  end
end
