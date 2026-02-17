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
          components: __MODULE__.Components.t(),
          expand: [String.t()] | nil
        }

  defstruct [:account, :components, :expand]

  defmodule Components do
    @moduledoc "Nested parameters."

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
    @type t :: %__MODULE__{
            account_management: __MODULE__.AccountManagement.t() | nil,
            account_onboarding: __MODULE__.AccountOnboarding.t() | nil,
            balances: __MODULE__.Balances.t() | nil,
            disputes_list: __MODULE__.DisputesList.t() | nil,
            documents: __MODULE__.Documents.t() | nil,
            financial_account: __MODULE__.FinancialAccount.t() | nil,
            financial_account_transactions: __MODULE__.FinancialAccountTransactions.t() | nil,
            instant_payouts_promotion: __MODULE__.InstantPayoutsPromotion.t() | nil,
            issuing_card: __MODULE__.IssuingCard.t() | nil,
            issuing_cards_list: __MODULE__.IssuingCardsList.t() | nil,
            notification_banner: __MODULE__.NotificationBanner.t() | nil,
            payment_details: __MODULE__.PaymentDetails.t() | nil,
            payment_disputes: __MODULE__.PaymentDisputes.t() | nil,
            payments: __MODULE__.Payments.t() | nil,
            payout_details: __MODULE__.PayoutDetails.t() | nil,
            payouts: __MODULE__.Payouts.t() | nil,
            payouts_list: __MODULE__.PayoutsList.t() | nil,
            tax_registrations: __MODULE__.TaxRegistrations.t() | nil,
            tax_settings: __MODULE__.TaxSettings.t() | nil
          }
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

    defmodule AccountManagement do
      @moduledoc "Nested parameters."

      @typedoc """
      * `enabled` - Whether the embedded component is enabled.
      * `features` - The list of features enabled in the embedded component.
      """
      @type t :: %__MODULE__{
              enabled: boolean() | nil,
              features: __MODULE__.Features.t() | nil
            }
      defstruct [:enabled, :features]

      defmodule Features do
        @moduledoc "Nested parameters."

        @typedoc """
        * `disable_stripe_user_authentication` - Whether Stripe user authentication is disabled. This value can only be `true` for accounts where `controller.requirement_collection` is `application` for the account. The default value is the opposite of the `external_account_collection` value. For example, if you don't set `external_account_collection`, it defaults to `true` and `disable_stripe_user_authentication` defaults to `false`.
        * `external_account_collection` - Whether external account collection is enabled. This feature can only be `false` for accounts where you’re responsible for collecting updated information when requirements are due or change, like Custom accounts. The default value for this feature is `true`.
        """
        @type t :: %__MODULE__{
                disable_stripe_user_authentication: boolean() | nil,
                external_account_collection: boolean() | nil
              }
        defstruct [:disable_stripe_user_authentication, :external_account_collection]
      end
    end

    defmodule AccountOnboarding do
      @moduledoc "Nested parameters."

      @typedoc """
      * `enabled` - Whether the embedded component is enabled.
      * `features` - The list of features enabled in the embedded component.
      """
      @type t :: %__MODULE__{
              enabled: boolean() | nil,
              features: __MODULE__.Features.t() | nil
            }
      defstruct [:enabled, :features]

      defmodule Features do
        @moduledoc "Nested parameters."

        @typedoc """
        * `disable_stripe_user_authentication` - Whether Stripe user authentication is disabled. This value can only be `true` for accounts where `controller.requirement_collection` is `application` for the account. The default value is the opposite of the `external_account_collection` value. For example, if you don't set `external_account_collection`, it defaults to `true` and `disable_stripe_user_authentication` defaults to `false`.
        * `external_account_collection` - Whether external account collection is enabled. This feature can only be `false` for accounts where you’re responsible for collecting updated information when requirements are due or change, like Custom accounts. The default value for this feature is `true`.
        """
        @type t :: %__MODULE__{
                disable_stripe_user_authentication: boolean() | nil,
                external_account_collection: boolean() | nil
              }
        defstruct [:disable_stripe_user_authentication, :external_account_collection]
      end
    end

    defmodule Balances do
      @moduledoc "Nested parameters."

      @typedoc """
      * `enabled` - Whether the embedded component is enabled.
      * `features` - The list of features enabled in the embedded component.
      """
      @type t :: %__MODULE__{
              enabled: boolean() | nil,
              features: __MODULE__.Features.t() | nil
            }
      defstruct [:enabled, :features]

      defmodule Features do
        @moduledoc "Nested parameters."

        @typedoc """
        * `disable_stripe_user_authentication` - Whether Stripe user authentication is disabled. This value can only be `true` for accounts where `controller.requirement_collection` is `application` for the account. The default value is the opposite of the `external_account_collection` value. For example, if you don't set `external_account_collection`, it defaults to `true` and `disable_stripe_user_authentication` defaults to `false`.
        * `edit_payout_schedule` - Whether to allow payout schedule to be changed. Defaults to `true` when `controller.losses.payments` is set to `stripe` for the account, otherwise `false`.
        * `external_account_collection` - Whether external account collection is enabled. This feature can only be `false` for accounts where you’re responsible for collecting updated information when requirements are due or change, like Custom accounts. The default value for this feature is `true`.
        * `instant_payouts` - Whether instant payouts are enabled for this component.
        * `standard_payouts` - Whether to allow creation of standard payouts. Defaults to `true` when `controller.losses.payments` is set to `stripe` for the account, otherwise `false`.
        """
        @type t :: %__MODULE__{
                disable_stripe_user_authentication: boolean() | nil,
                edit_payout_schedule: boolean() | nil,
                external_account_collection: boolean() | nil,
                instant_payouts: boolean() | nil,
                standard_payouts: boolean() | nil
              }
        defstruct [
          :disable_stripe_user_authentication,
          :edit_payout_schedule,
          :external_account_collection,
          :instant_payouts,
          :standard_payouts
        ]
      end
    end

    defmodule DisputesList do
      @moduledoc "Nested parameters."

      @typedoc """
      * `enabled` - Whether the embedded component is enabled.
      * `features` - The list of features enabled in the embedded component.
      """
      @type t :: %__MODULE__{
              enabled: boolean() | nil,
              features: __MODULE__.Features.t() | nil
            }
      defstruct [:enabled, :features]

      defmodule Features do
        @moduledoc "Nested parameters."

        @typedoc """
        * `capture_payments` - Whether to allow capturing and cancelling payment intents. This is `true` by default.
        * `destination_on_behalf_of_charge_management` - Whether connected accounts can manage destination charges that are created on behalf of them. This is `false` by default.
        * `dispute_management` - Whether responding to disputes is enabled, including submitting evidence and accepting disputes. This is `true` by default.
        * `refund_management` - Whether sending refunds is enabled. This is `true` by default.
        """
        @type t :: %__MODULE__{
                capture_payments: boolean() | nil,
                destination_on_behalf_of_charge_management: boolean() | nil,
                dispute_management: boolean() | nil,
                refund_management: boolean() | nil
              }
        defstruct [
          :capture_payments,
          :destination_on_behalf_of_charge_management,
          :dispute_management,
          :refund_management
        ]
      end
    end

    defmodule Documents do
      @moduledoc "Nested parameters."

      @typedoc """
      * `enabled` - Whether the embedded component is enabled.
      * `features` - An empty list, because this embedded component has no features.
      """
      @type t :: %__MODULE__{
              enabled: boolean() | nil,
              features: map() | nil
            }
      defstruct [:enabled, :features]
    end

    defmodule FinancialAccount do
      @moduledoc "Nested parameters."

      @typedoc """
      * `enabled` - Whether the embedded component is enabled.
      * `features` - The list of features enabled in the embedded component.
      """
      @type t :: %__MODULE__{
              enabled: boolean() | nil,
              features: __MODULE__.Features.t() | nil
            }
      defstruct [:enabled, :features]

      defmodule Features do
        @moduledoc "Nested parameters."

        @typedoc """
        * `disable_stripe_user_authentication` - Whether Stripe user authentication is disabled. This value can only be `true` for accounts where `controller.requirement_collection` is `application` for the account. The default value is the opposite of the `external_account_collection` value. For example, if you don't set `external_account_collection`, it defaults to `true` and `disable_stripe_user_authentication` defaults to `false`.
        * `external_account_collection` - Whether external account collection is enabled. This feature can only be `false` for accounts where you’re responsible for collecting updated information when requirements are due or change, like Custom accounts. The default value for this feature is `true`.
        * `send_money` - Whether to allow sending money.
        * `transfer_balance` - Whether to allow transferring balance.
        """
        @type t :: %__MODULE__{
                disable_stripe_user_authentication: boolean() | nil,
                external_account_collection: boolean() | nil,
                send_money: boolean() | nil,
                transfer_balance: boolean() | nil
              }
        defstruct [
          :disable_stripe_user_authentication,
          :external_account_collection,
          :send_money,
          :transfer_balance
        ]
      end
    end

    defmodule FinancialAccountTransactions do
      @moduledoc "Nested parameters."

      @typedoc """
      * `enabled` - Whether the embedded component is enabled.
      * `features` - The list of features enabled in the embedded component.
      """
      @type t :: %__MODULE__{
              enabled: boolean() | nil,
              features: __MODULE__.Features.t() | nil
            }
      defstruct [:enabled, :features]

      defmodule Features do
        @moduledoc "Nested parameters."

        @typedoc """
        * `card_spend_dispute_management` - Whether to allow card spend dispute management features.
        """
        @type t :: %__MODULE__{
                card_spend_dispute_management: boolean() | nil
              }
        defstruct [:card_spend_dispute_management]
      end
    end

    defmodule InstantPayoutsPromotion do
      @moduledoc "Nested parameters."

      @typedoc """
      * `enabled` - Whether the embedded component is enabled.
      * `features` - The list of features enabled in the embedded component.
      """
      @type t :: %__MODULE__{
              enabled: boolean() | nil,
              features: __MODULE__.Features.t() | nil
            }
      defstruct [:enabled, :features]

      defmodule Features do
        @moduledoc "Nested parameters."

        @typedoc """
        * `disable_stripe_user_authentication` - Whether Stripe user authentication is disabled. This value can only be `true` for accounts where `controller.requirement_collection` is `application` for the account. The default value is the opposite of the `external_account_collection` value. For example, if you don't set `external_account_collection`, it defaults to `true` and `disable_stripe_user_authentication` defaults to `false`.
        * `external_account_collection` - Whether external account collection is enabled. This feature can only be `false` for accounts where you’re responsible for collecting updated information when requirements are due or change, like Custom accounts. The default value for this feature is `true`.
        * `instant_payouts` - Whether instant payouts are enabled for this component.
        """
        @type t :: %__MODULE__{
                disable_stripe_user_authentication: boolean() | nil,
                external_account_collection: boolean() | nil,
                instant_payouts: boolean() | nil
              }
        defstruct [
          :disable_stripe_user_authentication,
          :external_account_collection,
          :instant_payouts
        ]
      end
    end

    defmodule IssuingCard do
      @moduledoc "Nested parameters."

      @typedoc """
      * `enabled` - Whether the embedded component is enabled.
      * `features` - The list of features enabled in the embedded component.
      """
      @type t :: %__MODULE__{
              enabled: boolean() | nil,
              features: __MODULE__.Features.t() | nil
            }
      defstruct [:enabled, :features]

      defmodule Features do
        @moduledoc "Nested parameters."

        @typedoc """
        * `card_management` - Whether to allow card management features.
        * `card_spend_dispute_management` - Whether to allow card spend dispute management features.
        * `cardholder_management` - Whether to allow cardholder management features.
        * `spend_control_management` - Whether to allow spend control management features.
        """
        @type t :: %__MODULE__{
                card_management: boolean() | nil,
                card_spend_dispute_management: boolean() | nil,
                cardholder_management: boolean() | nil,
                spend_control_management: boolean() | nil
              }
        defstruct [
          :card_management,
          :card_spend_dispute_management,
          :cardholder_management,
          :spend_control_management
        ]
      end
    end

    defmodule IssuingCardsList do
      @moduledoc "Nested parameters."

      @typedoc """
      * `enabled` - Whether the embedded component is enabled.
      * `features` - The list of features enabled in the embedded component.
      """
      @type t :: %__MODULE__{
              enabled: boolean() | nil,
              features: __MODULE__.Features.t() | nil
            }
      defstruct [:enabled, :features]

      defmodule Features do
        @moduledoc "Nested parameters."

        @typedoc """
        * `card_management` - Whether to allow card management features.
        * `card_spend_dispute_management` - Whether to allow card spend dispute management features.
        * `cardholder_management` - Whether to allow cardholder management features.
        * `disable_stripe_user_authentication` - Whether Stripe user authentication is disabled. This value can only be `true` for accounts where `controller.requirement_collection` is `application` for the account. The default value is the opposite of the `external_account_collection` value. For example, if you don't set `external_account_collection`, it defaults to `true` and `disable_stripe_user_authentication` defaults to `false`.
        * `spend_control_management` - Whether to allow spend control management features.
        """
        @type t :: %__MODULE__{
                card_management: boolean() | nil,
                card_spend_dispute_management: boolean() | nil,
                cardholder_management: boolean() | nil,
                disable_stripe_user_authentication: boolean() | nil,
                spend_control_management: boolean() | nil
              }
        defstruct [
          :card_management,
          :card_spend_dispute_management,
          :cardholder_management,
          :disable_stripe_user_authentication,
          :spend_control_management
        ]
      end
    end

    defmodule NotificationBanner do
      @moduledoc "Nested parameters."

      @typedoc """
      * `enabled` - Whether the embedded component is enabled.
      * `features` - The list of features enabled in the embedded component.
      """
      @type t :: %__MODULE__{
              enabled: boolean() | nil,
              features: __MODULE__.Features.t() | nil
            }
      defstruct [:enabled, :features]

      defmodule Features do
        @moduledoc "Nested parameters."

        @typedoc """
        * `disable_stripe_user_authentication` - Whether Stripe user authentication is disabled. This value can only be `true` for accounts where `controller.requirement_collection` is `application` for the account. The default value is the opposite of the `external_account_collection` value. For example, if you don't set `external_account_collection`, it defaults to `true` and `disable_stripe_user_authentication` defaults to `false`.
        * `external_account_collection` - Whether external account collection is enabled. This feature can only be `false` for accounts where you’re responsible for collecting updated information when requirements are due or change, like Custom accounts. The default value for this feature is `true`.
        """
        @type t :: %__MODULE__{
                disable_stripe_user_authentication: boolean() | nil,
                external_account_collection: boolean() | nil
              }
        defstruct [:disable_stripe_user_authentication, :external_account_collection]
      end
    end

    defmodule PaymentDetails do
      @moduledoc "Nested parameters."

      @typedoc """
      * `enabled` - Whether the embedded component is enabled.
      * `features` - The list of features enabled in the embedded component.
      """
      @type t :: %__MODULE__{
              enabled: boolean() | nil,
              features: __MODULE__.Features.t() | nil
            }
      defstruct [:enabled, :features]

      defmodule Features do
        @moduledoc "Nested parameters."

        @typedoc """
        * `capture_payments` - Whether to allow capturing and cancelling payment intents. This is `true` by default.
        * `destination_on_behalf_of_charge_management` - Whether connected accounts can manage destination charges that are created on behalf of them. This is `false` by default.
        * `dispute_management` - Whether responding to disputes is enabled, including submitting evidence and accepting disputes. This is `true` by default.
        * `refund_management` - Whether sending refunds is enabled. This is `true` by default.
        """
        @type t :: %__MODULE__{
                capture_payments: boolean() | nil,
                destination_on_behalf_of_charge_management: boolean() | nil,
                dispute_management: boolean() | nil,
                refund_management: boolean() | nil
              }
        defstruct [
          :capture_payments,
          :destination_on_behalf_of_charge_management,
          :dispute_management,
          :refund_management
        ]
      end
    end

    defmodule PaymentDisputes do
      @moduledoc "Nested parameters."

      @typedoc """
      * `enabled` - Whether the embedded component is enabled.
      * `features` - The list of features enabled in the embedded component.
      """
      @type t :: %__MODULE__{
              enabled: boolean() | nil,
              features: __MODULE__.Features.t() | nil
            }
      defstruct [:enabled, :features]

      defmodule Features do
        @moduledoc "Nested parameters."

        @typedoc """
        * `destination_on_behalf_of_charge_management` - Whether connected accounts can manage destination charges that are created on behalf of them. This is `false` by default.
        * `dispute_management` - Whether responding to disputes is enabled, including submitting evidence and accepting disputes. This is `true` by default.
        * `refund_management` - Whether sending refunds is enabled. This is `true` by default.
        """
        @type t :: %__MODULE__{
                destination_on_behalf_of_charge_management: boolean() | nil,
                dispute_management: boolean() | nil,
                refund_management: boolean() | nil
              }
        defstruct [
          :destination_on_behalf_of_charge_management,
          :dispute_management,
          :refund_management
        ]
      end
    end

    defmodule Payments do
      @moduledoc "Nested parameters."

      @typedoc """
      * `enabled` - Whether the embedded component is enabled.
      * `features` - The list of features enabled in the embedded component.
      """
      @type t :: %__MODULE__{
              enabled: boolean() | nil,
              features: __MODULE__.Features.t() | nil
            }
      defstruct [:enabled, :features]

      defmodule Features do
        @moduledoc "Nested parameters."

        @typedoc """
        * `capture_payments` - Whether to allow capturing and cancelling payment intents. This is `true` by default.
        * `destination_on_behalf_of_charge_management` - Whether connected accounts can manage destination charges that are created on behalf of them. This is `false` by default.
        * `dispute_management` - Whether responding to disputes is enabled, including submitting evidence and accepting disputes. This is `true` by default.
        * `refund_management` - Whether sending refunds is enabled. This is `true` by default.
        """
        @type t :: %__MODULE__{
                capture_payments: boolean() | nil,
                destination_on_behalf_of_charge_management: boolean() | nil,
                dispute_management: boolean() | nil,
                refund_management: boolean() | nil
              }
        defstruct [
          :capture_payments,
          :destination_on_behalf_of_charge_management,
          :dispute_management,
          :refund_management
        ]
      end
    end

    defmodule PayoutDetails do
      @moduledoc "Nested parameters."

      @typedoc """
      * `enabled` - Whether the embedded component is enabled.
      * `features` - An empty list, because this embedded component has no features.
      """
      @type t :: %__MODULE__{
              enabled: boolean() | nil,
              features: map() | nil
            }
      defstruct [:enabled, :features]
    end

    defmodule Payouts do
      @moduledoc "Nested parameters."

      @typedoc """
      * `enabled` - Whether the embedded component is enabled.
      * `features` - The list of features enabled in the embedded component.
      """
      @type t :: %__MODULE__{
              enabled: boolean() | nil,
              features: __MODULE__.Features.t() | nil
            }
      defstruct [:enabled, :features]

      defmodule Features do
        @moduledoc "Nested parameters."

        @typedoc """
        * `disable_stripe_user_authentication` - Whether Stripe user authentication is disabled. This value can only be `true` for accounts where `controller.requirement_collection` is `application` for the account. The default value is the opposite of the `external_account_collection` value. For example, if you don't set `external_account_collection`, it defaults to `true` and `disable_stripe_user_authentication` defaults to `false`.
        * `edit_payout_schedule` - Whether to allow payout schedule to be changed. Defaults to `true` when `controller.losses.payments` is set to `stripe` for the account, otherwise `false`.
        * `external_account_collection` - Whether external account collection is enabled. This feature can only be `false` for accounts where you’re responsible for collecting updated information when requirements are due or change, like Custom accounts. The default value for this feature is `true`.
        * `instant_payouts` - Whether instant payouts are enabled for this component.
        * `standard_payouts` - Whether to allow creation of standard payouts. Defaults to `true` when `controller.losses.payments` is set to `stripe` for the account, otherwise `false`.
        """
        @type t :: %__MODULE__{
                disable_stripe_user_authentication: boolean() | nil,
                edit_payout_schedule: boolean() | nil,
                external_account_collection: boolean() | nil,
                instant_payouts: boolean() | nil,
                standard_payouts: boolean() | nil
              }
        defstruct [
          :disable_stripe_user_authentication,
          :edit_payout_schedule,
          :external_account_collection,
          :instant_payouts,
          :standard_payouts
        ]
      end
    end

    defmodule PayoutsList do
      @moduledoc "Nested parameters."

      @typedoc """
      * `enabled` - Whether the embedded component is enabled.
      * `features` - An empty list, because this embedded component has no features.
      """
      @type t :: %__MODULE__{
              enabled: boolean() | nil,
              features: map() | nil
            }
      defstruct [:enabled, :features]
    end

    defmodule TaxRegistrations do
      @moduledoc "Nested parameters."

      @typedoc """
      * `enabled` - Whether the embedded component is enabled.
      * `features` - An empty list, because this embedded component has no features.
      """
      @type t :: %__MODULE__{
              enabled: boolean() | nil,
              features: map() | nil
            }
      defstruct [:enabled, :features]
    end

    defmodule TaxSettings do
      @moduledoc "Nested parameters."

      @typedoc """
      * `enabled` - Whether the embedded component is enabled.
      * `features` - An empty list, because this embedded component has no features.
      """
      @type t :: %__MODULE__{
              enabled: boolean() | nil,
              features: map() | nil
            }
      defstruct [:enabled, :features]
    end
  end
end
