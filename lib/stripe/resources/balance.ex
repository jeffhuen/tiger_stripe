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
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `balance`.
  * `pending` - Funds that aren't available in the balance yet. You can find the pending balance for each currency and each payment type in the `source_types` property. Expandable.
  * `refund_and_dispute_prefunding` - Expandable.
  """
  @type t :: %__MODULE__{
          available: [available()],
          connect_reserved: [connect_reserved()] | nil,
          instant_available: [instant_available()] | nil,
          issuing: issuing() | nil,
          livemode: boolean(),
          object: String.t(),
          pending: [pending()],
          refund_and_dispute_prefunding: refund_and_dispute_prefunding() | nil
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

  @typedoc """
  * `amount` - Balance amount.
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `source_types`
  """
  @type available :: %{
          optional(:amount) => integer() | nil,
          optional(:currency) => String.t() | nil,
          optional(:source_types) => available_source_types() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `bank_account` - Amount coming from [legacy US ACH payments](https://docs.stripe.com/ach-deprecated).
  * `card` - Amount coming from most payment methods, including cards as well as [non-legacy bank debits](https://docs.stripe.com/payments/bank-debits).
  * `fpx` - Amount coming from [FPX](https://docs.stripe.com/payments/fpx), a Malaysian payment method.
  """
  @type available_source_types :: %{
          optional(:bank_account) => integer() | nil,
          optional(:card) => integer() | nil,
          optional(:fpx) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `amount` - Balance amount.
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `source_types`
  """
  @type connect_reserved :: %{
          optional(:amount) => integer() | nil,
          optional(:currency) => String.t() | nil,
          optional(:source_types) => connect_reserved_source_types() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `bank_account` - Amount coming from [legacy US ACH payments](https://docs.stripe.com/ach-deprecated).
  * `card` - Amount coming from most payment methods, including cards as well as [non-legacy bank debits](https://docs.stripe.com/payments/bank-debits).
  * `fpx` - Amount coming from [FPX](https://docs.stripe.com/payments/fpx), a Malaysian payment method.
  """
  @type connect_reserved_source_types :: %{
          optional(:bank_account) => integer() | nil,
          optional(:card) => integer() | nil,
          optional(:fpx) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `amount` - Balance amount.
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `net_available` - Breakdown of balance by destination.
  * `source_types`
  """
  @type instant_available :: %{
          optional(:amount) => integer() | nil,
          optional(:currency) => String.t() | nil,
          optional(:net_available) => [instant_available_net_available()] | nil,
          optional(:source_types) => instant_available_source_types() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `amount` - Net balance amount, subtracting fees from platform-set pricing.
  * `destination` - ID of the external account for this net balance (not expandable). Max length: 5000.
  * `source_types`
  """
  @type instant_available_net_available :: %{
          optional(:amount) => integer() | nil,
          optional(:destination) => String.t() | nil,
          optional(:source_types) => instant_available_net_available_source_types() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `bank_account` - Amount coming from [legacy US ACH payments](https://docs.stripe.com/ach-deprecated).
  * `card` - Amount coming from most payment methods, including cards as well as [non-legacy bank debits](https://docs.stripe.com/payments/bank-debits).
  * `fpx` - Amount coming from [FPX](https://docs.stripe.com/payments/fpx), a Malaysian payment method.
  """
  @type instant_available_net_available_source_types :: %{
          optional(:bank_account) => integer() | nil,
          optional(:card) => integer() | nil,
          optional(:fpx) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `bank_account` - Amount coming from [legacy US ACH payments](https://docs.stripe.com/ach-deprecated).
  * `card` - Amount coming from most payment methods, including cards as well as [non-legacy bank debits](https://docs.stripe.com/payments/bank-debits).
  * `fpx` - Amount coming from [FPX](https://docs.stripe.com/payments/fpx), a Malaysian payment method.
  """
  @type instant_available_source_types :: %{
          optional(:bank_account) => integer() | nil,
          optional(:card) => integer() | nil,
          optional(:fpx) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `available` - Funds that are available for use.
  """
  @type issuing :: %{
          optional(:available) => [issuing_available()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `amount` - Balance amount.
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `source_types`
  """
  @type issuing_available :: %{
          optional(:amount) => integer() | nil,
          optional(:currency) => String.t() | nil,
          optional(:source_types) => issuing_available_source_types() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `bank_account` - Amount coming from [legacy US ACH payments](https://docs.stripe.com/ach-deprecated).
  * `card` - Amount coming from most payment methods, including cards as well as [non-legacy bank debits](https://docs.stripe.com/payments/bank-debits).
  * `fpx` - Amount coming from [FPX](https://docs.stripe.com/payments/fpx), a Malaysian payment method.
  """
  @type issuing_available_source_types :: %{
          optional(:bank_account) => integer() | nil,
          optional(:card) => integer() | nil,
          optional(:fpx) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `amount` - Balance amount.
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `source_types`
  """
  @type pending :: %{
          optional(:amount) => integer() | nil,
          optional(:currency) => String.t() | nil,
          optional(:source_types) => pending_source_types() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `bank_account` - Amount coming from [legacy US ACH payments](https://docs.stripe.com/ach-deprecated).
  * `card` - Amount coming from most payment methods, including cards as well as [non-legacy bank debits](https://docs.stripe.com/payments/bank-debits).
  * `fpx` - Amount coming from [FPX](https://docs.stripe.com/payments/fpx), a Malaysian payment method.
  """
  @type pending_source_types :: %{
          optional(:bank_account) => integer() | nil,
          optional(:card) => integer() | nil,
          optional(:fpx) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `available` - Funds that are available for use.
  * `pending` - Funds that are pending
  """
  @type refund_and_dispute_prefunding :: %{
          optional(:available) => [refund_and_dispute_prefunding_available()] | nil,
          optional(:pending) => [refund_and_dispute_prefunding_pending()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `amount` - Balance amount.
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `source_types`
  """
  @type refund_and_dispute_prefunding_available :: %{
          optional(:amount) => integer() | nil,
          optional(:currency) => String.t() | nil,
          optional(:source_types) => refund_and_dispute_prefunding_available_source_types() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `bank_account` - Amount coming from [legacy US ACH payments](https://docs.stripe.com/ach-deprecated).
  * `card` - Amount coming from most payment methods, including cards as well as [non-legacy bank debits](https://docs.stripe.com/payments/bank-debits).
  * `fpx` - Amount coming from [FPX](https://docs.stripe.com/payments/fpx), a Malaysian payment method.
  """
  @type refund_and_dispute_prefunding_available_source_types :: %{
          optional(:bank_account) => integer() | nil,
          optional(:card) => integer() | nil,
          optional(:fpx) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `amount` - Balance amount.
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `source_types`
  """
  @type refund_and_dispute_prefunding_pending :: %{
          optional(:amount) => integer() | nil,
          optional(:currency) => String.t() | nil,
          optional(:source_types) => refund_and_dispute_prefunding_pending_source_types() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `bank_account` - Amount coming from [legacy US ACH payments](https://docs.stripe.com/ach-deprecated).
  * `card` - Amount coming from most payment methods, including cards as well as [non-legacy bank debits](https://docs.stripe.com/payments/bank-debits).
  * `fpx` - Amount coming from [FPX](https://docs.stripe.com/payments/fpx), a Malaysian payment method.
  """
  @type refund_and_dispute_prefunding_pending_source_types :: %{
          optional(:bank_account) => integer() | nil,
          optional(:card) => integer() | nil,
          optional(:fpx) => integer() | nil,
          optional(String.t()) => term()
        }

  def __nested_fields__ do
    %{
      "available" => %{
        fields: %{
          "amount" => :scalar,
          "currency" => :scalar,
          "source_types" => %{
            fields: %{
              "bank_account" => :scalar,
              "card" => :scalar,
              "fpx" => :scalar
            }
          }
        }
      },
      "connect_reserved" => %{
        fields: %{
          "amount" => :scalar,
          "currency" => :scalar,
          "source_types" => %{
            fields: %{
              "bank_account" => :scalar,
              "card" => :scalar,
              "fpx" => :scalar
            }
          }
        }
      },
      "instant_available" => %{
        fields: %{
          "amount" => :scalar,
          "currency" => :scalar,
          "net_available" =>
            {:list,
             %{
               fields: %{
                 "amount" => :scalar,
                 "destination" => :scalar,
                 "source_types" => %{
                   fields: %{
                     "bank_account" => :scalar,
                     "card" => :scalar,
                     "fpx" => :scalar
                   }
                 }
               }
             }},
          "source_types" => %{
            fields: %{
              "bank_account" => :scalar,
              "card" => :scalar,
              "fpx" => :scalar
            }
          }
        }
      },
      "issuing" => %{
        fields: %{
          "available" =>
            {:list,
             %{
               fields: %{
                 "amount" => :scalar,
                 "currency" => :scalar,
                 "source_types" => %{
                   fields: %{
                     "bank_account" => :scalar,
                     "card" => :scalar,
                     "fpx" => :scalar
                   }
                 }
               }
             }}
        }
      },
      "pending" => %{
        fields: %{
          "amount" => :scalar,
          "currency" => :scalar,
          "source_types" => %{
            fields: %{
              "bank_account" => :scalar,
              "card" => :scalar,
              "fpx" => :scalar
            }
          }
        }
      },
      "refund_and_dispute_prefunding" => %{
        fields: %{
          "available" =>
            {:list,
             %{
               fields: %{
                 "amount" => :scalar,
                 "currency" => :scalar,
                 "source_types" => %{
                   fields: %{
                     "bank_account" => :scalar,
                     "card" => :scalar,
                     "fpx" => :scalar
                   }
                 }
               }
             }},
          "pending" =>
            {:list,
             %{
               fields: %{
                 "amount" => :scalar,
                 "currency" => :scalar,
                 "source_types" => %{
                   fields: %{
                     "bank_account" => :scalar,
                     "card" => :scalar,
                     "fpx" => :scalar
                   }
                 }
               }
             }}
        }
      }
    }
  end
end
