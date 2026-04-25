# File generated from our OpenAPI spec
defmodule Stripe.Params.CustomerFundingInstructionsCreateFundingInstructionsParams do
  @moduledoc "Parameters for customer funding instructions create funding instructions."

  @typedoc """
  * `bank_transfer` - Additional parameters for `bank_transfer` funding types
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `expand` - Specifies which fields in the response should be expanded.
  * `funding_type` - The `funding_type` to get the instructions for. Possible values: `bank_transfer`.
  """
  @type t :: %__MODULE__{
          bank_transfer: bank_transfer(),
          currency: String.t(),
          expand: [String.t()] | nil,
          funding_type: String.t()
        }

  defstruct [:bank_transfer, :currency, :expand, :funding_type]

  @typedoc """
  * `eu_bank_transfer` - Configuration for eu_bank_transfer funding type.
  * `requested_address_types` - List of address types that should be returned in the financial_addresses response. If not specified, all valid types will be returned.

  Permitted values include: `sort_code`, `zengin`, `iban`, or `spei`.
  * `type` - The type of the `bank_transfer` Possible values: `eu_bank_transfer`, `gb_bank_transfer`, `jp_bank_transfer`, `mx_bank_transfer`, `us_bank_transfer`.
  """
  @type bank_transfer :: %{
          optional(:eu_bank_transfer) => bank_transfer_eu_bank_transfer() | nil,
          optional(:requested_address_types) => [String.t()] | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `country` - The desired country code of the bank account information. Permitted values include: `BE`, `DE`, `ES`, `FR`, `IE`, or `NL`. Max length: 5000.
  """
  @type bank_transfer_eu_bank_transfer :: %{
          optional(:country) => String.t() | nil,
          optional(String.t()) => term()
        }
end
