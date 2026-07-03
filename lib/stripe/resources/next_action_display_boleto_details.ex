# File generated from our OpenAPI spec
defmodule Stripe.Resources.NextActionDisplayBoletoDetails do
  @moduledoc """
  payment_intent_next_action_boleto
  """

  @typedoc """
  * `expires_at` - The timestamp after which the boleto expires. Format: Unix timestamp. Nullable.
  * `hosted_voucher_url` - The URL to the hosted boleto voucher page, which allows customers to view the boleto voucher. Max length: 5000. Nullable.
  * `number` - The boleto number. Max length: 5000. Nullable.
  * `pdf` - The URL to the downloadable boleto voucher PDF. Max length: 5000. Nullable.
  """
  @type t :: %__MODULE__{}

  defstruct [:expires_at, :hosted_voucher_url, :number, :pdf]

  @object_name "payment_intent_next_action_boleto"
  def object_name, do: @object_name
end
