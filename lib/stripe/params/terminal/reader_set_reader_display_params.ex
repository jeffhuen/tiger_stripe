# File generated from our OpenAPI spec
defmodule Stripe.Params.Terminal.ReaderSetReaderDisplayParams do
  @moduledoc "Parameters for reader set reader display."

  @typedoc """
  * `cart` - Cart details to display on the reader screen, including line items, amounts, and currency.
  * `expand` - Specifies which fields in the response should be expanded.
  * `type` - Type of information to display. Only `cart` is currently supported. Possible values: `cart`.
  """
  @type t :: %__MODULE__{
          cart: cart() | nil,
          expand: [String.t()] | nil,
          type: String.t()
        }

  defstruct [:cart, :expand, :type]

  @typedoc """
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `line_items` - Array of line items to display.
  * `tax` - The amount of tax in the [smallest currency unit](https://docs.stripe.com/currencies#zero-decimal).
  * `total` - Total balance of cart due in the [smallest currency unit](https://docs.stripe.com/currencies#zero-decimal).
  """
  @type cart :: %{
          optional(:currency) => String.t() | nil,
          optional(:line_items) => [cart_line_items()] | nil,
          optional(:tax) => integer() | nil,
          optional(:total) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `amount` - The price of the item in the [smallest currency unit](https://docs.stripe.com/currencies#zero-decimal).
  * `description` - The description or name of the item. Max length: 5000.
  * `quantity` - The quantity of the line item being purchased.
  """
  @type cart_line_items :: %{
          optional(:amount) => integer() | nil,
          optional(:description) => String.t() | nil,
          optional(:quantity) => integer() | nil,
          optional(String.t()) => term()
        }
end
