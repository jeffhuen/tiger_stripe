# File generated from our OpenAPI spec
defmodule Stripe.Params.V2.MoneyManagement.FinancialAccountUpdateParams do
  @moduledoc "Parameters for financial account update."

  @typedoc """
  * `display_name` - A descriptive name for the FinancialAccount, up to 50 characters long. This name appears in the Stripe Dashboard and embedded components.
  * `metadata` - Set of key-value pairs that you can attach to the FinancialAccount. Individual keys can be unset by posting
  null to them.
  """
  @type t :: %__MODULE__{}

  defstruct [:display_name, :metadata]
end
