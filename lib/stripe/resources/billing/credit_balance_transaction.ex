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
          credit: __MODULE__.Credit.t(),
          credit_grant: String.t() | Stripe.Resources.Billing.CreditGrant.t(),
          debit: __MODULE__.Debit.t(),
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

  defmodule Credit do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `amount`
    * `credits_application_invoice_voided` - Details of the invoice to which the reinstated credits were originally applied. Only present if `type` is `credits_application_invoice_voided`. Nullable.
    * `type` - The type of credit transaction. Possible values: `credits_application_invoice_voided`, `credits_granted`.
    """
    @type t :: %__MODULE__{
            amount: __MODULE__.Amount.t() | nil,
            credits_application_invoice_voided:
              __MODULE__.CreditsApplicationInvoiceVoided.t() | nil,
            type: String.t() | nil
          }
    defstruct [:amount, :credits_application_invoice_voided, :type]

    defmodule Amount do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `monetary` - The monetary amount. Nullable.
      * `type` - The type of this amount. We currently only support `monetary` billing credits. Possible values: `monetary`.
      """
      @type t :: %__MODULE__{
              monetary: __MODULE__.Monetary.t() | nil,
              type: String.t() | nil
            }
      defstruct [:monetary, :type]

      defmodule Monetary do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Max length: 5000.
        * `value` - A positive integer representing the amount.
        """
        @type t :: %__MODULE__{
                currency: String.t() | nil,
                value: integer() | nil
              }
        defstruct [:currency, :value]
      end

      def __inner_types__ do
        %{
          "monetary" => __MODULE__.Monetary
        }
      end
    end

    defmodule CreditsApplicationInvoiceVoided do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `invoice` - The invoice to which the reinstated billing credits were originally applied.
      * `invoice_line_item` - The invoice line item to which the reinstated billing credits were originally applied. Max length: 5000.
      """
      @type t :: %__MODULE__{
              invoice: String.t() | Stripe.Resources.Invoice.t() | nil,
              invoice_line_item: String.t() | nil
            }
      defstruct [:invoice, :invoice_line_item]
    end

    def __inner_types__ do
      %{
        "amount" => __MODULE__.Amount,
        "credits_application_invoice_voided" => __MODULE__.CreditsApplicationInvoiceVoided
      }
    end
  end

  defmodule Debit do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `amount`
    * `credits_applied` - Details of how the billing credits were applied to an invoice. Only present if `type` is `credits_applied`. Nullable.
    * `type` - The type of debit transaction. Possible values: `credits_applied`, `credits_expired`, `credits_voided`.
    """
    @type t :: %__MODULE__{
            amount: __MODULE__.Amount.t() | nil,
            credits_applied: __MODULE__.CreditsApplied.t() | nil,
            type: String.t() | nil
          }
    defstruct [:amount, :credits_applied, :type]

    defmodule Amount do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `monetary` - The monetary amount. Nullable.
      * `type` - The type of this amount. We currently only support `monetary` billing credits. Possible values: `monetary`.
      """
      @type t :: %__MODULE__{
              monetary: __MODULE__.Monetary.t() | nil,
              type: String.t() | nil
            }
      defstruct [:monetary, :type]

      defmodule Monetary do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Max length: 5000.
        * `value` - A positive integer representing the amount.
        """
        @type t :: %__MODULE__{
                currency: String.t() | nil,
                value: integer() | nil
              }
        defstruct [:currency, :value]
      end

      def __inner_types__ do
        %{
          "monetary" => __MODULE__.Monetary
        }
      end
    end

    defmodule CreditsApplied do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `invoice` - The invoice to which the billing credits were applied.
      * `invoice_line_item` - The invoice line item to which the billing credits were applied. Max length: 5000.
      """
      @type t :: %__MODULE__{
              invoice: String.t() | Stripe.Resources.Invoice.t() | nil,
              invoice_line_item: String.t() | nil
            }
      defstruct [:invoice, :invoice_line_item]
    end

    def __inner_types__ do
      %{
        "amount" => __MODULE__.Amount,
        "credits_applied" => __MODULE__.CreditsApplied
      }
    end
  end

  def __inner_types__ do
    %{
      "credit" => __MODULE__.Credit,
      "debit" => __MODULE__.Debit
    }
  end
end
