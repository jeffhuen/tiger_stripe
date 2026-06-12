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
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `tax.settings`.
  * `status` - The status of the Tax `Settings`. Possible values: `active`, `pending`.
  * `status_details` - Expandable.
  """
  @type t :: %__MODULE__{
          defaults: defaults(),
          head_office: head_office(),
          livemode: boolean(),
          object: String.t(),
          status: String.t(),
          status_details: status_details()
        }

  defstruct [:defaults, :head_office, :livemode, :object, :status, :status_details]

  @object_name "tax.settings"
  def object_name, do: @object_name

  def expandable_fields, do: ["defaults", "head_office", "status_details"]

  @typedoc """
  * `provider` - The tax calculation provider this account uses. Defaults to `stripe` when not using a [third-party provider](https://stripe.com/tax/third-party-apps). Possible values: `anrok`, `avalara`, `sphere`, `stripe`.
  * `tax_behavior` - Default [tax behavior](https://stripe.com/docs/tax/products-prices-tax-categories-tax-behavior#tax-behavior) used to specify whether the price is considered inclusive of taxes or exclusive of taxes. If the item's price has a tax behavior set, it will take precedence over the default tax behavior. Possible values: `exclusive`, `inclusive`, `inferred_by_currency`. Nullable.
  * `tax_code` - Default [tax code](https://stripe.com/docs/tax/tax-categories) used to classify your products and prices. Max length: 5000. Nullable.
  """
  @type defaults :: %{
          optional(:provider) => String.t() | nil,
          optional(:tax_behavior) => String.t() | nil,
          optional(:tax_code) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `address`
  """
  @type head_office :: %{
          optional(:address) => Stripe.Resources.Address.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `active`
  * `pending`
  """
  @type status_details :: %{
          optional(:active) => map() | nil,
          optional(:pending) => status_details_pending() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `missing_fields` - The list of missing fields that are required to perform calculations. It includes the entry `head_office` when the status is `pending`. It is recommended to set the optional values even if they aren't listed as required for calculating taxes. Calculations can fail if missing fields aren't explicitly provided on every call. Nullable.
  """
  @type status_details_pending :: %{
          optional(:missing_fields) => [String.t()] | nil,
          optional(String.t()) => term()
        }

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
