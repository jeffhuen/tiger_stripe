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
  @type t :: %__MODULE__{
          created: integer(),
          id: String.t(),
          object: String.t(),
          owners: owners()
        }

  defstruct [:created, :id, :object, :owners]

  @object_name "financial_connections.account_ownership"
  def object_name, do: @object_name

  def expandable_fields, do: ["owners"]

  @typedoc """
  * `data` - Details about each object.
  * `has_more` - True if this list has another page of items after this one that can be fetched.
  * `object` - String representing the object's type. Objects of the same type share the same value. Always has the value `list`. Possible values: `list`.
  * `url` - The URL where this list can be accessed. Max length: 5000.
  """
  @type owners :: %{
          optional(:data) => [Stripe.Resources.FinancialConnections.AccountOwner.t()] | nil,
          optional(:has_more) => boolean() | nil,
          optional(:object) => String.t() | nil,
          optional(:url) => String.t() | nil,
          optional(String.t()) => term()
        }

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
