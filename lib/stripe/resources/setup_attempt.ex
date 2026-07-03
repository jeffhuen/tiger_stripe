# File generated from our OpenAPI spec
defmodule Stripe.Resources.SetupAttempt do
  @moduledoc """
  PaymentFlowsSetupIntentSetupAttempt

  A SetupAttempt describes one attempted confirmation of a SetupIntent,
  whether that confirmation is successful or unsuccessful. You can use
  SetupAttempts to inspect details of a specific attempt at setting up a
  payment method using a SetupIntent.
  """

  @typedoc """
  * `application` - The value of [application](https://docs.stripe.com/api/setup_intents/object#setup_intent_object-application) on the SetupIntent at the time of this confirmation. Nullable. Expandable.
  * `attach_to_self` - If present, the SetupIntent's payment method will be attached to the in-context Stripe Account.

  It can only be used for this Stripe Account’s own money movement flows like InboundTransfer and OutboundTransfers. It cannot be set to true when setting up a PaymentMethod for a Customer, and defaults to false when attaching a PaymentMethod to a Customer.
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `customer` - The value of [customer](https://docs.stripe.com/api/setup_intents/object#setup_intent_object-customer) on the SetupIntent at the time of this confirmation. Nullable. Expandable.
  * `customer_account` - The value of [customer_account](https://docs.stripe.com/api/setup_intents/object#setup_intent_object-customer_account) on the SetupIntent at the time of this confirmation. Max length: 5000. Nullable.
  * `flow_directions` - Indicates the directions of money movement for which this payment method is intended to be used.

  Include `inbound` if you intend to use the payment method as the origin to pull funds from. Include `outbound` if you intend to use the payment method as the destination to send funds to. You can include both if you intend to use the payment method for both purposes. Nullable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `setup_attempt`.
  * `on_behalf_of` - The value of [on_behalf_of](https://docs.stripe.com/api/setup_intents/object#setup_intent_object-on_behalf_of) on the SetupIntent at the time of this confirmation. Nullable. Expandable.
  * `payment_method` - ID of the payment method used with this SetupAttempt. Expandable.
  * `payment_method_details` - Expandable.
  * `setup_error` - The error encountered during this attempt to confirm the SetupIntent, if any. Nullable. Expandable.
  * `setup_intent` - ID of the SetupIntent that this attempt belongs to. Expandable.
  * `status` - Status of this SetupAttempt, one of `requires_confirmation`, `requires_action`, `processing`, `succeeded`, `failed`, or `abandoned`. Max length: 5000.
  * `usage` - The value of [usage](https://docs.stripe.com/api/setup_intents/object#setup_intent_object-usage) on the SetupIntent at the time of this confirmation, one of `off_session` or `on_session`. Max length: 5000.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :application,
    :attach_to_self,
    :created,
    :customer,
    :customer_account,
    :flow_directions,
    :id,
    :livemode,
    :object,
    :on_behalf_of,
    :payment_method,
    :payment_method_details,
    :setup_error,
    :setup_intent,
    :status,
    :usage
  ]

  @object_name "setup_attempt"
  def object_name, do: @object_name

  def expandable_fields,
    do: [
      "application",
      "customer",
      "on_behalf_of",
      "payment_method",
      "payment_method_details",
      "setup_error",
      "setup_intent"
    ]

  def __nested_fields__ do
    %{
      "payment_method_details" => %{
        fields: %{
          "acss_debit" => :scalar,
          "amazon_pay" => :scalar,
          "au_becs_debit" => {:resource, Stripe.Resources.AuBecsDebit},
          "bacs_debit" => :scalar,
          "bancontact" => {:resource, Stripe.Resources.Bancontact},
          "boleto" => :scalar,
          "card" => %{
            fields: %{
              "brand" => :scalar,
              "checks" => %{
                fields: %{
                  "address_line1_check" => :scalar,
                  "address_postal_code_check" => :scalar,
                  "cvc_check" => :scalar
                }
              },
              "country" => :scalar,
              "description" => :scalar,
              "exp_month" => :scalar,
              "exp_year" => :scalar,
              "fingerprint" => :scalar,
              "funding" => :scalar,
              "iin" => :scalar,
              "issuer" => :scalar,
              "last4" => :scalar,
              "network" => :scalar,
              "three_d_secure" => %{
                fields: %{
                  "authentication_flow" => :scalar,
                  "electronic_commerce_indicator" => :scalar,
                  "result" => :scalar,
                  "result_reason" => :scalar,
                  "transaction_id" => :scalar,
                  "version" => :scalar
                }
              },
              "wallet" => %{
                fields: %{
                  "apple_pay" => :scalar,
                  "google_pay" => :scalar,
                  "type" => :scalar
                }
              }
            }
          },
          "card_present" => {:resource, Stripe.Resources.CardPresent},
          "cashapp" => :scalar,
          "ideal" => %{
            fields: %{
              "bank" => :scalar,
              "bic" => :scalar,
              "generated_sepa_debit" => {:resource, Stripe.Resources.PaymentMethod},
              "generated_sepa_debit_mandate" => {:resource, Stripe.Resources.Mandate},
              "iban_last4" => :scalar,
              "verified_name" => :scalar
            }
          },
          "kakao_pay" => :scalar,
          "klarna" => :scalar,
          "kr_card" => :scalar,
          "link" => :scalar,
          "naver_pay" => %{
            fields: %{
              "buyer_id" => :scalar
            }
          },
          "nz_bank_account" => {:resource, Stripe.Resources.NzBankAccount},
          "paypal" => :scalar,
          "payto" => :scalar,
          "revolut_pay" => {:resource, Stripe.Resources.RevolutPay},
          "sepa_debit" => :scalar,
          "sofort" => %{
            fields: %{
              "bank_code" => :scalar,
              "bank_name" => :scalar,
              "bic" => :scalar,
              "generated_sepa_debit" => {:resource, Stripe.Resources.PaymentMethod},
              "generated_sepa_debit_mandate" => {:resource, Stripe.Resources.Mandate},
              "iban_last4" => :scalar,
              "preferred_language" => :scalar,
              "verified_name" => :scalar
            }
          },
          "type" => :scalar,
          "us_bank_account" => {:resource, Stripe.Resources.UsBankAccount}
        }
      },
      "setup_error" => {:resource, Stripe.Resources.StripeError}
    }
  end
end
