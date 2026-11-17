# File generated from our OpenAPI spec
defmodule Stripe.Resources.V2.MoneyManagement.PayoutMethodsBankAccountSpec do
  @moduledoc """
  Payout Methods Bank Account Spec

  The PayoutMethodsBankAccountSpec object.
  """

  @typedoc """
  * `countries` - The list of specs by country.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `object` - String representing the object's type. Objects of the same type share the same value of the object field. Possible values: `v2.money_management.payout_methods_bank_account_spec`.
  """
  @type t :: %__MODULE__{}

  defstruct [:countries, :livemode, :object]

  @object_name "v2.money_management.payout_methods_bank_account_spec"
  def object_name, do: @object_name

  def __nested_fields__ do
    %{
      "countries" => %{
        fields: %{
          "fields" =>
            {:list,
             %{
               fields: %{
                 "currencies" => {:list, :scalar},
                 "local_name" => :scalar,
                 "local_name_human" => %{
                   fields: %{
                     "content" => :scalar,
                     "localization_key" => :scalar
                   }
                 },
                 "max_length" => :scalar,
                 "min_length" => :scalar,
                 "placeholder" => :scalar,
                 "stripe_name" => :scalar,
                 "validation_regex" => :scalar
               }
             }}
        }
      }
    }
  end
end
