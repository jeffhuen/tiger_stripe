# File generated from our OpenAPI spec
defmodule Stripe.Resources.Balance do
  @moduledoc """
  Balance

  This is an object representing your Stripe balance. You can retrieve it to see
  the balance currently on your Stripe account.

  The top-level `available` and `pending` comprise your "payments balance."

  Related guide: [Balances and settlement time](https://docs.stripe.com/payments/balances), [Understanding Connect account balances](https://docs.stripe.com/connect/account-balances)
  """

  @typedoc """
  * `available` - Available funds that you can transfer or pay out automatically by Stripe or explicitly through the [Transfers API](https://api.stripe.com#transfers) or [Payouts API](https://api.stripe.com#payouts). You can find the available balance for each currency and payment type in the `source_types` property. Expandable.
  * `connect_reserved` - Funds held due to negative balances on connected accounts where [account.controller.requirement_collection](https://docs.stripe.com/api/accounts/object#account_object-controller-requirement_collection) is `application`, which includes Custom accounts. You can find the connect reserve balance for each currency and payment type in the `source_types` property. Expandable.
  * `instant_available` - Funds that you can pay out using Instant Payouts. Expandable.
  * `issuing` - Expandable.
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `balance`.
  * `pending` - Funds that aren't available in the balance yet. You can find the pending balance for each currency and each payment type in the `source_types` property. Expandable.
  * `refund_and_dispute_prefunding` - Expandable.
  """
  @type t :: %__MODULE__{
          available: [__MODULE__.Available.t()],
          connect_reserved: [__MODULE__.ConnectReserved.t()] | nil,
          instant_available: [__MODULE__.InstantAvailable.t()] | nil,
          issuing: __MODULE__.Issuing.t() | nil,
          livemode: boolean(),
          object: String.t(),
          pending: [__MODULE__.Pending.t()],
          refund_and_dispute_prefunding: __MODULE__.RefundAndDisputePrefunding.t() | nil
        }

  defstruct [
    :available,
    :connect_reserved,
    :instant_available,
    :issuing,
    :livemode,
    :object,
    :pending,
    :refund_and_dispute_prefunding
  ]

  @object_name "balance"
  def object_name, do: @object_name

  def expandable_fields,
    do: [
      "available",
      "connect_reserved",
      "instant_available",
      "issuing",
      "pending",
      "refund_and_dispute_prefunding"
    ]

  defmodule Available do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `amount` - Balance amount.
    * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
    * `source_types`
    """
    @type t :: %__MODULE__{
            amount: integer() | nil,
            currency: String.t() | nil,
            source_types: __MODULE__.SourceTypes.t() | nil
          }
    defstruct [:amount, :currency, :source_types]

    defmodule SourceTypes do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `bank_account` - Amount coming from [legacy US ACH payments](https://docs.stripe.com/ach-deprecated).
      * `card` - Amount coming from most payment methods, including cards as well as [non-legacy bank debits](https://docs.stripe.com/payments/bank-debits).
      * `fpx` - Amount coming from [FPX](https://docs.stripe.com/payments/fpx), a Malaysian payment method.
      """
      @type t :: %__MODULE__{
              bank_account: integer() | nil,
              card: integer() | nil,
              fpx: integer() | nil
            }
      defstruct [:bank_account, :card, :fpx]
    end

    def __inner_types__ do
      %{
        "source_types" => __MODULE__.SourceTypes
      }
    end
  end

  defmodule ConnectReserved do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `amount` - Balance amount.
    * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
    * `source_types`
    """
    @type t :: %__MODULE__{
            amount: integer() | nil,
            currency: String.t() | nil,
            source_types: __MODULE__.SourceTypes.t() | nil
          }
    defstruct [:amount, :currency, :source_types]

    defmodule SourceTypes do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `bank_account` - Amount coming from [legacy US ACH payments](https://docs.stripe.com/ach-deprecated).
      * `card` - Amount coming from most payment methods, including cards as well as [non-legacy bank debits](https://docs.stripe.com/payments/bank-debits).
      * `fpx` - Amount coming from [FPX](https://docs.stripe.com/payments/fpx), a Malaysian payment method.
      """
      @type t :: %__MODULE__{
              bank_account: integer() | nil,
              card: integer() | nil,
              fpx: integer() | nil
            }
      defstruct [:bank_account, :card, :fpx]
    end

    def __inner_types__ do
      %{
        "source_types" => __MODULE__.SourceTypes
      }
    end
  end

  defmodule InstantAvailable do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `amount` - Balance amount.
    * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
    * `net_available` - Breakdown of balance by destination.
    * `source_types`
    """
    @type t :: %__MODULE__{
            amount: integer() | nil,
            currency: String.t() | nil,
            net_available: [__MODULE__.NetAvailable.t()] | nil,
            source_types: __MODULE__.SourceTypes.t() | nil
          }
    defstruct [:amount, :currency, :net_available, :source_types]

    defmodule NetAvailable do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `amount` - Net balance amount, subtracting fees from platform-set pricing.
      * `destination` - ID of the external account for this net balance (not expandable). Max length: 5000.
      * `source_types`
      """
      @type t :: %__MODULE__{
              amount: integer() | nil,
              destination: String.t() | nil,
              source_types: __MODULE__.SourceTypes.t() | nil
            }
      defstruct [:amount, :destination, :source_types]

      defmodule SourceTypes do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `bank_account` - Amount coming from [legacy US ACH payments](https://docs.stripe.com/ach-deprecated).
        * `card` - Amount coming from most payment methods, including cards as well as [non-legacy bank debits](https://docs.stripe.com/payments/bank-debits).
        * `fpx` - Amount coming from [FPX](https://docs.stripe.com/payments/fpx), a Malaysian payment method.
        """
        @type t :: %__MODULE__{
                bank_account: integer() | nil,
                card: integer() | nil,
                fpx: integer() | nil
              }
        defstruct [:bank_account, :card, :fpx]
      end

      def __inner_types__ do
        %{
          "source_types" => __MODULE__.SourceTypes
        }
      end
    end

    defmodule SourceTypes do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `bank_account` - Amount coming from [legacy US ACH payments](https://docs.stripe.com/ach-deprecated).
      * `card` - Amount coming from most payment methods, including cards as well as [non-legacy bank debits](https://docs.stripe.com/payments/bank-debits).
      * `fpx` - Amount coming from [FPX](https://docs.stripe.com/payments/fpx), a Malaysian payment method.
      """
      @type t :: %__MODULE__{
              bank_account: integer() | nil,
              card: integer() | nil,
              fpx: integer() | nil
            }
      defstruct [:bank_account, :card, :fpx]
    end

    def __inner_types__ do
      %{
        "net_available" => __MODULE__.NetAvailable,
        "source_types" => __MODULE__.SourceTypes
      }
    end
  end

  defmodule Issuing do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `available` - Funds that are available for use.
    """
    @type t :: %__MODULE__{
            available: [__MODULE__.Available.t()] | nil
          }
    defstruct [:available]

    defmodule Available do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `amount` - Balance amount.
      * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
      * `source_types`
      """
      @type t :: %__MODULE__{
              amount: integer() | nil,
              currency: String.t() | nil,
              source_types: __MODULE__.SourceTypes.t() | nil
            }
      defstruct [:amount, :currency, :source_types]

      defmodule SourceTypes do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `bank_account` - Amount coming from [legacy US ACH payments](https://docs.stripe.com/ach-deprecated).
        * `card` - Amount coming from most payment methods, including cards as well as [non-legacy bank debits](https://docs.stripe.com/payments/bank-debits).
        * `fpx` - Amount coming from [FPX](https://docs.stripe.com/payments/fpx), a Malaysian payment method.
        """
        @type t :: %__MODULE__{
                bank_account: integer() | nil,
                card: integer() | nil,
                fpx: integer() | nil
              }
        defstruct [:bank_account, :card, :fpx]
      end

      def __inner_types__ do
        %{
          "source_types" => __MODULE__.SourceTypes
        }
      end
    end

    def __inner_types__ do
      %{
        "available" => __MODULE__.Available
      }
    end
  end

  defmodule Pending do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `amount` - Balance amount.
    * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
    * `source_types`
    """
    @type t :: %__MODULE__{
            amount: integer() | nil,
            currency: String.t() | nil,
            source_types: __MODULE__.SourceTypes.t() | nil
          }
    defstruct [:amount, :currency, :source_types]

    defmodule SourceTypes do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `bank_account` - Amount coming from [legacy US ACH payments](https://docs.stripe.com/ach-deprecated).
      * `card` - Amount coming from most payment methods, including cards as well as [non-legacy bank debits](https://docs.stripe.com/payments/bank-debits).
      * `fpx` - Amount coming from [FPX](https://docs.stripe.com/payments/fpx), a Malaysian payment method.
      """
      @type t :: %__MODULE__{
              bank_account: integer() | nil,
              card: integer() | nil,
              fpx: integer() | nil
            }
      defstruct [:bank_account, :card, :fpx]
    end

    def __inner_types__ do
      %{
        "source_types" => __MODULE__.SourceTypes
      }
    end
  end

  defmodule RefundAndDisputePrefunding do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `available` - Funds that are available for use.
    * `pending` - Funds that are pending
    """
    @type t :: %__MODULE__{
            available: [__MODULE__.Available.t()] | nil,
            pending: [__MODULE__.Pending.t()] | nil
          }
    defstruct [:available, :pending]

    defmodule Available do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `amount` - Balance amount.
      * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
      * `source_types`
      """
      @type t :: %__MODULE__{
              amount: integer() | nil,
              currency: String.t() | nil,
              source_types: __MODULE__.SourceTypes.t() | nil
            }
      defstruct [:amount, :currency, :source_types]

      defmodule SourceTypes do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `bank_account` - Amount coming from [legacy US ACH payments](https://docs.stripe.com/ach-deprecated).
        * `card` - Amount coming from most payment methods, including cards as well as [non-legacy bank debits](https://docs.stripe.com/payments/bank-debits).
        * `fpx` - Amount coming from [FPX](https://docs.stripe.com/payments/fpx), a Malaysian payment method.
        """
        @type t :: %__MODULE__{
                bank_account: integer() | nil,
                card: integer() | nil,
                fpx: integer() | nil
              }
        defstruct [:bank_account, :card, :fpx]
      end

      def __inner_types__ do
        %{
          "source_types" => __MODULE__.SourceTypes
        }
      end
    end

    defmodule Pending do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `amount` - Balance amount.
      * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
      * `source_types`
      """
      @type t :: %__MODULE__{
              amount: integer() | nil,
              currency: String.t() | nil,
              source_types: __MODULE__.SourceTypes.t() | nil
            }
      defstruct [:amount, :currency, :source_types]

      defmodule SourceTypes do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `bank_account` - Amount coming from [legacy US ACH payments](https://docs.stripe.com/ach-deprecated).
        * `card` - Amount coming from most payment methods, including cards as well as [non-legacy bank debits](https://docs.stripe.com/payments/bank-debits).
        * `fpx` - Amount coming from [FPX](https://docs.stripe.com/payments/fpx), a Malaysian payment method.
        """
        @type t :: %__MODULE__{
                bank_account: integer() | nil,
                card: integer() | nil,
                fpx: integer() | nil
              }
        defstruct [:bank_account, :card, :fpx]
      end

      def __inner_types__ do
        %{
          "source_types" => __MODULE__.SourceTypes
        }
      end
    end

    def __inner_types__ do
      %{
        "available" => __MODULE__.Available,
        "pending" => __MODULE__.Pending
      }
    end
  end

  def __inner_types__ do
    %{
      "available" => __MODULE__.Available,
      "connect_reserved" => __MODULE__.ConnectReserved,
      "instant_available" => __MODULE__.InstantAvailable,
      "issuing" => __MODULE__.Issuing,
      "pending" => __MODULE__.Pending,
      "refund_and_dispute_prefunding" => __MODULE__.RefundAndDisputePrefunding
    }
  end
end
