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
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `source_transaction`.
  * `paper_check` - Expandable.
  * `sepa_credit_transfer` - Expandable.
  * `source` - The ID of the source this transaction is attached to. Max length: 5000.
  * `status` - The status of the transaction, one of `succeeded`, `pending`, or `failed`. Max length: 5000.
  * `type` - The type of source this transaction is attached to. Possible values: `ach_credit_transfer`, `ach_debit`, `alipay`, `bancontact`, `card`, `card_present`, `eps`, `giropay`, `ideal`, `klarna`, `multibanco`, `p24`, `sepa_debit`, `sofort`, `three_d_secure`, `wechat`.
  """
  @type t :: %__MODULE__{}

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

  def __nested_fields__ do
    %{
      "ach_credit_transfer" => %{
        fields: %{
          "customer_data" => :scalar,
          "fingerprint" => :scalar,
          "last4" => :scalar,
          "routing_number" => :scalar
        }
      },
      "chf_credit_transfer" => %{
        fields: %{
          "reference" => :scalar,
          "sender_address_country" => :scalar,
          "sender_address_line1" => :scalar,
          "sender_iban" => :scalar,
          "sender_name" => :scalar
        }
      },
      "gbp_credit_transfer" => %{
        fields: %{
          "fingerprint" => :scalar,
          "funding_method" => :scalar,
          "last4" => :scalar,
          "reference" => :scalar,
          "sender_account_number" => :scalar,
          "sender_name" => :scalar,
          "sender_sort_code" => :scalar
        }
      },
      "paper_check" => %{
        fields: %{
          "available_at" => :scalar,
          "invoices" => :scalar
        }
      },
      "sepa_credit_transfer" => %{
        fields: %{
          "reference" => :scalar,
          "sender_iban" => :scalar,
          "sender_name" => :scalar
        }
      }
    }
  end
end
