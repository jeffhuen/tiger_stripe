# File generated from our OpenAPI spec
defmodule Stripe.Resources.V2.MoneyManagement.FinancialAddressCreditSimulation do
  @moduledoc """
  Financial Address Credit Simulation

  Credit Simulations represent simulated credit transactions applied to financial addresses for testing purposes.
  """

  @typedoc """
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `object` - String representing the object's type. Objects of the same type share the same value of the object field. Possible values: `v2.money_management.financial_address_credit_simulation`.
  * `status` - The status of the request, signifying whether a simulated credit was initiated.
  """
  @type t :: %__MODULE__{}

  defstruct [:livemode, :object, :status]

  @object_name "v2.money_management.financial_address_credit_simulation"
  def object_name, do: @object_name
end
