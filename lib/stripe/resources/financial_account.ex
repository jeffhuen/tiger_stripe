# File generated from our OpenAPI spec
defmodule Stripe.Resources.FinancialAccount do
  @moduledoc """
  received_payment_method_details_financial_account
  """

  @typedoc """
  * `id` - The FinancialAccount ID. Max length: 5000.
  * `network` - The rails the ReceivedCredit was sent over. A FinancialAccount can only send funds over `stripe`. Possible values: `stripe`.
  """
  @type t :: %__MODULE__{}

  defstruct [:id, :network]

  @object_name "received_payment_method_details_financial_account"
  def object_name, do: @object_name
end
