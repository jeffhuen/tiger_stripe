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
  @type t :: %__MODULE__{}

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
end
