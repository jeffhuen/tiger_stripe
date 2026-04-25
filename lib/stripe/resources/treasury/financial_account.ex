# File generated from our OpenAPI spec
defmodule Stripe.Resources.Treasury.FinancialAccount do
  @moduledoc """
  TreasuryFinancialAccountsResourceFinancialAccount

  Stripe Treasury provides users with a container for money called a FinancialAccount that is separate from their Payments balance.
  FinancialAccounts serve as the source and destination of Treasury’s money movement APIs.
  """

  @typedoc """
  * `active_features` - The array of paths to active Features in the Features hash.
  * `balance` - Expandable.
  * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)). Max length: 5000.
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `features` - Expandable.
  * `financial_addresses` - The set of credentials that resolve to a FinancialAccount. Expandable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `is_default`
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Nullable.
  * `nickname` - The nickname for the FinancialAccount. Max length: 5000. Nullable.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `treasury.financial_account`.
  * `pending_features` - The array of paths to pending Features in the Features hash.
  * `platform_restrictions` - The set of functionalities that the platform can restrict on the FinancialAccount. Nullable. Expandable.
  * `restricted_features` - The array of paths to restricted Features in the Features hash.
  * `status` - Status of this FinancialAccount. Possible values: `closed`, `open`.
  * `status_details` - Expandable.
  * `supported_currencies` - The currencies the FinancialAccount can hold a balance in. Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase.
  """
  @type t :: %__MODULE__{
          active_features: [String.t()] | nil,
          balance: Stripe.Resources.Balance.t(),
          country: String.t(),
          created: integer(),
          features: Stripe.Resources.Treasury.FinancialAccountFeatures.t() | nil,
          financial_addresses: [financial_addresses()],
          id: String.t(),
          is_default: boolean() | nil,
          livemode: boolean(),
          metadata: %{String.t() => String.t()},
          nickname: String.t() | nil,
          object: String.t(),
          pending_features: [String.t()] | nil,
          platform_restrictions: Stripe.Resources.PlatformRestriction.t() | nil,
          restricted_features: [String.t()] | nil,
          status: String.t(),
          status_details: Stripe.Resources.StatusDetails.t(),
          supported_currencies: [String.t()]
        }

  defstruct [
    :active_features,
    :balance,
    :country,
    :created,
    :features,
    :financial_addresses,
    :id,
    :is_default,
    :livemode,
    :metadata,
    :nickname,
    :object,
    :pending_features,
    :platform_restrictions,
    :restricted_features,
    :status,
    :status_details,
    :supported_currencies
  ]

  @object_name "treasury.financial_account"
  def object_name, do: @object_name

  def expandable_fields,
    do: ["balance", "features", "financial_addresses", "platform_restrictions", "status_details"]

  @typedoc """
  * `aba`
  * `supported_networks` - The list of networks that the address supports
  * `type` - The type of financial address Possible values: `aba`.
  """
  @type financial_addresses :: %{
          optional(:aba) => Stripe.Resources.Aba.t() | nil,
          optional(:supported_networks) => [String.t()] | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  def __nested_fields__ do
    %{
      "financial_addresses" => %{
        fields: %{
          "aba" => {:resource, Stripe.Resources.Aba},
          "supported_networks" => {:list, :scalar},
          "type" => :scalar
        }
      },
      "balance" => {:resource, Stripe.Resources.Balance},
      "features" => {:resource, Stripe.Resources.Treasury.FinancialAccountFeatures},
      "platform_restrictions" => {:resource, Stripe.Resources.PlatformRestriction},
      "status_details" => {:resource, Stripe.Resources.StatusDetails}
    }
  end
end
