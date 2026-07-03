# File generated from our OpenAPI spec
defmodule Stripe.Resources.PaymentRecord do
  @moduledoc """
  PaymentRecord

  A Payment Record is a resource that allows you to represent payments that occur on- or off-Stripe.
  For example, you can create a Payment Record to model a payment made on a different payment processor,
  in order to mark an Invoice as paid and a Subscription as active. Payment Records consist of one or
  more Payment Attempt Records, which represent individual attempts made on a payment network.
  """

  @typedoc """
  * `amount` - Expandable.
  * `amount_authorized` - Expandable.
  * `amount_canceled` - Expandable.
  * `amount_failed` - Expandable.
  * `amount_guaranteed` - Expandable.
  * `amount_refunded` - Expandable.
  * `amount_requested` - Expandable.
  * `application` - ID of the Connect application that created the PaymentRecord. Max length: 5000. Nullable.
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `customer_details` - Customer information for this payment. Nullable. Expandable.
  * `customer_presence` - Indicates whether the customer was present in your checkout flow during this payment. Possible values: `off_session`, `on_session`. Nullable.
  * `description` - An arbitrary string attached to the object. Often useful for displaying to users. Max length: 5000. Nullable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `latest_payment_attempt_record` - ID of the latest Payment Attempt Record attached to this Payment Record. Max length: 5000. Nullable.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `payment_record`.
  * `payment_method_details` - Information about the Payment Method debited for this payment. Nullable. Expandable.
  * `processor_details` - Expandable.
  * `reported_by` - Indicates who reported the payment. Possible values: `self`, `stripe`.
  * `shipping_details` - Shipping information for this payment. Nullable. Expandable.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :amount,
    :amount_authorized,
    :amount_canceled,
    :amount_failed,
    :amount_guaranteed,
    :amount_refunded,
    :amount_requested,
    :application,
    :created,
    :customer_details,
    :customer_presence,
    :description,
    :id,
    :latest_payment_attempt_record,
    :livemode,
    :metadata,
    :object,
    :payment_method_details,
    :processor_details,
    :reported_by,
    :shipping_details
  ]

  @object_name "payment_record"
  def object_name, do: @object_name

  def expandable_fields,
    do: [
      "amount",
      "amount_authorized",
      "amount_canceled",
      "amount_failed",
      "amount_guaranteed",
      "amount_refunded",
      "amount_requested",
      "customer_details",
      "payment_method_details",
      "processor_details",
      "shipping_details"
    ]

  def __nested_fields__ do
    %{
      "amount" => %{
        fields: %{
          "currency" => :scalar,
          "value" => :scalar
        }
      },
      "amount_authorized" => %{
        fields: %{
          "currency" => :scalar,
          "value" => :scalar
        }
      },
      "amount_canceled" => %{
        fields: %{
          "currency" => :scalar,
          "value" => :scalar
        }
      },
      "amount_failed" => %{
        fields: %{
          "currency" => :scalar,
          "value" => :scalar
        }
      },
      "amount_guaranteed" => %{
        fields: %{
          "currency" => :scalar,
          "value" => :scalar
        }
      },
      "amount_refunded" => %{
        fields: %{
          "currency" => :scalar,
          "value" => :scalar
        }
      },
      "amount_requested" => %{
        fields: %{
          "currency" => :scalar,
          "value" => :scalar
        }
      },
      "customer_details" => %{
        fields: %{
          "customer" => :scalar,
          "email" => :scalar,
          "name" => :scalar,
          "phone" => :scalar
        }
      },
      "payment_method_details" => %{
        fields: %{
          "ach_credit_transfer" => %{
            fields: %{
              "account_number" => :scalar,
              "bank_name" => :scalar,
              "routing_number" => :scalar,
              "swift_code" => :scalar
            }
          },
          "ach_debit" => %{
            fields: %{
              "account_holder_type" => :scalar,
              "bank_name" => :scalar,
              "country" => :scalar,
              "fingerprint" => :scalar,
              "last4" => :scalar,
              "routing_number" => :scalar
            }
          },
          "acss_debit" => %{
            fields: %{
              "bank_name" => :scalar,
              "expected_debit_date" => :scalar,
              "fingerprint" => :scalar,
              "institution_number" => :scalar,
              "last4" => :scalar,
              "mandate" => :scalar,
              "transit_number" => :scalar
            }
          },
          "affirm" => %{
            fields: %{
              "location" => :scalar,
              "reader" => :scalar,
              "transaction_id" => :scalar
            }
          },
          "afterpay_clearpay" => %{
            fields: %{
              "order_id" => :scalar,
              "reference" => :scalar
            }
          },
          "alipay" => %{
            fields: %{
              "buyer_id" => :scalar,
              "fingerprint" => :scalar,
              "transaction_id" => :scalar
            }
          },
          "alma" => %{
            fields: %{
              "installments" => %{
                fields: %{
                  "count" => :scalar
                }
              },
              "transaction_id" => :scalar
            }
          },
          "amazon_pay" => %{
            fields: %{
              "funding" => %{
                fields: %{
                  "card" => %{
                    fields: %{
                      "brand" => :scalar,
                      "country" => :scalar,
                      "exp_month" => :scalar,
                      "exp_year" => :scalar,
                      "funding" => :scalar,
                      "last4" => :scalar
                    }
                  },
                  "type" => :scalar
                }
              },
              "transaction_id" => :scalar
            }
          },
          "au_becs_debit" => %{
            fields: %{
              "bsb_number" => :scalar,
              "expected_debit_date" => :scalar,
              "fingerprint" => :scalar,
              "last4" => :scalar,
              "mandate" => :scalar
            }
          },
          "bacs_debit" => %{
            fields: %{
              "expected_debit_date" => :scalar,
              "fingerprint" => :scalar,
              "last4" => :scalar,
              "mandate" => :scalar,
              "sort_code" => :scalar
            }
          },
          "bancontact" => %{
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
          "billie" => %{
            fields: %{
              "transaction_id" => :scalar
            }
          },
          "billing_details" => %{
            fields: %{
              "address" => %{
                fields: %{
                  "city" => :scalar,
                  "country" => :scalar,
                  "line1" => :scalar,
                  "line2" => :scalar,
                  "postal_code" => :scalar,
                  "state" => :scalar
                }
              },
              "email" => :scalar,
              "name" => :scalar,
              "phone" => :scalar
            }
          },
          "blik" => %{
            fields: %{
              "buyer_id" => :scalar
            }
          },
          "boleto" => %{
            fields: %{
              "tax_id" => :scalar
            }
          },
          "card" => %{
            fields: %{
              "authorization_code" => :scalar,
              "brand" => :scalar,
              "capture_before" => :scalar,
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
              "installments" => %{
                fields: %{
                  "plan" => %{
                    fields: %{
                      "count" => :scalar,
                      "interval" => :scalar,
                      "type" => :scalar
                    }
                  }
                }
              },
              "issuer" => :scalar,
              "last4" => :scalar,
              "moto" => :scalar,
              "network" => :scalar,
              "network_advice_code" => :scalar,
              "network_decline_code" => :scalar,
              "network_token" => %{
                fields: %{
                  "used" => :scalar
                }
              },
              "network_transaction_id" => :scalar,
              "stored_credential_usage" => :scalar,
              "three_d_secure" => %{
                fields: %{
                  "authentication_flow" => :scalar,
                  "result" => :scalar,
                  "result_reason" => :scalar,
                  "version" => :scalar
                }
              },
              "wallet" => %{
                fields: %{
                  "apple_pay" => %{
                    fields: %{
                      "type" => :scalar
                    }
                  },
                  "dynamic_last4" => :scalar,
                  "google_pay" => :scalar,
                  "type" => :scalar
                }
              }
            }
          },
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
          "cashapp" => %{
            fields: %{
              "buyer_id" => :scalar,
              "cashtag" => :scalar,
              "transaction_id" => :scalar
            }
          },
          "crypto" => {:resource, Stripe.Resources.Crypto},
          "custom" => %{
            fields: %{
              "display_name" => :scalar,
              "type" => :scalar
            }
          },
          "customer_balance" => :scalar,
          "eps" => %{
            fields: %{
              "bank" => :scalar,
              "verified_name" => :scalar
            }
          },
          "fpx" => %{
            fields: %{
              "account_holder_type" => :scalar,
              "bank" => :scalar,
              "transaction_id" => :scalar
            }
          },
          "giropay" => %{
            fields: %{
              "bank_code" => :scalar,
              "bank_name" => :scalar,
              "bic" => :scalar,
              "verified_name" => :scalar
            }
          },
          "grabpay" => %{
            fields: %{
              "transaction_id" => :scalar
            }
          },
          "ideal" => %{
            fields: %{
              "bank" => :scalar,
              "bic" => :scalar,
              "generated_sepa_debit" => {:resource, Stripe.Resources.PaymentMethod},
              "generated_sepa_debit_mandate" => {:resource, Stripe.Resources.Mandate},
              "iban_last4" => :scalar,
              "transaction_id" => :scalar,
              "verified_name" => :scalar
            }
          },
          "interac_present" => %{
            fields: %{
              "brand" => :scalar,
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
              "issuer" => :scalar,
              "last4" => :scalar,
              "network" => :scalar,
              "network_transaction_id" => :scalar,
              "preferred_locales" => {:list, :scalar},
              "read_method" => :scalar,
              "receipt" => {:resource, Stripe.Resources.Receipt}
            }
          },
          "kakao_pay" => {:resource, Stripe.Resources.KakaoPay},
          "klarna" => %{
            fields: %{
              "payer_details" => %{
                fields: %{
                  "address" => %{
                    fields: %{
                      "country" => :scalar
                    }
                  }
                }
              },
              "payment_method_category" => :scalar,
              "preferred_locale" => :scalar
            }
          },
          "konbini" => %{
            fields: %{
              "store" => %{
                fields: %{
                  "chain" => :scalar
                }
              }
            }
          },
          "kr_card" => {:resource, Stripe.Resources.KrCard},
          "link" => %{
            fields: %{
              "country" => :scalar
            }
          },
          "mb_way" => {:resource, Stripe.Resources.MbWay},
          "mobilepay" => %{
            fields: %{
              "card" => %{
                fields: %{
                  "brand" => :scalar,
                  "country" => :scalar,
                  "exp_month" => :scalar,
                  "exp_year" => :scalar,
                  "last4" => :scalar
                }
              }
            }
          },
          "multibanco" => %{
            fields: %{
              "entity" => :scalar,
              "reference" => :scalar
            }
          },
          "naver_pay" => {:resource, Stripe.Resources.NaverPay},
          "nz_bank_account" => %{
            fields: %{
              "account_holder_name" => :scalar,
              "bank_code" => :scalar,
              "bank_name" => :scalar,
              "branch_code" => :scalar,
              "expected_debit_date" => :scalar,
              "last4" => :scalar,
              "suffix" => :scalar
            }
          },
          "oxxo" => %{
            fields: %{
              "number" => :scalar
            }
          },
          "p24" => %{
            fields: %{
              "bank" => :scalar,
              "reference" => :scalar,
              "verified_name" => :scalar
            }
          },
          "pay_by_bank" => :scalar,
          "payco" => {:resource, Stripe.Resources.Payco},
          "payment_method" => :scalar,
          "paynow" => %{
            fields: %{
              "location" => :scalar,
              "reader" => :scalar,
              "reference" => :scalar
            }
          },
          "paypal" => %{
            fields: %{
              "country" => :scalar,
              "payer_email" => :scalar,
              "payer_id" => :scalar,
              "payer_name" => :scalar,
              "seller_protection" => %{
                fields: %{
                  "dispute_categories" => {:list, :scalar},
                  "status" => :scalar
                }
              },
              "transaction_id" => :scalar
            }
          },
          "payto" => %{
            fields: %{
              "bsb_number" => :scalar,
              "last4" => :scalar,
              "mandate" => :scalar,
              "pay_id" => :scalar
            }
          },
          "pix" => %{
            fields: %{
              "bank_transaction_id" => :scalar
            }
          },
          "promptpay" => %{
            fields: %{
              "reference" => :scalar
            }
          },
          "revolut_pay" => %{
            fields: %{
              "funding" => %{
                fields: %{
                  "card" => %{
                    fields: %{
                      "brand" => :scalar,
                      "country" => :scalar,
                      "exp_month" => :scalar,
                      "exp_year" => :scalar,
                      "funding" => :scalar,
                      "last4" => :scalar
                    }
                  },
                  "type" => :scalar
                }
              },
              "transaction_id" => :scalar
            }
          },
          "samsung_pay" => {:resource, Stripe.Resources.SamsungPay},
          "satispay" => %{
            fields: %{
              "transaction_id" => :scalar
            }
          },
          "sepa_credit_transfer" => %{
            fields: %{
              "bank_name" => :scalar,
              "bic" => :scalar,
              "iban" => :scalar
            }
          },
          "sepa_debit" => %{
            fields: %{
              "bank_code" => :scalar,
              "branch_code" => :scalar,
              "country" => :scalar,
              "expected_debit_date" => :scalar,
              "fingerprint" => :scalar,
              "last4" => :scalar,
              "mandate" => :scalar
            }
          },
          "sofort" => %{
            fields: %{
              "bank_code" => :scalar,
              "bank_name" => :scalar,
              "bic" => :scalar,
              "country" => :scalar,
              "generated_sepa_debit" => {:resource, Stripe.Resources.PaymentMethod},
              "generated_sepa_debit_mandate" => {:resource, Stripe.Resources.Mandate},
              "iban_last4" => :scalar,
              "preferred_language" => :scalar,
              "verified_name" => :scalar
            }
          },
          "stripe_account" => :scalar,
          "swish" => %{
            fields: %{
              "fingerprint" => :scalar,
              "payment_reference" => :scalar,
              "verified_phone_last4" => :scalar
            }
          },
          "twint" => :scalar,
          "type" => :scalar,
          "us_bank_account" => %{
            fields: %{
              "account_holder_type" => :scalar,
              "account_type" => :scalar,
              "bank_name" => :scalar,
              "expected_debit_date" => :scalar,
              "fingerprint" => :scalar,
              "last4" => :scalar,
              "mandate" => {:resource, Stripe.Resources.Mandate},
              "payment_reference" => :scalar,
              "routing_number" => :scalar
            }
          },
          "wechat" => :scalar,
          "wechat_pay" => %{
            fields: %{
              "fingerprint" => :scalar,
              "location" => :scalar,
              "reader" => :scalar,
              "transaction_id" => :scalar
            }
          },
          "zip" => :scalar
        }
      },
      "processor_details" => %{
        fields: %{
          "custom" => %{
            fields: %{
              "payment_reference" => :scalar
            }
          },
          "type" => :scalar
        }
      },
      "shipping_details" => %{
        fields: %{
          "address" => %{
            fields: %{
              "city" => :scalar,
              "country" => :scalar,
              "line1" => :scalar,
              "line2" => :scalar,
              "postal_code" => :scalar,
              "state" => :scalar
            }
          },
          "name" => :scalar,
          "phone" => :scalar
        }
      }
    }
  end
end
