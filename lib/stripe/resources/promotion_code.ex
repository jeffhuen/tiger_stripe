# File generated from our OpenAPI spec
defmodule Stripe.Resources.PromotionCode do
  @moduledoc """
  PromotionCode

  A Promotion Code represents a customer-redeemable code for an underlying promotion.
  You can create multiple codes for a single promotion.

  If you enable promotion codes in your [customer portal configuration](https://docs.stripe.com/customer-management/configure-portal), then customers can redeem a code themselves when updating a subscription in the portal.
  Customers can also view the currently active promotion codes and coupons on each of their subscriptions in the portal.
  """

  @typedoc """
  * `active` - Whether the promotion code is currently active. A promotion code is only active if the coupon is also valid.
  * `code` - The customer-facing code. Regardless of case, this code must be unique across all active promotion codes for each customer. Valid characters are lower case letters (a-z), upper case letters (A-Z), digits (0-9), and dashes (-). Max length: 5000.
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `customer` - The customer who can use this promotion code. Nullable. Expandable.
  * `customer_account` - The account representing the customer who can use this promotion code. Max length: 5000. Nullable.
  * `expires_at` - Date at which the promotion code can no longer be redeemed. Format: Unix timestamp. Nullable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `max_redemptions` - Maximum number of times this promotion code can be redeemed. Nullable.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Nullable.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `promotion_code`.
  * `promotion` - Expandable.
  * `restrictions` - Expandable.
  * `times_redeemed` - Number of times this promotion code has been used.
  """
  @type t :: %__MODULE__{
          active: boolean(),
          code: String.t(),
          created: integer(),
          customer: String.t() | Stripe.Resources.Customer.t(),
          customer_account: String.t(),
          expires_at: integer(),
          id: String.t(),
          livemode: boolean(),
          max_redemptions: integer(),
          metadata: %{String.t() => String.t()},
          object: String.t(),
          promotion: __MODULE__.Promotion.t(),
          restrictions: __MODULE__.Restrictions.t(),
          times_redeemed: integer()
        }

  defstruct [
    :active,
    :code,
    :created,
    :customer,
    :customer_account,
    :expires_at,
    :id,
    :livemode,
    :max_redemptions,
    :metadata,
    :object,
    :promotion,
    :restrictions,
    :times_redeemed
  ]

  @object_name "promotion_code"
  def object_name, do: @object_name

  def expandable_fields, do: ["customer", "promotion", "restrictions"]

  defmodule Promotion do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `coupon` - If promotion `type` is `coupon`, the coupon for this promotion. Nullable.
    * `type` - The type of promotion. Possible values: `coupon`.
    """
    @type t :: %__MODULE__{
            coupon: String.t() | Stripe.Resources.Coupon.t() | nil,
            type: String.t() | nil
          }
    defstruct [:coupon, :type]
  end

  defmodule Restrictions do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `currency_options` - Promotion code restrictions defined in each available currency option. Each key must be a three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html) and a [supported currency](https://stripe.com/docs/currencies).
    * `first_time_transaction` - A Boolean indicating if the Promotion Code should only be redeemed for Customers without any successful payments or invoices
    * `minimum_amount` - Minimum amount required to redeem this Promotion Code into a Coupon (e.g., a purchase must be $100 or more to work). Nullable.
    * `minimum_amount_currency` - Three-letter [ISO code](https://stripe.com/docs/currencies) for minimum_amount Max length: 5000. Nullable.
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
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `minimum_amount` - Minimum amount required to redeem this Promotion Code into a Coupon (e.g., a purchase must be $100 or more to work).
      """
      @type t :: %__MODULE__{
              minimum_amount: integer() | nil
            }
      defstruct [:minimum_amount]
    end

    def __inner_types__ do
      %{
        "currency_options" => __MODULE__.CurrencyOptions
      }
    end
  end

  def __inner_types__ do
    %{
      "promotion" => __MODULE__.Promotion,
      "restrictions" => __MODULE__.Restrictions
    }
  end
end
