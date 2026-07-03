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
  @type t :: %__MODULE__{}

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
