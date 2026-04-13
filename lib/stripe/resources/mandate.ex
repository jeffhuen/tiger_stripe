# File generated from our OpenAPI spec
defmodule Stripe.Resources.Mandate do
  @moduledoc """
  Mandate

  A Mandate is a record of the permission that your customer gives you to debit their payment method.
  """

  @typedoc """
  * `customer_acceptance` - Expandable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `multi_use` - Expandable.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `mandate`.
  * `on_behalf_of` - The account (if any) that the mandate is intended for. Max length: 5000.
  * `payment_method` - ID of the payment method associated with this mandate. Expandable.
  * `payment_method_details` - Expandable.
  * `single_use` - Expandable.
  * `status` - The mandate status indicates whether or not you can use it to initiate a payment. Possible values: `active`, `inactive`, `pending`.
  * `type` - The type of the mandate. Possible values: `multi_use`, `single_use`.
  """
  @type t :: %__MODULE__{
          customer_acceptance: __MODULE__.CustomerAcceptance.t(),
          id: String.t(),
          livemode: boolean(),
          multi_use: map() | nil,
          object: String.t(),
          on_behalf_of: String.t() | nil,
          payment_method: String.t() | Stripe.Resources.PaymentMethod.t(),
          payment_method_details: __MODULE__.PaymentMethodDetails.t(),
          single_use: __MODULE__.SingleUse.t() | nil,
          status: String.t(),
          type: String.t()
        }

  defstruct [
    :customer_acceptance,
    :id,
    :livemode,
    :multi_use,
    :object,
    :on_behalf_of,
    :payment_method,
    :payment_method_details,
    :single_use,
    :status,
    :type
  ]

  @object_name "mandate"
  def object_name, do: @object_name

  def expandable_fields,
    do: [
      "customer_acceptance",
      "multi_use",
      "payment_method",
      "payment_method_details",
      "single_use"
    ]

  defmodule CustomerAcceptance do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `accepted_at` - The time that the customer accepts the mandate. Format: Unix timestamp. Nullable.
    * `offline`
    * `online`
    * `type` - The mandate includes the type of customer acceptance information, such as: `online` or `offline`. Possible values: `offline`, `online`.
    """
    @type t :: %__MODULE__{
            accepted_at: integer() | nil,
            offline: map() | nil,
            online: __MODULE__.Online.t() | nil,
            type: String.t() | nil
          }
    defstruct [:accepted_at, :offline, :online, :type]

    defmodule Online do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `ip_address` - The customer accepts the mandate from this IP address. Max length: 5000. Nullable.
      * `user_agent` - The customer accepts the mandate using the user agent of the browser. Max length: 5000. Nullable.
      """
      @type t :: %__MODULE__{
              ip_address: String.t() | nil,
              user_agent: String.t() | nil
            }
      defstruct [:ip_address, :user_agent]
    end

    def __inner_types__ do
      %{
        "online" => __MODULE__.Online
      }
    end
  end

  defmodule PaymentMethodDetails do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `acss_debit`
    * `amazon_pay`
    * `au_becs_debit`
    * `bacs_debit`
    * `card`
    * `cashapp`
    * `kakao_pay`
    * `klarna`
    * `kr_card`
    * `link`
    * `naver_pay`
    * `nz_bank_account`
    * `paypal`
    * `payto`
    * `revolut_pay`
    * `sepa_debit`
    * `type` - This mandate corresponds with a specific payment method type. The `payment_method_details` includes an additional hash with the same name and contains mandate information that's specific to that payment method. Max length: 5000.
    * `upi`
    * `us_bank_account`
    """
    @type t :: %__MODULE__{
            acss_debit: Stripe.Resources.AcssDebit.t() | nil,
            amazon_pay: Stripe.Resources.AmazonPay.t() | nil,
            au_becs_debit: __MODULE__.AuBecsDebit.t() | nil,
            bacs_debit: __MODULE__.BacsDebit.t() | nil,
            card: map() | nil,
            cashapp: Stripe.Resources.Cashapp.t() | nil,
            kakao_pay: Stripe.Resources.KakaoPay.t() | nil,
            klarna: map() | nil,
            kr_card: Stripe.Resources.KrCard.t() | nil,
            link: map() | nil,
            naver_pay: map() | nil,
            nz_bank_account: Stripe.Resources.NzBankAccount.t() | nil,
            paypal: __MODULE__.Paypal.t() | nil,
            payto: Stripe.Resources.Payto.t() | nil,
            revolut_pay: Stripe.Resources.RevolutPay.t() | nil,
            sepa_debit: Stripe.Resources.SepaDebit.t() | nil,
            type: String.t() | nil,
            upi: Stripe.Resources.UPI.t() | nil,
            us_bank_account: Stripe.Resources.UsBankAccount.t() | nil
          }
    defstruct [
      :acss_debit,
      :amazon_pay,
      :au_becs_debit,
      :bacs_debit,
      :card,
      :cashapp,
      :kakao_pay,
      :klarna,
      :kr_card,
      :link,
      :naver_pay,
      :nz_bank_account,
      :paypal,
      :payto,
      :revolut_pay,
      :sepa_debit,
      :type,
      :upi,
      :us_bank_account
    ]

    defmodule AuBecsDebit do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `url` - The URL of the mandate. This URL generally contains sensitive information about the customer and should be shared with them exclusively. Max length: 5000.
      """
      @type t :: %__MODULE__{
              url: String.t() | nil
            }
      defstruct [:url]
    end

    defmodule BacsDebit do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `display_name` - The display name for the account on this mandate. Max length: 5000. Nullable.
      * `network_status` - The status of the mandate on the Bacs network. Can be one of `pending`, `revoked`, `refused`, or `accepted`. Possible values: `accepted`, `pending`, `refused`, `revoked`.
      * `reference` - The unique reference identifying the mandate on the Bacs network. Max length: 5000.
      * `revocation_reason` - When the mandate is revoked on the Bacs network this field displays the reason for the revocation. Possible values: `account_closed`, `bank_account_restricted`, `bank_ownership_changed`, `could_not_process`, `debit_not_authorized`. Nullable.
      * `service_user_number` - The service user number for the account on this mandate. Max length: 5000. Nullable.
      * `url` - The URL that will contain the mandate that the customer has signed. Max length: 5000.
      """
      @type t :: %__MODULE__{
              display_name: String.t() | nil,
              network_status: String.t() | nil,
              reference: String.t() | nil,
              revocation_reason: String.t() | nil,
              service_user_number: String.t() | nil,
              url: String.t() | nil
            }
      defstruct [
        :display_name,
        :network_status,
        :reference,
        :revocation_reason,
        :service_user_number,
        :url
      ]
    end

    defmodule Paypal do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `billing_agreement_id` - The PayPal Billing Agreement ID (BAID). This is an ID generated by PayPal which represents the mandate between the merchant and the customer. Max length: 5000. Nullable.
      * `payer_id` - PayPal account PayerID. This identifier uniquely identifies the PayPal customer. Max length: 5000. Nullable.
      """
      @type t :: %__MODULE__{
              billing_agreement_id: String.t() | nil,
              payer_id: String.t() | nil
            }
      defstruct [:billing_agreement_id, :payer_id]
    end

    def __inner_types__ do
      %{
        "au_becs_debit" => __MODULE__.AuBecsDebit,
        "bacs_debit" => __MODULE__.BacsDebit,
        "paypal" => __MODULE__.Paypal
      }
    end
  end

  defmodule SingleUse do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `amount` - The amount of the payment on a single use mandate.
    * `currency` - The currency of the payment on a single use mandate. Format: ISO 4217 currency code.
    """
    @type t :: %__MODULE__{
            amount: integer() | nil,
            currency: String.t() | nil
          }
    defstruct [:amount, :currency]
  end

  def __inner_types__ do
    %{
      "customer_acceptance" => __MODULE__.CustomerAcceptance,
      "payment_method_details" => __MODULE__.PaymentMethodDetails,
      "single_use" => __MODULE__.SingleUse
    }
  end
end
