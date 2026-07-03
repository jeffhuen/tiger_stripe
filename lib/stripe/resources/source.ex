# File generated from our OpenAPI spec
defmodule Stripe.Resources.Source do
  @moduledoc """
  Source

  `Source` objects allow you to accept a variety of payment methods. They
  represent a customer's payment instrument, and can be used with the Stripe API
  just like a `Card` object: once chargeable, they can be charged, or can be
  attached to customers.

  Stripe doesn't recommend using the deprecated [Sources API](https://docs.stripe.com/api/sources).
  We recommend that you adopt the [PaymentMethods API](https://docs.stripe.com/api/payment_methods).
  This newer API provides access to our latest features and payment method types.

  Related guides: [Sources API](https://docs.stripe.com/sources) and [Sources & Customers](https://docs.stripe.com/sources/customers).
  """

  @typedoc """
  * `ach_credit_transfer`
  * `ach_debit`
  * `acss_debit`
  * `alipay`
  * `allow_redisplay` - This field indicates whether this payment method can be shown again to its customer in a checkout flow. Stripe products such as Checkout and Elements use this field to determine whether a payment method can be shown as a saved payment method in a checkout flow. The field defaults to “unspecified”. Possible values: `always`, `limited`, `unspecified`. Nullable.
  * `amount` - A positive integer in the smallest currency unit (that is, 100 cents for $1.00, or 1 for ¥1, Japanese Yen being a zero-decimal currency) representing the total amount associated with the source. This is the amount for which the source will be chargeable once ready. Required for `single_use` sources. Nullable.
  * `au_becs_debit`
  * `bancontact`
  * `card`
  * `card_present`
  * `client_secret` - The client secret of the source. Used for client-side retrieval using a publishable key. Max length: 5000.
  * `code_verification` - Expandable.
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `currency` - Three-letter [ISO code for the currency](https://stripe.com/docs/currencies) associated with the source. This is the currency for which the source will be chargeable once ready. Required for `single_use` sources. Format: ISO 4217 currency code. Nullable.
  * `customer` - The ID of the customer to which this source is attached. This will not be present when the source has not been attached to a customer. Max length: 5000.
  * `eps`
  * `flow` - The authentication `flow` of the source. `flow` is one of `redirect`, `receiver`, `code_verification`, `none`. Max length: 5000.
  * `giropay`
  * `id` - Unique identifier for the object. Max length: 5000.
  * `ideal`
  * `klarna`
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Nullable.
  * `multibanco`
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `source`.
  * `owner` - Information about the owner of the payment instrument that may be used or required by particular source types. Nullable. Expandable.
  * `p24`
  * `receiver` - Expandable.
  * `redirect` - Expandable.
  * `sepa_credit_transfer`
  * `sepa_debit`
  * `sofort`
  * `source_order` - Expandable.
  * `statement_descriptor` - Extra information about a source. This will appear on your customer's statement every time you charge the source. Max length: 5000. Nullable.
  * `status` - The status of the source, one of `canceled`, `chargeable`, `consumed`, `failed`, or `pending`. Only `chargeable` sources can be used to create a charge. Max length: 5000.
  * `three_d_secure`
  * `type` - The `type` of the source. The `type` is a payment method, one of `ach_credit_transfer`, `ach_debit`, `alipay`, `bancontact`, `card`, `card_present`, `eps`, `giropay`, `ideal`, `multibanco`, `klarna`, `p24`, `sepa_debit`, `sofort`, `three_d_secure`, or `wechat`. An additional hash is included on the source with a name matching this value. It contains additional information specific to the [payment method](https://docs.stripe.com/sources) used. Possible values: `ach_credit_transfer`, `ach_debit`, `acss_debit`, `alipay`, `au_becs_debit`, `bancontact`, `card`, `card_present`, `eps`, `giropay`, `ideal`, `klarna`, `multibanco`, `p24`, `sepa_credit_transfer`, `sepa_debit`, `sofort`, `three_d_secure`, `wechat`.
  * `usage` - Either `reusable` or `single_use`. Whether this source should be reusable or not. Some source types may or may not be reusable by construction, while others may leave the option at creation. If an incompatible value is passed, an error will be returned. Max length: 5000. Nullable.
  * `wechat`
  """
  @type t :: %__MODULE__{}

  defstruct [
    :ach_credit_transfer,
    :ach_debit,
    :acss_debit,
    :alipay,
    :allow_redisplay,
    :amount,
    :au_becs_debit,
    :bancontact,
    :card,
    :card_present,
    :client_secret,
    :code_verification,
    :created,
    :currency,
    :customer,
    :eps,
    :flow,
    :giropay,
    :id,
    :ideal,
    :klarna,
    :livemode,
    :metadata,
    :multibanco,
    :object,
    :owner,
    :p24,
    :receiver,
    :redirect,
    :sepa_credit_transfer,
    :sepa_debit,
    :sofort,
    :source_order,
    :statement_descriptor,
    :status,
    :three_d_secure,
    :type,
    :usage,
    :wechat
  ]

  @object_name "source"
  def object_name, do: @object_name

  def expandable_fields,
    do: ["code_verification", "owner", "receiver", "redirect", "source_order"]

  def __nested_fields__ do
    %{
      "code_verification" => %{
        fields: %{
          "attempts_remaining" => :scalar,
          "status" => :scalar
        }
      },
      "owner" => %{
        fields: %{
          "address" => {:resource, Stripe.Resources.Address},
          "email" => :scalar,
          "name" => :scalar,
          "phone" => :scalar,
          "verified_address" => {:resource, Stripe.Resources.Address},
          "verified_email" => :scalar,
          "verified_name" => :scalar,
          "verified_phone" => :scalar
        }
      },
      "receiver" => %{
        fields: %{
          "address" => :scalar,
          "amount_charged" => :scalar,
          "amount_received" => :scalar,
          "amount_returned" => :scalar,
          "refund_attributes_method" => :scalar,
          "refund_attributes_status" => :scalar
        }
      },
      "redirect" => %{
        fields: %{
          "failure_reason" => :scalar,
          "return_url" => :scalar,
          "status" => :scalar,
          "url" => :scalar
        }
      },
      "source_order" => %{
        fields: %{
          "amount" => :scalar,
          "currency" => :scalar,
          "email" => :scalar,
          "items" =>
            {:list,
             %{
               fields: %{
                 "amount" => :scalar,
                 "currency" => :scalar,
                 "description" => :scalar,
                 "parent" => :scalar,
                 "quantity" => :scalar,
                 "type" => :scalar
               }
             }},
          "shipping" => {:resource, Stripe.Resources.ShippingDetails}
        }
      },
      "ach_credit_transfer" => {:resource, Stripe.Resources.AchCreditTransfer},
      "ach_debit" => {:resource, Stripe.Resources.AchDebit},
      "acss_debit" => {:resource, Stripe.Resources.AcssDebit},
      "alipay" => {:resource, Stripe.Resources.Alipay},
      "au_becs_debit" => {:resource, Stripe.Resources.AuBecsDebit},
      "bancontact" => {:resource, Stripe.Resources.Bancontact},
      "card" => {:resource, Stripe.Resources.Card},
      "card_present" => {:resource, Stripe.Resources.CardPresent},
      "eps" => {:resource, Stripe.Resources.Eps},
      "giropay" => {:resource, Stripe.Resources.Giropay},
      "ideal" => {:resource, Stripe.Resources.Ideal},
      "klarna" => {:resource, Stripe.Resources.Klarna},
      "multibanco" => {:resource, Stripe.Resources.Multibanco},
      "p24" => {:resource, Stripe.Resources.P24},
      "sepa_credit_transfer" => {:resource, Stripe.Resources.SepaCreditTransfer},
      "sepa_debit" => {:resource, Stripe.Resources.SepaDebit},
      "sofort" => {:resource, Stripe.Resources.Sofort},
      "three_d_secure" => {:resource, Stripe.Resources.ThreeDSecure},
      "wechat" => {:resource, Stripe.Resources.Wechat}
    }
  end
end
