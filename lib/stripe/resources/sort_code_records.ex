# File generated from our OpenAPI spec
defmodule Stripe.Resources.SortCodeRecords do
  @moduledoc """
  FundingInstructionsBankTransferSortCodeRecord

  Sort Code Records contain U.K. bank account details per the sort code format.
  """

  @typedoc """
  * `account_holder_address` - Expandable.
  * `account_holder_name` - The name of the person or business that owns the bank account Max length: 5000.
  * `account_number` - The account number Max length: 5000.
  * `bank_address` - Expandable.
  * `sort_code` - The six-digit sort code Max length: 5000.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :account_holder_address,
    :account_holder_name,
    :account_number,
    :bank_address,
    :sort_code
  ]

  @object_name "funding_instructions_bank_transfer_sort_code_record"
  def object_name, do: @object_name

  def expandable_fields, do: ["account_holder_address", "bank_address"]

  def __nested_fields__ do
    %{
      "account_holder_address" => {:resource, Stripe.Resources.Address},
      "bank_address" => {:resource, Stripe.Resources.Address}
    }
  end
end
