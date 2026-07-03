# File generated from our OpenAPI spec
defmodule Stripe.Resources.BalanceSettings do
  @moduledoc """
  BalanceSettingsResourceBalanceSettings

  Options for customizing account balances and payout settings for a Stripe platform’s connected accounts.
  """

  @typedoc """
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `balance_settings`.
  * `payments` - Expandable.
  """
  @type t :: %__MODULE__{}

  defstruct [:object, :payments]

  @object_name "balance_settings"
  def object_name, do: @object_name

  def expandable_fields, do: ["payments"]

  def __nested_fields__ do
    %{
      "payments" => %{
        fields: %{
          "debit_negative_balances" => :scalar,
          "payouts" => %{
            fields: %{
              "automatic_transfer_rules_by_currency" =>
                {:map,
                 {:list,
                  %{
                    fields: %{
                      "payout_method" => :scalar,
                      "transfer_up_to_amount" => :scalar,
                      "type" => :scalar
                    }
                  }}},
              "minimum_balance_by_currency" => {:map, :scalar},
              "schedule" => %{
                fields: %{
                  "interval" => :scalar,
                  "monthly_payout_days" => {:list, :scalar},
                  "weekly_payout_days" => {:list, :scalar}
                }
              },
              "statement_descriptor" => :scalar,
              "status" => :scalar
            }
          },
          "settlement_timing" => %{
            fields: %{
              "delay_days" => :scalar,
              "delay_days_override" => :scalar,
              "start_of_day" => %{
                fields: %{
                  "hour" => :scalar,
                  "minutes" => :scalar,
                  "timezone" => :scalar
                }
              }
            }
          }
        }
      }
    }
  end
end
