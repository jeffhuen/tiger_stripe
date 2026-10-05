# File generated from our OpenAPI spec
defmodule Stripe.Resources.India do
  @moduledoc """
  card_mandate_payment_method_details_india
  """

  @typedoc """
  * `inactive_reason` - The reason why the mandate has an `inactive` status. This field is only populated if the mandate is inactive. Possible values: `canceled`, `card_not_supported`, `currency_not_supported`, `expired`, `issuer_not_supported`, `processing_error`, `undetermined`. Nullable.
  """
  @type t :: %__MODULE__{}

  defstruct [:inactive_reason]

  @object_name "card_mandate_payment_method_details_india"
  def object_name, do: @object_name
end
