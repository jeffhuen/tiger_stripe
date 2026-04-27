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
  @type t :: %__MODULE__{
          customer_acceptance: customer_acceptance(),
          id: String.t(),
          livemode: boolean(),
          multi_use: map() | nil,
          object: String.t(),
          on_behalf_of: String.t() | nil,
          payment_method: String.t() | Stripe.Resources.PaymentMethod.t(),
          payment_method_details: payment_method_details(),
          single_use: single_use() | nil,
          status: String.t(),
          type: String.t()
        }

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

  @typedoc """
  * `accepted_at` - The time that the customer accepts the mandate. Format: Unix timestamp. Nullable.
  * `offline`
  * `online`
  * `type` - The mandate includes the type of customer acceptance information, such as: `online` or `offline`. Possible values: `offline`, `online`.
  """
  @type customer_acceptance :: %{
          optional(:accepted_at) => integer() | nil,
          optional(:offline) => map() | nil,
          optional(:online) => customer_acceptance_online() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `ip_address` - The customer accepts the mandate from this IP address. Max length: 5000. Nullable.
  * `user_agent` - The customer accepts the mandate using the user agent of the browser. Max length: 5000. Nullable.
  """
  @type customer_acceptance_online :: %{
          optional(:ip_address) => String.t() | nil,
          optional(:user_agent) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `acss_debit`
  * `amazon_pay`
  * `au_becs_debit`
  * `bacs_debit`
  * `card`
  * `cashapp`
  * `kakao_pay`
  * `klarna`
  * `kr_card`
  * `link`
  * `naver_pay`
  * `nz_bank_account`
  * `paypal`
  * `payto`
  * `revolut_pay`
  * `sepa_debit`
  * `type` - This mandate corresponds with a specific payment method type. The `payment_method_details` includes an additional hash with the same name and contains mandate information that's specific to that payment method. Max length: 5000.
  * `upi`
  * `us_bank_account`
  """
  @type payment_method_details :: %{
          optional(:acss_debit) => Stripe.Resources.AcssDebit.t() | nil,
          optional(:amazon_pay) => Stripe.Resources.AmazonPay.t() | nil,
          optional(:au_becs_debit) => payment_method_details_au_becs_debit() | nil,
          optional(:bacs_debit) => payment_method_details_bacs_debit() | nil,
          optional(:card) => map() | nil,
          optional(:cashapp) => Stripe.Resources.Cashapp.t() | nil,
          optional(:kakao_pay) => Stripe.Resources.KakaoPay.t() | nil,
          optional(:klarna) => map() | nil,
          optional(:kr_card) => Stripe.Resources.KrCard.t() | nil,
          optional(:link) => map() | nil,
          optional(:naver_pay) => map() | nil,
          optional(:nz_bank_account) => Stripe.Resources.NzBankAccount.t() | nil,
          optional(:paypal) => payment_method_details_paypal() | nil,
          optional(:payto) => Stripe.Resources.Payto.t() | nil,
          optional(:revolut_pay) => Stripe.Resources.RevolutPay.t() | nil,
          optional(:sepa_debit) => Stripe.Resources.SepaDebit.t() | nil,
          optional(:type) => String.t() | nil,
          optional(:upi) => Stripe.Resources.UPI.t() | nil,
          optional(:us_bank_account) => Stripe.Resources.UsBankAccount.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `url` - The URL of the mandate. This URL generally contains sensitive information about the customer and should be shared with them exclusively. Max length: 5000.
  """
  @type payment_method_details_au_becs_debit :: %{
          optional(:url) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `display_name` - The display name for the account on this mandate. Max length: 5000. Nullable.
  * `network_status` - The status of the mandate on the Bacs network. Can be one of `pending`, `revoked`, `refused`, or `accepted`. Possible values: `accepted`, `pending`, `refused`, `revoked`.
  * `reference` - The unique reference identifying the mandate on the Bacs network. Max length: 5000.
  * `revocation_reason` - When the mandate is revoked on the Bacs network this field displays the reason for the revocation. Possible values: `account_closed`, `bank_account_restricted`, `bank_ownership_changed`, `could_not_process`, `debit_not_authorized`. Nullable.
  * `service_user_number` - The service user number for the account on this mandate. Max length: 5000. Nullable.
  * `url` - The URL that will contain the mandate that the customer has signed. Max length: 5000.
  """
  @type payment_method_details_bacs_debit :: %{
          optional(:display_name) => String.t() | nil,
          optional(:network_status) => String.t() | nil,
          optional(:reference) => String.t() | nil,
          optional(:revocation_reason) => String.t() | nil,
          optional(:service_user_number) => String.t() | nil,
          optional(:url) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `billing_agreement_id` - The PayPal Billing Agreement ID (BAID). This is an ID generated by PayPal which represents the mandate between the merchant and the customer. Max length: 5000. Nullable.
  * `payer_id` - PayPal account PayerID. This identifier uniquely identifies the PayPal customer. Max length: 5000. Nullable.
  """
  @type payment_method_details_paypal :: %{
          optional(:billing_agreement_id) => String.t() | nil,
          optional(:payer_id) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `amount` - The amount of the payment on a single use mandate.
  * `currency` - The currency of the payment on a single use mandate. Format: ISO 4217 currency code.
  """
  @type single_use :: %{
          optional(:amount) => integer() | nil,
          optional(:currency) => String.t() | nil,
          optional(String.t()) => term()
        }

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
          "revolut_pay" => {:resource, Stripe.Resources.RevolutPay},
          "sepa_debit" => {:resource, Stripe.Resources.SepaDebit},
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
