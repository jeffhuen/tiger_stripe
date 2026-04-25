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
  @type t :: %__MODULE__{
          object: String.t(),
          payments: payments()
        }

  defstruct [:object, :payments]

  @object_name "balance_settings"
  def object_name, do: @object_name

  def expandable_fields, do: ["payments"]

  @typedoc """
  * `debit_negative_balances` - A Boolean indicating if Stripe should try to reclaim negative balances from an attached bank account. See [Understanding Connect account balances](https://stripe.com/connect/account-balances) for details. The default value is `false` when [controller.requirement_collection](https://docs.stripe.com/api/accounts/object#account_object-controller-requirement_collection) is `application`, which includes Custom accounts, otherwise `true`. Nullable.
  * `payouts` - Settings specific to the account's payouts. Nullable.
  * `settlement_timing`
  """
  @type payments :: %{
          optional(:debit_negative_balances) => boolean() | nil,
          optional(:payouts) => payments_payouts() | nil,
          optional(:settlement_timing) => payments_settlement_timing() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `minimum_balance_by_currency` - The minimum balance amount to retain per currency after automatic payouts. Only funds that exceed these amounts are paid out. Learn more about the [minimum balances for automatic payouts](https://stripe.com/payouts/minimum-balances-for-automatic-payouts). Nullable.
  * `schedule` - Details on when funds from charges are available, and when they are paid out to an external account. See our [Setting Bank and Debit Card Payouts](https://docs.stripe.com/connect/bank-transfers#payout-information) documentation for details. Nullable.
  * `statement_descriptor` - The text that appears on the bank account statement for payouts. If not set, this defaults to the platform's bank descriptor as set in the Dashboard. Max length: 5000. Nullable.
  * `status` - Whether the funds in this account can be paid out. Possible values: `disabled`, `enabled`.
  """
  @type payments_payouts :: %{
          optional(:minimum_balance_by_currency) => %{String.t() => integer()} | nil,
          optional(:schedule) => payments_payouts_schedule() | nil,
          optional(:statement_descriptor) => String.t() | nil,
          optional(:status) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `interval` - How frequently funds will be paid out. One of `manual` (payouts only created via API call), `daily`, `weekly`, or `monthly`. Possible values: `daily`, `manual`, `monthly`, `weekly`. Nullable.
  * `monthly_payout_days` - The day of the month funds will be paid out. Only shown if `interval` is monthly. Payouts scheduled between the 29th and 31st of the month are sent on the last day of shorter months.
  * `weekly_payout_days` - The days of the week when available funds are paid out, specified as an array, for example, [`monday`, `tuesday`]. Only shown if `interval` is weekly.
  """
  @type payments_payouts_schedule :: %{
          optional(:interval) => String.t() | nil,
          optional(:monthly_payout_days) => [integer()] | nil,
          optional(:weekly_payout_days) => [String.t()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `delay_days` - The number of days charge funds are held before becoming available.
  * `delay_days_override` - The number of days charge funds are held before becoming available. If present, overrides the default, or minimum available, for the account.
  """
  @type payments_settlement_timing :: %{
          optional(:delay_days) => integer() | nil,
          optional(:delay_days_override) => integer() | nil,
          optional(String.t()) => term()
        }

  def __nested_fields__ do
    %{
      "payments" => %{
        fields: %{
          "debit_negative_balances" => :scalar,
          "payouts" => %{
            fields: %{
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
              "delay_days_override" => :scalar
            }
          }
        }
      }
    }
  end
end
