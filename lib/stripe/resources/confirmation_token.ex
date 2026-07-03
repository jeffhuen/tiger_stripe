# File generated from our OpenAPI spec
defmodule Stripe.Resources.ConfirmationToken do
  @moduledoc """
  ConfirmationTokensResourceConfirmationToken

  ConfirmationTokens help transport client side data collected by Stripe JS over
  to your server for confirming a PaymentIntent or SetupIntent. If the confirmation
  is successful, values present on the ConfirmationToken are written onto the Intent.

  To learn more about how to use ConfirmationToken, visit the related guides:
  - [Finalize payments on the server](https://docs.stripe.com/payments/finalize-payments-on-the-server)
  - [Build two-step confirmation](https://docs.stripe.com/payments/build-a-two-step-confirmation).
  """

  @typedoc """
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `expires_at` - Time at which this ConfirmationToken expires and can no longer be used to confirm a PaymentIntent or SetupIntent. Format: Unix timestamp. Nullable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `mandate_data` - Data used for generating a Mandate. Nullable. Expandable.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `confirmation_token`.
  * `payment_intent` - ID of the PaymentIntent that this ConfirmationToken was used to confirm, or null if this ConfirmationToken has not yet been used. Max length: 5000. Nullable.
  * `payment_method_options` - Payment-method-specific configuration for this ConfirmationToken. Nullable. Expandable.
  * `payment_method_preview` - Payment details collected by the Payment Element, used to create a PaymentMethod when a PaymentIntent or SetupIntent is confirmed with this ConfirmationToken. Nullable. Expandable.
  * `return_url` - Return URL used to confirm the Intent. Max length: 5000. Nullable.
  * `setup_future_usage` - Indicates that you intend to make future payments with this ConfirmationToken's payment method.

  The presence of this property will [attach the payment method](https://docs.stripe.com/payments/save-during-payment) to the PaymentIntent's Customer, if present, after the PaymentIntent is confirmed and any required actions from the user are complete. Possible values: `off_session`, `on_session`. Nullable.
  * `setup_intent` - ID of the SetupIntent that this ConfirmationToken was used to confirm, or null if this ConfirmationToken has not yet been used. Max length: 5000. Nullable.
  * `shipping` - Shipping information collected on this ConfirmationToken. Nullable. Expandable.
  * `use_stripe_sdk` - Indicates whether the Stripe SDK is used to handle confirmation flow. Defaults to `true` on ConfirmationToken.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :created,
    :expires_at,
    :id,
    :livemode,
    :mandate_data,
    :object,
    :payment_intent,
    :payment_method_options,
    :payment_method_preview,
    :return_url,
    :setup_future_usage,
    :setup_intent,
    :shipping,
    :use_stripe_sdk
  ]

  @object_name "confirmation_token"
  def object_name, do: @object_name

  def expandable_fields,
    do: ["mandate_data", "payment_method_options", "payment_method_preview", "shipping"]

  def __nested_fields__ do
    %{
      "mandate_data" => %{
        fields: %{
          "customer_acceptance" => %{
            fields: %{
              "online" => %{
                fields: %{
                  "ip_address" => :scalar,
                  "user_agent" => :scalar
                }
              },
              "type" => :scalar
            }
          }
        }
      },
      "payment_method_options" => %{
        fields: %{
          "card" => %{
            fields: %{
              "cvc_token" => :scalar,
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
              }
            }
          }
        }
      },
      "payment_method_preview" => %{
        fields: %{
          "acss_debit" => %{
            fields: %{
              "bank_name" => :scalar,
              "fingerprint" => :scalar,
              "institution_number" => :scalar,
              "last4" => :scalar,
              "transit_number" => :scalar
            }
          },
          "affirm" => :scalar,
          "afterpay_clearpay" => :scalar,
          "alipay" => :scalar,
          "allow_redisplay" => :scalar,
          "alma" => :scalar,
          "amazon_pay" => :scalar,
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
          "bancontact" => :scalar,
          "billie" => :scalar,
          "billing_details" => %{
            fields: %{
              "address" => {:resource, Stripe.Resources.Address},
              "email" => :scalar,
              "name" => :scalar,
              "phone" => :scalar,
              "tax_id" => :scalar
            }
          },
          "blik" => :scalar,
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
          "crypto" => {:resource, Stripe.Resources.Crypto},
          "customer" => {:resource, Stripe.Resources.Customer},
          "customer_account" => :scalar,
          "customer_balance" => :scalar,
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
          "giropay" => :scalar,
          "grabpay" => :scalar,
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
          "kakao_pay" => {:resource, Stripe.Resources.KakaoPay},
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
          "konbini" => :scalar,
          "kr_card" => {:resource, Stripe.Resources.KrCard},
          "link" => %{
            fields: %{
              "email" => :scalar,
              "persistent_token" => :scalar
            }
          },
          "mb_way" => {:resource, Stripe.Resources.MbWay},
          "mobilepay" => :scalar,
          "multibanco" => :scalar,
          "naver_pay" => {:resource, Stripe.Resources.NaverPay},
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
          "oxxo" => :scalar,
          "p24" => %{
            fields: %{
              "bank" => :scalar
            }
          },
          "pay_by_bank" => :scalar,
          "payco" => {:resource, Stripe.Resources.Payco},
          "paynow" => :scalar,
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
          "pix" => :scalar,
          "promptpay" => :scalar,
          "revolut_pay" => :scalar,
          "samsung_pay" => {:resource, Stripe.Resources.SamsungPay},
          "satispay" => :scalar,
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
          "swish" => :scalar,
          "twint" => :scalar,
          "type" => :scalar,
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
          "wechat_pay" => :scalar,
          "zip" => :scalar
        }
      },
      "shipping" => %{
        fields: %{
          "address" => {:resource, Stripe.Resources.Address},
          "name" => :scalar,
          "phone" => :scalar
        }
      }
    }
  end
end
