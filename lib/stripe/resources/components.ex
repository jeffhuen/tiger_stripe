# File generated from our OpenAPI spec
defmodule Stripe.Resources.Components do
  @moduledoc """
  ConnectEmbeddedAccountSessionCreateComponents
  """

  @typedoc """
  * `account_management` - Expandable.
  * `account_onboarding` - Expandable.
  * `balances` - Expandable.
  * `disputes_list` - Expandable.
  * `documents` - Expandable.
  * `financial_account` - Expandable.
  * `financial_account_transactions` - Expandable.
  * `instant_payouts_promotion` - Expandable.
  * `issuing_card` - Expandable.
  * `issuing_cards_list` - Expandable.
  * `notification_banner` - Expandable.
  * `payment_details` - Expandable.
  * `payment_disputes` - Expandable.
  * `payments` - Expandable.
  * `payout_details` - Expandable.
  * `payouts` - Expandable.
  * `payouts_list` - Expandable.
  * `tax_registrations` - Expandable.
  * `tax_settings` - Expandable.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :account_management,
    :account_onboarding,
    :balances,
    :disputes_list,
    :documents,
    :financial_account,
    :financial_account_transactions,
    :instant_payouts_promotion,
    :issuing_card,
    :issuing_cards_list,
    :notification_banner,
    :payment_details,
    :payment_disputes,
    :payments,
    :payout_details,
    :payouts,
    :payouts_list,
    :tax_registrations,
    :tax_settings
  ]

  @object_name "connect_embedded_account_session_create_components"
  def object_name, do: @object_name

  def expandable_fields,
    do: [
      "account_management",
      "account_onboarding",
      "balances",
      "disputes_list",
      "documents",
      "financial_account",
      "financial_account_transactions",
      "instant_payouts_promotion",
      "issuing_card",
      "issuing_cards_list",
      "notification_banner",
      "payment_details",
      "payment_disputes",
      "payments",
      "payout_details",
      "payouts",
      "payouts_list",
      "tax_registrations",
      "tax_settings"
    ]

  def __nested_fields__ do
    %{
      "account_management" => {:resource, Stripe.Resources.AccountConfig},
      "account_onboarding" => {:resource, Stripe.Resources.AccountConfig},
      "balances" => {:resource, Stripe.Resources.PayoutsConfig},
      "disputes_list" => {:resource, Stripe.Resources.DisputesListConfig},
      "documents" => {:resource, Stripe.Resources.BaseConfig},
      "financial_account" => {:resource, Stripe.Resources.FinancialAccountConfig},
      "financial_account_transactions" =>
        {:resource, Stripe.Resources.FinancialAccountTransactionsConfig},
      "instant_payouts_promotion" => {:resource, Stripe.Resources.InstantPayoutsPromotionConfig},
      "issuing_card" => {:resource, Stripe.Resources.IssuingCardConfig},
      "issuing_cards_list" => {:resource, Stripe.Resources.IssuingCardsListConfig},
      "notification_banner" => {:resource, Stripe.Resources.AccountConfig},
      "payment_details" => {:resource, Stripe.Resources.PaymentsConfig},
      "payment_disputes" => {:resource, Stripe.Resources.PaymentDisputesConfig},
      "payments" => {:resource, Stripe.Resources.PaymentsConfig},
      "payout_details" => {:resource, Stripe.Resources.BaseConfig},
      "payouts" => {:resource, Stripe.Resources.PayoutsConfig},
      "payouts_list" => {:resource, Stripe.Resources.BaseConfig},
      "tax_registrations" => {:resource, Stripe.Resources.BaseConfig},
      "tax_settings" => {:resource, Stripe.Resources.BaseConfig}
    }
  end
end
