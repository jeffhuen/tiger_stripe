# File generated from our OpenAPI spec
defmodule Stripe.Resources.Charge do
  @moduledoc """
  Charge

  The `Charge` object represents a single attempt to move money into your Stripe account.
  PaymentIntent confirmation is the most common way to create Charges, but [Account Debits](https://docs.stripe.com/connect/account-debits) may also create Charges.
  Some legacy payment flows create Charges directly, which is not recommended for new integrations.
  """

  @typedoc """
  * `amount` - Amount intended to be collected by this payment. A positive integer representing how much to charge in the [smallest currency unit](https://docs.stripe.com/currencies#zero-decimal) (e.g., 100 cents to charge $1.00 or 100 to charge ¥100, a zero-decimal currency). The minimum amount is $0.50 US or [equivalent in charge currency](https://docs.stripe.com/currencies#minimum-and-maximum-charge-amounts). The amount value supports up to eight digits (e.g., a value of 99999999 for a USD charge of $999,999.99).
  * `amount_captured` - Amount in cents (or local equivalent) captured (can be less than the amount attribute on the charge if a partial capture was made).
  * `amount_refunded` - Amount in cents (or local equivalent) refunded (can be less than the amount attribute on the charge if a partial refund was issued).
  * `application` - ID of the Connect application that created the charge. Nullable. Expandable.
  * `application_fee` - The application fee (if any) for the charge. [See the Connect documentation](https://docs.stripe.com/connect/direct-charges#collect-fees) for details. Nullable. Expandable.
  * `application_fee_amount` - The amount of the application fee (if any) requested for the charge. [See the Connect documentation](https://docs.stripe.com/connect/direct-charges#collect-fees) for details. Nullable.
  * `authorization_code` - Authorization code on the charge. Max length: 5000.
  * `balance_transaction` - ID of the balance transaction that describes the impact of this charge on your account balance (not including refunds or disputes). Nullable. Expandable.
  * `billing_details` - Expandable.
  * `calculated_statement_descriptor` - The full statement descriptor that is passed to card networks, and that is displayed on your customers' credit card and bank statements. Allows you to see what the statement descriptor looks like after the static and dynamic portions are combined. This value only exists for card payments. Max length: 5000. Nullable.
  * `captured` - If the charge was created without capturing, this Boolean represents whether it is still uncaptured or has since been captured.
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `customer` - ID of the customer this charge is for if one exists. Nullable. Expandable.
  * `description` - An arbitrary string attached to the object. Often useful for displaying to users. Max length: 40000. Nullable.
  * `disputed` - Whether the charge has been disputed.
  * `failure_balance_transaction` - ID of the balance transaction that describes the reversal of the balance on your account due to payment failure. Nullable. Expandable.
  * `failure_code` - Error code explaining reason for charge failure if available (see [the errors section](https://docs.stripe.com/error-codes) for a list of codes). Max length: 5000. Nullable.
  * `failure_message` - Message to user further explaining reason for charge failure if available. Max length: 5000. Nullable.
  * `fraud_details` - Information on fraud assessments for the charge. Nullable. Expandable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `invoice` - ID of the invoice this charge is for if one exists. Nullable.
  * `level3` - Expandable.
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `charge`.
  * `on_behalf_of` - The account (if any) the charge was made on behalf of without triggering an automatic transfer. See the [Connect documentation](https://docs.stripe.com/connect/separate-charges-and-transfers) for details. Nullable. Expandable.
  * `outcome` - Details about whether the payment was accepted, and why. See [understanding declines](https://docs.stripe.com/declines) for details. Nullable. Expandable.
  * `paid` - `true` if the charge succeeded, or was successfully authorized for later capture.
  * `payment_intent` - ID of the PaymentIntent associated with this charge, if one exists. Nullable. Expandable.
  * `payment_method` - ID of the payment method used in this charge. Max length: 5000. Nullable.
  * `payment_method_details` - Details about the payment method at the time of the transaction. Nullable. Expandable.
  * `presentment_details` - Expandable.
  * `radar_options` - Expandable.
  * `receipt_email` - This is the email address that the receipt for this charge was sent to. Max length: 5000. Nullable.
  * `receipt_number` - This is the transaction number that appears on email receipts sent for this charge. This attribute will be `null` until a receipt has been sent. Max length: 5000. Nullable.
  * `receipt_url` - This is the URL to view the receipt for this charge. The receipt is kept up-to-date to the latest state of the charge, including any refunds. If the charge is for an Invoice, the receipt will be stylized as an Invoice receipt. Max length: 5000. Nullable.
  * `refunded` - Whether the charge has been fully refunded. If the charge is only partially refunded, this attribute will still be false.
  * `refunds` - A list of refunds that have been applied to the charge. Nullable. Expandable.
  * `review` - ID of the review associated with this charge if one exists. Nullable. Expandable.
  * `shipping` - Shipping information for the charge. Nullable. Expandable.
  * `source` - This is a legacy field that will be removed in the future. It contains the Source, Card, or BankAccount object used for the charge. For details about the payment method used for this charge, refer to `payment_method` or `payment_method_details` instead. Nullable. Expandable.
  * `source_transfer` - The transfer ID which created this charge. Only present if the charge came from another Stripe account. [See the Connect documentation](https://docs.stripe.com/connect/destination-charges) for details. Nullable. Expandable.
  * `statement_descriptor` - For a non-card charge, text that appears on the customer's statement as the statement descriptor. This value overrides the account's default statement descriptor. For information about requirements, including the 22-character limit, see [the Statement Descriptor docs](https://docs.stripe.com/get-started/account/statement-descriptors).

  For a card charge, this value is ignored unless you don't specify a `statement_descriptor_suffix`, in which case this value is used as the suffix. Max length: 5000. Nullable.
  * `statement_descriptor_suffix` - Provides information about a card charge. Concatenated to the account's [statement descriptor prefix](https://docs.stripe.com/get-started/account/statement-descriptors#static) to form the complete statement descriptor that appears on the customer's statement. If the account has no prefix value, the suffix is concatenated to the account's statement descriptor. Max length: 5000. Nullable.
  * `status` - The status of the payment is either `succeeded`, `pending`, or `failed`. Possible values: `failed`, `pending`, `succeeded`.
  * `transfer` - ID of the transfer to the `destination` account (only applicable if the charge was created using the `destination` parameter). Expandable.
  * `transfer_data` - An optional dictionary including the account to automatically transfer to as part of a destination charge. [See the Connect documentation](https://docs.stripe.com/connect/destination-charges) for details. Nullable. Expandable.
  * `transfer_group` - A string that identifies this transaction as part of a group. See the [Connect documentation](https://docs.stripe.com/connect/separate-charges-and-transfers#transfer-options) for details. Max length: 5000. Nullable.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :amount,
    :amount_captured,
    :amount_refunded,
    :application,
    :application_fee,
    :application_fee_amount,
    :authorization_code,
    :balance_transaction,
    :billing_details,
    :calculated_statement_descriptor,
    :captured,
    :created,
    :currency,
    :customer,
    :description,
    :disputed,
    :failure_balance_transaction,
    :failure_code,
    :failure_message,
    :fraud_details,
    :id,
    :invoice,
    :level3,
    :livemode,
    :metadata,
    :object,
    :on_behalf_of,
    :outcome,
    :paid,
    :payment_intent,
    :payment_method,
    :payment_method_details,
    :presentment_details,
    :radar_options,
    :receipt_email,
    :receipt_number,
    :receipt_url,
    :refunded,
    :refunds,
    :review,
    :shipping,
    :source,
    :source_transfer,
    :statement_descriptor,
    :statement_descriptor_suffix,
    :status,
    :transfer,
    :transfer_data,
    :transfer_group
  ]

  @object_name "charge"
  def object_name, do: @object_name

  def expandable_fields,
    do: [
      "application",
      "application_fee",
      "balance_transaction",
      "billing_details",
      "customer",
      "failure_balance_transaction",
      "fraud_details",
      "level3",
      "on_behalf_of",
      "outcome",
      "payment_intent",
      "payment_method_details",
      "presentment_details",
      "radar_options",
      "refunds",
      "review",
      "shipping",
      "source",
      "source_transfer",
      "transfer",
      "transfer_data"
    ]

  def __nested_fields__ do
    %{
      "billing_details" => %{
        fields: %{
          "address" => {:resource, Stripe.Resources.Address},
          "email" => :scalar,
          "name" => :scalar,
          "phone" => :scalar,
          "tax_id" => :scalar
        }
      },
      "fraud_details" => %{
        fields: %{
          "stripe_report" => :scalar,
          "user_report" => :scalar
        }
      },
      "level3" => %{
        fields: %{
          "customer_reference" => :scalar,
          "line_items" =>
            {:list,
             %{
               fields: %{
                 "discount_amount" => :scalar,
                 "product_code" => :scalar,
                 "product_description" => :scalar,
                 "quantity" => :scalar,
                 "tax_amount" => :scalar,
                 "unit_cost" => :scalar
               }
             }},
          "merchant_reference" => :scalar,
          "shipping_address_zip" => :scalar,
          "shipping_amount" => :scalar,
          "shipping_from_zip" => :scalar
        }
      },
      "outcome" => %{
        fields: %{
          "advice_code" => :scalar,
          "network_advice_code" => :scalar,
          "network_decline_code" => :scalar,
          "network_status" => :scalar,
          "reason" => :scalar,
          "risk_level" => :scalar,
          "risk_score" => :scalar,
          "rule" => {:resource, Stripe.Resources.Radar.Rule},
          "seller_message" => :scalar,
          "type" => :scalar
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
          "bizum" => %{
            fields: %{
              "buyer_id" => :scalar,
              "transaction_id" => :scalar
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
              "amount_authorized" => :scalar,
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
              "extended_authorization" => %{
                fields: %{
                  "status" => :scalar
                }
              },
              "fingerprint" => :scalar,
              "funding" => :scalar,
              "iin" => :scalar,
              "incremental_authorization" => %{
                fields: %{
                  "status" => :scalar
                }
              },
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
              "mandate" => :scalar,
              "moto" => :scalar,
              "multicapture" => %{
                fields: %{
                  "status" => :scalar
                }
              },
              "network" => :scalar,
              "network_token" => %{
                fields: %{
                  "used" => :scalar
                }
              },
              "network_transaction_id" => :scalar,
              "overcapture" => %{
                fields: %{
                  "maximum_amount_capturable" => :scalar,
                  "status" => :scalar
                }
              },
              "regulated_status" => :scalar,
              "three_d_secure" => %{
                fields: %{
                  "authentication_flow" => :scalar,
                  "electronic_commerce_indicator" => :scalar,
                  "exemption_indicator" => :scalar,
                  "exemption_indicator_applied" => :scalar,
                  "result" => :scalar,
                  "result_reason" => :scalar,
                  "transaction_id" => :scalar,
                  "version" => :scalar
                }
              },
              "transaction_link_id" => :scalar,
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
              "location" => :scalar,
              "network" => :scalar,
              "network_transaction_id" => :scalar,
              "offline" => {:resource, Stripe.Resources.Offline},
              "overcapture_supported" => :scalar,
              "preferred_locales" => {:list, :scalar},
              "read_method" => :scalar,
              "reader" => :scalar,
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
              "location" => :scalar,
              "network" => :scalar,
              "network_transaction_id" => :scalar,
              "preferred_locales" => {:list, :scalar},
              "read_method" => :scalar,
              "reader" => :scalar,
              "receipt" => {:resource, Stripe.Resources.Receipt}
            }
          },
          "kakao_pay" => {:resource, Stripe.Resources.KakaoPay},
          "klarna" => %{
            fields: %{
              "location" => :scalar,
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
              "preferred_locale" => :scalar,
              "reader" => :scalar
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
              "bank_transaction_id" => :scalar,
              "fingerprint" => :scalar,
              "mandate" => :scalar
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
          "scalapay" => {:resource, Stripe.Resources.Scalapay},
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
          "sunbit" => %{
            fields: %{
              "transaction_id" => :scalar
            }
          },
          "swish" => %{
            fields: %{
              "fingerprint" => :scalar,
              "payment_reference" => :scalar,
              "verified_phone_last4" => :scalar
            }
          },
          "twint" => %{
            fields: %{
              "mandate" => :scalar
            }
          },
          "type" => :scalar,
          "upi" => %{
            fields: %{
              "vpa" => :scalar
            }
          },
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
      "presentment_details" => %{
        fields: %{
          "presentment_amount" => :scalar,
          "presentment_currency" => :scalar
        }
      },
      "radar_options" => %{
        fields: %{
          "session" => :scalar
        }
      },
      "refunds" => %{
        fields: %{
          "data" => {:list, {:resource, Stripe.Resources.Refund}},
          "has_more" => :scalar,
          "object" => :scalar,
          "url" => :scalar
        }
      },
      "transfer_data" => %{
        fields: %{
          "amount" => :scalar,
          "destination" => {:resource, Stripe.Resources.Account}
        }
      },
      "shipping" => {:resource, Stripe.Resources.ShippingDetails},
      "source" => {:resource, Stripe.Resources.PaymentSource}
    }
  end
end
