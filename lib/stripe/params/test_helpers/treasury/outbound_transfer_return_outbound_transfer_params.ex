# File generated from our OpenAPI spec
defmodule Stripe.Params.TestHelpers.Treasury.OutboundTransferReturnOutboundTransferParams do
  @moduledoc "Parameters for outbound transfer return outbound transfer."

  @typedoc """
  * `expand` - Specifies which fields in the response should be expanded.
  * `returned_details` - Details about a returned OutboundTransfer.
  """
  @type t :: %__MODULE__{
          expand: [String.t()] | nil,
          returned_details: returned_details() | nil
        }

  defstruct [:expand, :returned_details]

  @typedoc """
  * `code` - Reason for the return. Possible values: `account_closed`, `account_frozen`, `bank_account_restricted`, `bank_ownership_changed`, `declined`, `incorrect_account_holder_name`, `invalid_account_number`, `invalid_currency`, `no_account`, `other`.
  """
  @type returned_details :: %{
          optional(:code) => String.t() | nil,
          optional(String.t()) => term()
        }
end
