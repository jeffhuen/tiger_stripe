# File generated from our OpenAPI spec
defmodule Stripe.Resources.Issuing.Authorization do
  @moduledoc """
  IssuingAuthorization

  When an [issued card](https://docs.stripe.com/issuing) is used to make a purchase, an Issuing `Authorization`
  object is created. [Authorizations](https://docs.stripe.com/issuing/purchases/authorizations) must be approved for the
  purchase to be completed successfully.

  Related guide: [Issued card authorizations](https://docs.stripe.com/issuing/purchases/authorizations)
  """

  @typedoc """
  * `amount` - The total amount that was authorized or rejected. This amount is in `currency` and in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal). `amount` should be the same as `merchant_amount`, unless `currency` and `merchant_currency` are different.
  * `amount_details` - Detailed breakdown of amount components. These amounts are denominated in `currency` and in the [smallest currency unit](https://docs.stripe.com/currencies#zero-decimal). Nullable. Expandable.
  * `approved` - Whether the authorization has been approved.
  * `authorization_method` - How the card details were provided. Possible values: `chip`, `contactless`, `keyed_in`, `online`, `swipe`.
  * `balance_transactions` - List of balance transactions associated with this authorization. Expandable.
  * `card` - Expandable.
  * `cardholder` - The cardholder to whom this authorization belongs. Nullable. Expandable.
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `currency` - The currency of the cardholder. This currency can be different from the currency presented at authorization and the `merchant_currency` field on this authorization. Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `fleet` - Fleet-specific information for authorizations using Fleet cards. Nullable. Expandable.
  * `fraud_challenges` - Fraud challenges sent to the cardholder, if this authorization was declined for fraud risk reasons. Nullable. Expandable.
  * `fuel` - Information about fuel that was purchased with this transaction. Typically this information is received from the merchant after the authorization has been approved and the fuel dispensed. Nullable. Expandable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `merchant_amount` - The total amount that was authorized or rejected. This amount is in the `merchant_currency` and in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal). `merchant_amount` should be the same as `amount`, unless `merchant_currency` and `currency` are different.
  * `merchant_currency` - The local currency that was presented to the cardholder for the authorization. This currency can be different from the cardholder currency and the `currency` field on this authorization. Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `merchant_data` - Expandable.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
  * `network_data` - Details about the authorization, such as identifiers, set by the card network. Nullable. Expandable.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `issuing.authorization`.
  * `pending_request` - The pending authorization request. This field will only be non-null during an `issuing_authorization.request` webhook. Nullable. Expandable.
  * `request_history` - History of every time a `pending_request` authorization was approved/declined, either by you directly or by Stripe (e.g. based on your spending_controls). If the merchant changes the authorization by performing an incremental authorization, you can look at this field to see the previous requests for the authorization. This field can be helpful in determining why a given authorization was approved/declined. Expandable.
  * `status` - The current status of the authorization in its lifecycle. Possible values: `closed`, `expired`, `pending`, `reversed`.
  * `token` - [Token](https://docs.stripe.com/api/issuing/tokens/object) object used for this authorization. If a network token was not used for this authorization, this field will be null. Nullable. Expandable.
  * `transactions` - List of [transactions](https://docs.stripe.com/api/issuing/transactions) associated with this authorization. Expandable.
  * `treasury` - [Treasury](https://docs.stripe.com/api/treasury) details related to this authorization if it was created on a [FinancialAccount](https://docs.stripe.com/api/treasury/financial_accounts). Nullable. Expandable.
  * `verification_data` - Expandable.
  * `verified_by_fraud_challenge` - Whether the authorization bypassed fraud risk checks because the cardholder has previously completed a fraud challenge on a similar high-risk authorization from the same merchant. Nullable.
  * `wallet` - The digital wallet used for this transaction. One of `apple_pay`, `google_pay`, or `samsung_pay`. Will populate as `null` when no digital wallet was utilized. Max length: 5000. Nullable.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :amount,
    :amount_details,
    :approved,
    :authorization_method,
    :balance_transactions,
    :card,
    :cardholder,
    :created,
    :currency,
    :fleet,
    :fraud_challenges,
    :fuel,
    :id,
    :livemode,
    :merchant_amount,
    :merchant_currency,
    :merchant_data,
    :metadata,
    :network_data,
    :object,
    :pending_request,
    :request_history,
    :status,
    :token,
    :transactions,
    :treasury,
    :verification_data,
    :verified_by_fraud_challenge,
    :wallet
  ]

  @object_name "issuing.authorization"
  def object_name, do: @object_name

  def expandable_fields,
    do: [
      "amount_details",
      "balance_transactions",
      "card",
      "cardholder",
      "fleet",
      "fraud_challenges",
      "fuel",
      "merchant_data",
      "network_data",
      "pending_request",
      "request_history",
      "token",
      "transactions",
      "treasury",
      "verification_data"
    ]

  def __nested_fields__ do
    %{
      "amount_details" => %{
        fields: %{
          "atm_fee" => :scalar,
          "cashback_amount" => :scalar
        }
      },
      "fleet" => %{
        fields: %{
          "cardholder_prompt_data" => %{
            fields: %{
              "alphanumeric_id" => :scalar,
              "driver_id" => :scalar,
              "odometer" => :scalar,
              "unspecified_id" => :scalar,
              "user_id" => :scalar,
              "vehicle_number" => :scalar
            }
          },
          "purchase_type" => :scalar,
          "reported_breakdown" => %{
            fields: %{
              "fuel" => %{
                fields: %{
                  "gross_amount_decimal" => :scalar
                }
              },
              "non_fuel" => %{
                fields: %{
                  "gross_amount_decimal" => :scalar
                }
              },
              "tax" => %{
                fields: %{
                  "local_amount_decimal" => :scalar,
                  "national_amount_decimal" => :scalar
                }
              }
            }
          },
          "service_type" => :scalar
        }
      },
      "fraud_challenges" => %{
        fields: %{
          "channel" => :scalar,
          "status" => :scalar,
          "undeliverable_reason" => :scalar
        }
      },
      "fuel" => %{
        fields: %{
          "industry_product_code" => :scalar,
          "quantity_decimal" => :scalar,
          "type" => :scalar,
          "unit" => :scalar,
          "unit_cost_decimal" => :scalar
        }
      },
      "merchant_data" => %{
        fields: %{
          "category" => :scalar,
          "category_code" => :scalar,
          "city" => :scalar,
          "country" => :scalar,
          "name" => :scalar,
          "network_id" => :scalar,
          "postal_code" => :scalar,
          "state" => :scalar,
          "tax_id" => :scalar,
          "terminal_id" => :scalar,
          "url" => :scalar
        }
      },
      "network_data" => %{
        fields: %{
          "acquiring_institution_id" => :scalar,
          "system_trace_audit_number" => :scalar,
          "transaction_id" => :scalar
        }
      },
      "pending_request" => %{
        fields: %{
          "amount" => :scalar,
          "amount_details" => %{
            fields: %{
              "atm_fee" => :scalar,
              "cashback_amount" => :scalar
            }
          },
          "currency" => :scalar,
          "is_amount_controllable" => :scalar,
          "merchant_amount" => :scalar,
          "merchant_currency" => :scalar,
          "network_risk_score" => :scalar
        }
      },
      "request_history" => %{
        fields: %{
          "amount" => :scalar,
          "amount_details" => %{
            fields: %{
              "atm_fee" => :scalar,
              "cashback_amount" => :scalar
            }
          },
          "approved" => :scalar,
          "authorization_code" => :scalar,
          "created" => :scalar,
          "currency" => :scalar,
          "merchant_amount" => :scalar,
          "merchant_currency" => :scalar,
          "network_risk_score" => :scalar,
          "reason" => :scalar,
          "reason_message" => :scalar,
          "requested_at" => :scalar
        }
      },
      "treasury" => %{
        fields: %{
          "received_credits" => {:list, :scalar},
          "received_debits" => {:list, :scalar},
          "transaction" => :scalar
        }
      },
      "verification_data" => %{
        fields: %{
          "address_line1_check" => :scalar,
          "address_postal_code_check" => :scalar,
          "authentication_exemption" => %{
            fields: %{
              "claimed_by" => :scalar,
              "type" => :scalar
            }
          },
          "cvc_check" => :scalar,
          "expiry_check" => :scalar,
          "postal_code" => :scalar,
          "three_d_secure" => %{
            fields: %{
              "result" => :scalar
            }
          }
        }
      },
      "card" => {:resource, Stripe.Resources.Issuing.Card}
    }
  end
end
