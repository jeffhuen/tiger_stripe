# File generated from our OpenAPI spec
defmodule Stripe.Resources.BalanceTransaction do
  @moduledoc """
  BalanceTransaction

  Balance transactions represent funds moving through your Stripe account.
  Stripe creates them for every type of transaction that enters or leaves your Stripe account balance.

  Related guide: [Balance transaction types](https://docs.stripe.com/reports/balance-transaction-types)
  """

  @typedoc """
  * `amount` - Gross amount of this transaction (in cents (or local equivalent)). A positive value represents funds charged to another party, and a negative value represents funds sent to another party.
  * `available_on` - The date that the transaction's net funds become available in the Stripe balance. Format: Unix timestamp.
  * `balance_type` - The balance that this transaction impacts. Possible values: `issuing`, `payments`, `refund_and_dispute_prefunding`, `risk_reserved`.
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `description` - An arbitrary string attached to the object. Often useful for displaying to users. Max length: 5000. Nullable.
  * `exchange_rate` - If applicable, this transaction uses an exchange rate. If money converts from currency A to currency B, then the `amount` in currency A, multipled by the `exchange_rate`, equals the `amount` in currency B. For example, if you charge a customer 10.00 EUR, the PaymentIntent's `amount` is `1000` and `currency` is `eur`. If this converts to 12.34 USD in your Stripe account, the BalanceTransaction's `amount` is `1234`, its `currency` is `usd`, and the `exchange_rate` is `1.234`. Nullable.
  * `fee` - Fees (in cents (or local equivalent)) paid for this transaction. Represented as a positive integer when assessed.
  * `fee_details` - Detailed breakdown of fees (in cents (or local equivalent)) paid for this transaction. Expandable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `net` - Net impact to a Stripe balance (in cents (or local equivalent)). A positive value represents incrementing a Stripe balance, and a negative value decrementing a Stripe balance. You can calculate the net impact of a transaction on a balance by `amount` - `fee`
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `balance_transaction`.
  * `reporting_category` - Learn more about how [reporting categories](https://stripe.com/docs/reports/reporting-categories) can help you understand balance transactions from an accounting perspective. Max length: 5000.
  * `source` - This transaction relates to the Stripe object. Nullable. Expandable.
  * `status` - The transaction's net funds status in the Stripe balance, which are either `available` or `pending`. Max length: 5000.
  * `type` - Transaction type: `adjustment`, `advance`, `advance_funding`, `anticipation_repayment`, `application_fee`, `application_fee_refund`, `charge`, `climate_order_purchase`, `climate_order_refund`, `connect_collection_transfer`, `contribution`, `issuing_authorization_hold`, `issuing_authorization_release`, `issuing_dispute`, `issuing_transaction`, `obligation_outbound`, `obligation_reversal_inbound`, `payment`, `payment_failure_refund`, `payment_network_reserve_hold`, `payment_network_reserve_release`, `payment_refund`, `payment_reversal`, `payment_unreconciled`, `payout`, `payout_cancel`, `payout_failure`, `payout_minimum_balance_hold`, `payout_minimum_balance_release`, `refund`, `refund_failure`, `reserve_transaction`, `reserved_funds`, `reserve_hold`, `reserve_release`, `stripe_fee`, `stripe_fx_fee`, `stripe_balance_payment_debit`, `stripe_balance_payment_debit_reversal`, `tax_fee`, `topup`, `topup_reversal`, `transfer`, `transfer_cancel`, `transfer_failure`, or `transfer_refund`. Learn more about [balance transaction types and what they represent](https://stripe.com/docs/reports/balance-transaction-types). To classify transactions for accounting purposes, consider `reporting_category` instead. Possible values: `adjustment`, `advance`, `advance_funding`, `anticipation_repayment`, `application_fee`, `application_fee_refund`, `charge`, `climate_order_purchase`, `climate_order_refund`, `connect_collection_transfer`, `contribution`, `issuing_authorization_hold`, `issuing_authorization_release`, `issuing_dispute`, `issuing_transaction`, `obligation_outbound`, `obligation_reversal_inbound`, `payment`, `payment_failure_refund`, `payment_network_reserve_hold`, `payment_network_reserve_release`, `payment_refund`, `payment_reversal`, `payment_unreconciled`, `payout`, `payout_cancel`, `payout_failure`, `payout_minimum_balance_hold`, `payout_minimum_balance_release`, `refund`, `refund_failure`, `reserve_hold`, `reserve_release`, `reserve_transaction`, `reserved_funds`, `stripe_balance_payment_debit`, `stripe_balance_payment_debit_reversal`, `stripe_fee`, `stripe_fx_fee`, `tax_fee`, `topup`, `topup_reversal`, `transfer`, `transfer_cancel`, `transfer_failure`, `transfer_refund`.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :amount,
    :available_on,
    :balance_type,
    :created,
    :currency,
    :description,
    :exchange_rate,
    :fee,
    :fee_details,
    :id,
    :net,
    :object,
    :reporting_category,
    :source,
    :status,
    :type
  ]

  @object_name "balance_transaction"
  def object_name, do: @object_name

  def expandable_fields, do: ["fee_details", "source"]

  def __nested_fields__ do
    %{
      "fee_details" => %{
        fields: %{
          "amount" => :scalar,
          "application" => :scalar,
          "currency" => :scalar,
          "description" => :scalar,
          "type" => :scalar
        }
      }
    }
  end
end
