# File generated from our OpenAPI spec
defmodule Stripe.Resources.V2.Core.Vault.GbBankAccount do
  @moduledoc """
  GB Bank Account

  Use the GBBankAccounts API to create and manage GB bank account objects
  """

  @typedoc """
  * `archived` - Whether this bank account object was archived. Bank account objects can be archived through
  the /archive API, and they will not be automatically archived by Stripe. Archived bank account objects
  cannot be used as outbound destinations and will not appear in the outbound destination list.
  * `bank_account_type` - Closed Enum. The type of the bank account (checking or savings). Possible values: `checking`, `savings`.
  * `bank_name` - The name of the bank.
  * `created` - Creation time. Format: date-time.
  * `id` - The ID of the GBBankAccount object.
  * `last4` - The last 4 digits of the account number or IBAN.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `object` - String representing the object's type. Objects of the same type share the same value of the object field. Possible values: `v2.core.vault.gb_bank_account`.
  * `restricted` - Whether the GB Bank Account is currently unusable for money movement, despite potentially being correctly set up. Please reach out to Stripe Support for more information.
  * `sort_code` - The Sort Code of the bank account.
  * `supported_currencies` - The list of currencies supported by this bank account.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :archived,
    :bank_account_type,
    :bank_name,
    :created,
    :id,
    :last4,
    :livemode,
    :object,
    :restricted,
    :sort_code,
    :supported_currencies
  ]

  @object_name "v2.core.vault.gb_bank_account"
  def object_name, do: @object_name
end
