# File generated from our OpenAPI spec
defmodule Stripe.Resources.Billing.CreditBalanceTransaction do
  @moduledoc """
  CreditBalanceTransaction

  A credit balance transaction is a resource representing a transaction (either a credit or a debit) against an existing credit grant.
  """

  @typedoc """
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `credit` - Credit details for this credit balance transaction. Only present if type is `credit`. Nullable. Expandable.
  * `credit_grant` - The credit grant associated with this credit balance transaction. Expandable.
  * `debit` - Debit details for this credit balance transaction. Only present if type is `debit`. Nullable. Expandable.
  * `effective_at` - The effective time of this credit balance transaction. Format: Unix timestamp.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `billing.credit_balance_transaction`.
  * `test_clock` - ID of the test clock this credit balance transaction belongs to. Nullable. Expandable.
  * `type` - The type of credit balance transaction (credit or debit). Possible values: `credit`, `debit`. Nullable.
  """
  @type t :: %__MODULE__{
          created: integer(),
          credit: credit(),
          credit_grant: String.t() | Stripe.Resources.Billing.CreditGrant.t(),
          debit: debit(),
          effective_at: integer(),
          id: String.t(),
          livemode: boolean(),
          object: String.t(),
          test_clock: String.t() | Stripe.Resources.TestHelpers.TestClock.t(),
          type: String.t()
        }

  defstruct [
    :created,
    :credit,
    :credit_grant,
    :debit,
    :effective_at,
    :id,
    :livemode,
    :object,
    :test_clock,
    :type
  ]

  @object_name "billing.credit_balance_transaction"
  def object_name, do: @object_name

  def expandable_fields, do: ["credit", "credit_grant", "debit", "test_clock"]

  @typedoc """
  * `amount`
  * `credits_application_invoice_voided` - Details of the invoice to which the reinstated credits were originally applied. Only present if `type` is `credits_application_invoice_voided`. Nullable.
  * `type` - The type of credit transaction. Possible values: `credits_application_invoice_voided`, `credits_granted`.
  """
  @type credit :: %{
          optional(:amount) => credit_amount() | nil,
          optional(:credits_application_invoice_voided) =>
            credit_credits_application_invoice_voided() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `monetary` - The monetary amount. Nullable.
  * `type` - The type of this amount. We currently only support `monetary` billing credits. Possible values: `monetary`.
  """
  @type credit_amount :: %{
          optional(:monetary) => credit_amount_monetary() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Max length: 5000.
  * `value` - A positive integer representing the amount.
  """
  @type credit_amount_monetary :: %{
          optional(:currency) => String.t() | nil,
          optional(:value) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `invoice` - The invoice to which the reinstated billing credits were originally applied.
  * `invoice_line_item` - The invoice line item to which the reinstated billing credits were originally applied. Max length: 5000.
  """
  @type credit_credits_application_invoice_voided :: %{
          optional(:invoice) => String.t() | Stripe.Resources.Invoice.t() | nil,
          optional(:invoice_line_item) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `amount`
  * `credits_applied` - Details of how the billing credits were applied to an invoice. Only present if `type` is `credits_applied`. Nullable.
  * `type` - The type of debit transaction. Possible values: `credits_applied`, `credits_expired`, `credits_voided`.
  """
  @type debit :: %{
          optional(:amount) => debit_amount() | nil,
          optional(:credits_applied) => debit_credits_applied() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `monetary` - The monetary amount. Nullable.
  * `type` - The type of this amount. We currently only support `monetary` billing credits. Possible values: `monetary`.
  """
  @type debit_amount :: %{
          optional(:monetary) => debit_amount_monetary() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Max length: 5000.
  * `value` - A positive integer representing the amount.
  """
  @type debit_amount_monetary :: %{
          optional(:currency) => String.t() | nil,
          optional(:value) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `invoice` - The invoice to which the billing credits were applied.
  * `invoice_line_item` - The invoice line item to which the billing credits were applied. Max length: 5000.
  """
  @type debit_credits_applied :: %{
          optional(:invoice) => String.t() | Stripe.Resources.Invoice.t() | nil,
          optional(:invoice_line_item) => String.t() | nil,
          optional(String.t()) => term()
        }

  def __nested_fields__ do
    %{
      "credit" => %{
        fields: %{
          "amount" => %{
            fields: %{
              "monetary" => %{
                fields: %{
                  "currency" => :scalar,
                  "value" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "credits_application_invoice_voided" => %{
            fields: %{
              "invoice" => {:resource, Stripe.Resources.Invoice},
              "invoice_line_item" => :scalar
            }
          },
          "type" => :scalar
        }
      },
      "debit" => %{
        fields: %{
          "amount" => %{
            fields: %{
              "monetary" => %{
                fields: %{
                  "currency" => :scalar,
                  "value" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "credits_applied" => %{
            fields: %{
              "invoice" => {:resource, Stripe.Resources.Invoice},
              "invoice_line_item" => :scalar
            }
          },
          "type" => :scalar
        }
      }
    }
  end
end
