# File generated from our OpenAPI spec
defmodule Stripe.Resources.FinancialConnections.Authorization do
  @moduledoc """
  BankConnectionsResourceAuthorization

  An Authorization represents the set of credentials used to connect a group of Financial Connections Accounts.
  """

  @typedoc """
  * `id` - Unique identifier for the object. Max length: 5000.
  * `institution_name` - The name of the institution that this authorization belongs to. Max length: 5000.
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `financial_connections.authorization`.
  * `status` - The status of the connection to the Authorization. Possible values: `active`, `inactive`.
  * `status_details` - Expandable.
  """
  @type t :: %__MODULE__{}

  defstruct [:id, :institution_name, :livemode, :object, :status, :status_details]

  @object_name "financial_connections.authorization"
  def object_name, do: @object_name

  def expandable_fields, do: ["status_details"]

  def __nested_fields__ do
    %{
      "status_details" => %{
        fields: %{
          "active" => %{
            fields: %{
              "action" => :scalar,
              "expected_deactivation_date" => :scalar
            }
          },
          "inactive" => %{
            fields: %{
              "action" => :scalar
            }
          }
        }
      }
    }
  end
end
