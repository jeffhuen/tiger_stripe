# File generated from our OpenAPI spec
defmodule Stripe.Resources.NaverPay do
  @moduledoc """
  payment_method_naver_pay
  """

  @typedoc """
  * `buyer_id` - Uniquely identifies this particular Naver Pay account. You can use this attribute to check whether two Naver Pay accounts are the same. Max length: 5000. Nullable.
  * `funding` - Whether to fund this transaction with Naver Pay points or a card. Possible values: `card`, `points`.
  """
  @type t :: %__MODULE__{}

  defstruct [:buyer_id, :funding]

  @object_name "payment_method_naver_pay"
  def object_name, do: @object_name
end
