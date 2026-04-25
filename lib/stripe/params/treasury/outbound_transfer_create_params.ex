# File generated from our OpenAPI spec
defmodule Stripe.Params.Treasury.OutboundTransferCreateParams do
  @moduledoc "Parameters for outbound transfer create."

  @typedoc """
  * `amount` - Amount (in cents) to be transferred.
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `description` - An arbitrary string attached to the object. Often useful for displaying to users. Max length: 5000.
  * `destination_payment_method` - The PaymentMethod to use as the payment instrument for the OutboundTransfer. Max length: 5000.
  * `destination_payment_method_data` - Hash used to generate the PaymentMethod to be used for this OutboundTransfer. Exclusive with `destination_payment_method`.
  * `destination_payment_method_options` - Hash describing payment method configuration details.
  * `expand` - Specifies which fields in the response should be expanded.
  * `financial_account` - The FinancialAccount to pull funds from.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `statement_descriptor` - Statement descriptor to be shown on the receiving end of an OutboundTransfer. Maximum 10 characters for `ach` transfers or 140 characters for `us_domestic_wire` transfers. The default value is "transfer". Can only include -#.$&*, spaces, and alphanumeric characters. Max length: 5000.
  """
  @type t :: %__MODULE__{
          amount: integer(),
          currency: String.t(),
          description: String.t() | nil,
          destination_payment_method: String.t() | nil,
          destination_payment_method_data: destination_payment_method_data() | nil,
          destination_payment_method_options: destination_payment_method_options() | nil,
          expand: [String.t()] | nil,
          financial_account: String.t(),
          metadata: %{String.t() => String.t()} | nil,
          statement_descriptor: String.t() | nil
        }

  defstruct [
    :amount,
    :currency,
    :description,
    :destination_payment_method,
    :destination_payment_method_data,
    :destination_payment_method_options,
    :expand,
    :financial_account,
    :metadata,
    :statement_descriptor
  ]

  @typedoc """
  * `financial_account` - Required if type is set to `financial_account`. The FinancialAccount ID to send funds to.
  * `type` - The type of the destination. Possible values: `financial_account`.
  """
  @type destination_payment_method_data :: %{
          optional(:financial_account) => String.t() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `us_bank_account` - Optional fields for `us_bank_account`.
  """
  @type destination_payment_method_options :: %{
          optional(:us_bank_account) => map() | nil,
          optional(String.t()) => term()
        }
end
