# File generated from our OpenAPI spec
defmodule Stripe.Params.Treasury.FinancialAccountFeaturesUpdateFeaturesParams do
  @moduledoc "Parameters for financial account features update features."

  @typedoc """
  * `card_issuing` - Encodes the FinancialAccount's ability to be used with the Issuing product, including attaching cards to and drawing funds from the FinancialAccount.
  * `deposit_insurance` - Represents whether this FinancialAccount is eligible for deposit insurance. Various factors determine the insurance amount.
  * `expand` - Specifies which fields in the response should be expanded.
  * `financial_addresses` - Contains Features that add FinancialAddresses to the FinancialAccount.
  * `inbound_transfers` - Contains settings related to adding funds to a FinancialAccount from another Account with the same owner.
  * `intra_stripe_flows` - Represents the ability for the FinancialAccount to send money to, or receive money from other FinancialAccounts (for example, via OutboundPayment).
  * `outbound_payments` - Includes Features related to initiating money movement out of the FinancialAccount to someone else's bucket of money.
  * `outbound_transfers` - Contains a Feature and settings related to moving money out of the FinancialAccount into another Account with the same owner.
  """
  @type t :: %__MODULE__{
          card_issuing: card_issuing() | nil,
          deposit_insurance: deposit_insurance() | nil,
          expand: [String.t()] | nil,
          financial_addresses: financial_addresses() | nil,
          inbound_transfers: inbound_transfers() | nil,
          intra_stripe_flows: intra_stripe_flows() | nil,
          outbound_payments: outbound_payments() | nil,
          outbound_transfers: outbound_transfers() | nil
        }

  defstruct [
    :card_issuing,
    :deposit_insurance,
    :expand,
    :financial_addresses,
    :inbound_transfers,
    :intra_stripe_flows,
    :outbound_payments,
    :outbound_transfers
  ]

  @typedoc """
  * `requested` - Whether the FinancialAccount should have the Feature.
  """
  @type card_issuing :: %{
          optional(:requested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `requested` - Whether the FinancialAccount should have the Feature.
  """
  @type deposit_insurance :: %{
          optional(:requested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `aba` - Adds an ABA FinancialAddress to the FinancialAccount.
  """
  @type financial_addresses :: %{
          optional(:aba) => financial_addresses_aba() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `requested` - Whether the FinancialAccount should have the Feature.
  """
  @type financial_addresses_aba :: %{
          optional(:requested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `ach` - Enables ACH Debits via the InboundTransfers API.
  """
  @type inbound_transfers :: %{
          optional(:ach) => inbound_transfers_ach() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `requested` - Whether the FinancialAccount should have the Feature.
  """
  @type inbound_transfers_ach :: %{
          optional(:requested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `requested` - Whether the FinancialAccount should have the Feature.
  """
  @type intra_stripe_flows :: %{
          optional(:requested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `ach` - Enables ACH transfers via the OutboundPayments API.
  * `us_domestic_wire` - Enables US domestic wire transfers via the OutboundPayments API.
  """
  @type outbound_payments :: %{
          optional(:ach) => outbound_payments_ach() | nil,
          optional(:us_domestic_wire) => outbound_payments_us_domestic_wire() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `requested` - Whether the FinancialAccount should have the Feature.
  """
  @type outbound_payments_ach :: %{
          optional(:requested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `requested` - Whether the FinancialAccount should have the Feature.
  """
  @type outbound_payments_us_domestic_wire :: %{
          optional(:requested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `ach` - Enables ACH transfers via the OutboundTransfers API.
  * `us_domestic_wire` - Enables US domestic wire transfers via the OutboundTransfers API.
  """
  @type outbound_transfers :: %{
          optional(:ach) => outbound_transfers_ach() | nil,
          optional(:us_domestic_wire) => outbound_transfers_us_domestic_wire() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `requested` - Whether the FinancialAccount should have the Feature.
  """
  @type outbound_transfers_ach :: %{
          optional(:requested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `requested` - Whether the FinancialAccount should have the Feature.
  """
  @type outbound_transfers_us_domestic_wire :: %{
          optional(:requested) => boolean() | nil,
          optional(String.t()) => term()
        }
end
