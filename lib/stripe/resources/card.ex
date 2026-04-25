# File generated from our OpenAPI spec
defmodule Stripe.Resources.Card do
  @moduledoc """
  Card

  You can store multiple cards on a customer in order to charge the customer
  later. You can also store multiple debit cards on a recipient in order to
  transfer to those cards later.

  Related guide: [Card payments with Sources](https://docs.stripe.com/sources/cards)
  """

  @typedoc """
  * `account` - Nullable. Expandable.
  * `address_city` - City/District/Suburb/Town/Village. Max length: 5000. Nullable.
  * `address_country` - Billing address country, if provided when creating card. Max length: 5000. Nullable.
  * `address_line1` - Address line 1 (Street address/PO Box/Company name). Max length: 5000. Nullable.
  * `address_line1_check` - If `address_line1` was provided, results of the check: `pass`, `fail`, `unavailable`, or `unchecked`. Max length: 5000. Nullable.
  * `address_line2` - Address line 2 (Apartment/Suite/Unit/Building). Max length: 5000. Nullable.
  * `address_state` - State/County/Province/Region. Max length: 5000. Nullable.
  * `address_zip` - ZIP or postal code. Max length: 5000. Nullable.
  * `address_zip_check` - If `address_zip` was provided, results of the check: `pass`, `fail`, `unavailable`, or `unchecked`. Max length: 5000. Nullable.
  * `allow_redisplay` - This field indicates whether this payment method can be shown again to its customer in a checkout flow. Stripe products such as Checkout and Elements use this field to determine whether a payment method can be shown as a saved payment method in a checkout flow. The field defaults to “unspecified”. Possible values: `always`, `limited`, `unspecified`. Nullable.
  * `available_payout_methods` - A set of available payout methods for this card. Only values from this set should be passed as the `method` when creating a payout. Nullable.
  * `brand` - Card brand. Can be `American Express`, `Cartes Bancaires`, `Diners Club`, `Discover`, `Eftpos Australia`, `Girocard`, `JCB`, `MasterCard`, `UnionPay`, `Visa`, or `Unknown`. Max length: 5000.
  * `country` - Two-letter ISO code representing the country of the card. You could use this attribute to get a sense of the international breakdown of cards you've collected. Max length: 5000. Nullable.
  * `currency` - Three-letter [ISO code for currency](https://www.iso.org/iso-4217-currency-codes.html) in lowercase. Must be a [supported currency](https://docs.stripe.com/currencies). Only applicable on accounts (not customers or recipients). The card can be used as a transfer destination for funds in this currency. This property is only available when returned as an [External Account](https://docs.stripe.com/api/external_account_cards/object) where [controller.is_controller](https://docs.stripe.com/api/accounts/object#account_object-controller-is_controller) is `true`. Format: ISO 4217 currency code. Nullable.
  * `customer` - The customer that this card belongs to. This attribute will not be in the card object if the card belongs to an account or recipient instead. Nullable. Expandable.
  * `cvc_check` - If a CVC was provided, results of the check: `pass`, `fail`, `unavailable`, or `unchecked`. A result of unchecked indicates that CVC was provided but hasn't been checked yet. Checks are typically performed when attaching a card to a Customer object, or when creating a charge. For more details, see [Check if a card is valid without a charge](https://support.stripe.com/questions/check-if-a-card-is-valid-without-a-charge). Max length: 5000. Nullable.
  * `default_for_currency` - Whether this card is the default external account for its currency. This property is only available for accounts where [controller.requirement_collection](https://docs.stripe.com/api/accounts/object#account_object-controller-requirement_collection) is `application`, which includes Custom accounts. Nullable.
  * `description` - A high-level description of the type of cards issued in this range. (For internal use only and not typically available in standard API requests.) Max length: 5000.
  * `dynamic_last4` - (For tokenized numbers only.) The last four digits of the device account number. Max length: 5000. Nullable.
  * `exp_month` - Two-digit number representing the card's expiration month.
  * `exp_year` - Four-digit number representing the card's expiration year.
  * `fingerprint` - Uniquely identifies this particular card number. You can use this attribute to check whether two customers who’ve signed up with you are using the same card number, for example. For payment methods that tokenize card information (Apple Pay, Google Pay), the tokenized number might be provided instead of the underlying card number.

  *As of May 1, 2021, card fingerprint in India for Connect changed to allow two fingerprints for the same card---one for India and one for the rest of the world.* Max length: 5000. Nullable.
  * `funding` - Card funding type. Can be `credit`, `debit`, `prepaid`, or `unknown`. Max length: 5000.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `iin` - Issuer identification number of the card. (For internal use only and not typically available in standard API requests.) Max length: 5000.
  * `issuer` - The name of the card's issuing bank. (For internal use only and not typically available in standard API requests.) Max length: 5000.
  * `last4` - The last four digits of the card. Max length: 5000.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Nullable.
  * `name` - Cardholder name. Max length: 5000. Nullable.
  * `networks` - Expandable.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `card`.
  * `regulated_status` - Status of a card based on the card issuer. Possible values: `regulated`, `unregulated`. Nullable.
  * `status` - For external accounts that are cards, possible values are `new` and `errored`. If a payout fails, the status is set to `errored` and [scheduled payouts](https://stripe.com/docs/payouts#payout-schedule) are stopped until account details are updated. Max length: 5000. Nullable.
  * `tokenization_method` - If the card number is tokenized, this is the method that was used. Can be `android_pay` (includes Google Pay), `apple_pay`, `masterpass`, `visa_checkout`, or null. Max length: 5000. Nullable.
  """
  @type t :: %__MODULE__{
          account: String.t() | Stripe.Resources.Account.t() | nil,
          address_city: String.t(),
          address_country: String.t(),
          address_line1: String.t(),
          address_line1_check: String.t(),
          address_line2: String.t(),
          address_state: String.t(),
          address_zip: String.t(),
          address_zip_check: String.t(),
          allow_redisplay: String.t() | nil,
          available_payout_methods: [String.t()] | nil,
          brand: String.t(),
          country: String.t(),
          currency: String.t() | nil,
          customer: String.t() | Stripe.Resources.Customer.t() | nil,
          cvc_check: String.t(),
          default_for_currency: boolean() | nil,
          description: String.t() | nil,
          dynamic_last4: String.t(),
          exp_month: integer(),
          exp_year: integer(),
          fingerprint: String.t() | nil,
          funding: String.t(),
          id: String.t(),
          iin: String.t() | nil,
          issuer: String.t() | nil,
          last4: String.t(),
          metadata: %{String.t() => String.t()},
          name: String.t(),
          networks: networks() | nil,
          object: String.t(),
          regulated_status: String.t(),
          status: String.t() | nil,
          tokenization_method: String.t()
        }

  defstruct [
    :account,
    :address_city,
    :address_country,
    :address_line1,
    :address_line1_check,
    :address_line2,
    :address_state,
    :address_zip,
    :address_zip_check,
    :allow_redisplay,
    :available_payout_methods,
    :brand,
    :country,
    :currency,
    :customer,
    :cvc_check,
    :default_for_currency,
    :description,
    :dynamic_last4,
    :exp_month,
    :exp_year,
    :fingerprint,
    :funding,
    :id,
    :iin,
    :issuer,
    :last4,
    :metadata,
    :name,
    :networks,
    :object,
    :regulated_status,
    :status,
    :tokenization_method
  ]

  @object_name "card"
  def object_name, do: @object_name

  def expandable_fields, do: ["account", "customer", "networks"]

  @typedoc """
  * `preferred` - The preferred network for co-branded cards. Can be `cartes_bancaires`, `mastercard`, `visa` or `invalid_preference` if requested network is not valid for the card. Max length: 5000. Nullable.
  """
  @type networks :: %{
          optional(:preferred) => String.t() | nil,
          optional(String.t()) => term()
        }

  def __nested_fields__ do
    %{
      "networks" => %{
        fields: %{
          "preferred" => :scalar
        }
      }
    }
  end
end
