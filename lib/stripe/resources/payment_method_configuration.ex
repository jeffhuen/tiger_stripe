# File generated from our OpenAPI spec
defmodule Stripe.Resources.PaymentMethodConfiguration do
  @moduledoc """
  PaymentMethodConfigResourcePaymentMethodConfiguration

  PaymentMethodConfigurations control which payment methods are displayed to your customers when you don't explicitly specify payment method types. You can have multiple configurations with different sets of payment methods for different scenarios.

  There are two types of PaymentMethodConfigurations. Which is used depends on the [charge type](https://docs.stripe.com/connect/charges):

  **Direct** configurations apply to payments created on your account, including Connect destination charges, Connect separate charges and transfers, and payments not involving Connect.

  **Child** configurations apply to payments created on your connected accounts using direct charges, and charges with the on_behalf_of parameter.

  Child configurations have a `parent` that sets default values and controls which settings connected accounts may override. You can specify a parent ID at payment time, and Stripe will automatically resolve the connected account’s associated child configuration. Parent configurations are [managed in the dashboard](https://dashboard.stripe.com/settings/payment_methods/connected_accounts) and are not available in this API.

  Related guides:
  - [Payment Method Configurations API](https://docs.stripe.com/connect/payment-method-configurations)
  - [Multiple configurations on dynamic payment methods](https://docs.stripe.com/payments/multiple-payment-method-configs)
  - [Multiple configurations for your Connect accounts](https://docs.stripe.com/connect/multiple-payment-method-configurations)
  """

  @typedoc """
  * `acss_debit` - Expandable.
  * `active` - Whether the configuration can be used for new payments.
  * `affirm` - Expandable.
  * `afterpay_clearpay` - Expandable.
  * `alipay` - Expandable.
  * `alma` - Expandable.
  * `amazon_pay` - Expandable.
  * `apple_pay` - Expandable.
  * `application` - For child configs, the Connect application associated with the configuration. Max length: 5000. Nullable.
  * `au_becs_debit` - Expandable.
  * `bacs_debit` - Expandable.
  * `bancontact` - Expandable.
  * `billie` - Expandable.
  * `bizum` - Expandable.
  * `blik` - Expandable.
  * `boleto` - Expandable.
  * `card` - Expandable.
  * `cartes_bancaires` - Expandable.
  * `cashapp` - Expandable.
  * `crypto` - Expandable.
  * `customer_balance` - Expandable.
  * `eps` - Expandable.
  * `fpx` - Expandable.
  * `giropay` - Expandable.
  * `google_pay` - Expandable.
  * `grabpay` - Expandable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `ideal` - Expandable.
  * `is_default` - The default configuration is used whenever a payment method configuration is not specified.
  * `jcb` - Expandable.
  * `kakao_pay` - Expandable.
  * `klarna` - Expandable.
  * `konbini` - Expandable.
  * `kr_card` - Expandable.
  * `link` - Expandable.
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `mb_way` - Expandable.
  * `mobilepay` - Expandable.
  * `multibanco` - Expandable.
  * `name` - The configuration's name. Max length: 5000.
  * `naver_pay` - Expandable.
  * `nz_bank_account` - Expandable.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `payment_method_configuration`.
  * `oxxo` - Expandable.
  * `p24` - Expandable.
  * `parent` - For child configs, the configuration's parent configuration. Max length: 5000. Nullable.
  * `pay_by_bank` - Expandable.
  * `payco` - Expandable.
  * `paynow` - Expandable.
  * `paypal` - Expandable.
  * `payto` - Expandable.
  * `pix` - Expandable.
  * `promptpay` - Expandable.
  * `revolut_pay` - Expandable.
  * `samsung_pay` - Expandable.
  * `satispay` - Expandable.
  * `scalapay` - Expandable.
  * `sepa_debit` - Expandable.
  * `sofort` - Expandable.
  * `sunbit` - Expandable.
  * `swish` - Expandable.
  * `twint` - Expandable.
  * `upi` - Expandable.
  * `us_bank_account` - Expandable.
  * `wechat_pay` - Expandable.
  * `zip` - Expandable.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :acss_debit,
    :active,
    :affirm,
    :afterpay_clearpay,
    :alipay,
    :alma,
    :amazon_pay,
    :apple_pay,
    :application,
    :au_becs_debit,
    :bacs_debit,
    :bancontact,
    :billie,
    :bizum,
    :blik,
    :boleto,
    :card,
    :cartes_bancaires,
    :cashapp,
    :crypto,
    :customer_balance,
    :eps,
    :fpx,
    :giropay,
    :google_pay,
    :grabpay,
    :id,
    :ideal,
    :is_default,
    :jcb,
    :kakao_pay,
    :klarna,
    :konbini,
    :kr_card,
    :link,
    :livemode,
    :mb_way,
    :mobilepay,
    :multibanco,
    :name,
    :naver_pay,
    :nz_bank_account,
    :object,
    :oxxo,
    :p24,
    :parent,
    :pay_by_bank,
    :payco,
    :paynow,
    :paypal,
    :payto,
    :pix,
    :promptpay,
    :revolut_pay,
    :samsung_pay,
    :satispay,
    :scalapay,
    :sepa_debit,
    :sofort,
    :sunbit,
    :swish,
    :twint,
    :upi,
    :us_bank_account,
    :wechat_pay,
    :zip
  ]

  @object_name "payment_method_configuration"
  def object_name, do: @object_name

  def expandable_fields,
    do: [
      "acss_debit",
      "affirm",
      "afterpay_clearpay",
      "alipay",
      "alma",
      "amazon_pay",
      "apple_pay",
      "au_becs_debit",
      "bacs_debit",
      "bancontact",
      "billie",
      "bizum",
      "blik",
      "boleto",
      "card",
      "cartes_bancaires",
      "cashapp",
      "crypto",
      "customer_balance",
      "eps",
      "fpx",
      "giropay",
      "google_pay",
      "grabpay",
      "ideal",
      "jcb",
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
      "revolut_pay",
      "samsung_pay",
      "satispay",
      "scalapay",
      "sepa_debit",
      "sofort",
      "sunbit",
      "swish",
      "twint",
      "upi",
      "us_bank_account",
      "wechat_pay",
      "zip"
    ]

  def __nested_fields__ do
    %{
      "acss_debit" => %{
        fields: %{
          "available" => :scalar,
          "display_preference" => %{
            fields: %{
              "overridable" => :scalar,
              "preference" => :scalar,
              "value" => :scalar
            }
          }
        }
      },
      "affirm" => %{
        fields: %{
          "available" => :scalar,
          "display_preference" => %{
            fields: %{
              "overridable" => :scalar,
              "preference" => :scalar,
              "value" => :scalar
            }
          }
        }
      },
      "afterpay_clearpay" => %{
        fields: %{
          "available" => :scalar,
          "display_preference" => %{
            fields: %{
              "overridable" => :scalar,
              "preference" => :scalar,
              "value" => :scalar
            }
          }
        }
      },
      "alipay" => %{
        fields: %{
          "available" => :scalar,
          "display_preference" => %{
            fields: %{
              "overridable" => :scalar,
              "preference" => :scalar,
              "value" => :scalar
            }
          }
        }
      },
      "alma" => %{
        fields: %{
          "available" => :scalar,
          "display_preference" => %{
            fields: %{
              "overridable" => :scalar,
              "preference" => :scalar,
              "value" => :scalar
            }
          }
        }
      },
      "amazon_pay" => %{
        fields: %{
          "available" => :scalar,
          "display_preference" => %{
            fields: %{
              "overridable" => :scalar,
              "preference" => :scalar,
              "value" => :scalar
            }
          }
        }
      },
      "apple_pay" => %{
        fields: %{
          "available" => :scalar,
          "display_preference" => %{
            fields: %{
              "overridable" => :scalar,
              "preference" => :scalar,
              "value" => :scalar
            }
          }
        }
      },
      "au_becs_debit" => %{
        fields: %{
          "available" => :scalar,
          "display_preference" => %{
            fields: %{
              "overridable" => :scalar,
              "preference" => :scalar,
              "value" => :scalar
            }
          }
        }
      },
      "bacs_debit" => %{
        fields: %{
          "available" => :scalar,
          "display_preference" => %{
            fields: %{
              "overridable" => :scalar,
              "preference" => :scalar,
              "value" => :scalar
            }
          }
        }
      },
      "bancontact" => %{
        fields: %{
          "available" => :scalar,
          "display_preference" => %{
            fields: %{
              "overridable" => :scalar,
              "preference" => :scalar,
              "value" => :scalar
            }
          }
        }
      },
      "billie" => %{
        fields: %{
          "available" => :scalar,
          "display_preference" => %{
            fields: %{
              "overridable" => :scalar,
              "preference" => :scalar,
              "value" => :scalar
            }
          }
        }
      },
      "bizum" => %{
        fields: %{
          "available" => :scalar,
          "display_preference" => %{
            fields: %{
              "overridable" => :scalar,
              "preference" => :scalar,
              "value" => :scalar
            }
          }
        }
      },
      "blik" => %{
        fields: %{
          "available" => :scalar,
          "display_preference" => %{
            fields: %{
              "overridable" => :scalar,
              "preference" => :scalar,
              "value" => :scalar
            }
          }
        }
      },
      "boleto" => %{
        fields: %{
          "available" => :scalar,
          "display_preference" => %{
            fields: %{
              "overridable" => :scalar,
              "preference" => :scalar,
              "value" => :scalar
            }
          }
        }
      },
      "card" => %{
        fields: %{
          "available" => :scalar,
          "display_preference" => %{
            fields: %{
              "overridable" => :scalar,
              "preference" => :scalar,
              "value" => :scalar
            }
          }
        }
      },
      "cartes_bancaires" => %{
        fields: %{
          "available" => :scalar,
          "display_preference" => %{
            fields: %{
              "overridable" => :scalar,
              "preference" => :scalar,
              "value" => :scalar
            }
          }
        }
      },
      "cashapp" => %{
        fields: %{
          "available" => :scalar,
          "display_preference" => %{
            fields: %{
              "overridable" => :scalar,
              "preference" => :scalar,
              "value" => :scalar
            }
          }
        }
      },
      "crypto" => %{
        fields: %{
          "available" => :scalar,
          "display_preference" => %{
            fields: %{
              "overridable" => :scalar,
              "preference" => :scalar,
              "value" => :scalar
            }
          }
        }
      },
      "customer_balance" => %{
        fields: %{
          "available" => :scalar,
          "display_preference" => %{
            fields: %{
              "overridable" => :scalar,
              "preference" => :scalar,
              "value" => :scalar
            }
          }
        }
      },
      "eps" => %{
        fields: %{
          "available" => :scalar,
          "display_preference" => %{
            fields: %{
              "overridable" => :scalar,
              "preference" => :scalar,
              "value" => :scalar
            }
          }
        }
      },
      "fpx" => %{
        fields: %{
          "available" => :scalar,
          "display_preference" => %{
            fields: %{
              "overridable" => :scalar,
              "preference" => :scalar,
              "value" => :scalar
            }
          }
        }
      },
      "giropay" => %{
        fields: %{
          "available" => :scalar,
          "display_preference" => %{
            fields: %{
              "overridable" => :scalar,
              "preference" => :scalar,
              "value" => :scalar
            }
          }
        }
      },
      "google_pay" => %{
        fields: %{
          "available" => :scalar,
          "display_preference" => %{
            fields: %{
              "overridable" => :scalar,
              "preference" => :scalar,
              "value" => :scalar
            }
          }
        }
      },
      "grabpay" => %{
        fields: %{
          "available" => :scalar,
          "display_preference" => %{
            fields: %{
              "overridable" => :scalar,
              "preference" => :scalar,
              "value" => :scalar
            }
          }
        }
      },
      "ideal" => %{
        fields: %{
          "available" => :scalar,
          "display_preference" => %{
            fields: %{
              "overridable" => :scalar,
              "preference" => :scalar,
              "value" => :scalar
            }
          }
        }
      },
      "jcb" => %{
        fields: %{
          "available" => :scalar,
          "display_preference" => %{
            fields: %{
              "overridable" => :scalar,
              "preference" => :scalar,
              "value" => :scalar
            }
          }
        }
      },
      "kakao_pay" => %{
        fields: %{
          "available" => :scalar,
          "display_preference" => %{
            fields: %{
              "overridable" => :scalar,
              "preference" => :scalar,
              "value" => :scalar
            }
          }
        }
      },
      "klarna" => %{
        fields: %{
          "available" => :scalar,
          "display_preference" => %{
            fields: %{
              "overridable" => :scalar,
              "preference" => :scalar,
              "value" => :scalar
            }
          }
        }
      },
      "konbini" => %{
        fields: %{
          "available" => :scalar,
          "display_preference" => %{
            fields: %{
              "overridable" => :scalar,
              "preference" => :scalar,
              "value" => :scalar
            }
          }
        }
      },
      "kr_card" => %{
        fields: %{
          "available" => :scalar,
          "display_preference" => %{
            fields: %{
              "overridable" => :scalar,
              "preference" => :scalar,
              "value" => :scalar
            }
          }
        }
      },
      "link" => %{
        fields: %{
          "available" => :scalar,
          "display_preference" => %{
            fields: %{
              "overridable" => :scalar,
              "preference" => :scalar,
              "value" => :scalar
            }
          }
        }
      },
      "mb_way" => %{
        fields: %{
          "available" => :scalar,
          "display_preference" => %{
            fields: %{
              "overridable" => :scalar,
              "preference" => :scalar,
              "value" => :scalar
            }
          }
        }
      },
      "mobilepay" => %{
        fields: %{
          "available" => :scalar,
          "display_preference" => %{
            fields: %{
              "overridable" => :scalar,
              "preference" => :scalar,
              "value" => :scalar
            }
          }
        }
      },
      "multibanco" => %{
        fields: %{
          "available" => :scalar,
          "display_preference" => %{
            fields: %{
              "overridable" => :scalar,
              "preference" => :scalar,
              "value" => :scalar
            }
          }
        }
      },
      "naver_pay" => %{
        fields: %{
          "available" => :scalar,
          "display_preference" => %{
            fields: %{
              "overridable" => :scalar,
              "preference" => :scalar,
              "value" => :scalar
            }
          }
        }
      },
      "nz_bank_account" => %{
        fields: %{
          "available" => :scalar,
          "display_preference" => %{
            fields: %{
              "overridable" => :scalar,
              "preference" => :scalar,
              "value" => :scalar
            }
          }
        }
      },
      "oxxo" => %{
        fields: %{
          "available" => :scalar,
          "display_preference" => %{
            fields: %{
              "overridable" => :scalar,
              "preference" => :scalar,
              "value" => :scalar
            }
          }
        }
      },
      "p24" => %{
        fields: %{
          "available" => :scalar,
          "display_preference" => %{
            fields: %{
              "overridable" => :scalar,
              "preference" => :scalar,
              "value" => :scalar
            }
          }
        }
      },
      "pay_by_bank" => %{
        fields: %{
          "available" => :scalar,
          "display_preference" => %{
            fields: %{
              "overridable" => :scalar,
              "preference" => :scalar,
              "value" => :scalar
            }
          }
        }
      },
      "payco" => %{
        fields: %{
          "available" => :scalar,
          "display_preference" => %{
            fields: %{
              "overridable" => :scalar,
              "preference" => :scalar,
              "value" => :scalar
            }
          }
        }
      },
      "paynow" => %{
        fields: %{
          "available" => :scalar,
          "display_preference" => %{
            fields: %{
              "overridable" => :scalar,
              "preference" => :scalar,
              "value" => :scalar
            }
          }
        }
      },
      "paypal" => %{
        fields: %{
          "available" => :scalar,
          "display_preference" => %{
            fields: %{
              "overridable" => :scalar,
              "preference" => :scalar,
              "value" => :scalar
            }
          }
        }
      },
      "payto" => %{
        fields: %{
          "available" => :scalar,
          "display_preference" => %{
            fields: %{
              "overridable" => :scalar,
              "preference" => :scalar,
              "value" => :scalar
            }
          }
        }
      },
      "pix" => %{
        fields: %{
          "available" => :scalar,
          "display_preference" => %{
            fields: %{
              "overridable" => :scalar,
              "preference" => :scalar,
              "value" => :scalar
            }
          }
        }
      },
      "promptpay" => %{
        fields: %{
          "available" => :scalar,
          "display_preference" => %{
            fields: %{
              "overridable" => :scalar,
              "preference" => :scalar,
              "value" => :scalar
            }
          }
        }
      },
      "revolut_pay" => %{
        fields: %{
          "available" => :scalar,
          "display_preference" => %{
            fields: %{
              "overridable" => :scalar,
              "preference" => :scalar,
              "value" => :scalar
            }
          }
        }
      },
      "samsung_pay" => %{
        fields: %{
          "available" => :scalar,
          "display_preference" => %{
            fields: %{
              "overridable" => :scalar,
              "preference" => :scalar,
              "value" => :scalar
            }
          }
        }
      },
      "satispay" => %{
        fields: %{
          "available" => :scalar,
          "display_preference" => %{
            fields: %{
              "overridable" => :scalar,
              "preference" => :scalar,
              "value" => :scalar
            }
          }
        }
      },
      "scalapay" => %{
        fields: %{
          "available" => :scalar,
          "display_preference" => %{
            fields: %{
              "overridable" => :scalar,
              "preference" => :scalar,
              "value" => :scalar
            }
          }
        }
      },
      "sepa_debit" => %{
        fields: %{
          "available" => :scalar,
          "display_preference" => %{
            fields: %{
              "overridable" => :scalar,
              "preference" => :scalar,
              "value" => :scalar
            }
          }
        }
      },
      "sofort" => %{
        fields: %{
          "available" => :scalar,
          "display_preference" => %{
            fields: %{
              "overridable" => :scalar,
              "preference" => :scalar,
              "value" => :scalar
            }
          }
        }
      },
      "sunbit" => %{
        fields: %{
          "available" => :scalar,
          "display_preference" => %{
            fields: %{
              "overridable" => :scalar,
              "preference" => :scalar,
              "value" => :scalar
            }
          }
        }
      },
      "swish" => %{
        fields: %{
          "available" => :scalar,
          "display_preference" => %{
            fields: %{
              "overridable" => :scalar,
              "preference" => :scalar,
              "value" => :scalar
            }
          }
        }
      },
      "twint" => %{
        fields: %{
          "available" => :scalar,
          "display_preference" => %{
            fields: %{
              "overridable" => :scalar,
              "preference" => :scalar,
              "value" => :scalar
            }
          }
        }
      },
      "upi" => %{
        fields: %{
          "available" => :scalar,
          "display_preference" => %{
            fields: %{
              "overridable" => :scalar,
              "preference" => :scalar,
              "value" => :scalar
            }
          }
        }
      },
      "us_bank_account" => %{
        fields: %{
          "available" => :scalar,
          "display_preference" => %{
            fields: %{
              "overridable" => :scalar,
              "preference" => :scalar,
              "value" => :scalar
            }
          }
        }
      },
      "wechat_pay" => %{
        fields: %{
          "available" => :scalar,
          "display_preference" => %{
            fields: %{
              "overridable" => :scalar,
              "preference" => :scalar,
              "value" => :scalar
            }
          }
        }
      },
      "zip" => %{
        fields: %{
          "available" => :scalar,
          "display_preference" => %{
            fields: %{
              "overridable" => :scalar,
              "preference" => :scalar,
              "value" => :scalar
            }
          }
        }
      }
    }
  end
end
