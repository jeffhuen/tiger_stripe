# File generated from our OpenAPI spec
defmodule Stripe.Params.PaymentMethodListParams do
  @moduledoc "Parameters for payment method list."

  @typedoc """
  * `allow_redisplay` - This field indicates whether this payment method can be shown again to its customer in a checkout flow. Stripe products such as Checkout and Elements use this field to determine whether a payment method can be shown as a saved payment method in a checkout flow. Possible values: `always`, `limited`, `unspecified`.
  * `customer` - The ID of the customer whose PaymentMethods will be retrieved. Max length: 5000.
  * `customer_account` - The ID of the Account whose PaymentMethods will be retrieved. Max length: 5000.
  * `ending_before` - A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. Max length: 5000.
  * `expand` - Specifies which fields in the response should be expanded.
  * `limit` - A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
  * `starting_after` - A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. Max length: 5000.
  * `type` - Filters the list by the object `type` field. Unfiltered, the list returns all payment method types except `custom`. If your integration expects only one type of payment method in the response, specify that type value in the request to reduce your payload. Possible values: `acss_debit`, `affirm`, `afterpay_clearpay`, `alipay`, `alma`, `amazon_pay`, `au_becs_debit`, `bacs_debit`, `bancontact`, `billie`, `blik`, `boleto`, `card`, `cashapp`, `crypto`, `custom`, `customer_balance`, `eps`, `fpx`, `giropay`, `grabpay`, `ideal`, `kakao_pay`, `klarna`, `konbini`, `kr_card`, `link`, `mb_way`, `mobilepay`, `multibanco`, `naver_pay`, `nz_bank_account`, `oxxo`, `p24`, `pay_by_bank`, `payco`, `paynow`, `paypal`, `payto`, `pix`, `promptpay`, `revolut_pay`, `samsung_pay`, `satispay`, `sepa_debit`, `sofort`, `swish`, `twint`, `us_bank_account`, `wechat_pay`, `zip`.
  """
  @type t :: %__MODULE__{
          allow_redisplay: String.t() | nil,
          customer: String.t() | nil,
          customer_account: String.t() | nil,
          ending_before: String.t() | nil,
          expand: [String.t()] | nil,
          limit: integer() | nil,
          starting_after: String.t() | nil,
          type: String.t() | nil
        }

  defstruct [
    :allow_redisplay,
    :customer,
    :customer_account,
    :ending_before,
    :expand,
    :limit,
    :starting_after,
    :type
  ]
end
