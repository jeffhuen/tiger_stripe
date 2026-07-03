# File generated from our OpenAPI spec
defmodule Stripe.Resources.PaymentMethod do
  @moduledoc """
  PaymentMethod

  PaymentMethod objects represent your customer's payment instruments.
  You can use them with [PaymentIntents](https://docs.stripe.com/payments/payment-intents) to collect payments or save them to
  Customer objects to store instrument details for future payments.

  Related guides: [Payment Methods](https://docs.stripe.com/payments/payment-methods) and [More Payment Scenarios](https://docs.stripe.com/payments/more-payment-scenarios).
  """

  @typedoc """
  * `acss_debit` - Expandable.
  * `affirm` - Expandable.
  * `afterpay_clearpay` - Expandable.
  * `alipay` - Expandable.
  * `allow_redisplay` - This field indicates whether this payment method can be shown again to its customer in a checkout flow. Stripe products such as Checkout and Elements use this field to determine whether a payment method can be shown as a saved payment method in a checkout flow. The field defaults to “unspecified”. Possible values: `always`, `limited`, `unspecified`.
  * `alma` - Expandable.
  * `amazon_pay` - Expandable.
  * `au_becs_debit` - Expandable.
  * `bacs_debit` - Expandable.
  * `bancontact` - Expandable.
  * `billie` - Expandable.
  * `billing_details` - Expandable.
  * `blik` - Expandable.
  * `boleto` - Expandable.
  * `card` - Expandable.
  * `card_present` - Expandable.
  * `cashapp` - Expandable.
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `crypto` - Expandable.
  * `custom` - Expandable.
  * `customer` - The ID of the Customer to which this PaymentMethod is saved. This will not be set when the PaymentMethod has not been saved to a Customer. Nullable. Expandable.
  * `customer_account` - Max length: 5000. Nullable.
  * `customer_balance` - Expandable.
  * `eps` - Expandable.
  * `fpx` - Expandable.
  * `giropay` - Expandable.
  * `grabpay` - Expandable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `ideal` - Expandable.
  * `interac_present` - Expandable.
  * `kakao_pay` - Expandable.
  * `klarna` - Expandable.
  * `konbini` - Expandable.
  * `kr_card` - Expandable.
  * `link` - Expandable.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `mb_way` - Expandable.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Nullable.
  * `mobilepay` - Expandable.
  * `multibanco` - Expandable.
  * `naver_pay` - Expandable.
  * `nz_bank_account` - Expandable.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `payment_method`.
  * `oxxo` - Expandable.
  * `p24` - Expandable.
  * `pay_by_bank` - Expandable.
  * `payco` - Expandable.
  * `paynow` - Expandable.
  * `paypal` - Expandable.
  * `payto` - Expandable.
  * `pix` - Expandable.
  * `promptpay` - Expandable.
  * `radar_options` - Expandable.
  * `revolut_pay` - Expandable.
  * `samsung_pay` - Expandable.
  * `satispay` - Expandable.
  * `sepa_debit` - Expandable.
  * `sofort` - Expandable.
  * `swish` - Expandable.
  * `twint` - Expandable.
  * `type` - The type of the PaymentMethod. An additional hash is included on the PaymentMethod with a name matching this value. It contains additional information specific to the PaymentMethod type. Possible values: `acss_debit`, `affirm`, `afterpay_clearpay`, `alipay`, `alma`, `amazon_pay`, `au_becs_debit`, `bacs_debit`, `bancontact`, `billie`, `blik`, `boleto`, `card`, `card_present`, `cashapp`, `crypto`, `custom`, `customer_balance`, `eps`, `fpx`, `giropay`, `grabpay`, `ideal`, `interac_present`, `kakao_pay`, `klarna`, `konbini`, `kr_card`, `link`, `mb_way`, `mobilepay`, `multibanco`, `naver_pay`, `nz_bank_account`, `oxxo`, `p24`, `pay_by_bank`, `payco`, `paynow`, `paypal`, `payto`, `pix`, `promptpay`, `revolut_pay`, `samsung_pay`, `satispay`, `sepa_debit`, `sofort`, `swish`, `twint`, `us_bank_account`, `wechat_pay`, `zip`.
  * `us_bank_account` - Expandable.
  * `wechat_pay` - Expandable.
  * `zip` - Expandable.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :acss_debit,
    :affirm,
    :afterpay_clearpay,
    :alipay,
    :allow_redisplay,
    :alma,
    :amazon_pay,
    :au_becs_debit,
    :bacs_debit,
    :bancontact,
    :billie,
    :billing_details,
    :blik,
    :boleto,
    :card,
    :card_present,
    :cashapp,
    :created,
    :crypto,
    :custom,
    :customer,
    :customer_account,
    :customer_balance,
    :eps,
    :fpx,
    :giropay,
    :grabpay,
    :id,
    :ideal,
    :interac_present,
    :kakao_pay,
    :klarna,
    :konbini,
    :kr_card,
    :link,
    :livemode,
    :mb_way,
    :metadata,
    :mobilepay,
    :multibanco,
    :naver_pay,
    :nz_bank_account,
    :object,
    :oxxo,
    :p24,
    :pay_by_bank,
    :payco,
    :paynow,
    :paypal,
    :payto,
    :pix,
    :promptpay,
    :radar_options,
    :revolut_pay,
    :samsung_pay,
    :satispay,
    :sepa_debit,
    :sofort,
    :swish,
    :twint,
    :type,
    :us_bank_account,
    :wechat_pay,
    :zip
  ]

  @object_name "payment_method"
  def object_name, do: @object_name

  def expandable_fields,
    do: [
      "acss_debit",
      "affirm",
      "afterpay_clearpay",
      "alipay",
      "alma",
      "amazon_pay",
      "au_becs_debit",
      "bacs_debit",
      "bancontact",
      "billie",
      "billing_details",
      "blik",
      "boleto",
      "card",
      "card_present",
      "cashapp",
      "crypto",
      "custom",
      "customer",
      "customer_balance",
      "eps",
      "fpx",
      "giropay",
      "grabpay",
      "ideal",
      "interac_present",
      "kakao_pay",
      "klarna",
      "konbini",
      "kr_card",
      "link",
      "mb_way",
      "mobilepay",
      "multibanco",
      "naver_pay",
      "nz_bank_account",
      "oxxo",
      "p24",
      "pay_by_bank",
      "payco",
      "paynow",
      "paypal",
      "payto",
      "pix",
      "promptpay",
      "radar_options",
      "revolut_pay",
      "samsung_pay",
      "satispay",
      "sepa_debit",
      "sofort",
      "swish",
      "twint",
      "us_bank_account",
      "wechat_pay",
      "zip"
    ]

  def __nested_fields__ do
    %{
      "acss_debit" => %{
        fields: %{
          "bank_name" => :scalar,
          "fingerprint" => :scalar,
          "institution_number" => :scalar,
          "last4" => :scalar,
          "transit_number" => :scalar
        }
      },
      "au_becs_debit" => %{
        fields: %{
          "bsb_number" => :scalar,
          "fingerprint" => :scalar,
          "last4" => :scalar
        }
      },
      "bacs_debit" => %{
        fields: %{
          "fingerprint" => :scalar,
          "last4" => :scalar,
          "sort_code" => :scalar
        }
      },
      "billing_details" => %{
        fields: %{
          "address" => {:resource, Stripe.Resources.Address},
          "email" => :scalar,
          "name" => :scalar,
          "phone" => :scalar,
          "tax_id" => :scalar
        }
      },
      "boleto" => %{
        fields: %{
          "tax_id" => :scalar
        }
      },
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
          "display_brand" => :scalar,
          "exp_month" => :scalar,
          "exp_year" => :scalar,
          "fingerprint" => :scalar,
          "funding" => :scalar,
          "generated_from" => %{
            fields: %{
              "charge" => :scalar,
              "payment_method_details" => %{
                fields: %{
                  "card_present" => %{
                    fields: %{
                      "amount_authorized" => :scalar,
                      "brand" => :scalar,
                      "brand_product" => :scalar,
                      "capture_before" => :scalar,
                      "cardholder_name" => :scalar,
                      "country" => :scalar,
                      "description" => :scalar,
                      "emv_auth_data" => :scalar,
                      "exp_month" => :scalar,
                      "exp_year" => :scalar,
                      "fingerprint" => :scalar,
                      "funding" => :scalar,
                      "generated_card" => :scalar,
                      "iin" => :scalar,
                      "incremental_authorization_supported" => :scalar,
                      "issuer" => :scalar,
                      "last4" => :scalar,
                      "network" => :scalar,
                      "network_transaction_id" => :scalar,
                      "offline" => {:resource, Stripe.Resources.Offline},
                      "overcapture_supported" => :scalar,
                      "preferred_locales" => {:list, :scalar},
                      "read_method" => :scalar,
                      "receipt" => %{
                        fields: %{
                          "account_type" => :scalar,
                          "application_cryptogram" => :scalar,
                          "application_preferred_name" => :scalar,
                          "authorization_code" => :scalar,
                          "authorization_response_code" => :scalar,
                          "cardholder_verification_method" => :scalar,
                          "dedicated_file_name" => :scalar,
                          "terminal_verification_results" => :scalar,
                          "transaction_status_information" => :scalar
                        }
                      },
                      "wallet" => %{
                        fields: %{
                          "type" => :scalar
                        }
                      }
                    }
                  },
                  "type" => :scalar
                }
              },
              "setup_attempt" => {:resource, Stripe.Resources.SetupAttempt}
            }
          },
          "iin" => :scalar,
          "issuer" => :scalar,
          "last4" => :scalar,
          "networks" => %{
            fields: %{
              "available" => {:list, :scalar},
              "preferred" => :scalar
            }
          },
          "regulated_status" => :scalar,
          "three_d_secure_usage" => %{
            fields: %{
              "supported" => :scalar
            }
          },
          "wallet" => %{
            fields: %{
              "amex_express_checkout" => :scalar,
              "apple_pay" => :scalar,
              "dynamic_last4" => :scalar,
              "google_pay" => :scalar,
              "link" => :scalar,
              "masterpass" => %{
                fields: %{
                  "billing_address" => {:resource, Stripe.Resources.Address},
                  "email" => :scalar,
                  "name" => :scalar,
                  "shipping_address" => {:resource, Stripe.Resources.Address}
                }
              },
              "samsung_pay" => :scalar,
              "type" => :scalar,
              "visa_checkout" => %{
                fields: %{
                  "billing_address" => {:resource, Stripe.Resources.Address},
                  "email" => :scalar,
                  "name" => :scalar,
                  "shipping_address" => {:resource, Stripe.Resources.Address}
                }
              }
            }
          }
        }
      },
      "card_present" => %{
        fields: %{
          "brand" => :scalar,
          "brand_product" => :scalar,
          "cardholder_name" => :scalar,
          "country" => :scalar,
          "description" => :scalar,
          "exp_month" => :scalar,
          "exp_year" => :scalar,
          "fingerprint" => :scalar,
          "funding" => :scalar,
          "iin" => :scalar,
          "issuer" => :scalar,
          "last4" => :scalar,
          "networks" => %{
            fields: %{
              "available" => {:list, :scalar},
              "preferred" => :scalar
            }
          },
          "offline" => {:resource, Stripe.Resources.Offline},
          "preferred_locales" => {:list, :scalar},
          "read_method" => :scalar,
          "wallet" => %{
            fields: %{
              "type" => :scalar
            }
          }
        }
      },
      "cashapp" => %{
        fields: %{
          "buyer_id" => :scalar,
          "cashtag" => :scalar
        }
      },
      "eps" => %{
        fields: %{
          "bank" => :scalar
        }
      },
      "fpx" => %{
        fields: %{
          "account_holder_type" => :scalar,
          "bank" => :scalar
        }
      },
      "ideal" => %{
        fields: %{
          "bank" => :scalar,
          "bic" => :scalar
        }
      },
      "interac_present" => %{
        fields: %{
          "brand" => :scalar,
          "cardholder_name" => :scalar,
          "country" => :scalar,
          "description" => :scalar,
          "exp_month" => :scalar,
          "exp_year" => :scalar,
          "fingerprint" => :scalar,
          "funding" => :scalar,
          "iin" => :scalar,
          "issuer" => :scalar,
          "last4" => :scalar,
          "networks" => %{
            fields: %{
              "available" => {:list, :scalar},
              "preferred" => :scalar
            }
          },
          "preferred_locales" => {:list, :scalar},
          "read_method" => :scalar
        }
      },
      "klarna" => %{
        fields: %{
          "dob" => %{
            fields: %{
              "day" => :scalar,
              "month" => :scalar,
              "year" => :scalar
            }
          }
        }
      },
      "link" => %{
        fields: %{
          "email" => :scalar,
          "persistent_token" => :scalar
        }
      },
      "nz_bank_account" => %{
        fields: %{
          "account_holder_name" => :scalar,
          "bank_code" => :scalar,
          "bank_name" => :scalar,
          "branch_code" => :scalar,
          "last4" => :scalar,
          "suffix" => :scalar
        }
      },
      "p24" => %{
        fields: %{
          "bank" => :scalar
        }
      },
      "paypal" => %{
        fields: %{
          "country" => :scalar,
          "payer_email" => :scalar,
          "payer_id" => :scalar
        }
      },
      "payto" => %{
        fields: %{
          "bsb_number" => :scalar,
          "last4" => :scalar,
          "pay_id" => :scalar
        }
      },
      "radar_options" => %{
        fields: %{
          "session" => :scalar
        }
      },
      "sepa_debit" => %{
        fields: %{
          "bank_code" => :scalar,
          "branch_code" => :scalar,
          "country" => :scalar,
          "fingerprint" => :scalar,
          "generated_from" => %{
            fields: %{
              "charge" => {:resource, Stripe.Resources.Charge},
              "setup_attempt" => {:resource, Stripe.Resources.SetupAttempt}
            }
          },
          "last4" => :scalar
        }
      },
      "sofort" => %{
        fields: %{
          "country" => :scalar
        }
      },
      "us_bank_account" => %{
        fields: %{
          "account_holder_type" => :scalar,
          "account_type" => :scalar,
          "bank_name" => :scalar,
          "financial_connections_account" => :scalar,
          "fingerprint" => :scalar,
          "last4" => :scalar,
          "networks" => %{
            fields: %{
              "preferred" => :scalar,
              "supported" => {:list, :scalar}
            }
          },
          "routing_number" => :scalar,
          "status_details" => %{
            fields: %{
              "blocked" => %{
                fields: %{
                  "network_code" => :scalar,
                  "reason" => :scalar
                }
              }
            }
          }
        }
      },
      "crypto" => {:resource, Stripe.Resources.Crypto},
      "custom" => {:resource, Stripe.Resources.Custom},
      "kakao_pay" => {:resource, Stripe.Resources.KakaoPay},
      "kr_card" => {:resource, Stripe.Resources.KrCard},
      "mb_way" => {:resource, Stripe.Resources.MbWay},
      "naver_pay" => {:resource, Stripe.Resources.NaverPay},
      "payco" => {:resource, Stripe.Resources.Payco},
      "samsung_pay" => {:resource, Stripe.Resources.SamsungPay}
    }
  end
end
