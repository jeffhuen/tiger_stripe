# File generated from our OpenAPI spec
defmodule Stripe.Resources.FinancialConnections.AccountOwnership do
  @moduledoc """
  BankConnectionsResourceOwnership

  Describes a snapshot of the owners of an account at a particular point in time.
  """

  @typedoc """
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `financial_connections.account_ownership`.
  * `owners` - A paginated list of owners for this account. Expandable.
  """
  @type t :: %__MODULE__{}

  defstruct [:created, :id, :object, :owners]

  @object_name "financial_connections.account_ownership"
  def object_name, do: @object_name

  def expandable_fields, do: ["owners"]

  def __nested_fields__ do
    %{
      "owners" => %{
        fields: %{
          "data" => {:list, {:resource, Stripe.Resources.FinancialConnections.AccountOwner}},
          "has_more" => :scalar,
          "object" => :scalar,
          "url" => :scalar
        }
      }
    }
  end
end
