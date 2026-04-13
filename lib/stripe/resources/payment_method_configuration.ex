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
  * `sepa_debit` - Expandable.
  * `sofort` - Expandable.
  * `swish` - Expandable.
  * `twint` - Expandable.
  * `upi` - Expandable.
  * `us_bank_account` - Expandable.
  * `wechat_pay` - Expandable.
  * `zip` - Expandable.
  """
  @type t :: %__MODULE__{
          acss_debit: __MODULE__.AcssDebit.t() | nil,
          active: boolean(),
          affirm: __MODULE__.Affirm.t() | nil,
          afterpay_clearpay: __MODULE__.AfterpayClearpay.t() | nil,
          alipay: __MODULE__.Alipay.t() | nil,
          alma: __MODULE__.Alma.t() | nil,
          amazon_pay: __MODULE__.AmazonPay.t() | nil,
          apple_pay: __MODULE__.ApplePay.t() | nil,
          application: String.t(),
          au_becs_debit: __MODULE__.AuBecsDebit.t() | nil,
          bacs_debit: __MODULE__.BacsDebit.t() | nil,
          bancontact: __MODULE__.Bancontact.t() | nil,
          billie: __MODULE__.Billie.t() | nil,
          blik: __MODULE__.Blik.t() | nil,
          boleto: __MODULE__.Boleto.t() | nil,
          card: __MODULE__.Card.t() | nil,
          cartes_bancaires: __MODULE__.CartesBancaires.t() | nil,
          cashapp: __MODULE__.Cashapp.t() | nil,
          crypto: __MODULE__.Crypto.t() | nil,
          customer_balance: __MODULE__.CustomerBalance.t() | nil,
          eps: __MODULE__.Eps.t() | nil,
          fpx: __MODULE__.Fpx.t() | nil,
          giropay: __MODULE__.Giropay.t() | nil,
          google_pay: __MODULE__.GooglePay.t() | nil,
          grabpay: __MODULE__.Grabpay.t() | nil,
          id: String.t(),
          ideal: __MODULE__.Ideal.t() | nil,
          is_default: boolean(),
          jcb: __MODULE__.Jcb.t() | nil,
          kakao_pay: __MODULE__.KakaoPay.t() | nil,
          klarna: __MODULE__.Klarna.t() | nil,
          konbini: __MODULE__.Konbini.t() | nil,
          kr_card: __MODULE__.KrCard.t() | nil,
          link: __MODULE__.Link.t() | nil,
          livemode: boolean(),
          mb_way: __MODULE__.MbWay.t() | nil,
          mobilepay: __MODULE__.Mobilepay.t() | nil,
          multibanco: __MODULE__.Multibanco.t() | nil,
          name: String.t(),
          naver_pay: __MODULE__.NaverPay.t() | nil,
          nz_bank_account: __MODULE__.NzBankAccount.t() | nil,
          object: String.t(),
          oxxo: __MODULE__.Oxxo.t() | nil,
          p24: __MODULE__.P24.t() | nil,
          parent: String.t(),
          pay_by_bank: __MODULE__.PayByBank.t() | nil,
          payco: __MODULE__.Payco.t() | nil,
          paynow: __MODULE__.Paynow.t() | nil,
          paypal: __MODULE__.Paypal.t() | nil,
          payto: __MODULE__.Payto.t() | nil,
          pix: __MODULE__.Pix.t() | nil,
          promptpay: __MODULE__.Promptpay.t() | nil,
          revolut_pay: __MODULE__.RevolutPay.t() | nil,
          samsung_pay: __MODULE__.SamsungPay.t() | nil,
          satispay: __MODULE__.Satispay.t() | nil,
          sepa_debit: __MODULE__.SepaDebit.t() | nil,
          sofort: __MODULE__.Sofort.t() | nil,
          swish: __MODULE__.Swish.t() | nil,
          twint: __MODULE__.Twint.t() | nil,
          upi: __MODULE__.Upi.t() | nil,
          us_bank_account: __MODULE__.UsBankAccount.t() | nil,
          wechat_pay: __MODULE__.WechatPay.t() | nil,
          zip: __MODULE__.Zip.t() | nil
        }

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
    :sepa_debit,
    :sofort,
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
      "sepa_debit",
      "sofort",
      "swish",
      "twint",
      "upi",
      "us_bank_account",
      "wechat_pay",
      "zip"
    ]

  defmodule AcssDebit do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
    * `display_preference`
    """
    @type t :: %__MODULE__{
            available: boolean() | nil,
            display_preference: __MODULE__.DisplayPreference.t() | nil
          }
    defstruct [:available, :display_preference]

    defmodule DisplayPreference do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
      * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
      * `value` - The effective display preference value. Possible values: `off`, `on`.
      """
      @type t :: %__MODULE__{
              overridable: boolean() | nil,
              preference: String.t() | nil,
              value: String.t() | nil
            }
      defstruct [:overridable, :preference, :value]
    end

    def __inner_types__ do
      %{
        "display_preference" => __MODULE__.DisplayPreference
      }
    end
  end

  defmodule Affirm do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
    * `display_preference`
    """
    @type t :: %__MODULE__{
            available: boolean() | nil,
            display_preference: __MODULE__.DisplayPreference.t() | nil
          }
    defstruct [:available, :display_preference]

    defmodule DisplayPreference do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
      * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
      * `value` - The effective display preference value. Possible values: `off`, `on`.
      """
      @type t :: %__MODULE__{
              overridable: boolean() | nil,
              preference: String.t() | nil,
              value: String.t() | nil
            }
      defstruct [:overridable, :preference, :value]
    end

    def __inner_types__ do
      %{
        "display_preference" => __MODULE__.DisplayPreference
      }
    end
  end

  defmodule AfterpayClearpay do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
    * `display_preference`
    """
    @type t :: %__MODULE__{
            available: boolean() | nil,
            display_preference: __MODULE__.DisplayPreference.t() | nil
          }
    defstruct [:available, :display_preference]

    defmodule DisplayPreference do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
      * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
      * `value` - The effective display preference value. Possible values: `off`, `on`.
      """
      @type t :: %__MODULE__{
              overridable: boolean() | nil,
              preference: String.t() | nil,
              value: String.t() | nil
            }
      defstruct [:overridable, :preference, :value]
    end

    def __inner_types__ do
      %{
        "display_preference" => __MODULE__.DisplayPreference
      }
    end
  end

  defmodule Alipay do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
    * `display_preference`
    """
    @type t :: %__MODULE__{
            available: boolean() | nil,
            display_preference: __MODULE__.DisplayPreference.t() | nil
          }
    defstruct [:available, :display_preference]

    defmodule DisplayPreference do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
      * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
      * `value` - The effective display preference value. Possible values: `off`, `on`.
      """
      @type t :: %__MODULE__{
              overridable: boolean() | nil,
              preference: String.t() | nil,
              value: String.t() | nil
            }
      defstruct [:overridable, :preference, :value]
    end

    def __inner_types__ do
      %{
        "display_preference" => __MODULE__.DisplayPreference
      }
    end
  end

  defmodule Alma do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
    * `display_preference`
    """
    @type t :: %__MODULE__{
            available: boolean() | nil,
            display_preference: __MODULE__.DisplayPreference.t() | nil
          }
    defstruct [:available, :display_preference]

    defmodule DisplayPreference do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
      * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
      * `value` - The effective display preference value. Possible values: `off`, `on`.
      """
      @type t :: %__MODULE__{
              overridable: boolean() | nil,
              preference: String.t() | nil,
              value: String.t() | nil
            }
      defstruct [:overridable, :preference, :value]
    end

    def __inner_types__ do
      %{
        "display_preference" => __MODULE__.DisplayPreference
      }
    end
  end

  defmodule AmazonPay do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
    * `display_preference`
    """
    @type t :: %__MODULE__{
            available: boolean() | nil,
            display_preference: __MODULE__.DisplayPreference.t() | nil
          }
    defstruct [:available, :display_preference]

    defmodule DisplayPreference do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
      * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
      * `value` - The effective display preference value. Possible values: `off`, `on`.
      """
      @type t :: %__MODULE__{
              overridable: boolean() | nil,
              preference: String.t() | nil,
              value: String.t() | nil
            }
      defstruct [:overridable, :preference, :value]
    end

    def __inner_types__ do
      %{
        "display_preference" => __MODULE__.DisplayPreference
      }
    end
  end

  defmodule ApplePay do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
    * `display_preference`
    """
    @type t :: %__MODULE__{
            available: boolean() | nil,
            display_preference: __MODULE__.DisplayPreference.t() | nil
          }
    defstruct [:available, :display_preference]

    defmodule DisplayPreference do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
      * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
      * `value` - The effective display preference value. Possible values: `off`, `on`.
      """
      @type t :: %__MODULE__{
              overridable: boolean() | nil,
              preference: String.t() | nil,
              value: String.t() | nil
            }
      defstruct [:overridable, :preference, :value]
    end

    def __inner_types__ do
      %{
        "display_preference" => __MODULE__.DisplayPreference
      }
    end
  end

  defmodule AuBecsDebit do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
    * `display_preference`
    """
    @type t :: %__MODULE__{
            available: boolean() | nil,
            display_preference: __MODULE__.DisplayPreference.t() | nil
          }
    defstruct [:available, :display_preference]

    defmodule DisplayPreference do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
      * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
      * `value` - The effective display preference value. Possible values: `off`, `on`.
      """
      @type t :: %__MODULE__{
              overridable: boolean() | nil,
              preference: String.t() | nil,
              value: String.t() | nil
            }
      defstruct [:overridable, :preference, :value]
    end

    def __inner_types__ do
      %{
        "display_preference" => __MODULE__.DisplayPreference
      }
    end
  end

  defmodule BacsDebit do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
    * `display_preference`
    """
    @type t :: %__MODULE__{
            available: boolean() | nil,
            display_preference: __MODULE__.DisplayPreference.t() | nil
          }
    defstruct [:available, :display_preference]

    defmodule DisplayPreference do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
      * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
      * `value` - The effective display preference value. Possible values: `off`, `on`.
      """
      @type t :: %__MODULE__{
              overridable: boolean() | nil,
              preference: String.t() | nil,
              value: String.t() | nil
            }
      defstruct [:overridable, :preference, :value]
    end

    def __inner_types__ do
      %{
        "display_preference" => __MODULE__.DisplayPreference
      }
    end
  end

  defmodule Bancontact do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
    * `display_preference`
    """
    @type t :: %__MODULE__{
            available: boolean() | nil,
            display_preference: __MODULE__.DisplayPreference.t() | nil
          }
    defstruct [:available, :display_preference]

    defmodule DisplayPreference do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
      * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
      * `value` - The effective display preference value. Possible values: `off`, `on`.
      """
      @type t :: %__MODULE__{
              overridable: boolean() | nil,
              preference: String.t() | nil,
              value: String.t() | nil
            }
      defstruct [:overridable, :preference, :value]
    end

    def __inner_types__ do
      %{
        "display_preference" => __MODULE__.DisplayPreference
      }
    end
  end

  defmodule Billie do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
    * `display_preference`
    """
    @type t :: %__MODULE__{
            available: boolean() | nil,
            display_preference: __MODULE__.DisplayPreference.t() | nil
          }
    defstruct [:available, :display_preference]

    defmodule DisplayPreference do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
      * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
      * `value` - The effective display preference value. Possible values: `off`, `on`.
      """
      @type t :: %__MODULE__{
              overridable: boolean() | nil,
              preference: String.t() | nil,
              value: String.t() | nil
            }
      defstruct [:overridable, :preference, :value]
    end

    def __inner_types__ do
      %{
        "display_preference" => __MODULE__.DisplayPreference
      }
    end
  end

  defmodule Blik do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
    * `display_preference`
    """
    @type t :: %__MODULE__{
            available: boolean() | nil,
            display_preference: __MODULE__.DisplayPreference.t() | nil
          }
    defstruct [:available, :display_preference]

    defmodule DisplayPreference do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
      * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
      * `value` - The effective display preference value. Possible values: `off`, `on`.
      """
      @type t :: %__MODULE__{
              overridable: boolean() | nil,
              preference: String.t() | nil,
              value: String.t() | nil
            }
      defstruct [:overridable, :preference, :value]
    end

    def __inner_types__ do
      %{
        "display_preference" => __MODULE__.DisplayPreference
      }
    end
  end

  defmodule Boleto do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
    * `display_preference`
    """
    @type t :: %__MODULE__{
            available: boolean() | nil,
            display_preference: __MODULE__.DisplayPreference.t() | nil
          }
    defstruct [:available, :display_preference]

    defmodule DisplayPreference do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
      * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
      * `value` - The effective display preference value. Possible values: `off`, `on`.
      """
      @type t :: %__MODULE__{
              overridable: boolean() | nil,
              preference: String.t() | nil,
              value: String.t() | nil
            }
      defstruct [:overridable, :preference, :value]
    end

    def __inner_types__ do
      %{
        "display_preference" => __MODULE__.DisplayPreference
      }
    end
  end

  defmodule Card do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
    * `display_preference`
    """
    @type t :: %__MODULE__{
            available: boolean() | nil,
            display_preference: __MODULE__.DisplayPreference.t() | nil
          }
    defstruct [:available, :display_preference]

    defmodule DisplayPreference do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
      * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
      * `value` - The effective display preference value. Possible values: `off`, `on`.
      """
      @type t :: %__MODULE__{
              overridable: boolean() | nil,
              preference: String.t() | nil,
              value: String.t() | nil
            }
      defstruct [:overridable, :preference, :value]
    end

    def __inner_types__ do
      %{
        "display_preference" => __MODULE__.DisplayPreference
      }
    end
  end

  defmodule CartesBancaires do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
    * `display_preference`
    """
    @type t :: %__MODULE__{
            available: boolean() | nil,
            display_preference: __MODULE__.DisplayPreference.t() | nil
          }
    defstruct [:available, :display_preference]

    defmodule DisplayPreference do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
      * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
      * `value` - The effective display preference value. Possible values: `off`, `on`.
      """
      @type t :: %__MODULE__{
              overridable: boolean() | nil,
              preference: String.t() | nil,
              value: String.t() | nil
            }
      defstruct [:overridable, :preference, :value]
    end

    def __inner_types__ do
      %{
        "display_preference" => __MODULE__.DisplayPreference
      }
    end
  end

  defmodule Cashapp do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
    * `display_preference`
    """
    @type t :: %__MODULE__{
            available: boolean() | nil,
            display_preference: __MODULE__.DisplayPreference.t() | nil
          }
    defstruct [:available, :display_preference]

    defmodule DisplayPreference do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
      * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
      * `value` - The effective display preference value. Possible values: `off`, `on`.
      """
      @type t :: %__MODULE__{
              overridable: boolean() | nil,
              preference: String.t() | nil,
              value: String.t() | nil
            }
      defstruct [:overridable, :preference, :value]
    end

    def __inner_types__ do
      %{
        "display_preference" => __MODULE__.DisplayPreference
      }
    end
  end

  defmodule Crypto do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
    * `display_preference`
    """
    @type t :: %__MODULE__{
            available: boolean() | nil,
            display_preference: __MODULE__.DisplayPreference.t() | nil
          }
    defstruct [:available, :display_preference]

    defmodule DisplayPreference do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
      * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
      * `value` - The effective display preference value. Possible values: `off`, `on`.
      """
      @type t :: %__MODULE__{
              overridable: boolean() | nil,
              preference: String.t() | nil,
              value: String.t() | nil
            }
      defstruct [:overridable, :preference, :value]
    end

    def __inner_types__ do
      %{
        "display_preference" => __MODULE__.DisplayPreference
      }
    end
  end

  defmodule CustomerBalance do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
    * `display_preference`
    """
    @type t :: %__MODULE__{
            available: boolean() | nil,
            display_preference: __MODULE__.DisplayPreference.t() | nil
          }
    defstruct [:available, :display_preference]

    defmodule DisplayPreference do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
      * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
      * `value` - The effective display preference value. Possible values: `off`, `on`.
      """
      @type t :: %__MODULE__{
              overridable: boolean() | nil,
              preference: String.t() | nil,
              value: String.t() | nil
            }
      defstruct [:overridable, :preference, :value]
    end

    def __inner_types__ do
      %{
        "display_preference" => __MODULE__.DisplayPreference
      }
    end
  end

  defmodule Eps do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
    * `display_preference`
    """
    @type t :: %__MODULE__{
            available: boolean() | nil,
            display_preference: __MODULE__.DisplayPreference.t() | nil
          }
    defstruct [:available, :display_preference]

    defmodule DisplayPreference do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
      * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
      * `value` - The effective display preference value. Possible values: `off`, `on`.
      """
      @type t :: %__MODULE__{
              overridable: boolean() | nil,
              preference: String.t() | nil,
              value: String.t() | nil
            }
      defstruct [:overridable, :preference, :value]
    end

    def __inner_types__ do
      %{
        "display_preference" => __MODULE__.DisplayPreference
      }
    end
  end

  defmodule Fpx do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
    * `display_preference`
    """
    @type t :: %__MODULE__{
            available: boolean() | nil,
            display_preference: __MODULE__.DisplayPreference.t() | nil
          }
    defstruct [:available, :display_preference]

    defmodule DisplayPreference do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
      * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
      * `value` - The effective display preference value. Possible values: `off`, `on`.
      """
      @type t :: %__MODULE__{
              overridable: boolean() | nil,
              preference: String.t() | nil,
              value: String.t() | nil
            }
      defstruct [:overridable, :preference, :value]
    end

    def __inner_types__ do
      %{
        "display_preference" => __MODULE__.DisplayPreference
      }
    end
  end

  defmodule Giropay do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
    * `display_preference`
    """
    @type t :: %__MODULE__{
            available: boolean() | nil,
            display_preference: __MODULE__.DisplayPreference.t() | nil
          }
    defstruct [:available, :display_preference]

    defmodule DisplayPreference do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
      * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
      * `value` - The effective display preference value. Possible values: `off`, `on`.
      """
      @type t :: %__MODULE__{
              overridable: boolean() | nil,
              preference: String.t() | nil,
              value: String.t() | nil
            }
      defstruct [:overridable, :preference, :value]
    end

    def __inner_types__ do
      %{
        "display_preference" => __MODULE__.DisplayPreference
      }
    end
  end

  defmodule GooglePay do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
    * `display_preference`
    """
    @type t :: %__MODULE__{
            available: boolean() | nil,
            display_preference: __MODULE__.DisplayPreference.t() | nil
          }
    defstruct [:available, :display_preference]

    defmodule DisplayPreference do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
      * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
      * `value` - The effective display preference value. Possible values: `off`, `on`.
      """
      @type t :: %__MODULE__{
              overridable: boolean() | nil,
              preference: String.t() | nil,
              value: String.t() | nil
            }
      defstruct [:overridable, :preference, :value]
    end

    def __inner_types__ do
      %{
        "display_preference" => __MODULE__.DisplayPreference
      }
    end
  end

  defmodule Grabpay do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
    * `display_preference`
    """
    @type t :: %__MODULE__{
            available: boolean() | nil,
            display_preference: __MODULE__.DisplayPreference.t() | nil
          }
    defstruct [:available, :display_preference]

    defmodule DisplayPreference do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
      * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
      * `value` - The effective display preference value. Possible values: `off`, `on`.
      """
      @type t :: %__MODULE__{
              overridable: boolean() | nil,
              preference: String.t() | nil,
              value: String.t() | nil
            }
      defstruct [:overridable, :preference, :value]
    end

    def __inner_types__ do
      %{
        "display_preference" => __MODULE__.DisplayPreference
      }
    end
  end

  defmodule Ideal do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
    * `display_preference`
    """
    @type t :: %__MODULE__{
            available: boolean() | nil,
            display_preference: __MODULE__.DisplayPreference.t() | nil
          }
    defstruct [:available, :display_preference]

    defmodule DisplayPreference do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
      * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
      * `value` - The effective display preference value. Possible values: `off`, `on`.
      """
      @type t :: %__MODULE__{
              overridable: boolean() | nil,
              preference: String.t() | nil,
              value: String.t() | nil
            }
      defstruct [:overridable, :preference, :value]
    end

    def __inner_types__ do
      %{
        "display_preference" => __MODULE__.DisplayPreference
      }
    end
  end

  defmodule Jcb do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
    * `display_preference`
    """
    @type t :: %__MODULE__{
            available: boolean() | nil,
            display_preference: __MODULE__.DisplayPreference.t() | nil
          }
    defstruct [:available, :display_preference]

    defmodule DisplayPreference do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
      * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
      * `value` - The effective display preference value. Possible values: `off`, `on`.
      """
      @type t :: %__MODULE__{
              overridable: boolean() | nil,
              preference: String.t() | nil,
              value: String.t() | nil
            }
      defstruct [:overridable, :preference, :value]
    end

    def __inner_types__ do
      %{
        "display_preference" => __MODULE__.DisplayPreference
      }
    end
  end

  defmodule KakaoPay do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
    * `display_preference`
    """
    @type t :: %__MODULE__{
            available: boolean() | nil,
            display_preference: __MODULE__.DisplayPreference.t() | nil
          }
    defstruct [:available, :display_preference]

    defmodule DisplayPreference do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
      * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
      * `value` - The effective display preference value. Possible values: `off`, `on`.
      """
      @type t :: %__MODULE__{
              overridable: boolean() | nil,
              preference: String.t() | nil,
              value: String.t() | nil
            }
      defstruct [:overridable, :preference, :value]
    end

    def __inner_types__ do
      %{
        "display_preference" => __MODULE__.DisplayPreference
      }
    end
  end

  defmodule Klarna do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
    * `display_preference`
    """
    @type t :: %__MODULE__{
            available: boolean() | nil,
            display_preference: __MODULE__.DisplayPreference.t() | nil
          }
    defstruct [:available, :display_preference]

    defmodule DisplayPreference do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
      * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
      * `value` - The effective display preference value. Possible values: `off`, `on`.
      """
      @type t :: %__MODULE__{
              overridable: boolean() | nil,
              preference: String.t() | nil,
              value: String.t() | nil
            }
      defstruct [:overridable, :preference, :value]
    end

    def __inner_types__ do
      %{
        "display_preference" => __MODULE__.DisplayPreference
      }
    end
  end

  defmodule Konbini do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
    * `display_preference`
    """
    @type t :: %__MODULE__{
            available: boolean() | nil,
            display_preference: __MODULE__.DisplayPreference.t() | nil
          }
    defstruct [:available, :display_preference]

    defmodule DisplayPreference do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
      * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
      * `value` - The effective display preference value. Possible values: `off`, `on`.
      """
      @type t :: %__MODULE__{
              overridable: boolean() | nil,
              preference: String.t() | nil,
              value: String.t() | nil
            }
      defstruct [:overridable, :preference, :value]
    end

    def __inner_types__ do
      %{
        "display_preference" => __MODULE__.DisplayPreference
      }
    end
  end

  defmodule KrCard do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
    * `display_preference`
    """
    @type t :: %__MODULE__{
            available: boolean() | nil,
            display_preference: __MODULE__.DisplayPreference.t() | nil
          }
    defstruct [:available, :display_preference]

    defmodule DisplayPreference do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
      * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
      * `value` - The effective display preference value. Possible values: `off`, `on`.
      """
      @type t :: %__MODULE__{
              overridable: boolean() | nil,
              preference: String.t() | nil,
              value: String.t() | nil
            }
      defstruct [:overridable, :preference, :value]
    end

    def __inner_types__ do
      %{
        "display_preference" => __MODULE__.DisplayPreference
      }
    end
  end

  defmodule Link do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
    * `display_preference`
    """
    @type t :: %__MODULE__{
            available: boolean() | nil,
            display_preference: __MODULE__.DisplayPreference.t() | nil
          }
    defstruct [:available, :display_preference]

    defmodule DisplayPreference do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
      * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
      * `value` - The effective display preference value. Possible values: `off`, `on`.
      """
      @type t :: %__MODULE__{
              overridable: boolean() | nil,
              preference: String.t() | nil,
              value: String.t() | nil
            }
      defstruct [:overridable, :preference, :value]
    end

    def __inner_types__ do
      %{
        "display_preference" => __MODULE__.DisplayPreference
      }
    end
  end

  defmodule MbWay do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
    * `display_preference`
    """
    @type t :: %__MODULE__{
            available: boolean() | nil,
            display_preference: __MODULE__.DisplayPreference.t() | nil
          }
    defstruct [:available, :display_preference]

    defmodule DisplayPreference do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
      * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
      * `value` - The effective display preference value. Possible values: `off`, `on`.
      """
      @type t :: %__MODULE__{
              overridable: boolean() | nil,
              preference: String.t() | nil,
              value: String.t() | nil
            }
      defstruct [:overridable, :preference, :value]
    end

    def __inner_types__ do
      %{
        "display_preference" => __MODULE__.DisplayPreference
      }
    end
  end

  defmodule Mobilepay do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
    * `display_preference`
    """
    @type t :: %__MODULE__{
            available: boolean() | nil,
            display_preference: __MODULE__.DisplayPreference.t() | nil
          }
    defstruct [:available, :display_preference]

    defmodule DisplayPreference do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
      * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
      * `value` - The effective display preference value. Possible values: `off`, `on`.
      """
      @type t :: %__MODULE__{
              overridable: boolean() | nil,
              preference: String.t() | nil,
              value: String.t() | nil
            }
      defstruct [:overridable, :preference, :value]
    end

    def __inner_types__ do
      %{
        "display_preference" => __MODULE__.DisplayPreference
      }
    end
  end

  defmodule Multibanco do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
    * `display_preference`
    """
    @type t :: %__MODULE__{
            available: boolean() | nil,
            display_preference: __MODULE__.DisplayPreference.t() | nil
          }
    defstruct [:available, :display_preference]

    defmodule DisplayPreference do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
      * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
      * `value` - The effective display preference value. Possible values: `off`, `on`.
      """
      @type t :: %__MODULE__{
              overridable: boolean() | nil,
              preference: String.t() | nil,
              value: String.t() | nil
            }
      defstruct [:overridable, :preference, :value]
    end

    def __inner_types__ do
      %{
        "display_preference" => __MODULE__.DisplayPreference
      }
    end
  end

  defmodule NaverPay do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
    * `display_preference`
    """
    @type t :: %__MODULE__{
            available: boolean() | nil,
            display_preference: __MODULE__.DisplayPreference.t() | nil
          }
    defstruct [:available, :display_preference]

    defmodule DisplayPreference do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
      * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
      * `value` - The effective display preference value. Possible values: `off`, `on`.
      """
      @type t :: %__MODULE__{
              overridable: boolean() | nil,
              preference: String.t() | nil,
              value: String.t() | nil
            }
      defstruct [:overridable, :preference, :value]
    end

    def __inner_types__ do
      %{
        "display_preference" => __MODULE__.DisplayPreference
      }
    end
  end

  defmodule NzBankAccount do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
    * `display_preference`
    """
    @type t :: %__MODULE__{
            available: boolean() | nil,
            display_preference: __MODULE__.DisplayPreference.t() | nil
          }
    defstruct [:available, :display_preference]

    defmodule DisplayPreference do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
      * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
      * `value` - The effective display preference value. Possible values: `off`, `on`.
      """
      @type t :: %__MODULE__{
              overridable: boolean() | nil,
              preference: String.t() | nil,
              value: String.t() | nil
            }
      defstruct [:overridable, :preference, :value]
    end

    def __inner_types__ do
      %{
        "display_preference" => __MODULE__.DisplayPreference
      }
    end
  end

  defmodule Oxxo do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
    * `display_preference`
    """
    @type t :: %__MODULE__{
            available: boolean() | nil,
            display_preference: __MODULE__.DisplayPreference.t() | nil
          }
    defstruct [:available, :display_preference]

    defmodule DisplayPreference do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
      * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
      * `value` - The effective display preference value. Possible values: `off`, `on`.
      """
      @type t :: %__MODULE__{
              overridable: boolean() | nil,
              preference: String.t() | nil,
              value: String.t() | nil
            }
      defstruct [:overridable, :preference, :value]
    end

    def __inner_types__ do
      %{
        "display_preference" => __MODULE__.DisplayPreference
      }
    end
  end

  defmodule P24 do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
    * `display_preference`
    """
    @type t :: %__MODULE__{
            available: boolean() | nil,
            display_preference: __MODULE__.DisplayPreference.t() | nil
          }
    defstruct [:available, :display_preference]

    defmodule DisplayPreference do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
      * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
      * `value` - The effective display preference value. Possible values: `off`, `on`.
      """
      @type t :: %__MODULE__{
              overridable: boolean() | nil,
              preference: String.t() | nil,
              value: String.t() | nil
            }
      defstruct [:overridable, :preference, :value]
    end

    def __inner_types__ do
      %{
        "display_preference" => __MODULE__.DisplayPreference
      }
    end
  end

  defmodule PayByBank do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
    * `display_preference`
    """
    @type t :: %__MODULE__{
            available: boolean() | nil,
            display_preference: __MODULE__.DisplayPreference.t() | nil
          }
    defstruct [:available, :display_preference]

    defmodule DisplayPreference do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
      * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
      * `value` - The effective display preference value. Possible values: `off`, `on`.
      """
      @type t :: %__MODULE__{
              overridable: boolean() | nil,
              preference: String.t() | nil,
              value: String.t() | nil
            }
      defstruct [:overridable, :preference, :value]
    end

    def __inner_types__ do
      %{
        "display_preference" => __MODULE__.DisplayPreference
      }
    end
  end

  defmodule Payco do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
    * `display_preference`
    """
    @type t :: %__MODULE__{
            available: boolean() | nil,
            display_preference: __MODULE__.DisplayPreference.t() | nil
          }
    defstruct [:available, :display_preference]

    defmodule DisplayPreference do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
      * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
      * `value` - The effective display preference value. Possible values: `off`, `on`.
      """
      @type t :: %__MODULE__{
              overridable: boolean() | nil,
              preference: String.t() | nil,
              value: String.t() | nil
            }
      defstruct [:overridable, :preference, :value]
    end

    def __inner_types__ do
      %{
        "display_preference" => __MODULE__.DisplayPreference
      }
    end
  end

  defmodule Paynow do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
    * `display_preference`
    """
    @type t :: %__MODULE__{
            available: boolean() | nil,
            display_preference: __MODULE__.DisplayPreference.t() | nil
          }
    defstruct [:available, :display_preference]

    defmodule DisplayPreference do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
      * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
      * `value` - The effective display preference value. Possible values: `off`, `on`.
      """
      @type t :: %__MODULE__{
              overridable: boolean() | nil,
              preference: String.t() | nil,
              value: String.t() | nil
            }
      defstruct [:overridable, :preference, :value]
    end

    def __inner_types__ do
      %{
        "display_preference" => __MODULE__.DisplayPreference
      }
    end
  end

  defmodule Paypal do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
    * `display_preference`
    """
    @type t :: %__MODULE__{
            available: boolean() | nil,
            display_preference: __MODULE__.DisplayPreference.t() | nil
          }
    defstruct [:available, :display_preference]

    defmodule DisplayPreference do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
      * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
      * `value` - The effective display preference value. Possible values: `off`, `on`.
      """
      @type t :: %__MODULE__{
              overridable: boolean() | nil,
              preference: String.t() | nil,
              value: String.t() | nil
            }
      defstruct [:overridable, :preference, :value]
    end

    def __inner_types__ do
      %{
        "display_preference" => __MODULE__.DisplayPreference
      }
    end
  end

  defmodule Payto do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
    * `display_preference`
    """
    @type t :: %__MODULE__{
            available: boolean() | nil,
            display_preference: __MODULE__.DisplayPreference.t() | nil
          }
    defstruct [:available, :display_preference]

    defmodule DisplayPreference do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
      * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
      * `value` - The effective display preference value. Possible values: `off`, `on`.
      """
      @type t :: %__MODULE__{
              overridable: boolean() | nil,
              preference: String.t() | nil,
              value: String.t() | nil
            }
      defstruct [:overridable, :preference, :value]
    end

    def __inner_types__ do
      %{
        "display_preference" => __MODULE__.DisplayPreference
      }
    end
  end

  defmodule Pix do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
    * `display_preference`
    """
    @type t :: %__MODULE__{
            available: boolean() | nil,
            display_preference: __MODULE__.DisplayPreference.t() | nil
          }
    defstruct [:available, :display_preference]

    defmodule DisplayPreference do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
      * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
      * `value` - The effective display preference value. Possible values: `off`, `on`.
      """
      @type t :: %__MODULE__{
              overridable: boolean() | nil,
              preference: String.t() | nil,
              value: String.t() | nil
            }
      defstruct [:overridable, :preference, :value]
    end

    def __inner_types__ do
      %{
        "display_preference" => __MODULE__.DisplayPreference
      }
    end
  end

  defmodule Promptpay do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
    * `display_preference`
    """
    @type t :: %__MODULE__{
            available: boolean() | nil,
            display_preference: __MODULE__.DisplayPreference.t() | nil
          }
    defstruct [:available, :display_preference]

    defmodule DisplayPreference do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
      * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
      * `value` - The effective display preference value. Possible values: `off`, `on`.
      """
      @type t :: %__MODULE__{
              overridable: boolean() | nil,
              preference: String.t() | nil,
              value: String.t() | nil
            }
      defstruct [:overridable, :preference, :value]
    end

    def __inner_types__ do
      %{
        "display_preference" => __MODULE__.DisplayPreference
      }
    end
  end

  defmodule RevolutPay do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
    * `display_preference`
    """
    @type t :: %__MODULE__{
            available: boolean() | nil,
            display_preference: __MODULE__.DisplayPreference.t() | nil
          }
    defstruct [:available, :display_preference]

    defmodule DisplayPreference do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
      * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
      * `value` - The effective display preference value. Possible values: `off`, `on`.
      """
      @type t :: %__MODULE__{
              overridable: boolean() | nil,
              preference: String.t() | nil,
              value: String.t() | nil
            }
      defstruct [:overridable, :preference, :value]
    end

    def __inner_types__ do
      %{
        "display_preference" => __MODULE__.DisplayPreference
      }
    end
  end

  defmodule SamsungPay do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
    * `display_preference`
    """
    @type t :: %__MODULE__{
            available: boolean() | nil,
            display_preference: __MODULE__.DisplayPreference.t() | nil
          }
    defstruct [:available, :display_preference]

    defmodule DisplayPreference do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
      * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
      * `value` - The effective display preference value. Possible values: `off`, `on`.
      """
      @type t :: %__MODULE__{
              overridable: boolean() | nil,
              preference: String.t() | nil,
              value: String.t() | nil
            }
      defstruct [:overridable, :preference, :value]
    end

    def __inner_types__ do
      %{
        "display_preference" => __MODULE__.DisplayPreference
      }
    end
  end

  defmodule Satispay do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
    * `display_preference`
    """
    @type t :: %__MODULE__{
            available: boolean() | nil,
            display_preference: __MODULE__.DisplayPreference.t() | nil
          }
    defstruct [:available, :display_preference]

    defmodule DisplayPreference do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
      * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
      * `value` - The effective display preference value. Possible values: `off`, `on`.
      """
      @type t :: %__MODULE__{
              overridable: boolean() | nil,
              preference: String.t() | nil,
              value: String.t() | nil
            }
      defstruct [:overridable, :preference, :value]
    end

    def __inner_types__ do
      %{
        "display_preference" => __MODULE__.DisplayPreference
      }
    end
  end

  defmodule SepaDebit do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
    * `display_preference`
    """
    @type t :: %__MODULE__{
            available: boolean() | nil,
            display_preference: __MODULE__.DisplayPreference.t() | nil
          }
    defstruct [:available, :display_preference]

    defmodule DisplayPreference do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
      * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
      * `value` - The effective display preference value. Possible values: `off`, `on`.
      """
      @type t :: %__MODULE__{
              overridable: boolean() | nil,
              preference: String.t() | nil,
              value: String.t() | nil
            }
      defstruct [:overridable, :preference, :value]
    end

    def __inner_types__ do
      %{
        "display_preference" => __MODULE__.DisplayPreference
      }
    end
  end

  defmodule Sofort do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
    * `display_preference`
    """
    @type t :: %__MODULE__{
            available: boolean() | nil,
            display_preference: __MODULE__.DisplayPreference.t() | nil
          }
    defstruct [:available, :display_preference]

    defmodule DisplayPreference do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
      * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
      * `value` - The effective display preference value. Possible values: `off`, `on`.
      """
      @type t :: %__MODULE__{
              overridable: boolean() | nil,
              preference: String.t() | nil,
              value: String.t() | nil
            }
      defstruct [:overridable, :preference, :value]
    end

    def __inner_types__ do
      %{
        "display_preference" => __MODULE__.DisplayPreference
      }
    end
  end

  defmodule Swish do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
    * `display_preference`
    """
    @type t :: %__MODULE__{
            available: boolean() | nil,
            display_preference: __MODULE__.DisplayPreference.t() | nil
          }
    defstruct [:available, :display_preference]

    defmodule DisplayPreference do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
      * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
      * `value` - The effective display preference value. Possible values: `off`, `on`.
      """
      @type t :: %__MODULE__{
              overridable: boolean() | nil,
              preference: String.t() | nil,
              value: String.t() | nil
            }
      defstruct [:overridable, :preference, :value]
    end

    def __inner_types__ do
      %{
        "display_preference" => __MODULE__.DisplayPreference
      }
    end
  end

  defmodule Twint do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
    * `display_preference`
    """
    @type t :: %__MODULE__{
            available: boolean() | nil,
            display_preference: __MODULE__.DisplayPreference.t() | nil
          }
    defstruct [:available, :display_preference]

    defmodule DisplayPreference do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
      * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
      * `value` - The effective display preference value. Possible values: `off`, `on`.
      """
      @type t :: %__MODULE__{
              overridable: boolean() | nil,
              preference: String.t() | nil,
              value: String.t() | nil
            }
      defstruct [:overridable, :preference, :value]
    end

    def __inner_types__ do
      %{
        "display_preference" => __MODULE__.DisplayPreference
      }
    end
  end

  defmodule Upi do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
    * `display_preference`
    """
    @type t :: %__MODULE__{
            available: boolean() | nil,
            display_preference: __MODULE__.DisplayPreference.t() | nil
          }
    defstruct [:available, :display_preference]

    defmodule DisplayPreference do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
      * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
      * `value` - The effective display preference value. Possible values: `off`, `on`.
      """
      @type t :: %__MODULE__{
              overridable: boolean() | nil,
              preference: String.t() | nil,
              value: String.t() | nil
            }
      defstruct [:overridable, :preference, :value]
    end

    def __inner_types__ do
      %{
        "display_preference" => __MODULE__.DisplayPreference
      }
    end
  end

  defmodule UsBankAccount do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
    * `display_preference`
    """
    @type t :: %__MODULE__{
            available: boolean() | nil,
            display_preference: __MODULE__.DisplayPreference.t() | nil
          }
    defstruct [:available, :display_preference]

    defmodule DisplayPreference do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
      * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
      * `value` - The effective display preference value. Possible values: `off`, `on`.
      """
      @type t :: %__MODULE__{
              overridable: boolean() | nil,
              preference: String.t() | nil,
              value: String.t() | nil
            }
      defstruct [:overridable, :preference, :value]
    end

    def __inner_types__ do
      %{
        "display_preference" => __MODULE__.DisplayPreference
      }
    end
  end

  defmodule WechatPay do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
    * `display_preference`
    """
    @type t :: %__MODULE__{
            available: boolean() | nil,
            display_preference: __MODULE__.DisplayPreference.t() | nil
          }
    defstruct [:available, :display_preference]

    defmodule DisplayPreference do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
      * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
      * `value` - The effective display preference value. Possible values: `off`, `on`.
      """
      @type t :: %__MODULE__{
              overridable: boolean() | nil,
              preference: String.t() | nil,
              value: String.t() | nil
            }
      defstruct [:overridable, :preference, :value]
    end

    def __inner_types__ do
      %{
        "display_preference" => __MODULE__.DisplayPreference
      }
    end
  end

  defmodule Zip do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
    * `display_preference`
    """
    @type t :: %__MODULE__{
            available: boolean() | nil,
            display_preference: __MODULE__.DisplayPreference.t() | nil
          }
    defstruct [:available, :display_preference]

    defmodule DisplayPreference do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
      * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
      * `value` - The effective display preference value. Possible values: `off`, `on`.
      """
      @type t :: %__MODULE__{
              overridable: boolean() | nil,
              preference: String.t() | nil,
              value: String.t() | nil
            }
      defstruct [:overridable, :preference, :value]
    end

    def __inner_types__ do
      %{
        "display_preference" => __MODULE__.DisplayPreference
      }
    end
  end

  def __inner_types__ do
    %{
      "acss_debit" => __MODULE__.AcssDebit,
      "affirm" => __MODULE__.Affirm,
      "afterpay_clearpay" => __MODULE__.AfterpayClearpay,
      "alipay" => __MODULE__.Alipay,
      "alma" => __MODULE__.Alma,
      "amazon_pay" => __MODULE__.AmazonPay,
      "apple_pay" => __MODULE__.ApplePay,
      "au_becs_debit" => __MODULE__.AuBecsDebit,
      "bacs_debit" => __MODULE__.BacsDebit,
      "bancontact" => __MODULE__.Bancontact,
      "billie" => __MODULE__.Billie,
      "blik" => __MODULE__.Blik,
      "boleto" => __MODULE__.Boleto,
      "card" => __MODULE__.Card,
      "cartes_bancaires" => __MODULE__.CartesBancaires,
      "cashapp" => __MODULE__.Cashapp,
      "crypto" => __MODULE__.Crypto,
      "customer_balance" => __MODULE__.CustomerBalance,
      "eps" => __MODULE__.Eps,
      "fpx" => __MODULE__.Fpx,
      "giropay" => __MODULE__.Giropay,
      "google_pay" => __MODULE__.GooglePay,
      "grabpay" => __MODULE__.Grabpay,
      "ideal" => __MODULE__.Ideal,
      "jcb" => __MODULE__.Jcb,
      "kakao_pay" => __MODULE__.KakaoPay,
      "klarna" => __MODULE__.Klarna,
      "konbini" => __MODULE__.Konbini,
      "kr_card" => __MODULE__.KrCard,
      "link" => __MODULE__.Link,
      "mb_way" => __MODULE__.MbWay,
      "mobilepay" => __MODULE__.Mobilepay,
      "multibanco" => __MODULE__.Multibanco,
      "naver_pay" => __MODULE__.NaverPay,
      "nz_bank_account" => __MODULE__.NzBankAccount,
      "oxxo" => __MODULE__.Oxxo,
      "p24" => __MODULE__.P24,
      "pay_by_bank" => __MODULE__.PayByBank,
      "payco" => __MODULE__.Payco,
      "paynow" => __MODULE__.Paynow,
      "paypal" => __MODULE__.Paypal,
      "payto" => __MODULE__.Payto,
      "pix" => __MODULE__.Pix,
      "promptpay" => __MODULE__.Promptpay,
      "revolut_pay" => __MODULE__.RevolutPay,
      "samsung_pay" => __MODULE__.SamsungPay,
      "satispay" => __MODULE__.Satispay,
      "sepa_debit" => __MODULE__.SepaDebit,
      "sofort" => __MODULE__.Sofort,
      "swish" => __MODULE__.Swish,
      "twint" => __MODULE__.Twint,
      "upi" => __MODULE__.Upi,
      "us_bank_account" => __MODULE__.UsBankAccount,
      "wechat_pay" => __MODULE__.WechatPay,
      "zip" => __MODULE__.Zip
    }
  end
end
