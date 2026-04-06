# File generated from our OpenAPI spec
defmodule Stripe.Resources.SourceTransaction do
  @moduledoc """
  SourceTransaction

  Some payment methods have no required amount that a customer must send.
  Customers can be instructed to send any amount, and it can be made up of
  multiple transactions. As such, sources can have multiple associated
  transactions.
  """

  @typedoc """
  * `ach_credit_transfer` - Expandable.
  * `amount` - A positive integer in the smallest currency unit (that is, 100 cents for $1.00, or 1 for ¥1, Japanese Yen being a zero-decimal currency) representing the amount your customer has pushed to the receiver.
  * `chf_credit_transfer` - Expandable.
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `gbp_credit_transfer` - Expandable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `source_transaction`.
  * `paper_check` - Expandable.
  * `sepa_credit_transfer` - Expandable.
  * `source` - The ID of the source this transaction is attached to. Max length: 5000.
  * `status` - The status of the transaction, one of `succeeded`, `pending`, or `failed`. Max length: 5000.
  * `type` - The type of source this transaction is attached to. Possible values: `ach_credit_transfer`, `ach_debit`, `alipay`, `bancontact`, `card`, `card_present`, `eps`, `giropay`, `ideal`, `klarna`, `multibanco`, `p24`, `sepa_debit`, `sofort`, `three_d_secure`, `wechat`.
  """
  @type t :: %__MODULE__{
          ach_credit_transfer: __MODULE__.AchCreditTransfer.t() | nil,
          amount: integer(),
          chf_credit_transfer: __MODULE__.ChfCreditTransfer.t() | nil,
          created: integer(),
          currency: String.t(),
          gbp_credit_transfer: __MODULE__.GbpCreditTransfer.t() | nil,
          id: String.t(),
          livemode: boolean(),
          object: String.t(),
          paper_check: __MODULE__.PaperCheck.t() | nil,
          sepa_credit_transfer: __MODULE__.SepaCreditTransfer.t() | nil,
          source: String.t(),
          status: String.t(),
          type: String.t()
        }

  defstruct [
    :ach_credit_transfer,
    :amount,
    :chf_credit_transfer,
    :created,
    :currency,
    :gbp_credit_transfer,
    :id,
    :livemode,
    :object,
    :paper_check,
    :sepa_credit_transfer,
    :source,
    :status,
    :type
  ]

  @object_name "source_transaction"
  def object_name, do: @object_name

  def expandable_fields,
    do: [
      "ach_credit_transfer",
      "chf_credit_transfer",
      "gbp_credit_transfer",
      "paper_check",
      "sepa_credit_transfer"
    ]

  defmodule AchCreditTransfer do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `customer_data` - Customer data associated with the transfer. Max length: 5000.
    * `fingerprint` - Bank account fingerprint associated with the transfer. Max length: 5000.
    * `last4` - Last 4 digits of the account number associated with the transfer. Max length: 5000.
    * `routing_number` - Routing number associated with the transfer. Max length: 5000.
    """
    @type t :: %__MODULE__{
            customer_data: String.t() | nil,
            fingerprint: String.t() | nil,
            last4: String.t() | nil,
            routing_number: String.t() | nil
          }
    defstruct [:customer_data, :fingerprint, :last4, :routing_number]
  end

  defmodule ChfCreditTransfer do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `reference` - Reference associated with the transfer. Max length: 5000.
    * `sender_address_country` - Sender's country address. Max length: 5000.
    * `sender_address_line1` - Sender's line 1 address. Max length: 5000.
    * `sender_iban` - Sender's bank account IBAN. Max length: 5000.
    * `sender_name` - Sender's name. Max length: 5000.
    """
    @type t :: %__MODULE__{
            reference: String.t() | nil,
            sender_address_country: String.t() | nil,
            sender_address_line1: String.t() | nil,
            sender_iban: String.t() | nil,
            sender_name: String.t() | nil
          }
    defstruct [
      :reference,
      :sender_address_country,
      :sender_address_line1,
      :sender_iban,
      :sender_name
    ]
  end

  defmodule GbpCreditTransfer do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `fingerprint` - Bank account fingerprint associated with the Stripe owned bank account receiving the transfer. Max length: 5000.
    * `funding_method` - The credit transfer rails the sender used to push this transfer. The possible rails are: Faster Payments, BACS, CHAPS, and wire transfers. Currently only Faster Payments is supported. Max length: 5000.
    * `last4` - Last 4 digits of sender account number associated with the transfer. Max length: 5000.
    * `reference` - Sender entered arbitrary information about the transfer. Max length: 5000.
    * `sender_account_number` - Sender account number associated with the transfer. Max length: 5000.
    * `sender_name` - Sender name associated with the transfer. Max length: 5000.
    * `sender_sort_code` - Sender sort code associated with the transfer. Max length: 5000.
    """
    @type t :: %__MODULE__{
            fingerprint: String.t() | nil,
            funding_method: String.t() | nil,
            last4: String.t() | nil,
            reference: String.t() | nil,
            sender_account_number: String.t() | nil,
            sender_name: String.t() | nil,
            sender_sort_code: String.t() | nil
          }
    defstruct [
      :fingerprint,
      :funding_method,
      :last4,
      :reference,
      :sender_account_number,
      :sender_name,
      :sender_sort_code
    ]
  end

  defmodule PaperCheck do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `available_at` - Time at which the deposited funds will be available for use. Measured in seconds since the Unix epoch. Max length: 5000.
    * `invoices` - Comma-separated list of invoice IDs associated with the paper check. Max length: 5000.
    """
    @type t :: %__MODULE__{
            available_at: String.t() | nil,
            invoices: String.t() | nil
          }
    defstruct [:available_at, :invoices]
  end

  defmodule SepaCreditTransfer do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `reference` - Reference associated with the transfer. Max length: 5000.
    * `sender_iban` - Sender's bank account IBAN. Max length: 5000.
    * `sender_name` - Sender's name. Max length: 5000.
    """
    @type t :: %__MODULE__{
            reference: String.t() | nil,
            sender_iban: String.t() | nil,
            sender_name: String.t() | nil
          }
    defstruct [:reference, :sender_iban, :sender_name]
  end

  def __inner_types__ do
    %{
      "ach_credit_transfer" => __MODULE__.AchCreditTransfer,
      "chf_credit_transfer" => __MODULE__.ChfCreditTransfer,
      "gbp_credit_transfer" => __MODULE__.GbpCreditTransfer,
      "paper_check" => __MODULE__.PaperCheck,
      "sepa_credit_transfer" => __MODULE__.SepaCreditTransfer
    }
  end
end
