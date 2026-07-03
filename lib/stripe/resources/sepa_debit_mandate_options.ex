# File generated from our OpenAPI spec
defmodule Stripe.Resources.SepaDebitMandateOptions do
  @moduledoc """
  payment_intent_payment_method_options_mandate_options_sepa_debit
  """

  @typedoc """
  * `reference_prefix` - Prefix used to generate the Mandate reference. Must be at most 12 characters long. Must consist of only uppercase letters, numbers, spaces, or the following special characters: '/', '_', '-', '&', '.'. Cannot begin with 'STRIPE'. Max length: 5000.
  """
  @type t :: %__MODULE__{}

  defstruct [:reference_prefix]

  @object_name "payment_intent_payment_method_options_mandate_options_sepa_debit"
  def object_name, do: @object_name
end
