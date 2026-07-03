# File generated from our OpenAPI spec
defmodule Stripe.Params.Terminal.ReaderSetReaderDisplayParams do
  @moduledoc "Parameters for reader set reader display."

  @typedoc """
  * `cart` - Cart details to display on the reader screen, including line items, amounts, and currency.
  * `expand` - Specifies which fields in the response should be expanded.
  * `type` - Type of information to display. Only `cart` is currently supported. Possible values: `cart`.
  """
  @type t :: %__MODULE__{}

  defstruct [:cart, :expand, :type]
end
