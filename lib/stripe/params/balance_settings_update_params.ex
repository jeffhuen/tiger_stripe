# File generated from our OpenAPI spec
defmodule Stripe.Params.BalanceSettingsUpdateParams do
  @moduledoc "Parameters for balance settings update."

  @typedoc """
  * `expand` - Specifies which fields in the response should be expanded.
  * `payments` - Settings that apply to the [Payments Balance](https://docs.stripe.com/api/balance).
  """
  @type t :: %__MODULE__{
          expand: [String.t()] | nil,
          payments: __MODULE__.Payments.t() | nil
        }

  defstruct [:expand, :payments]

  defmodule Payments do
    @moduledoc "Nested parameters."

    @typedoc """
    * `debit_negative_balances` - A Boolean indicating whether Stripe should try to reclaim negative balances from an attached bank account. For details, see [Understanding Connect Account Balances](https://stripe.com/connect/account-balances).
    * `payouts` - Settings specific to the account's payouts.
    * `settlement_timing` - Settings related to the account's balance settlement timing.
    """
    @type t :: %__MODULE__{
            debit_negative_balances: boolean() | nil,
            payouts: __MODULE__.Payouts.t() | nil,
            settlement_timing: __MODULE__.SettlementTiming.t() | nil
          }
    defstruct [:debit_negative_balances, :payouts, :settlement_timing]

    defmodule Payouts do
      @moduledoc "Nested parameters."

      @typedoc """
      * `minimum_balance_by_currency` - The minimum balance amount to retain per currency after automatic payouts. Only funds that exceed these amounts are paid out. Learn more about the [minimum balances for automatic payouts](https://stripe.com/payouts/minimum-balances-for-automatic-payouts).
      * `schedule` - Details on when funds from charges are available, and when they are paid out to an external account. For details, see our [Setting Bank and Debit Card Payouts](https://stripe.com/connect/bank-transfers#payout-information) documentation.
      * `statement_descriptor` - The text that appears on the bank account statement for payouts. If not set, this defaults to the platform's bank descriptor as set in the Dashboard. Max length: 22.
      """
      @type t :: %__MODULE__{
              minimum_balance_by_currency: map() | nil,
              schedule: __MODULE__.Schedule.t() | nil,
              statement_descriptor: String.t() | nil
            }
      defstruct [:minimum_balance_by_currency, :schedule, :statement_descriptor]

      defmodule Schedule do
        @moduledoc "Nested parameters."

        @typedoc """
        * `interval` - How frequently available funds are paid out. One of: `daily`, `manual`, `weekly`, or `monthly`. Default is `daily`. Possible values: `daily`, `manual`, `monthly`, `weekly`.
        * `monthly_payout_days` - The days of the month when available funds are paid out, specified as an array of numbers between 1--31. Payouts nominally scheduled between the 29th and 31st of the month are instead sent on the last day of a shorter month. Required and applicable only if `interval` is `monthly`.
        * `weekly_payout_days` - The days of the week when available funds are paid out, specified as an array, e.g., [`monday`, `tuesday`]. Required and applicable only if `interval` is `weekly`.
        """
        @type t :: %__MODULE__{
                interval: String.t() | nil,
                monthly_payout_days: [integer()] | nil,
                weekly_payout_days: [String.t()] | nil
              }
        defstruct [:interval, :monthly_payout_days, :weekly_payout_days]
      end
    end

    defmodule SettlementTiming do
      @moduledoc "Nested parameters."

      @typedoc """
      * `delay_days_override` - Change `delay_days` for this account, which determines the number of days charge funds are held before becoming available. The maximum value is 31. Passing an empty string to `delay_days_override` will return `delay_days` to the default, which is the lowest available value for the account. [Learn more about controlling delay days](https://stripe.com/connect/manage-payout-schedule).
      """
      @type t :: %__MODULE__{
              delay_days_override: map() | nil
            }
      defstruct [:delay_days_override]
    end
  end
end
