# File generated from our OpenAPI spec
defmodule Stripe.Resources.BacsDebitMandateOptions do
  @moduledoc """
  setup_intent_payment_method_options_mandate_options_bacs_debit
  """

  @typedoc """
  * `reference_prefix` - Prefix used to generate the Mandate reference. Must be at most 12 characters long. Must consist of only uppercase letters, numbers, spaces, or the following special characters: '/', '_', '-', '&', '.'. Cannot begin with 'DDIC' or 'STRIPE'. Max length: 5000.
  """
  @type t :: %__MODULE__{}

  defstruct [:reference_prefix]

  @object_name "setup_intent_payment_method_options_mandate_options_bacs_debit"
  def object_name, do: @object_name
end
