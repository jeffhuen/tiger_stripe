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
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
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
  * `us_bank_account` - Expandable.
  * `wechat_pay` - Expandable.
  * `zip` - Expandable.
  """
  @type t :: %__MODULE__{
          acss_debit: acss_debit() | nil,
          active: boolean(),
          affirm: affirm() | nil,
          afterpay_clearpay: afterpay_clearpay() | nil,
          alipay: alipay() | nil,
          alma: alma() | nil,
          amazon_pay: amazon_pay() | nil,
          apple_pay: apple_pay() | nil,
          application: String.t(),
          au_becs_debit: au_becs_debit() | nil,
          bacs_debit: bacs_debit() | nil,
          bancontact: bancontact() | nil,
          billie: billie() | nil,
          blik: blik() | nil,
          boleto: boleto() | nil,
          card: card() | nil,
          cartes_bancaires: cartes_bancaires() | nil,
          cashapp: cashapp() | nil,
          crypto: crypto() | nil,
          customer_balance: customer_balance() | nil,
          eps: eps() | nil,
          fpx: fpx() | nil,
          giropay: giropay() | nil,
          google_pay: google_pay() | nil,
          grabpay: grabpay() | nil,
          id: String.t(),
          ideal: ideal() | nil,
          is_default: boolean(),
          jcb: jcb() | nil,
          kakao_pay: kakao_pay() | nil,
          klarna: klarna() | nil,
          konbini: konbini() | nil,
          kr_card: kr_card() | nil,
          link: link() | nil,
          livemode: boolean(),
          mb_way: mb_way() | nil,
          mobilepay: mobilepay() | nil,
          multibanco: multibanco() | nil,
          name: String.t(),
          naver_pay: naver_pay() | nil,
          nz_bank_account: nz_bank_account() | nil,
          object: String.t(),
          oxxo: oxxo() | nil,
          p24: p24() | nil,
          parent: String.t(),
          pay_by_bank: pay_by_bank() | nil,
          payco: payco() | nil,
          paynow: paynow() | nil,
          paypal: paypal() | nil,
          payto: payto() | nil,
          pix: pix() | nil,
          promptpay: promptpay() | nil,
          revolut_pay: revolut_pay() | nil,
          samsung_pay: samsung_pay() | nil,
          satispay: satispay() | nil,
          sepa_debit: sepa_debit() | nil,
          sofort: sofort() | nil,
          swish: swish() | nil,
          twint: twint() | nil,
          us_bank_account: us_bank_account() | nil,
          wechat_pay: wechat_pay() | nil,
          zip: zip() | nil
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
      "us_bank_account",
      "wechat_pay",
      "zip"
    ]

  @typedoc """
  * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
  * `display_preference`
  """
  @type acss_debit :: %{
          optional(:available) => boolean() | nil,
          optional(:display_preference) => acss_debit_display_preference() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
  * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
  * `value` - The effective display preference value. Possible values: `off`, `on`.
  """
  @type acss_debit_display_preference :: %{
          optional(:overridable) => boolean() | nil,
          optional(:preference) => String.t() | nil,
          optional(:value) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
  * `display_preference`
  """
  @type affirm :: %{
          optional(:available) => boolean() | nil,
          optional(:display_preference) => affirm_display_preference() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
  * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
  * `value` - The effective display preference value. Possible values: `off`, `on`.
  """
  @type affirm_display_preference :: %{
          optional(:overridable) => boolean() | nil,
          optional(:preference) => String.t() | nil,
          optional(:value) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
  * `display_preference`
  """
  @type afterpay_clearpay :: %{
          optional(:available) => boolean() | nil,
          optional(:display_preference) => afterpay_clearpay_display_preference() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
  * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
  * `value` - The effective display preference value. Possible values: `off`, `on`.
  """
  @type afterpay_clearpay_display_preference :: %{
          optional(:overridable) => boolean() | nil,
          optional(:preference) => String.t() | nil,
          optional(:value) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
  * `display_preference`
  """
  @type alipay :: %{
          optional(:available) => boolean() | nil,
          optional(:display_preference) => alipay_display_preference() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
  * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
  * `value` - The effective display preference value. Possible values: `off`, `on`.
  """
  @type alipay_display_preference :: %{
          optional(:overridable) => boolean() | nil,
          optional(:preference) => String.t() | nil,
          optional(:value) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
  * `display_preference`
  """
  @type alma :: %{
          optional(:available) => boolean() | nil,
          optional(:display_preference) => alma_display_preference() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
  * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
  * `value` - The effective display preference value. Possible values: `off`, `on`.
  """
  @type alma_display_preference :: %{
          optional(:overridable) => boolean() | nil,
          optional(:preference) => String.t() | nil,
          optional(:value) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
  * `display_preference`
  """
  @type amazon_pay :: %{
          optional(:available) => boolean() | nil,
          optional(:display_preference) => amazon_pay_display_preference() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
  * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
  * `value` - The effective display preference value. Possible values: `off`, `on`.
  """
  @type amazon_pay_display_preference :: %{
          optional(:overridable) => boolean() | nil,
          optional(:preference) => String.t() | nil,
          optional(:value) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
  * `display_preference`
  """
  @type apple_pay :: %{
          optional(:available) => boolean() | nil,
          optional(:display_preference) => apple_pay_display_preference() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
  * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
  * `value` - The effective display preference value. Possible values: `off`, `on`.
  """
  @type apple_pay_display_preference :: %{
          optional(:overridable) => boolean() | nil,
          optional(:preference) => String.t() | nil,
          optional(:value) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
  * `display_preference`
  """
  @type au_becs_debit :: %{
          optional(:available) => boolean() | nil,
          optional(:display_preference) => au_becs_debit_display_preference() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
  * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
  * `value` - The effective display preference value. Possible values: `off`, `on`.
  """
  @type au_becs_debit_display_preference :: %{
          optional(:overridable) => boolean() | nil,
          optional(:preference) => String.t() | nil,
          optional(:value) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
  * `display_preference`
  """
  @type bacs_debit :: %{
          optional(:available) => boolean() | nil,
          optional(:display_preference) => bacs_debit_display_preference() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
  * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
  * `value` - The effective display preference value. Possible values: `off`, `on`.
  """
  @type bacs_debit_display_preference :: %{
          optional(:overridable) => boolean() | nil,
          optional(:preference) => String.t() | nil,
          optional(:value) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
  * `display_preference`
  """
  @type bancontact :: %{
          optional(:available) => boolean() | nil,
          optional(:display_preference) => bancontact_display_preference() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
  * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
  * `value` - The effective display preference value. Possible values: `off`, `on`.
  """
  @type bancontact_display_preference :: %{
          optional(:overridable) => boolean() | nil,
          optional(:preference) => String.t() | nil,
          optional(:value) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
  * `display_preference`
  """
  @type billie :: %{
          optional(:available) => boolean() | nil,
          optional(:display_preference) => billie_display_preference() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
  * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
  * `value` - The effective display preference value. Possible values: `off`, `on`.
  """
  @type billie_display_preference :: %{
          optional(:overridable) => boolean() | nil,
          optional(:preference) => String.t() | nil,
          optional(:value) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
  * `display_preference`
  """
  @type blik :: %{
          optional(:available) => boolean() | nil,
          optional(:display_preference) => blik_display_preference() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
  * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
  * `value` - The effective display preference value. Possible values: `off`, `on`.
  """
  @type blik_display_preference :: %{
          optional(:overridable) => boolean() | nil,
          optional(:preference) => String.t() | nil,
          optional(:value) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
  * `display_preference`
  """
  @type boleto :: %{
          optional(:available) => boolean() | nil,
          optional(:display_preference) => boleto_display_preference() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
  * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
  * `value` - The effective display preference value. Possible values: `off`, `on`.
  """
  @type boleto_display_preference :: %{
          optional(:overridable) => boolean() | nil,
          optional(:preference) => String.t() | nil,
          optional(:value) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
  * `display_preference`
  """
  @type card :: %{
          optional(:available) => boolean() | nil,
          optional(:display_preference) => card_display_preference() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
  * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
  * `value` - The effective display preference value. Possible values: `off`, `on`.
  """
  @type card_display_preference :: %{
          optional(:overridable) => boolean() | nil,
          optional(:preference) => String.t() | nil,
          optional(:value) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
  * `display_preference`
  """
  @type cartes_bancaires :: %{
          optional(:available) => boolean() | nil,
          optional(:display_preference) => cartes_bancaires_display_preference() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
  * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
  * `value` - The effective display preference value. Possible values: `off`, `on`.
  """
  @type cartes_bancaires_display_preference :: %{
          optional(:overridable) => boolean() | nil,
          optional(:preference) => String.t() | nil,
          optional(:value) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
  * `display_preference`
  """
  @type cashapp :: %{
          optional(:available) => boolean() | nil,
          optional(:display_preference) => cashapp_display_preference() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
  * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
  * `value` - The effective display preference value. Possible values: `off`, `on`.
  """
  @type cashapp_display_preference :: %{
          optional(:overridable) => boolean() | nil,
          optional(:preference) => String.t() | nil,
          optional(:value) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
  * `display_preference`
  """
  @type crypto :: %{
          optional(:available) => boolean() | nil,
          optional(:display_preference) => crypto_display_preference() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
  * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
  * `value` - The effective display preference value. Possible values: `off`, `on`.
  """
  @type crypto_display_preference :: %{
          optional(:overridable) => boolean() | nil,
          optional(:preference) => String.t() | nil,
          optional(:value) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
  * `display_preference`
  """
  @type customer_balance :: %{
          optional(:available) => boolean() | nil,
          optional(:display_preference) => customer_balance_display_preference() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
  * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
  * `value` - The effective display preference value. Possible values: `off`, `on`.
  """
  @type customer_balance_display_preference :: %{
          optional(:overridable) => boolean() | nil,
          optional(:preference) => String.t() | nil,
          optional(:value) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
  * `display_preference`
  """
  @type eps :: %{
          optional(:available) => boolean() | nil,
          optional(:display_preference) => eps_display_preference() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
  * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
  * `value` - The effective display preference value. Possible values: `off`, `on`.
  """
  @type eps_display_preference :: %{
          optional(:overridable) => boolean() | nil,
          optional(:preference) => String.t() | nil,
          optional(:value) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
  * `display_preference`
  """
  @type fpx :: %{
          optional(:available) => boolean() | nil,
          optional(:display_preference) => fpx_display_preference() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
  * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
  * `value` - The effective display preference value. Possible values: `off`, `on`.
  """
  @type fpx_display_preference :: %{
          optional(:overridable) => boolean() | nil,
          optional(:preference) => String.t() | nil,
          optional(:value) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
  * `display_preference`
  """
  @type giropay :: %{
          optional(:available) => boolean() | nil,
          optional(:display_preference) => giropay_display_preference() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
  * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
  * `value` - The effective display preference value. Possible values: `off`, `on`.
  """
  @type giropay_display_preference :: %{
          optional(:overridable) => boolean() | nil,
          optional(:preference) => String.t() | nil,
          optional(:value) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
  * `display_preference`
  """
  @type google_pay :: %{
          optional(:available) => boolean() | nil,
          optional(:display_preference) => google_pay_display_preference() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
  * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
  * `value` - The effective display preference value. Possible values: `off`, `on`.
  """
  @type google_pay_display_preference :: %{
          optional(:overridable) => boolean() | nil,
          optional(:preference) => String.t() | nil,
          optional(:value) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
  * `display_preference`
  """
  @type grabpay :: %{
          optional(:available) => boolean() | nil,
          optional(:display_preference) => grabpay_display_preference() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
  * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
  * `value` - The effective display preference value. Possible values: `off`, `on`.
  """
  @type grabpay_display_preference :: %{
          optional(:overridable) => boolean() | nil,
          optional(:preference) => String.t() | nil,
          optional(:value) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
  * `display_preference`
  """
  @type ideal :: %{
          optional(:available) => boolean() | nil,
          optional(:display_preference) => ideal_display_preference() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
  * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
  * `value` - The effective display preference value. Possible values: `off`, `on`.
  """
  @type ideal_display_preference :: %{
          optional(:overridable) => boolean() | nil,
          optional(:preference) => String.t() | nil,
          optional(:value) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
  * `display_preference`
  """
  @type jcb :: %{
          optional(:available) => boolean() | nil,
          optional(:display_preference) => jcb_display_preference() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
  * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
  * `value` - The effective display preference value. Possible values: `off`, `on`.
  """
  @type jcb_display_preference :: %{
          optional(:overridable) => boolean() | nil,
          optional(:preference) => String.t() | nil,
          optional(:value) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
  * `display_preference`
  """
  @type kakao_pay :: %{
          optional(:available) => boolean() | nil,
          optional(:display_preference) => kakao_pay_display_preference() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
  * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
  * `value` - The effective display preference value. Possible values: `off`, `on`.
  """
  @type kakao_pay_display_preference :: %{
          optional(:overridable) => boolean() | nil,
          optional(:preference) => String.t() | nil,
          optional(:value) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
  * `display_preference`
  """
  @type klarna :: %{
          optional(:available) => boolean() | nil,
          optional(:display_preference) => klarna_display_preference() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
  * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
  * `value` - The effective display preference value. Possible values: `off`, `on`.
  """
  @type klarna_display_preference :: %{
          optional(:overridable) => boolean() | nil,
          optional(:preference) => String.t() | nil,
          optional(:value) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
  * `display_preference`
  """
  @type konbini :: %{
          optional(:available) => boolean() | nil,
          optional(:display_preference) => konbini_display_preference() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
  * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
  * `value` - The effective display preference value. Possible values: `off`, `on`.
  """
  @type konbini_display_preference :: %{
          optional(:overridable) => boolean() | nil,
          optional(:preference) => String.t() | nil,
          optional(:value) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
  * `display_preference`
  """
  @type kr_card :: %{
          optional(:available) => boolean() | nil,
          optional(:display_preference) => kr_card_display_preference() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
  * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
  * `value` - The effective display preference value. Possible values: `off`, `on`.
  """
  @type kr_card_display_preference :: %{
          optional(:overridable) => boolean() | nil,
          optional(:preference) => String.t() | nil,
          optional(:value) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
  * `display_preference`
  """
  @type link :: %{
          optional(:available) => boolean() | nil,
          optional(:display_preference) => link_display_preference() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
  * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
  * `value` - The effective display preference value. Possible values: `off`, `on`.
  """
  @type link_display_preference :: %{
          optional(:overridable) => boolean() | nil,
          optional(:preference) => String.t() | nil,
          optional(:value) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
  * `display_preference`
  """
  @type mb_way :: %{
          optional(:available) => boolean() | nil,
          optional(:display_preference) => mb_way_display_preference() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
  * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
  * `value` - The effective display preference value. Possible values: `off`, `on`.
  """
  @type mb_way_display_preference :: %{
          optional(:overridable) => boolean() | nil,
          optional(:preference) => String.t() | nil,
          optional(:value) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
  * `display_preference`
  """
  @type mobilepay :: %{
          optional(:available) => boolean() | nil,
          optional(:display_preference) => mobilepay_display_preference() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
  * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
  * `value` - The effective display preference value. Possible values: `off`, `on`.
  """
  @type mobilepay_display_preference :: %{
          optional(:overridable) => boolean() | nil,
          optional(:preference) => String.t() | nil,
          optional(:value) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
  * `display_preference`
  """
  @type multibanco :: %{
          optional(:available) => boolean() | nil,
          optional(:display_preference) => multibanco_display_preference() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
  * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
  * `value` - The effective display preference value. Possible values: `off`, `on`.
  """
  @type multibanco_display_preference :: %{
          optional(:overridable) => boolean() | nil,
          optional(:preference) => String.t() | nil,
          optional(:value) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
  * `display_preference`
  """
  @type naver_pay :: %{
          optional(:available) => boolean() | nil,
          optional(:display_preference) => naver_pay_display_preference() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
  * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
  * `value` - The effective display preference value. Possible values: `off`, `on`.
  """
  @type naver_pay_display_preference :: %{
          optional(:overridable) => boolean() | nil,
          optional(:preference) => String.t() | nil,
          optional(:value) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
  * `display_preference`
  """
  @type nz_bank_account :: %{
          optional(:available) => boolean() | nil,
          optional(:display_preference) => nz_bank_account_display_preference() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
  * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
  * `value` - The effective display preference value. Possible values: `off`, `on`.
  """
  @type nz_bank_account_display_preference :: %{
          optional(:overridable) => boolean() | nil,
          optional(:preference) => String.t() | nil,
          optional(:value) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
  * `display_preference`
  """
  @type oxxo :: %{
          optional(:available) => boolean() | nil,
          optional(:display_preference) => oxxo_display_preference() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
  * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
  * `value` - The effective display preference value. Possible values: `off`, `on`.
  """
  @type oxxo_display_preference :: %{
          optional(:overridable) => boolean() | nil,
          optional(:preference) => String.t() | nil,
          optional(:value) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
  * `display_preference`
  """
  @type p24 :: %{
          optional(:available) => boolean() | nil,
          optional(:display_preference) => p24_display_preference() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
  * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
  * `value` - The effective display preference value. Possible values: `off`, `on`.
  """
  @type p24_display_preference :: %{
          optional(:overridable) => boolean() | nil,
          optional(:preference) => String.t() | nil,
          optional(:value) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
  * `display_preference`
  """
  @type pay_by_bank :: %{
          optional(:available) => boolean() | nil,
          optional(:display_preference) => pay_by_bank_display_preference() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
  * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
  * `value` - The effective display preference value. Possible values: `off`, `on`.
  """
  @type pay_by_bank_display_preference :: %{
          optional(:overridable) => boolean() | nil,
          optional(:preference) => String.t() | nil,
          optional(:value) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
  * `display_preference`
  """
  @type payco :: %{
          optional(:available) => boolean() | nil,
          optional(:display_preference) => payco_display_preference() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
  * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
  * `value` - The effective display preference value. Possible values: `off`, `on`.
  """
  @type payco_display_preference :: %{
          optional(:overridable) => boolean() | nil,
          optional(:preference) => String.t() | nil,
          optional(:value) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
  * `display_preference`
  """
  @type paynow :: %{
          optional(:available) => boolean() | nil,
          optional(:display_preference) => paynow_display_preference() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
  * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
  * `value` - The effective display preference value. Possible values: `off`, `on`.
  """
  @type paynow_display_preference :: %{
          optional(:overridable) => boolean() | nil,
          optional(:preference) => String.t() | nil,
          optional(:value) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
  * `display_preference`
  """
  @type paypal :: %{
          optional(:available) => boolean() | nil,
          optional(:display_preference) => paypal_display_preference() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
  * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
  * `value` - The effective display preference value. Possible values: `off`, `on`.
  """
  @type paypal_display_preference :: %{
          optional(:overridable) => boolean() | nil,
          optional(:preference) => String.t() | nil,
          optional(:value) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
  * `display_preference`
  """
  @type payto :: %{
          optional(:available) => boolean() | nil,
          optional(:display_preference) => payto_display_preference() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
  * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
  * `value` - The effective display preference value. Possible values: `off`, `on`.
  """
  @type payto_display_preference :: %{
          optional(:overridable) => boolean() | nil,
          optional(:preference) => String.t() | nil,
          optional(:value) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
  * `display_preference`
  """
  @type pix :: %{
          optional(:available) => boolean() | nil,
          optional(:display_preference) => pix_display_preference() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
  * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
  * `value` - The effective display preference value. Possible values: `off`, `on`.
  """
  @type pix_display_preference :: %{
          optional(:overridable) => boolean() | nil,
          optional(:preference) => String.t() | nil,
          optional(:value) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
  * `display_preference`
  """
  @type promptpay :: %{
          optional(:available) => boolean() | nil,
          optional(:display_preference) => promptpay_display_preference() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
  * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
  * `value` - The effective display preference value. Possible values: `off`, `on`.
  """
  @type promptpay_display_preference :: %{
          optional(:overridable) => boolean() | nil,
          optional(:preference) => String.t() | nil,
          optional(:value) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
  * `display_preference`
  """
  @type revolut_pay :: %{
          optional(:available) => boolean() | nil,
          optional(:display_preference) => revolut_pay_display_preference() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
  * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
  * `value` - The effective display preference value. Possible values: `off`, `on`.
  """
  @type revolut_pay_display_preference :: %{
          optional(:overridable) => boolean() | nil,
          optional(:preference) => String.t() | nil,
          optional(:value) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
  * `display_preference`
  """
  @type samsung_pay :: %{
          optional(:available) => boolean() | nil,
          optional(:display_preference) => samsung_pay_display_preference() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
  * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
  * `value` - The effective display preference value. Possible values: `off`, `on`.
  """
  @type samsung_pay_display_preference :: %{
          optional(:overridable) => boolean() | nil,
          optional(:preference) => String.t() | nil,
          optional(:value) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
  * `display_preference`
  """
  @type satispay :: %{
          optional(:available) => boolean() | nil,
          optional(:display_preference) => satispay_display_preference() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
  * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
  * `value` - The effective display preference value. Possible values: `off`, `on`.
  """
  @type satispay_display_preference :: %{
          optional(:overridable) => boolean() | nil,
          optional(:preference) => String.t() | nil,
          optional(:value) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
  * `display_preference`
  """
  @type sepa_debit :: %{
          optional(:available) => boolean() | nil,
          optional(:display_preference) => sepa_debit_display_preference() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
  * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
  * `value` - The effective display preference value. Possible values: `off`, `on`.
  """
  @type sepa_debit_display_preference :: %{
          optional(:overridable) => boolean() | nil,
          optional(:preference) => String.t() | nil,
          optional(:value) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
  * `display_preference`
  """
  @type sofort :: %{
          optional(:available) => boolean() | nil,
          optional(:display_preference) => sofort_display_preference() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
  * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
  * `value` - The effective display preference value. Possible values: `off`, `on`.
  """
  @type sofort_display_preference :: %{
          optional(:overridable) => boolean() | nil,
          optional(:preference) => String.t() | nil,
          optional(:value) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
  * `display_preference`
  """
  @type swish :: %{
          optional(:available) => boolean() | nil,
          optional(:display_preference) => swish_display_preference() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
  * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
  * `value` - The effective display preference value. Possible values: `off`, `on`.
  """
  @type swish_display_preference :: %{
          optional(:overridable) => boolean() | nil,
          optional(:preference) => String.t() | nil,
          optional(:value) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
  * `display_preference`
  """
  @type twint :: %{
          optional(:available) => boolean() | nil,
          optional(:display_preference) => twint_display_preference() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
  * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
  * `value` - The effective display preference value. Possible values: `off`, `on`.
  """
  @type twint_display_preference :: %{
          optional(:overridable) => boolean() | nil,
          optional(:preference) => String.t() | nil,
          optional(:value) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
  * `display_preference`
  """
  @type us_bank_account :: %{
          optional(:available) => boolean() | nil,
          optional(:display_preference) => us_bank_account_display_preference() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
  * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
  * `value` - The effective display preference value. Possible values: `off`, `on`.
  """
  @type us_bank_account_display_preference :: %{
          optional(:overridable) => boolean() | nil,
          optional(:preference) => String.t() | nil,
          optional(:value) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
  * `display_preference`
  """
  @type wechat_pay :: %{
          optional(:available) => boolean() | nil,
          optional(:display_preference) => wechat_pay_display_preference() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
  * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
  * `value` - The effective display preference value. Possible values: `off`, `on`.
  """
  @type wechat_pay_display_preference :: %{
          optional(:overridable) => boolean() | nil,
          optional(:preference) => String.t() | nil,
          optional(:value) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `available` - Whether this payment method may be offered at checkout. True if `display_preference` is `on` and the payment method's capability is active.
  * `display_preference`
  """
  @type zip :: %{
          optional(:available) => boolean() | nil,
          optional(:display_preference) => zip_display_preference() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `overridable` - For child configs, whether or not the account's preference will be observed. If `false`, the parent configuration's default is used. Nullable.
  * `preference` - The account's display preference. Possible values: `none`, `off`, `on`.
  * `value` - The effective display preference value. Possible values: `off`, `on`.
  """
  @type zip_display_preference :: %{
          optional(:overridable) => boolean() | nil,
          optional(:preference) => String.t() | nil,
          optional(:value) => String.t() | nil,
          optional(String.t()) => term()
        }

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
