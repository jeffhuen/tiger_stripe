# File generated from our OpenAPI spec
defmodule Stripe.Params.Checkout.SessionUpdateParams do
  @moduledoc "Parameters for session update."

  @typedoc """
  * `collected_information` - Information about the customer collected within the Checkout Session. Can only be set when updating `embedded` or `custom` sessions.
  * `expand` - Specifies which fields in the response should be expanded.
  * `line_items` - A list of items the customer is purchasing.

  When updating line items, you must retransmit the entire array of line items.

  To retain an existing line item, specify its `id`.

  To update an existing line item, specify its `id` along with the new values of the fields to update.

  To add a new line item, specify one of `price` or `price_data` and `quantity`.

  To remove an existing line item, omit the line item's ID from the retransmitted array.

  To reorder a line item, specify it at the desired position in the retransmitted array.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `shipping_options` - The shipping rate options to apply to this Session. Up to a maximum of 5.
  """
  @type t :: %__MODULE__{}

  defstruct [:collected_information, :expand, :line_items, :metadata, :shipping_options]
end
