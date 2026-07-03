# File generated from our OpenAPI spec
defmodule Stripe.Params.PromotionCodeUpdateParams do
  @moduledoc "Parameters for promotion code update."

  @typedoc """
  * `active` - Whether the promotion code is currently active. A promotion code can only be reactivated when the coupon is still valid and the promotion code is otherwise redeemable.
  * `expand` - Specifies which fields in the response should be expanded.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `restrictions` - Settings that restrict the redemption of the promotion code.
  """
  @type t :: %__MODULE__{}

  defstruct [:active, :expand, :metadata, :restrictions]
end
