# File generated from our OpenAPI spec
defmodule Stripe.Params.PaymentMethodUpdateParams do
  @moduledoc "Parameters for payment method update."

  @typedoc """
  * `allow_redisplay` - This field indicates whether this payment method can be shown again to its customer in a checkout flow. Stripe products such as Checkout and Elements use this field to determine whether a payment method can be shown as a saved payment method in a checkout flow. The field defaults to `unspecified`. Possible values: `always`, `limited`, `unspecified`.
  * `billing_details` - Billing information associated with the PaymentMethod that may be used or required by particular types of payment methods.
  * `card` - If this is a `card` PaymentMethod, this hash contains the user's card details.
  * `expand` - Specifies which fields in the response should be expanded.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `payto` - If this is a `payto` PaymentMethod, this hash contains details about the PayTo payment method.
  * `us_bank_account` - If this is an `us_bank_account` PaymentMethod, this hash contains details about the US bank account payment method.
  """
  @type t :: %__MODULE__{
          allow_redisplay: String.t() | nil,
          billing_details: __MODULE__.BillingDetails.t() | nil,
          card: __MODULE__.Card.t() | nil,
          expand: [String.t()] | nil,
          metadata: map() | nil,
          payto: __MODULE__.Payto.t() | nil,
          us_bank_account: __MODULE__.UsBankAccount.t() | nil
        }

  defstruct [
    :allow_redisplay,
    :billing_details,
    :card,
    :expand,
    :metadata,
    :payto,
    :us_bank_account
  ]

  defmodule BillingDetails do
    @moduledoc "Nested parameters."

    @typedoc """
    * `address` - Billing address.
    * `email` - Email address.
    * `name` - Full name.
    * `phone` - Billing phone number (including extension).
    * `tax_id` - Taxpayer identification number. Used only for transactions between LATAM buyers and non-LATAM sellers. Max length: 5000.
    """
    @type t :: %__MODULE__{
            address: map() | nil,
            email: map() | nil,
            name: map() | nil,
            phone: map() | nil,
            tax_id: String.t() | nil
          }
    defstruct [:address, :email, :name, :phone, :tax_id]
  end

  defmodule Card do
    @moduledoc "Nested parameters."

    @typedoc """
    * `exp_month` - Two-digit number representing the card's expiration month.
    * `exp_year` - Four-digit number representing the card's expiration year.
    * `networks` - Contains information about card networks used to process the payment.
    """
    @type t :: %__MODULE__{
            exp_month: integer() | nil,
            exp_year: integer() | nil,
            networks: __MODULE__.Networks.t() | nil
          }
    defstruct [:exp_month, :exp_year, :networks]

    defmodule Networks do
      @moduledoc "Nested parameters."

      @typedoc """
      * `preferred` - The customer's preferred card network for co-branded cards. Supports `cartes_bancaires`, `mastercard`, or `visa`. Selection of a network that does not apply to the card will be stored as `invalid_preference` on the card. Possible values: `cartes_bancaires`, `mastercard`, `visa`.
      """
      @type t :: %__MODULE__{
              preferred: String.t() | nil
            }
      defstruct [:preferred]
    end
  end

  defmodule Payto do
    @moduledoc "Nested parameters."

    @typedoc """
    * `account_number` - The account number for the bank account. Max length: 5000.
    * `bsb_number` - Bank-State-Branch number of the bank account. Max length: 5000.
    * `pay_id` - The PayID alias for the bank account. Max length: 5000.
    """
    @type t :: %__MODULE__{
            account_number: String.t() | nil,
            bsb_number: String.t() | nil,
            pay_id: String.t() | nil
          }
    defstruct [:account_number, :bsb_number, :pay_id]
  end

  defmodule UsBankAccount do
    @moduledoc "Nested parameters."

    @typedoc """
    * `account_holder_type` - Bank account holder type. Possible values: `company`, `individual`.
    * `account_type` - Bank account type. Possible values: `checking`, `savings`.
    """
    @type t :: %__MODULE__{
            account_holder_type: String.t() | nil,
            account_type: String.t() | nil
          }
    defstruct [:account_holder_type, :account_type]
  end
end
