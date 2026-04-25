# File generated from our OpenAPI spec
defmodule Stripe.Resources.Treasury.FinancialAccountFeatures do
  @moduledoc """
  TreasuryFinancialAccountsResourceFinancialAccountFeatures

  Encodes whether a FinancialAccount has access to a particular Feature, with a `status` enum and associated `status_details`.
  Stripe or the platform can control Features via the requested field.
  """

  @typedoc """
  * `card_issuing` - Expandable.
  * `deposit_insurance` - Expandable.
  * `financial_addresses` - Expandable.
  * `inbound_transfers` - Expandable.
  * `intra_stripe_flows` - Expandable.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `treasury.financial_account_features`.
  * `outbound_payments` - Expandable.
  * `outbound_transfers` - Expandable.
  """
  @type t :: %__MODULE__{
          card_issuing: Stripe.Resources.ToggleSettings.t() | nil,
          deposit_insurance: Stripe.Resources.ToggleSettings.t() | nil,
          financial_addresses: Stripe.Resources.FinancialAddresses.t() | nil,
          inbound_transfers: Stripe.Resources.InboundTransfers.t() | nil,
          intra_stripe_flows: Stripe.Resources.ToggleSettings.t() | nil,
          object: String.t(),
          outbound_payments: Stripe.Resources.OutboundPayments.t() | nil,
          outbound_transfers: Stripe.Resources.OutboundTransfers.t() | nil
        }

  defstruct [
    :card_issuing,
    :deposit_insurance,
    :financial_addresses,
    :inbound_transfers,
    :intra_stripe_flows,
    :object,
    :outbound_payments,
    :outbound_transfers
  ]

  @object_name "treasury.financial_account_features"
  def object_name, do: @object_name

  def expandable_fields,
    do: [
      "card_issuing",
      "deposit_insurance",
      "financial_addresses",
      "inbound_transfers",
      "intra_stripe_flows",
      "outbound_payments",
      "outbound_transfers"
    ]

  def __nested_fields__ do
    %{
      "card_issuing" => {:resource, Stripe.Resources.ToggleSettings},
      "deposit_insurance" => {:resource, Stripe.Resources.ToggleSettings},
      "financial_addresses" => {:resource, Stripe.Resources.FinancialAddresses},
      "inbound_transfers" => {:resource, Stripe.Resources.InboundTransfers},
      "intra_stripe_flows" => {:resource, Stripe.Resources.ToggleSettings},
      "outbound_payments" => {:resource, Stripe.Resources.OutboundPayments},
      "outbound_transfers" => {:resource, Stripe.Resources.OutboundTransfers}
    }
  end
end
