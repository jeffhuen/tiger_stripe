# File generated from our OpenAPI spec
defmodule Stripe.Resources.V2.Core.Vault.UsBankAccount do
  @moduledoc """
  US Bank Account

  Use the USBankAccounts API to create and manage US bank accounts objects that you can use to receive funds. Note that these are not interchangeable with v1 Tokens.
  """

  @typedoc """
  * `archived` - Whether this USBankAccount object was archived.
  * `bank_account_type` - Closed Enum. The type of bank account (checking or savings). Possible values: `checking`, `savings`.
  * `bank_name` - The name of the bank this bank account belongs to. This field is populated automatically by Stripe based on the routing number.
  * `created` - Creation time of the object. Format: date-time.
  * `fedwire_routing_number` - The fedwire routing number of the bank account.
  * `financial_connections_account` - The ID of the Financial Connections Account used to create the bank account.
  * `id` - The ID of the USBankAccount object.
  * `last4` - The last 4 digits of the account number.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `object` - String representing the object's type. Objects of the same type share the same value of the object field. Possible values: `v2.core.vault.us_bank_account`.
  * `restricted` - Whether the US Bank Account is currently unusable for money movement, despite potentially being correctly set up. Please reach out to Stripe Support for more information.
  * `routing_number` - The ACH routing number of the bank account.
  * `supported_currencies` - The list of currencies supported by this bank account.
  * `verification` - The bank account verification details.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :archived,
    :bank_account_type,
    :bank_name,
    :created,
    :fedwire_routing_number,
    :financial_connections_account,
    :id,
    :last4,
    :livemode,
    :object,
    :restricted,
    :routing_number,
    :supported_currencies,
    :verification
  ]

  @object_name "v2.core.vault.us_bank_account"
  def object_name, do: @object_name

  def __nested_fields__ do
    %{
      "verification" => %{
        fields: %{
          "microdeposit_verification_details" => %{
            fields: %{
              "expires" => :scalar,
              "microdeposit_type" => :scalar,
              "sent" => :scalar
            }
          },
          "status" => :scalar
        }
      }
    }
  end
end
