# File generated from our OpenAPI spec
defmodule Stripe.Params.PromotionCodeCreateParams do
  @moduledoc "Parameters for promotion code create."

  @typedoc """
  * `active` - Whether the promotion code is currently active.
  * `code` - The customer-facing code. Regardless of case, this code must be unique across all active promotion codes for a specific customer. Valid characters are lower case letters (a-z), upper case letters (A-Z), and digits (0-9).

  If left blank, we will generate one automatically. Max length: 500.
  * `customer` - The customer who can use this promotion code. If not set, all customers can use the promotion code. Max length: 5000.
  * `customer_account` - The account representing the customer who can use this promotion code. If not set, all customers can use the promotion code. Max length: 5000.
  * `expand` - Specifies which fields in the response should be expanded.
  * `expires_at` - The timestamp at which this promotion code will expire. If the coupon has specified a `redeems_by`, then this value cannot be after the coupon's `redeems_by`. Format: Unix timestamp.
  * `max_redemptions` - A positive integer specifying the number of times the promotion code can be redeemed. If the coupon has specified a `max_redemptions`, then this value cannot be greater than the coupon's `max_redemptions`.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `promotion` - The promotion referenced by this promotion code.
  * `restrictions` - Settings that restrict the redemption of the promotion code.
  """
  @type t :: %__MODULE__{
          active: boolean() | nil,
          code: String.t() | nil,
          customer: String.t() | nil,
          customer_account: String.t() | nil,
          expand: [String.t()] | nil,
          expires_at: integer() | nil,
          max_redemptions: integer() | nil,
          metadata: %{String.t() => String.t()} | nil,
          promotion: __MODULE__.Promotion.t(),
          restrictions: __MODULE__.Restrictions.t() | nil
        }

  defstruct [
    :active,
    :code,
    :customer,
    :customer_account,
    :expand,
    :expires_at,
    :max_redemptions,
    :metadata,
    :promotion,
    :restrictions
  ]

  defmodule Promotion do
    @moduledoc "Nested parameters."

    @typedoc """
    * `coupon` - If promotion `type` is `coupon`, the coupon for this promotion code. Max length: 5000.
    * `type` - Specifies the type of promotion. Possible values: `coupon`.
    """
    @type t :: %__MODULE__{
            coupon: String.t() | nil,
            type: String.t() | nil
          }
    defstruct [:coupon, :type]
  end

  defmodule Restrictions do
    @moduledoc "Nested parameters."

    @typedoc """
    * `currency_options` - Promotion codes defined in each available currency option. Each key must be a three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html) and a [supported currency](https://stripe.com/docs/currencies).
    * `first_time_transaction` - A Boolean indicating if the Promotion Code should only be redeemed for Customers without any successful payments or invoices
    * `minimum_amount` - Minimum amount required to redeem this Promotion Code into a Coupon (e.g., a purchase must be $100 or more to work).
    * `minimum_amount_currency` - Three-letter [ISO code](https://stripe.com/docs/currencies) for minimum_amount Format: ISO 4217 currency code.
    """
    @type t :: %__MODULE__{
            currency_options: %{String.t() => __MODULE__.CurrencyOptions.t()} | nil,
            first_time_transaction: boolean() | nil,
            minimum_amount: integer() | nil,
            minimum_amount_currency: String.t() | nil
          }
    defstruct [
      :currency_options,
      :first_time_transaction,
      :minimum_amount,
      :minimum_amount_currency
    ]

    defmodule CurrencyOptions do
      @moduledoc "Nested parameters."

      @typedoc """
      * `minimum_amount` - Minimum amount required to redeem this Promotion Code into a Coupon (e.g., a purchase must be $100 or more to work).
      """
      @type t :: %__MODULE__{
              minimum_amount: integer() | nil
            }
      defstruct [:minimum_amount]
    end
  end
end
