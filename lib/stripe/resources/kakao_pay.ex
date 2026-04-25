# File generated from our OpenAPI spec
defmodule Stripe.Resources.KakaoPay do
  @moduledoc """
  payment_method_details_kakao_pay
  """

  @typedoc """
  * `buyer_id` - A unique identifier for the buyer as determined by the local payment processor. Max length: 5000. Nullable.
  * `transaction_id` - The Kakao Pay transaction ID associated with this payment. Max length: 5000. Nullable.
  """
  @type t :: %__MODULE__{
          buyer_id: String.t(),
          transaction_id: String.t()
        }

  defstruct [:buyer_id, :transaction_id]

  @object_name "payment_method_details_kakao_pay"
  def object_name, do: @object_name
end
