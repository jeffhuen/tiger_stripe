# File generated from our OpenAPI spec
defmodule Stripe.Resources.CustomerCashBalanceTransaction do
  @moduledoc """
  CustomerCashBalanceTransaction

  Customers with certain payments enabled have a cash balance, representing funds that were paid
  by the customer to a merchant, but have not yet been allocated to a payment. Cash Balance Transactions
  represent when funds are moved into or out of this balance. This includes funding by the customer, allocation
  to payments, and refunds to the customer.
  """

  @typedoc """
  * `adjusted_for_overdraft` - Expandable.
  * `applied_to_payment` - Expandable.
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Max length: 5000.
  * `customer` - The customer whose available cash balance changed as a result of this transaction. Expandable.
  * `customer_account` - The ID of an Account representing a customer whose available cash balance changed as a result of this transaction. Max length: 5000. Nullable.
  * `ending_balance` - The total available cash balance for the specified currency after this transaction was applied. Represented in the [smallest currency unit](https://docs.stripe.com/currencies#zero-decimal).
  * `funded` - Expandable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `net_amount` - The amount by which the cash balance changed, represented in the [smallest currency unit](https://docs.stripe.com/currencies#zero-decimal). A positive value represents funds being added to the cash balance, a negative value represents funds being removed from the cash balance.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `customer_cash_balance_transaction`.
  * `refunded_from_payment` - Expandable.
  * `transferred_to_balance` - Expandable.
  * `type` - The type of the cash balance transaction. New types may be added in future. See [Customer Balance](https://docs.stripe.com/payments/customer-balance#types) to learn more about these types. Possible values: `adjusted_for_overdraft`, `applied_to_payment`, `funded`, `funding_reversed`, `refunded_from_payment`, `return_canceled`, `return_initiated`, `transferred_to_balance`, `unapplied_from_payment`.
  * `unapplied_from_payment` - Expandable.
  """
  @type t :: %__MODULE__{
          adjusted_for_overdraft: Stripe.Resources.AdjustedForOverdraft.t() | nil,
          applied_to_payment: __MODULE__.AppliedToPayment.t() | nil,
          created: integer(),
          currency: String.t(),
          customer: String.t() | Stripe.Resources.Customer.t(),
          customer_account: String.t(),
          ending_balance: integer(),
          funded: __MODULE__.Funded.t() | nil,
          id: String.t(),
          livemode: boolean(),
          net_amount: integer(),
          object: String.t(),
          refunded_from_payment: Stripe.Resources.RefundedFromPayment.t() | nil,
          transferred_to_balance: Stripe.Resources.TransferredToBalance.t() | nil,
          type: String.t(),
          unapplied_from_payment: Stripe.Resources.UnappliedFromPayment.t() | nil
        }

  defstruct [
    :adjusted_for_overdraft,
    :applied_to_payment,
    :created,
    :currency,
    :customer,
    :customer_account,
    :ending_balance,
    :funded,
    :id,
    :livemode,
    :net_amount,
    :object,
    :refunded_from_payment,
    :transferred_to_balance,
    :type,
    :unapplied_from_payment
  ]

  @object_name "customer_cash_balance_transaction"
  def object_name, do: @object_name

  def expandable_fields,
    do: [
      "adjusted_for_overdraft",
      "applied_to_payment",
      "customer",
      "funded",
      "refunded_from_payment",
      "transferred_to_balance",
      "unapplied_from_payment"
    ]

  defmodule AppliedToPayment do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `payment_intent` - The [Payment Intent](https://docs.stripe.com/api/payment_intents/object) that funds were applied to.
    """
    @type t :: %__MODULE__{
            payment_intent: String.t() | Stripe.Resources.PaymentIntent.t() | nil
          }
    defstruct [:payment_intent]
  end

  defmodule Funded do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `bank_transfer`
    """
    @type t :: %__MODULE__{
            bank_transfer: __MODULE__.BankTransfer.t() | nil
          }
    defstruct [:bank_transfer]

    defmodule BankTransfer do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `eu_bank_transfer`
      * `gb_bank_transfer`
      * `jp_bank_transfer`
      * `reference` - The user-supplied reference field on the bank transfer. Max length: 5000. Nullable.
      * `type` - The funding method type used to fund the customer balance. Permitted values include: `eu_bank_transfer`, `gb_bank_transfer`, `jp_bank_transfer`, `mx_bank_transfer`, or `us_bank_transfer`. Possible values: `eu_bank_transfer`, `gb_bank_transfer`, `jp_bank_transfer`, `mx_bank_transfer`, `us_bank_transfer`.
      * `us_bank_transfer`
      """
      @type t :: %__MODULE__{
              eu_bank_transfer: __MODULE__.EuBankTransfer.t() | nil,
              gb_bank_transfer: __MODULE__.GbBankTransfer.t() | nil,
              jp_bank_transfer: __MODULE__.JpBankTransfer.t() | nil,
              reference: String.t() | nil,
              type: String.t() | nil,
              us_bank_transfer: __MODULE__.UsBankTransfer.t() | nil
            }
      defstruct [
        :eu_bank_transfer,
        :gb_bank_transfer,
        :jp_bank_transfer,
        :reference,
        :type,
        :us_bank_transfer
      ]

      defmodule EuBankTransfer do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `bic` - The BIC of the bank of the sender of the funding. Max length: 5000. Nullable.
        * `iban_last4` - The last 4 digits of the IBAN of the sender of the funding. Max length: 5000. Nullable.
        * `sender_name` - The full name of the sender, as supplied by the sending bank. Max length: 5000. Nullable.
        """
        @type t :: %__MODULE__{
                bic: String.t() | nil,
                iban_last4: String.t() | nil,
                sender_name: String.t() | nil
              }
        defstruct [:bic, :iban_last4, :sender_name]
      end

      defmodule GbBankTransfer do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `account_number_last4` - The last 4 digits of the account number of the sender of the funding. Max length: 5000. Nullable.
        * `sender_name` - The full name of the sender, as supplied by the sending bank. Max length: 5000. Nullable.
        * `sort_code` - The sort code of the bank of the sender of the funding Max length: 5000. Nullable.
        """
        @type t :: %__MODULE__{
                account_number_last4: String.t() | nil,
                sender_name: String.t() | nil,
                sort_code: String.t() | nil
              }
        defstruct [:account_number_last4, :sender_name, :sort_code]
      end

      defmodule JpBankTransfer do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `sender_bank` - The name of the bank of the sender of the funding. Max length: 5000. Nullable.
        * `sender_branch` - The name of the bank branch of the sender of the funding. Max length: 5000. Nullable.
        * `sender_name` - The full name of the sender, as supplied by the sending bank. Max length: 5000. Nullable.
        """
        @type t :: %__MODULE__{
                sender_bank: String.t() | nil,
                sender_branch: String.t() | nil,
                sender_name: String.t() | nil
              }
        defstruct [:sender_bank, :sender_branch, :sender_name]
      end

      defmodule UsBankTransfer do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `network` - The banking network used for this funding. Possible values: `ach`, `domestic_wire_us`, `swift`.
        * `sender_name` - The full name of the sender, as supplied by the sending bank. Max length: 5000. Nullable.
        """
        @type t :: %__MODULE__{
                network: String.t() | nil,
                sender_name: String.t() | nil
              }
        defstruct [:network, :sender_name]
      end

      def __inner_types__ do
        %{
          "eu_bank_transfer" => __MODULE__.EuBankTransfer,
          "gb_bank_transfer" => __MODULE__.GbBankTransfer,
          "jp_bank_transfer" => __MODULE__.JpBankTransfer,
          "us_bank_transfer" => __MODULE__.UsBankTransfer
        }
      end
    end

    def __inner_types__ do
      %{
        "bank_transfer" => __MODULE__.BankTransfer
      }
    end
  end

  def __inner_types__ do
    %{
      "adjusted_for_overdraft" => Stripe.Resources.AdjustedForOverdraft,
      "applied_to_payment" => __MODULE__.AppliedToPayment,
      "funded" => __MODULE__.Funded,
      "refunded_from_payment" => Stripe.Resources.RefundedFromPayment,
      "transferred_to_balance" => Stripe.Resources.TransferredToBalance,
      "unapplied_from_payment" => Stripe.Resources.UnappliedFromPayment
    }
  end
end
