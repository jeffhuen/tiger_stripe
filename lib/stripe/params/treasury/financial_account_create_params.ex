# File generated from our OpenAPI spec
defmodule Stripe.Params.Treasury.FinancialAccountCreateParams do
  @moduledoc "Parameters for financial account create."

  @typedoc """
  * `expand` - Specifies which fields in the response should be expanded.
  * `features` - Encodes whether a FinancialAccount has access to a particular feature. Stripe or the platform can control features via the requested field.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `nickname` - The nickname for the FinancialAccount.
  * `platform_restrictions` - The set of functionalities that the platform can restrict on the FinancialAccount.
  * `supported_currencies` - The currencies the FinancialAccount can hold a balance in.
  """
  @type t :: %__MODULE__{
          expand: [String.t()] | nil,
          features: features() | nil,
          metadata: %{String.t() => String.t()} | nil,
          nickname: map() | nil,
          platform_restrictions: platform_restrictions() | nil,
          supported_currencies: [String.t()]
        }

  defstruct [
    :expand,
    :features,
    :metadata,
    :nickname,
    :platform_restrictions,
    :supported_currencies
  ]

  @typedoc """
  * `card_issuing` - Encodes the FinancialAccount's ability to be used with the Issuing product, including attaching cards to and drawing funds from the FinancialAccount.
  * `deposit_insurance` - Represents whether this FinancialAccount is eligible for deposit insurance. Various factors determine the insurance amount.
  * `financial_addresses` - Contains Features that add FinancialAddresses to the FinancialAccount.
  * `inbound_transfers` - Contains settings related to adding funds to a FinancialAccount from another Account with the same owner.
  * `intra_stripe_flows` - Represents the ability for the FinancialAccount to send money to, or receive money from other FinancialAccounts (for example, via OutboundPayment).
  * `outbound_payments` - Includes Features related to initiating money movement out of the FinancialAccount to someone else's bucket of money.
  * `outbound_transfers` - Contains a Feature and settings related to moving money out of the FinancialAccount into another Account with the same owner.
  """
  @type features :: %{
          optional(:card_issuing) => features_card_issuing() | nil,
          optional(:deposit_insurance) => features_deposit_insurance() | nil,
          optional(:financial_addresses) => features_financial_addresses() | nil,
          optional(:inbound_transfers) => features_inbound_transfers() | nil,
          optional(:intra_stripe_flows) => features_intra_stripe_flows() | nil,
          optional(:outbound_payments) => features_outbound_payments() | nil,
          optional(:outbound_transfers) => features_outbound_transfers() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `requested` - Whether the FinancialAccount should have the Feature.
  """
  @type features_card_issuing :: %{
          optional(:requested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `requested` - Whether the FinancialAccount should have the Feature.
  """
  @type features_deposit_insurance :: %{
          optional(:requested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `aba` - Adds an ABA FinancialAddress to the FinancialAccount.
  """
  @type features_financial_addresses :: %{
          optional(:aba) => features_financial_addresses_aba() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `requested` - Whether the FinancialAccount should have the Feature.
  """
  @type features_financial_addresses_aba :: %{
          optional(:requested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `ach` - Enables ACH Debits via the InboundTransfers API.
  """
  @type features_inbound_transfers :: %{
          optional(:ach) => features_inbound_transfers_ach() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `requested` - Whether the FinancialAccount should have the Feature.
  """
  @type features_inbound_transfers_ach :: %{
          optional(:requested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `requested` - Whether the FinancialAccount should have the Feature.
  """
  @type features_intra_stripe_flows :: %{
          optional(:requested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `ach` - Enables ACH transfers via the OutboundPayments API.
  * `us_domestic_wire` - Enables US domestic wire transfers via the OutboundPayments API.
  """
  @type features_outbound_payments :: %{
          optional(:ach) => features_outbound_payments_ach() | nil,
          optional(:us_domestic_wire) => features_outbound_payments_us_domestic_wire() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `requested` - Whether the FinancialAccount should have the Feature.
  """
  @type features_outbound_payments_ach :: %{
          optional(:requested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `requested` - Whether the FinancialAccount should have the Feature.
  """
  @type features_outbound_payments_us_domestic_wire :: %{
          optional(:requested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `ach` - Enables ACH transfers via the OutboundTransfers API.
  * `us_domestic_wire` - Enables US domestic wire transfers via the OutboundTransfers API.
  """
  @type features_outbound_transfers :: %{
          optional(:ach) => features_outbound_transfers_ach() | nil,
          optional(:us_domestic_wire) => features_outbound_transfers_us_domestic_wire() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `requested` - Whether the FinancialAccount should have the Feature.
  """
  @type features_outbound_transfers_ach :: %{
          optional(:requested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `requested` - Whether the FinancialAccount should have the Feature.
  """
  @type features_outbound_transfers_us_domestic_wire :: %{
          optional(:requested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `inbound_flows` - Restricts all inbound money movement. Possible values: `restricted`, `unrestricted`.
  * `outbound_flows` - Restricts all outbound money movement. Possible values: `restricted`, `unrestricted`.
  """
  @type platform_restrictions :: %{
          optional(:inbound_flows) => String.t() | nil,
          optional(:outbound_flows) => String.t() | nil,
          optional(String.t()) => term()
        }
end
