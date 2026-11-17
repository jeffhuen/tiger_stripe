# File generated from our OpenAPI spec
defmodule Stripe.Params.V2.MoneyManagement.TestHelpers.FinancialAddressCreditParams do
  @moduledoc "Parameters for financial address credit."

  @typedoc """
  * `amount` - Object containing the amount value and currency to credit.
  * `network` - Open Enum. The network to use in simulating the funds flow. This will be the reflected in the resulting ReceivedCredit. Possible values: `ach`, `chaps`, `fedwire`, `fps`, `rtp`, `sepa`.
  * `statement_descriptor` - String explaining funds flow. Use this field to populate the statement descriptor of the ReceivedCredit created as an eventual result of this simulation.
  """
  @type t :: %__MODULE__{}

  defstruct [:amount, :network, :statement_descriptor]
end
