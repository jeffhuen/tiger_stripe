# File generated from our OpenAPI spec
defmodule Stripe.Resources.NextActionDisplayBankTransferInstructions do
  @moduledoc """
  PaymentIntentNextActionDisplayBankTransferInstructions
  """

  @typedoc """
  * `amount_remaining` - The remaining amount that needs to be transferred to complete the payment. Nullable.
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code. Nullable.
  * `financial_addresses` - A list of financial addresses that can be used to fund the customer balance Expandable.
  * `hosted_instructions_url` - A link to a hosted page that guides your customer through completing the transfer. Max length: 5000. Nullable.
  * `reference` - A string identifying this payment. Instruct your customer to include this code in the reference or memo field of their bank transfer. Max length: 5000. Nullable.
  * `type` - Type of bank transfer Possible values: `eu_bank_transfer`, `gb_bank_transfer`, `jp_bank_transfer`, `mx_bank_transfer`, `us_bank_transfer`.
  """
  @type t :: %__MODULE__{
          amount_remaining: integer(),
          currency: String.t(),
          financial_addresses: [financial_addresses()] | nil,
          hosted_instructions_url: String.t(),
          reference: String.t(),
          type: String.t()
        }

  defstruct [
    :amount_remaining,
    :currency,
    :financial_addresses,
    :hosted_instructions_url,
    :reference,
    :type
  ]

  @object_name "payment_intent_next_action_display_bank_transfer_instructions"
  def object_name, do: @object_name

  def expandable_fields, do: ["financial_addresses"]

  @typedoc """
  * `aba`
  * `iban`
  * `sort_code`
  * `spei`
  * `supported_networks` - The payment networks supported by this FinancialAddress
  * `swift`
  * `type` - The type of financial address Possible values: `aba`, `iban`, `sort_code`, `spei`, `swift`, `zengin`.
  * `zengin`
  """
  @type financial_addresses :: %{
          optional(:aba) => Stripe.Resources.Aba.t() | nil,
          optional(:iban) => financial_addresses_iban() | nil,
          optional(:sort_code) => Stripe.Resources.SortCodeRecords.t() | nil,
          optional(:spei) => financial_addresses_spei() | nil,
          optional(:supported_networks) => [String.t()] | nil,
          optional(:swift) => financial_addresses_swift() | nil,
          optional(:type) => String.t() | nil,
          optional(:zengin) => financial_addresses_zengin() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `account_holder_address`
  * `account_holder_name` - The name of the person or business that owns the bank account Max length: 5000.
  * `bank_address`
  * `bic` - The BIC/SWIFT code of the account. Max length: 5000.
  * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)). Max length: 5000.
  * `iban` - The IBAN of the account. Max length: 5000.
  """
  @type financial_addresses_iban :: %{
          optional(:account_holder_address) => Stripe.Resources.Address.t() | nil,
          optional(:account_holder_name) => String.t() | nil,
          optional(:bank_address) => Stripe.Resources.Address.t() | nil,
          optional(:bic) => String.t() | nil,
          optional(:country) => String.t() | nil,
          optional(:iban) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `account_holder_address`
  * `account_holder_name` - The account holder name Max length: 5000.
  * `bank_address`
  * `bank_code` - The three-digit bank code Max length: 5000.
  * `bank_name` - The short banking institution name Max length: 5000.
  * `clabe` - The CLABE number Max length: 5000.
  """
  @type financial_addresses_spei :: %{
          optional(:account_holder_address) => Stripe.Resources.Address.t() | nil,
          optional(:account_holder_name) => String.t() | nil,
          optional(:bank_address) => Stripe.Resources.Address.t() | nil,
          optional(:bank_code) => String.t() | nil,
          optional(:bank_name) => String.t() | nil,
          optional(:clabe) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `account_holder_address`
  * `account_holder_name` - The account holder name Max length: 5000.
  * `account_number` - The account number Max length: 5000.
  * `account_type` - The account type Max length: 5000.
  * `bank_address`
  * `bank_name` - The bank name Max length: 5000.
  * `swift_code` - The SWIFT code Max length: 5000.
  """
  @type financial_addresses_swift :: %{
          optional(:account_holder_address) => Stripe.Resources.Address.t() | nil,
          optional(:account_holder_name) => String.t() | nil,
          optional(:account_number) => String.t() | nil,
          optional(:account_type) => String.t() | nil,
          optional(:bank_address) => Stripe.Resources.Address.t() | nil,
          optional(:bank_name) => String.t() | nil,
          optional(:swift_code) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `account_holder_address`
  * `account_holder_name` - The account holder name Max length: 5000. Nullable.
  * `account_number` - The account number Max length: 5000. Nullable.
  * `account_type` - The bank account type. In Japan, this can only be `futsu` or `toza`. Max length: 5000. Nullable.
  * `bank_address`
  * `bank_code` - The bank code of the account Max length: 5000. Nullable.
  * `bank_name` - The bank name of the account Max length: 5000. Nullable.
  * `branch_code` - The branch code of the account Max length: 5000. Nullable.
  * `branch_name` - The branch name of the account Max length: 5000. Nullable.
  """
  @type financial_addresses_zengin :: %{
          optional(:account_holder_address) => Stripe.Resources.Address.t() | nil,
          optional(:account_holder_name) => String.t() | nil,
          optional(:account_number) => String.t() | nil,
          optional(:account_type) => String.t() | nil,
          optional(:bank_address) => Stripe.Resources.Address.t() | nil,
          optional(:bank_code) => String.t() | nil,
          optional(:bank_name) => String.t() | nil,
          optional(:branch_code) => String.t() | nil,
          optional(:branch_name) => String.t() | nil,
          optional(String.t()) => term()
        }

  def __nested_fields__ do
    %{
      "financial_addresses" => %{
        fields: %{
          "aba" => {:resource, Stripe.Resources.Aba},
          "iban" => %{
            fields: %{
              "account_holder_address" => {:resource, Stripe.Resources.Address},
              "account_holder_name" => :scalar,
              "bank_address" => {:resource, Stripe.Resources.Address},
              "bic" => :scalar,
              "country" => :scalar,
              "iban" => :scalar
            }
          },
          "sort_code" => {:resource, Stripe.Resources.SortCodeRecords},
          "spei" => %{
            fields: %{
              "account_holder_address" => {:resource, Stripe.Resources.Address},
              "account_holder_name" => :scalar,
              "bank_address" => {:resource, Stripe.Resources.Address},
              "bank_code" => :scalar,
              "bank_name" => :scalar,
              "clabe" => :scalar
            }
          },
          "supported_networks" => {:list, :scalar},
          "swift" => %{
            fields: %{
              "account_holder_address" => {:resource, Stripe.Resources.Address},
              "account_holder_name" => :scalar,
              "account_number" => :scalar,
              "account_type" => :scalar,
              "bank_address" => {:resource, Stripe.Resources.Address},
              "bank_name" => :scalar,
              "swift_code" => :scalar
            }
          },
          "type" => :scalar,
          "zengin" => %{
            fields: %{
              "account_holder_address" => {:resource, Stripe.Resources.Address},
              "account_holder_name" => :scalar,
              "account_number" => :scalar,
              "account_type" => :scalar,
              "bank_address" => {:resource, Stripe.Resources.Address},
              "bank_code" => :scalar,
              "bank_name" => :scalar,
              "branch_code" => :scalar,
              "branch_name" => :scalar
            }
          }
        }
      }
    }
  end
end
