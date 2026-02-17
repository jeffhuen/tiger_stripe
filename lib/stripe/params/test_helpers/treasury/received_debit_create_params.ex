# File generated from our OpenAPI spec
defmodule Stripe.Params.TestHelpers.Treasury.ReceivedDebitCreateParams do
  @moduledoc "Parameters for received debit create."

  @typedoc """
  * `amount` - Amount (in cents) to be transferred.
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `description` - An arbitrary string attached to the object. Often useful for displaying to users. Max length: 5000.
  * `expand` - Specifies which fields in the response should be expanded.
  * `financial_account` - The FinancialAccount to pull funds from.
  * `initiating_payment_method_details` - Initiating payment method details for the object.
  * `network` - Specifies the network rails to be used. If not set, will default to the PaymentMethod's preferred network. See the [docs](https://docs.stripe.com/treasury/money-movement/timelines) to learn more about money movement timelines for each network type. Possible values: `ach`.
  """
  @type t :: %__MODULE__{
          amount: integer(),
          currency: String.t(),
          description: String.t() | nil,
          expand: [String.t()] | nil,
          financial_account: String.t(),
          initiating_payment_method_details: __MODULE__.InitiatingPaymentMethodDetails.t() | nil,
          network: String.t()
        }

  defstruct [
    :amount,
    :currency,
    :description,
    :expand,
    :financial_account,
    :initiating_payment_method_details,
    :network
  ]

  defmodule InitiatingPaymentMethodDetails do
    @moduledoc "Nested parameters."

    @typedoc """
    * `type` - The source type. Possible values: `us_bank_account`.
    * `us_bank_account` - Optional fields for `us_bank_account`.
    """
    @type t :: %__MODULE__{
            type: String.t() | nil,
            us_bank_account: __MODULE__.UsBankAccount.t() | nil
          }
    defstruct [:type, :us_bank_account]

    defmodule UsBankAccount do
      @moduledoc "Nested parameters."

      @typedoc """
      * `account_holder_name` - The bank account holder's name. Max length: 5000.
      * `account_number` - The bank account number. Max length: 5000.
      * `routing_number` - The bank account's routing number. Max length: 5000.
      """
      @type t :: %__MODULE__{
              account_holder_name: String.t() | nil,
              account_number: String.t() | nil,
              routing_number: String.t() | nil
            }
      defstruct [:account_holder_name, :account_number, :routing_number]
    end
  end
end
