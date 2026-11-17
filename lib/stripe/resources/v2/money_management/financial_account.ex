# File generated from our OpenAPI spec
defmodule Stripe.Resources.V2.MoneyManagement.FinancialAccount do
  @moduledoc """
  Financial Account

  A FinancialAccount represents a balance and can be the source or destination of money movement.
  """

  @typedoc """
  * `balance` - The FinancialAccount's balance, split into `available`, `inbound_pending`, and `outbound_pending` balances.
  Each balance is a hash keyed by lowercase currency codes, with an amount for each currency.
  * `country` - Open Enum. The country where the LegalEntity associated with the FinancialAccount is based, represented as a two-letter country code.
  * `created` - Time at which the object was created. Represented as an RFC 3339 timestamp in UTC with millisecond precision, for example `2022-09-18T13:22:18.123Z`. Format: date-time.
  * `display_name` - A descriptive name for the FinancialAccount, up to 50 characters long. This name appears in the Stripe Dashboard and embedded components.
  * `id` - Unique identifier for the object.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `metadata` - Set of key-value pairs that you can attach to an object. This can be useful for storing additional information
  about the object in a structured format.
  * `object` - String representing the object's type. Objects of the same type share the same value of the object field. Possible values: `v2.money_management.financial_account`.
  * `other` - If the FinancialAccount's `type` is `other`, this hash identifies its actual type.
  Upgrade your API version to see that type in `type`.
  * `status` - Closed Enum. An enum representing the status of the FinancialAccount. This indicates whether or not the FinancialAccount can be used for any money movement flows. Possible values: `closed`, `open`, `pending`.
  * `storage` - If the FinancialAccount's `type` is `storage`, this hash contains details specific to that type.
  * `type` - Closed Enum. The type of the FinancialAccount. Details specific to the type appear in the matching hash.
  For example, a `storage` FinancialAccount includes a `storage` hash. Possible values: `other`, `storage`.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :balance,
    :country,
    :created,
    :display_name,
    :id,
    :livemode,
    :metadata,
    :object,
    :other,
    :status,
    :storage,
    :type
  ]

  @object_name "v2.money_management.financial_account"
  def object_name, do: @object_name

  def __nested_fields__ do
    %{
      "balance" => %{
        fields: %{
          "available" =>
            {:map,
             %{
               fields: %{
                 "currency" => :scalar,
                 "value" => :scalar
               }
             }},
          "inbound_pending" =>
            {:map,
             %{
               fields: %{
                 "currency" => :scalar,
                 "value" => :scalar
               }
             }},
          "outbound_pending" =>
            {:map,
             %{
               fields: %{
                 "currency" => :scalar,
                 "value" => :scalar
               }
             }}
        }
      },
      "other" => %{
        fields: %{
          "type" => :scalar
        }
      },
      "storage" => %{
        fields: %{
          "deposit_insurance_eligibility" =>
            {:list,
             %{
               fields: %{
                 "bank_name" => :scalar,
                 "currencies" => {:list, :scalar},
                 "type" => :scalar
               }
             }},
          "holds_currencies" => {:list, :scalar}
        }
      }
    }
  end
end
