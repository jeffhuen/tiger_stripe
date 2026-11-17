# File generated from our OpenAPI spec
defmodule Stripe.Params.V2.Core.Vault.UsBankAccountConfirmMicrodepositsParams do
  @moduledoc "Parameters for us bank account confirm microdeposits."

  @typedoc """
  * `amounts` - Two amounts received through Send Microdeposits must match the input to Confirm Microdeposits to verify US Bank Account.
  * `descriptor_code` - Descriptor code received through Send Microdeposits must match the input to Confirm Microdeposits to verify US Bank Account.
  """
  @type t :: %__MODULE__{}

  defstruct [:amounts, :descriptor_code]
end
