# File generated from our OpenAPI spec
defmodule Stripe.Params.AccountSessionCreateParams do
  @moduledoc "Parameters for account session create."

  @typedoc """
  * `account` - The identifier of the account to create an Account Session for.
  * `components` - Each key of the dictionary represents an embedded component, and each embedded component maps to its configuration (e.g. whether it has been enabled or not).
  * `expand` - Specifies which fields in the response should be expanded.
  """
  @type t :: %__MODULE__{
          account: String.t(),
          components: components(),
          expand: [String.t()] | nil
        }

  defstruct [:account, :components, :expand]

  @typedoc """
  * `account_management` - Configuration for the [account management](https://stripe.com/connect/supported-embedded-components/account-management/) embedded component.
  * `account_onboarding` - Configuration for the [account onboarding](https://stripe.com/connect/supported-embedded-components/account-onboarding/) embedded component.
  * `balances` - Configuration for the [balances](https://stripe.com/connect/supported-embedded-components/balances/) embedded component.
  * `disputes_list` - Configuration for the [disputes list](https://stripe.com/connect/supported-embedded-components/disputes-list/) embedded component.
  * `documents` - Configuration for the [documents](https://stripe.com/connect/supported-embedded-components/documents/) embedded component.
  * `financial_account` - Configuration for the [financial account](https://stripe.com/connect/supported-embedded-components/financial-account/) embedded component.
  * `financial_account_transactions` - Configuration for the [financial account transactions](https://stripe.com/connect/supported-embedded-components/financial-account-transactions/) embedded component.
  * `instant_payouts_promotion` - Configuration for the [instant payouts promotion](https://stripe.com/connect/supported-embedded-components/instant-payouts-promotion/) embedded component.
  * `issuing_card` - Configuration for the [issuing card](https://stripe.com/connect/supported-embedded-components/issuing-card/) embedded component.
  * `issuing_cards_list` - Configuration for the [issuing cards list](https://stripe.com/connect/supported-embedded-components/issuing-cards-list/) embedded component.
  * `notification_banner` - Configuration for the [notification banner](https://stripe.com/connect/supported-embedded-components/notification-banner/) embedded component.
  * `payment_details` - Configuration for the [payment details](https://stripe.com/connect/supported-embedded-components/payment-details/) embedded component.
  * `payment_disputes` - Configuration for the [payment disputes](https://stripe.com/connect/supported-embedded-components/payment-disputes/) embedded component.
  * `payments` - Configuration for the [payments](https://stripe.com/connect/supported-embedded-components/payments/) embedded component.
  * `payout_details` - Configuration for the [payout details](https://stripe.com/connect/supported-embedded-components/payout-details/) embedded component.
  * `payouts` - Configuration for the [payouts](https://stripe.com/connect/supported-embedded-components/payouts/) embedded component.
  * `payouts_list` - Configuration for the [payouts list](https://stripe.com/connect/supported-embedded-components/payouts-list/) embedded component.
  * `tax_registrations` - Configuration for the [tax registrations](https://stripe.com/connect/supported-embedded-components/tax-registrations/) embedded component.
  * `tax_settings` - Configuration for the [tax settings](https://stripe.com/connect/supported-embedded-components/tax-settings/) embedded component.
  """
  @type components :: %{
          optional(:account_management) => components_account_management() | nil,
          optional(:account_onboarding) => components_account_onboarding() | nil,
          optional(:balances) => components_balances() | nil,
          optional(:disputes_list) => components_disputes_list() | nil,
          optional(:documents) => components_documents() | nil,
          optional(:financial_account) => components_financial_account() | nil,
          optional(:financial_account_transactions) =>
            components_financial_account_transactions() | nil,
          optional(:instant_payouts_promotion) => components_instant_payouts_promotion() | nil,
          optional(:issuing_card) => components_issuing_card() | nil,
          optional(:issuing_cards_list) => components_issuing_cards_list() | nil,
          optional(:notification_banner) => components_notification_banner() | nil,
          optional(:payment_details) => components_payment_details() | nil,
          optional(:payment_disputes) => components_payment_disputes() | nil,
          optional(:payments) => components_payments() | nil,
          optional(:payout_details) => components_payout_details() | nil,
          optional(:payouts) => components_payouts() | nil,
          optional(:payouts_list) => components_payouts_list() | nil,
          optional(:tax_registrations) => components_tax_registrations() | nil,
          optional(:tax_settings) => components_tax_settings() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `enabled` - Whether the embedded component is enabled.
  * `features` - The list of features enabled in the embedded component.
  """
  @type components_account_management :: %{
          optional(:enabled) => boolean() | nil,
          optional(:features) => components_account_management_features() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `disable_stripe_user_authentication` - Whether Stripe user authentication is disabled. This value can only be `true` for accounts where `controller.requirement_collection` is `application` for the account. The default value is the opposite of the `external_account_collection` value. For example, if you don't set `external_account_collection`, it defaults to `true` and `disable_stripe_user_authentication` defaults to `false`.
  * `external_account_collection` - Whether external account collection is enabled. This feature can only be `false` for accounts where you’re responsible for collecting updated information when requirements are due or change, like Custom accounts. The default value for this feature is `true`.
  """
  @type components_account_management_features :: %{
          optional(:disable_stripe_user_authentication) => boolean() | nil,
          optional(:external_account_collection) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `enabled` - Whether the embedded component is enabled.
  * `features` - The list of features enabled in the embedded component.
  """
  @type components_account_onboarding :: %{
          optional(:enabled) => boolean() | nil,
          optional(:features) => components_account_onboarding_features() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `disable_stripe_user_authentication` - Whether Stripe user authentication is disabled. This value can only be `true` for accounts where `controller.requirement_collection` is `application` for the account. The default value is the opposite of the `external_account_collection` value. For example, if you don't set `external_account_collection`, it defaults to `true` and `disable_stripe_user_authentication` defaults to `false`.
  * `external_account_collection` - Whether external account collection is enabled. This feature can only be `false` for accounts where you’re responsible for collecting updated information when requirements are due or change, like Custom accounts. The default value for this feature is `true`.
  """
  @type components_account_onboarding_features :: %{
          optional(:disable_stripe_user_authentication) => boolean() | nil,
          optional(:external_account_collection) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `enabled` - Whether the embedded component is enabled.
  * `features` - The list of features enabled in the embedded component.
  """
  @type components_balances :: %{
          optional(:enabled) => boolean() | nil,
          optional(:features) => components_balances_features() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `disable_stripe_user_authentication` - Whether Stripe user authentication is disabled. This value can only be `true` for accounts where `controller.requirement_collection` is `application` for the account. The default value is the opposite of the `external_account_collection` value. For example, if you don't set `external_account_collection`, it defaults to `true` and `disable_stripe_user_authentication` defaults to `false`.
  * `edit_payout_schedule` - Whether to allow payout schedule to be changed. Defaults to `true` when `controller.losses.payments` is set to `stripe` for the account, otherwise `false`.
  * `external_account_collection` - Whether external account collection is enabled. This feature can only be `false` for accounts where you’re responsible for collecting updated information when requirements are due or change, like Custom accounts. The default value for this feature is `true`.
  * `instant_payouts` - Whether instant payouts are enabled for this component.
  * `standard_payouts` - Whether to allow creation of standard payouts. Defaults to `true` when `controller.losses.payments` is set to `stripe` for the account, otherwise `false`.
  """
  @type components_balances_features :: %{
          optional(:disable_stripe_user_authentication) => boolean() | nil,
          optional(:edit_payout_schedule) => boolean() | nil,
          optional(:external_account_collection) => boolean() | nil,
          optional(:instant_payouts) => boolean() | nil,
          optional(:standard_payouts) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `enabled` - Whether the embedded component is enabled.
  * `features` - The list of features enabled in the embedded component.
  """
  @type components_disputes_list :: %{
          optional(:enabled) => boolean() | nil,
          optional(:features) => components_disputes_list_features() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `capture_payments` - Whether to allow capturing and cancelling payment intents. This is `true` by default.
  * `destination_on_behalf_of_charge_management` - Whether connected accounts can manage destination charges that are created on behalf of them. This is `false` by default.
  * `dispute_management` - Whether responding to disputes is enabled, including submitting evidence and accepting disputes. This is `true` by default.
  * `refund_management` - Whether sending refunds is enabled. This is `true` by default.
  """
  @type components_disputes_list_features :: %{
          optional(:capture_payments) => boolean() | nil,
          optional(:destination_on_behalf_of_charge_management) => boolean() | nil,
          optional(:dispute_management) => boolean() | nil,
          optional(:refund_management) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `enabled` - Whether the embedded component is enabled.
  * `features` - An empty list, because this embedded component has no features.
  """
  @type components_documents :: %{
          optional(:enabled) => boolean() | nil,
          optional(:features) => map() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `enabled` - Whether the embedded component is enabled.
  * `features` - The list of features enabled in the embedded component.
  """
  @type components_financial_account :: %{
          optional(:enabled) => boolean() | nil,
          optional(:features) => components_financial_account_features() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `disable_stripe_user_authentication` - Whether Stripe user authentication is disabled. This value can only be `true` for accounts where `controller.requirement_collection` is `application` for the account. The default value is the opposite of the `external_account_collection` value. For example, if you don't set `external_account_collection`, it defaults to `true` and `disable_stripe_user_authentication` defaults to `false`.
  * `external_account_collection` - Whether external account collection is enabled. This feature can only be `false` for accounts where you’re responsible for collecting updated information when requirements are due or change, like Custom accounts. The default value for this feature is `true`.
  * `send_money` - Whether to allow sending money.
  * `transfer_balance` - Whether to allow transferring balance.
  """
  @type components_financial_account_features :: %{
          optional(:disable_stripe_user_authentication) => boolean() | nil,
          optional(:external_account_collection) => boolean() | nil,
          optional(:send_money) => boolean() | nil,
          optional(:transfer_balance) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `enabled` - Whether the embedded component is enabled.
  * `features` - The list of features enabled in the embedded component.
  """
  @type components_financial_account_transactions :: %{
          optional(:enabled) => boolean() | nil,
          optional(:features) => components_financial_account_transactions_features() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `card_spend_dispute_management` - Whether to allow card spend dispute management features.
  """
  @type components_financial_account_transactions_features :: %{
          optional(:card_spend_dispute_management) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `enabled` - Whether the embedded component is enabled.
  * `features` - The list of features enabled in the embedded component.
  """
  @type components_instant_payouts_promotion :: %{
          optional(:enabled) => boolean() | nil,
          optional(:features) => components_instant_payouts_promotion_features() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `disable_stripe_user_authentication` - Whether Stripe user authentication is disabled. This value can only be `true` for accounts where `controller.requirement_collection` is `application` for the account. The default value is the opposite of the `external_account_collection` value. For example, if you don't set `external_account_collection`, it defaults to `true` and `disable_stripe_user_authentication` defaults to `false`.
  * `external_account_collection` - Whether external account collection is enabled. This feature can only be `false` for accounts where you’re responsible for collecting updated information when requirements are due or change, like Custom accounts. The default value for this feature is `true`.
  * `instant_payouts` - Whether instant payouts are enabled for this component.
  """
  @type components_instant_payouts_promotion_features :: %{
          optional(:disable_stripe_user_authentication) => boolean() | nil,
          optional(:external_account_collection) => boolean() | nil,
          optional(:instant_payouts) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `enabled` - Whether the embedded component is enabled.
  * `features` - The list of features enabled in the embedded component.
  """
  @type components_issuing_card :: %{
          optional(:enabled) => boolean() | nil,
          optional(:features) => components_issuing_card_features() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `card_management` - Whether to allow card management features.
  * `card_spend_dispute_management` - Whether to allow card spend dispute management features.
  * `cardholder_management` - Whether to allow cardholder management features.
  * `spend_control_management` - Whether to allow spend control management features.
  """
  @type components_issuing_card_features :: %{
          optional(:card_management) => boolean() | nil,
          optional(:card_spend_dispute_management) => boolean() | nil,
          optional(:cardholder_management) => boolean() | nil,
          optional(:spend_control_management) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `enabled` - Whether the embedded component is enabled.
  * `features` - The list of features enabled in the embedded component.
  """
  @type components_issuing_cards_list :: %{
          optional(:enabled) => boolean() | nil,
          optional(:features) => components_issuing_cards_list_features() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `card_management` - Whether to allow card management features.
  * `card_spend_dispute_management` - Whether to allow card spend dispute management features.
  * `cardholder_management` - Whether to allow cardholder management features.
  * `disable_stripe_user_authentication` - Whether Stripe user authentication is disabled. This value can only be `true` for accounts where `controller.requirement_collection` is `application` for the account. The default value is the opposite of the `external_account_collection` value. For example, if you don't set `external_account_collection`, it defaults to `true` and `disable_stripe_user_authentication` defaults to `false`.
  * `spend_control_management` - Whether to allow spend control management features.
  """
  @type components_issuing_cards_list_features :: %{
          optional(:card_management) => boolean() | nil,
          optional(:card_spend_dispute_management) => boolean() | nil,
          optional(:cardholder_management) => boolean() | nil,
          optional(:disable_stripe_user_authentication) => boolean() | nil,
          optional(:spend_control_management) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `enabled` - Whether the embedded component is enabled.
  * `features` - The list of features enabled in the embedded component.
  """
  @type components_notification_banner :: %{
          optional(:enabled) => boolean() | nil,
          optional(:features) => components_notification_banner_features() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `disable_stripe_user_authentication` - Whether Stripe user authentication is disabled. This value can only be `true` for accounts where `controller.requirement_collection` is `application` for the account. The default value is the opposite of the `external_account_collection` value. For example, if you don't set `external_account_collection`, it defaults to `true` and `disable_stripe_user_authentication` defaults to `false`.
  * `external_account_collection` - Whether external account collection is enabled. This feature can only be `false` for accounts where you’re responsible for collecting updated information when requirements are due or change, like Custom accounts. The default value for this feature is `true`.
  """
  @type components_notification_banner_features :: %{
          optional(:disable_stripe_user_authentication) => boolean() | nil,
          optional(:external_account_collection) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `enabled` - Whether the embedded component is enabled.
  * `features` - The list of features enabled in the embedded component.
  """
  @type components_payment_details :: %{
          optional(:enabled) => boolean() | nil,
          optional(:features) => components_payment_details_features() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `capture_payments` - Whether to allow capturing and cancelling payment intents. This is `true` by default.
  * `destination_on_behalf_of_charge_management` - Whether connected accounts can manage destination charges that are created on behalf of them. This is `false` by default.
  * `dispute_management` - Whether responding to disputes is enabled, including submitting evidence and accepting disputes. This is `true` by default.
  * `refund_management` - Whether sending refunds is enabled. This is `true` by default.
  """
  @type components_payment_details_features :: %{
          optional(:capture_payments) => boolean() | nil,
          optional(:destination_on_behalf_of_charge_management) => boolean() | nil,
          optional(:dispute_management) => boolean() | nil,
          optional(:refund_management) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `enabled` - Whether the embedded component is enabled.
  * `features` - The list of features enabled in the embedded component.
  """
  @type components_payment_disputes :: %{
          optional(:enabled) => boolean() | nil,
          optional(:features) => components_payment_disputes_features() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `destination_on_behalf_of_charge_management` - Whether connected accounts can manage destination charges that are created on behalf of them. This is `false` by default.
  * `dispute_management` - Whether responding to disputes is enabled, including submitting evidence and accepting disputes. This is `true` by default.
  * `refund_management` - Whether sending refunds is enabled. This is `true` by default.
  """
  @type components_payment_disputes_features :: %{
          optional(:destination_on_behalf_of_charge_management) => boolean() | nil,
          optional(:dispute_management) => boolean() | nil,
          optional(:refund_management) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `enabled` - Whether the embedded component is enabled.
  * `features` - The list of features enabled in the embedded component.
  """
  @type components_payments :: %{
          optional(:enabled) => boolean() | nil,
          optional(:features) => components_payments_features() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `capture_payments` - Whether to allow capturing and cancelling payment intents. This is `true` by default.
  * `destination_on_behalf_of_charge_management` - Whether connected accounts can manage destination charges that are created on behalf of them. This is `false` by default.
  * `dispute_management` - Whether responding to disputes is enabled, including submitting evidence and accepting disputes. This is `true` by default.
  * `refund_management` - Whether sending refunds is enabled. This is `true` by default.
  """
  @type components_payments_features :: %{
          optional(:capture_payments) => boolean() | nil,
          optional(:destination_on_behalf_of_charge_management) => boolean() | nil,
          optional(:dispute_management) => boolean() | nil,
          optional(:refund_management) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `enabled` - Whether the embedded component is enabled.
  * `features` - An empty list, because this embedded component has no features.
  """
  @type components_payout_details :: %{
          optional(:enabled) => boolean() | nil,
          optional(:features) => map() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `enabled` - Whether the embedded component is enabled.
  * `features` - The list of features enabled in the embedded component.
  """
  @type components_payouts :: %{
          optional(:enabled) => boolean() | nil,
          optional(:features) => components_payouts_features() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `disable_stripe_user_authentication` - Whether Stripe user authentication is disabled. This value can only be `true` for accounts where `controller.requirement_collection` is `application` for the account. The default value is the opposite of the `external_account_collection` value. For example, if you don't set `external_account_collection`, it defaults to `true` and `disable_stripe_user_authentication` defaults to `false`.
  * `edit_payout_schedule` - Whether to allow payout schedule to be changed. Defaults to `true` when `controller.losses.payments` is set to `stripe` for the account, otherwise `false`.
  * `external_account_collection` - Whether external account collection is enabled. This feature can only be `false` for accounts where you’re responsible for collecting updated information when requirements are due or change, like Custom accounts. The default value for this feature is `true`.
  * `instant_payouts` - Whether instant payouts are enabled for this component.
  * `standard_payouts` - Whether to allow creation of standard payouts. Defaults to `true` when `controller.losses.payments` is set to `stripe` for the account, otherwise `false`.
  """
  @type components_payouts_features :: %{
          optional(:disable_stripe_user_authentication) => boolean() | nil,
          optional(:edit_payout_schedule) => boolean() | nil,
          optional(:external_account_collection) => boolean() | nil,
          optional(:instant_payouts) => boolean() | nil,
          optional(:standard_payouts) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `enabled` - Whether the embedded component is enabled.
  * `features` - An empty list, because this embedded component has no features.
  """
  @type components_payouts_list :: %{
          optional(:enabled) => boolean() | nil,
          optional(:features) => map() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `enabled` - Whether the embedded component is enabled.
  * `features` - An empty list, because this embedded component has no features.
  """
  @type components_tax_registrations :: %{
          optional(:enabled) => boolean() | nil,
          optional(:features) => map() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `enabled` - Whether the embedded component is enabled.
  * `features` - An empty list, because this embedded component has no features.
  """
  @type components_tax_settings :: %{
          optional(:enabled) => boolean() | nil,
          optional(:features) => map() | nil,
          optional(String.t()) => term()
        }
end
