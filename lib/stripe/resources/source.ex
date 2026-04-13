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
  @type t :: %__MODULE__{
          ach_credit_transfer: Stripe.Resources.AchCreditTransfer.t() | nil,
          ach_debit: Stripe.Resources.AchDebit.t() | nil,
          acss_debit: Stripe.Resources.AcssDebit.t() | nil,
          alipay: Stripe.Resources.Alipay.t() | nil,
          allow_redisplay: String.t(),
          amount: integer(),
          au_becs_debit: Stripe.Resources.AuBecsDebit.t() | nil,
          bancontact: Stripe.Resources.Bancontact.t() | nil,
          card: Stripe.Resources.Card.t() | nil,
          card_present: Stripe.Resources.CardPresent.t() | nil,
          client_secret: String.t(),
          code_verification: __MODULE__.CodeVerification.t() | nil,
          created: integer(),
          currency: String.t(),
          customer: String.t() | nil,
          eps: Stripe.Resources.Eps.t() | nil,
          flow: String.t(),
          giropay: Stripe.Resources.Giropay.t() | nil,
          id: String.t(),
          ideal: Stripe.Resources.Ideal.t() | nil,
          klarna: Stripe.Resources.Klarna.t() | nil,
          livemode: boolean(),
          metadata: %{String.t() => String.t()},
          multibanco: Stripe.Resources.Multibanco.t() | nil,
          object: String.t(),
          owner: __MODULE__.Owner.t(),
          p24: Stripe.Resources.P24.t() | nil,
          receiver: __MODULE__.Receiver.t() | nil,
          redirect: __MODULE__.Redirect.t() | nil,
          sepa_credit_transfer: Stripe.Resources.SepaCreditTransfer.t() | nil,
          sepa_debit: Stripe.Resources.SepaDebit.t() | nil,
          sofort: Stripe.Resources.Sofort.t() | nil,
          source_order: __MODULE__.SourceOrder.t() | nil,
          statement_descriptor: String.t(),
          status: String.t(),
          three_d_secure: Stripe.Resources.ThreeDSecure.t() | nil,
          type: String.t(),
          usage: String.t(),
          wechat: Stripe.Resources.Wechat.t() | nil
        }

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

  defmodule CodeVerification do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `attempts_remaining` - The number of attempts remaining to authenticate the source object with a verification code.
    * `status` - The status of the code verification, either `pending` (awaiting verification, `attempts_remaining` should be greater than 0), `succeeded` (successful verification) or `failed` (failed verification, cannot be verified anymore as `attempts_remaining` should be 0). Max length: 5000.
    """
    @type t :: %__MODULE__{
            attempts_remaining: integer() | nil,
            status: String.t() | nil
          }
    defstruct [:attempts_remaining, :status]
  end

  defmodule Owner do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `address` - Owner's address. Nullable.
    * `email` - Owner's email address. Max length: 5000. Nullable.
    * `name` - Owner's full name. Max length: 5000. Nullable.
    * `phone` - Owner's phone number (including extension). Max length: 5000. Nullable.
    * `verified_address` - Verified owner's address. Verified values are verified or provided by the payment method directly (and if supported) at the time of authorization or settlement. They cannot be set or mutated. Nullable.
    * `verified_email` - Verified owner's email address. Verified values are verified or provided by the payment method directly (and if supported) at the time of authorization or settlement. They cannot be set or mutated. Max length: 5000. Nullable.
    * `verified_name` - Verified owner's full name. Verified values are verified or provided by the payment method directly (and if supported) at the time of authorization or settlement. They cannot be set or mutated. Max length: 5000. Nullable.
    * `verified_phone` - Verified owner's phone number (including extension). Verified values are verified or provided by the payment method directly (and if supported) at the time of authorization or settlement. They cannot be set or mutated. Max length: 5000. Nullable.
    """
    @type t :: %__MODULE__{
            address: Stripe.Resources.Address.t() | nil,
            email: String.t() | nil,
            name: String.t() | nil,
            phone: String.t() | nil,
            verified_address: Stripe.Resources.Address.t() | nil,
            verified_email: String.t() | nil,
            verified_name: String.t() | nil,
            verified_phone: String.t() | nil
          }
    defstruct [
      :address,
      :email,
      :name,
      :phone,
      :verified_address,
      :verified_email,
      :verified_name,
      :verified_phone
    ]
  end

  defmodule Receiver do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `address` - The address of the receiver source. This is the value that should be communicated to the customer to send their funds to. Max length: 5000. Nullable.
    * `amount_charged` - The total amount that was moved to your balance. This is almost always equal to the amount charged. In rare cases when customers deposit excess funds and we are unable to refund those, those funds get moved to your balance and show up in amount_charged as well. The amount charged is expressed in the source's currency.
    * `amount_received` - The total amount received by the receiver source. `amount_received = amount_returned + amount_charged` should be true for consumed sources unless customers deposit excess funds. The amount received is expressed in the source's currency.
    * `amount_returned` - The total amount that was returned to the customer. The amount returned is expressed in the source's currency.
    * `refund_attributes_method` - Type of refund attribute method, one of `email`, `manual`, or `none`. Max length: 5000.
    * `refund_attributes_status` - Type of refund attribute status, one of `missing`, `requested`, or `available`. Max length: 5000.
    """
    @type t :: %__MODULE__{
            address: String.t() | nil,
            amount_charged: integer() | nil,
            amount_received: integer() | nil,
            amount_returned: integer() | nil,
            refund_attributes_method: String.t() | nil,
            refund_attributes_status: String.t() | nil
          }
    defstruct [
      :address,
      :amount_charged,
      :amount_received,
      :amount_returned,
      :refund_attributes_method,
      :refund_attributes_status
    ]
  end

  defmodule Redirect do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `failure_reason` - The failure reason for the redirect, either `user_abort` (the customer aborted or dropped out of the redirect flow), `declined` (the authentication failed or the transaction was declined), or `processing_error` (the redirect failed due to a technical error). Present only if the redirect status is `failed`. Max length: 5000. Nullable.
    * `return_url` - The URL you provide to redirect the customer to after they authenticated their payment. Max length: 5000.
    * `status` - The status of the redirect, either `pending` (ready to be used by your customer to authenticate the transaction), `succeeded` (successful authentication, cannot be reused) or `not_required` (redirect should not be used) or `failed` (failed authentication, cannot be reused). Max length: 5000.
    * `url` - The URL provided to you to redirect a customer to as part of a `redirect` authentication flow. Max length: 2048.
    """
    @type t :: %__MODULE__{
            failure_reason: String.t() | nil,
            return_url: String.t() | nil,
            status: String.t() | nil,
            url: String.t() | nil
          }
    defstruct [:failure_reason, :return_url, :status, :url]
  end

  defmodule SourceOrder do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `amount` - A positive integer in the smallest currency unit (that is, 100 cents for $1.00, or 1 for ¥1, Japanese Yen being a zero-decimal currency) representing the total amount for the order.
    * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
    * `email` - The email address of the customer placing the order. Max length: 5000.
    * `items` - List of items constituting the order. Nullable.
    * `shipping`
    """
    @type t :: %__MODULE__{
            amount: integer() | nil,
            currency: String.t() | nil,
            email: String.t() | nil,
            items: [__MODULE__.Items.t()] | nil,
            shipping: Stripe.Resources.ShippingDetails.t() | nil
          }
    defstruct [:amount, :currency, :email, :items, :shipping]

    defmodule Items do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `amount` - The amount (price) for this order item. Nullable.
      * `currency` - This currency of this order item. Required when `amount` is present. Max length: 5000. Nullable.
      * `description` - Human-readable description for this order item. Max length: 5000. Nullable.
      * `parent` - The ID of the associated object for this line item. Expandable if not null (e.g., expandable to a SKU). Max length: 5000. Nullable.
      * `quantity` - The quantity of this order item. When type is `sku`, this is the number of instances of the SKU to be ordered.
      * `type` - The type of this order item. Must be `sku`, `tax`, or `shipping`. Max length: 5000. Nullable.
      """
      @type t :: %__MODULE__{
              amount: integer() | nil,
              currency: String.t() | nil,
              description: String.t() | nil,
              parent: String.t() | nil,
              quantity: integer() | nil,
              type: String.t() | nil
            }
      defstruct [:amount, :currency, :description, :parent, :quantity, :type]
    end

    def __inner_types__ do
      %{
        "items" => __MODULE__.Items
      }
    end
  end

  def __inner_types__ do
    %{
      "ach_credit_transfer" => Stripe.Resources.AchCreditTransfer,
      "ach_debit" => Stripe.Resources.AchDebit,
      "acss_debit" => Stripe.Resources.AcssDebit,
      "alipay" => Stripe.Resources.Alipay,
      "au_becs_debit" => Stripe.Resources.AuBecsDebit,
      "bancontact" => Stripe.Resources.Bancontact,
      "card" => Stripe.Resources.Card,
      "card_present" => Stripe.Resources.CardPresent,
      "code_verification" => __MODULE__.CodeVerification,
      "eps" => Stripe.Resources.Eps,
      "giropay" => Stripe.Resources.Giropay,
      "ideal" => Stripe.Resources.Ideal,
      "klarna" => Stripe.Resources.Klarna,
      "multibanco" => Stripe.Resources.Multibanco,
      "owner" => __MODULE__.Owner,
      "p24" => Stripe.Resources.P24,
      "receiver" => __MODULE__.Receiver,
      "redirect" => __MODULE__.Redirect,
      "sepa_credit_transfer" => Stripe.Resources.SepaCreditTransfer,
      "sepa_debit" => Stripe.Resources.SepaDebit,
      "sofort" => Stripe.Resources.Sofort,
      "source_order" => __MODULE__.SourceOrder,
      "three_d_secure" => Stripe.Resources.ThreeDSecure,
      "wechat" => Stripe.Resources.Wechat
    }
  end
end
