# File generated from our OpenAPI spec
defmodule Stripe.Resources.Mandate do
  @moduledoc """
  Mandate

  A Mandate is a record of the permission that your customer gives you to debit their payment method.
  """

  @typedoc """
  * `customer_acceptance` - Expandable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `multi_use` - Expandable.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `mandate`.
  * `on_behalf_of` - The account (if any) that the mandate is intended for. Max length: 5000.
  * `payment_method` - ID of the payment method associated with this mandate. Expandable.
  * `payment_method_details` - Expandable.
  * `single_use` - Expandable.
  * `status` - The mandate status indicates whether or not you can use it to initiate a payment. Possible values: `active`, `inactive`, `pending`.
  * `type` - The type of the mandate. Possible values: `multi_use`, `single_use`.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :customer_acceptance,
    :id,
    :livemode,
    :multi_use,
    :object,
    :on_behalf_of,
    :payment_method,
    :payment_method_details,
    :single_use,
    :status,
    :type
  ]

  @object_name "mandate"
  def object_name, do: @object_name

  def expandable_fields,
    do: [
      "customer_acceptance",
      "multi_use",
      "payment_method",
      "payment_method_details",
      "single_use"
    ]

  def __nested_fields__ do
    %{
      "customer_acceptance" => %{
        fields: %{
          "accepted_at" => :scalar,
          "offline" => :scalar,
          "online" => %{
            fields: %{
              "ip_address" => :scalar,
              "user_agent" => :scalar
            }
          },
          "type" => :scalar
        }
      },
      "multi_use" => %{
        fields: %{
          "amount" => :scalar,
          "currency" => :scalar
        }
      },
      "payment_method_details" => %{
        fields: %{
          "acss_debit" => {:resource, Stripe.Resources.AcssDebit},
          "amazon_pay" => {:resource, Stripe.Resources.AmazonPay},
          "au_becs_debit" => %{
            fields: %{
              "url" => :scalar
            }
          },
          "bacs_debit" => %{
            fields: %{
              "display_name" => :scalar,
              "network_status" => :scalar,
              "reference" => :scalar,
              "revocation_reason" => :scalar,
              "service_user_number" => :scalar,
              "url" => :scalar
            }
          },
          "card" => :scalar,
          "cashapp" => {:resource, Stripe.Resources.Cashapp},
          "kakao_pay" => {:resource, Stripe.Resources.KakaoPay},
          "klarna" => :scalar,
          "kr_card" => {:resource, Stripe.Resources.KrCard},
          "link" => :scalar,
          "naver_pay" => :scalar,
          "nz_bank_account" => {:resource, Stripe.Resources.NzBankAccount},
          "paypal" => %{
            fields: %{
              "billing_agreement_id" => :scalar,
              "payer_id" => :scalar
            }
          },
          "payto" => {:resource, Stripe.Resources.Payto},
          "pix" => %{
            fields: %{
              "amount_includes_iof" => :scalar,
              "amount_type" => :scalar,
              "end_date" => :scalar,
              "payment_schedule" => :scalar,
              "reference" => :scalar,
              "start_date" => :scalar
            }
          },
          "revolut_pay" => {:resource, Stripe.Resources.RevolutPay},
          "sepa_debit" => {:resource, Stripe.Resources.SepaDebit},
          "twint" => {:resource, Stripe.Resources.Twint},
          "type" => :scalar,
          "upi" => {:resource, Stripe.Resources.UPI},
          "us_bank_account" => {:resource, Stripe.Resources.UsBankAccount}
        }
      },
      "single_use" => %{
        fields: %{
          "amount" => :scalar,
          "currency" => :scalar
        }
      }
    }
  end
end
