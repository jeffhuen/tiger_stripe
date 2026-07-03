# File generated from our OpenAPI spec
defmodule Stripe.Resources.TaxDeductedAtSource do
  @moduledoc """
  TaxDeductedAtSource
  """

  @typedoc """
  * `id` - Unique identifier for the object. Max length: 5000.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `tax_deducted_at_source`.
  * `period_end` - The end of the invoicing period. This TDS applies to Stripe fees collected during this invoicing period. Format: Unix timestamp.
  * `period_start` - The start of the invoicing period. This TDS applies to Stripe fees collected during this invoicing period. Format: Unix timestamp.
  * `tax_deduction_account_number` - The TAN that was supplied to Stripe when TDS was assessed Max length: 5000.
  """
  @type t :: %__MODULE__{}

  defstruct [:id, :object, :period_end, :period_start, :tax_deduction_account_number]

  @object_name "tax_deducted_at_source"
  def object_name, do: @object_name
end
