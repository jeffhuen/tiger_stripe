# File generated from our OpenAPI spec
defmodule Stripe.Resources.Tax.Settings do
  @moduledoc """
  TaxProductResourceTaxSettings

  You can use Tax `Settings` to manage configurations used by Stripe Tax calculations.

  Related guide: [Using the Settings API](https://docs.stripe.com/tax/settings-api)
  """

  @typedoc """
  * `defaults` - Expandable.
  * `head_office` - The place where your business is located. Nullable. Expandable.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `tax.settings`.
  * `status` - The status of the Tax `Settings`. Possible values: `active`, `pending`.
  * `status_details` - Expandable.
  """
  @type t :: %__MODULE__{}

  defstruct [:defaults, :head_office, :livemode, :object, :status, :status_details]

  @object_name "tax.settings"
  def object_name, do: @object_name

  def expandable_fields, do: ["defaults", "head_office", "status_details"]

  def __nested_fields__ do
    %{
      "defaults" => %{
        fields: %{
          "provider" => :scalar,
          "tax_behavior" => :scalar,
          "tax_code" => :scalar
        }
      },
      "head_office" => %{
        fields: %{
          "address" => {:resource, Stripe.Resources.Address}
        }
      },
      "status_details" => %{
        fields: %{
          "active" => :scalar,
          "pending" => %{
            fields: %{
              "missing_fields" => {:list, :scalar}
            }
          }
        }
      }
    }
  end
end
