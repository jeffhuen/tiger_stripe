# File generated from our OpenAPI spec
defmodule Stripe.Resources.Capability do
  @moduledoc """
  AccountCapability

  This is an object representing a capability for a Stripe account.

  Related guide: [Account capabilities](https://docs.stripe.com/connect/account-capabilities)
  """

  @typedoc """
  * `account` - The account for which the capability enables functionality. Expandable.
  * `future_requirements` - Expandable.
  * `id` - The identifier for the capability. Max length: 5000.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `capability`.
  * `requested` - Whether the capability has been requested.
  * `requested_at` - Time at which the capability was requested. Measured in seconds since the Unix epoch. Format: Unix timestamp. Nullable.
  * `requirements` - Expandable.
  * `status` - The status of the capability. Possible values: `active`, `inactive`, `pending`, `unrequested`.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :account,
    :future_requirements,
    :id,
    :object,
    :requested,
    :requested_at,
    :requirements,
    :status
  ]

  @object_name "capability"
  def object_name, do: @object_name

  def expandable_fields, do: ["account", "future_requirements", "requirements"]

  def __nested_fields__ do
    %{
      "future_requirements" => %{
        fields: %{
          "alternatives" =>
            {:list,
             %{
               fields: %{
                 "alternative_fields_due" => {:list, :scalar},
                 "original_fields_due" => {:list, :scalar}
               }
             }},
          "current_deadline" => :scalar,
          "currently_due" => {:list, :scalar},
          "disabled_reason" => :scalar,
          "errors" =>
            {:list,
             %{
               fields: %{
                 "code" => :scalar,
                 "reason" => :scalar,
                 "requirement" => :scalar
               }
             }},
          "eventually_due" => {:list, :scalar},
          "past_due" => {:list, :scalar},
          "pending_verification" => {:list, :scalar}
        }
      },
      "requirements" => %{
        fields: %{
          "alternatives" =>
            {:list,
             %{
               fields: %{
                 "alternative_fields_due" => {:list, :scalar},
                 "original_fields_due" => {:list, :scalar}
               }
             }},
          "current_deadline" => :scalar,
          "currently_due" => {:list, :scalar},
          "disabled_reason" => :scalar,
          "errors" =>
            {:list,
             %{
               fields: %{
                 "code" => :scalar,
                 "reason" => :scalar,
                 "requirement" => :scalar
               }
             }},
          "eventually_due" => {:list, :scalar},
          "past_due" => {:list, :scalar},
          "pending_verification" => {:list, :scalar}
        }
      }
    }
  end
end
