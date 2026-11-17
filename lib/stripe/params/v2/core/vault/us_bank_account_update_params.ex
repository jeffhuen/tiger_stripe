# File generated from our OpenAPI spec
defmodule Stripe.Params.V2.Core.Vault.UsBankAccountUpdateParams do
  @moduledoc "Parameters for us bank account update."

  @typedoc """
  * `fedwire_routing_number` - The bank account's Fedwire routing number can be provided for update if it was empty previously.
  * `routing_number` - The bank account's ACH routing number can be provided for update if it was empty previously.
  """
  @type t :: %__MODULE__{}

  defstruct [:fedwire_routing_number, :routing_number]
end
