# File generated from our OpenAPI spec
defmodule Stripe.Resources.SubscriptionSchedule do
  @moduledoc """
  SubscriptionSchedule

  A subscription schedule allows you to create and manage the lifecycle of a subscription by predefining expected changes.

  Related guide: [Subscription schedules](https://docs.stripe.com/billing/subscriptions/subscription-schedules)
  """

  @typedoc """
  * `application` - ID of the Connect Application that created the schedule. Nullable. Expandable.
  * `billing_mode` - Expandable.
  * `canceled_at` - Time at which the subscription schedule was canceled. Measured in seconds since the Unix epoch. Format: Unix timestamp. Nullable.
  * `completed_at` - Time at which the subscription schedule was completed. Measured in seconds since the Unix epoch. Format: Unix timestamp. Nullable.
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `current_phase` - Object representing the start and end dates for the current phase of the subscription schedule, if it is `active`. Nullable. Expandable.
  * `customer` - ID of the customer who owns the subscription schedule. Expandable.
  * `customer_account` - ID of the account who owns the subscription schedule. Max length: 5000. Nullable.
  * `default_settings` - Expandable.
  * `end_behavior` - Behavior of the subscription schedule and underlying subscription when it ends. Possible values are `release` or `cancel` with the default being `release`. `release` will end the subscription schedule and keep the underlying subscription running. `cancel` will end the subscription schedule and cancel the underlying subscription. Possible values: `cancel`, `none`, `release`, `renew`.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Nullable.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `subscription_schedule`.
  * `phases` - Configuration for the subscription schedule's phases. Expandable.
  * `released_at` - Time at which the subscription schedule was released. Measured in seconds since the Unix epoch. Format: Unix timestamp. Nullable.
  * `released_subscription` - ID of the subscription once managed by the subscription schedule (if it is released). Max length: 5000. Nullable.
  * `status` - The present status of the subscription schedule. Possible values are `not_started`, `active`, `completed`, `released`, and `canceled`. You can read more about the different states in our [behavior guide](https://docs.stripe.com/billing/subscriptions/subscription-schedules). Possible values: `active`, `canceled`, `completed`, `not_started`, `released`.
  * `subscription` - ID of the subscription managed by the subscription schedule. Nullable. Expandable.
  * `test_clock` - ID of the test clock this subscription schedule belongs to. Nullable. Expandable.
  """
  @type t :: %__MODULE__{
          application: String.t() | Stripe.Resources.Application.t(),
          billing_mode: __MODULE__.BillingMode.t(),
          canceled_at: integer(),
          completed_at: integer(),
          created: integer(),
          current_phase: __MODULE__.CurrentPhase.t(),
          customer: String.t() | Stripe.Resources.Customer.t(),
          customer_account: String.t(),
          default_settings: __MODULE__.DefaultSettings.t(),
          end_behavior: String.t(),
          id: String.t(),
          livemode: boolean(),
          metadata: %{String.t() => String.t()},
          object: String.t(),
          phases: [__MODULE__.Phases.t()],
          released_at: integer(),
          released_subscription: String.t(),
          status: String.t(),
          subscription: String.t() | Stripe.Resources.Subscription.t(),
          test_clock: String.t() | Stripe.Resources.TestHelpers.TestClock.t()
        }

  defstruct [
    :application,
    :billing_mode,
    :canceled_at,
    :completed_at,
    :created,
    :current_phase,
    :customer,
    :customer_account,
    :default_settings,
    :end_behavior,
    :id,
    :livemode,
    :metadata,
    :object,
    :phases,
    :released_at,
    :released_subscription,
    :status,
    :subscription,
    :test_clock
  ]

  @object_name "subscription_schedule"
  def object_name, do: @object_name

  def expandable_fields,
    do: [
      "application",
      "billing_mode",
      "current_phase",
      "customer",
      "default_settings",
      "phases",
      "subscription",
      "test_clock"
    ]

  defmodule BillingMode do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `flexible` - Configure behavior for flexible billing mode Nullable.
    * `type` - Controls how prorations and invoices for subscriptions are calculated and orchestrated. Possible values: `classic`, `flexible`.
    * `updated_at` - Details on when the current billing_mode was adopted. Format: Unix timestamp.
    """
    @type t :: %__MODULE__{
            flexible: __MODULE__.Flexible.t() | nil,
            type: String.t() | nil,
            updated_at: integer() | nil
          }
    defstruct [:flexible, :type, :updated_at]

    defmodule Flexible do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `proration_discounts` - Controls how invoices and invoice items display proration amounts and discount amounts. Possible values: `included`, `itemized`.
      """
      @type t :: %__MODULE__{
              proration_discounts: String.t() | nil
            }
      defstruct [:proration_discounts]
    end

    def __inner_types__ do
      %{
        "flexible" => __MODULE__.Flexible
      }
    end
  end

  defmodule CurrentPhase do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `end_date` - The end of this phase of the subscription schedule. Format: Unix timestamp.
    * `start_date` - The start of this phase of the subscription schedule. Format: Unix timestamp.
    """
    @type t :: %__MODULE__{
            end_date: integer() | nil,
            start_date: integer() | nil
          }
    defstruct [:end_date, :start_date]
  end

  defmodule DefaultSettings do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `application_fee_percent` - A non-negative decimal between 0 and 100, with at most two decimal places. This represents the percentage of the subscription invoice total that will be transferred to the application owner's Stripe account during this phase of the schedule. Nullable.
    * `automatic_tax`
    * `billing_cycle_anchor` - Possible values are `phase_start` or `automatic`. If `phase_start` then billing cycle anchor of the subscription is set to the start of the phase when entering the phase. If `automatic` then the billing cycle anchor is automatically modified as needed when entering the phase. For more information, see the billing cycle [documentation](https://docs.stripe.com/billing/subscriptions/billing-cycle). Possible values: `automatic`, `phase_start`.
    * `billing_thresholds` - Define thresholds at which an invoice will be sent, and the subscription advanced to a new billing period Nullable.
    * `collection_method` - Either `charge_automatically`, or `send_invoice`. When charging automatically, Stripe will attempt to pay the underlying subscription at the end of each billing cycle using the default source attached to the customer. When sending an invoice, Stripe will email your customer an invoice with payment instructions and mark the subscription as `active`. Possible values: `charge_automatically`, `send_invoice`. Nullable.
    * `default_payment_method` - ID of the default payment method for the subscription schedule. If not set, invoices will use the default payment method in the customer's invoice settings. Nullable.
    * `description` - Subscription description, meant to be displayable to the customer. Use this field to optionally store an explanation of the subscription for rendering in Stripe surfaces and certain local payment methods UIs. Max length: 5000. Nullable.
    * `invoice_settings`
    * `on_behalf_of` - The account (if any) the charge was made on behalf of for charges associated with the schedule's subscription. See the Connect documentation for details. Nullable.
    * `transfer_data` - The account (if any) the associated subscription's payments will be attributed to for tax reporting, and where funds from each payment will be transferred to for each of the subscription's invoices. Nullable.
    """
    @type t :: %__MODULE__{
            application_fee_percent: float() | nil,
            automatic_tax: __MODULE__.AutomaticTax.t() | nil,
            billing_cycle_anchor: String.t() | nil,
            billing_thresholds: __MODULE__.BillingThresholds.t() | nil,
            collection_method: String.t() | nil,
            default_payment_method: String.t() | Stripe.Resources.PaymentMethod.t() | nil,
            description: String.t() | nil,
            invoice_settings: __MODULE__.InvoiceSettings.t() | nil,
            on_behalf_of: String.t() | Stripe.Resources.Account.t() | nil,
            transfer_data: __MODULE__.TransferData.t() | nil
          }
    defstruct [
      :application_fee_percent,
      :automatic_tax,
      :billing_cycle_anchor,
      :billing_thresholds,
      :collection_method,
      :default_payment_method,
      :description,
      :invoice_settings,
      :on_behalf_of,
      :transfer_data
    ]

    defmodule AutomaticTax do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `disabled_reason` - If Stripe disabled automatic tax, this enum describes why. Possible values: `requires_location_inputs`. Nullable.
      * `enabled` - Whether Stripe automatically computes tax on invoices created during this phase.
      * `liability` - The account that's liable for tax. If set, the business address and tax registrations required to perform the tax calculation are loaded from this account. The tax transaction is returned in the report of the connected account. Nullable.
      """
      @type t :: %__MODULE__{
              disabled_reason: String.t() | nil,
              enabled: boolean() | nil,
              liability: __MODULE__.Liability.t() | nil
            }
      defstruct [:disabled_reason, :enabled, :liability]

      defmodule Liability do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `account` - The connected account being referenced when `type` is `account`.
        * `type` - Type of the account referenced. Possible values: `account`, `self`.
        """
        @type t :: %__MODULE__{
                account: String.t() | Stripe.Resources.Account.t() | nil,
                type: String.t() | nil
              }
        defstruct [:account, :type]
      end

      def __inner_types__ do
        %{
          "liability" => __MODULE__.Liability
        }
      end
    end

    defmodule BillingThresholds do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `amount_gte` - Monetary threshold that triggers the subscription to create an invoice Nullable.
      * `reset_billing_cycle_anchor` - Indicates if the `billing_cycle_anchor` should be reset when a threshold is reached. If true, `billing_cycle_anchor` will be updated to the date/time the threshold was last reached; otherwise, the value will remain unchanged. This value may not be `true` if the subscription contains items with plans that have `aggregate_usage=last_ever`. Nullable.
      """
      @type t :: %__MODULE__{
              amount_gte: integer() | nil,
              reset_billing_cycle_anchor: boolean() | nil
            }
      defstruct [:amount_gte, :reset_billing_cycle_anchor]
    end

    defmodule InvoiceSettings do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `account_tax_ids` - The account tax IDs associated with the subscription schedule. Will be set on invoices generated by the subscription schedule. Nullable.
      * `days_until_due` - Number of days within which a customer must pay invoices generated by this subscription schedule. This value will be `null` for subscription schedules where `billing=charge_automatically`. Nullable.
      * `issuer`
      """
      @type t :: %__MODULE__{
              account_tax_ids: [String.t() | Stripe.Resources.TaxId.t()] | nil,
              days_until_due: integer() | nil,
              issuer: __MODULE__.Issuer.t() | nil
            }
      defstruct [:account_tax_ids, :days_until_due, :issuer]

      defmodule Issuer do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `account` - The connected account being referenced when `type` is `account`.
        * `type` - Type of the account referenced. Possible values: `account`, `self`.
        """
        @type t :: %__MODULE__{
                account: String.t() | Stripe.Resources.Account.t() | nil,
                type: String.t() | nil
              }
        defstruct [:account, :type]
      end

      def __inner_types__ do
        %{
          "issuer" => __MODULE__.Issuer
        }
      end
    end

    defmodule TransferData do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `amount_percent` - A non-negative decimal between 0 and 100, with at most two decimal places. This represents the percentage of the subscription invoice total that will be transferred to the destination account. By default, the entire amount is transferred to the destination. Nullable.
      * `destination` - The account where funds from the payment will be transferred to upon payment success.
      """
      @type t :: %__MODULE__{
              amount_percent: float() | nil,
              destination: String.t() | Stripe.Resources.Account.t() | nil
            }
      defstruct [:amount_percent, :destination]
    end

    def __inner_types__ do
      %{
        "automatic_tax" => __MODULE__.AutomaticTax,
        "billing_thresholds" => __MODULE__.BillingThresholds,
        "invoice_settings" => __MODULE__.InvoiceSettings,
        "transfer_data" => __MODULE__.TransferData
      }
    end
  end

  defmodule Phases do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `add_invoice_items` - A list of prices and quantities that will generate invoice items appended to the next invoice for this phase.
    * `application_fee_percent` - A non-negative decimal between 0 and 100, with at most two decimal places. This represents the percentage of the subscription invoice total that will be transferred to the application owner's Stripe account during this phase of the schedule. Nullable.
    * `automatic_tax`
    * `billing_cycle_anchor` - Possible values are `phase_start` or `automatic`. If `phase_start` then billing cycle anchor of the subscription is set to the start of the phase when entering the phase. If `automatic` then the billing cycle anchor is automatically modified as needed when entering the phase. For more information, see the billing cycle [documentation](https://docs.stripe.com/billing/subscriptions/billing-cycle). Possible values: `automatic`, `phase_start`. Nullable.
    * `billing_thresholds` - Define thresholds at which an invoice will be sent, and the subscription advanced to a new billing period Nullable.
    * `collection_method` - Either `charge_automatically`, or `send_invoice`. When charging automatically, Stripe will attempt to pay the underlying subscription at the end of each billing cycle using the default source attached to the customer. When sending an invoice, Stripe will email your customer an invoice with payment instructions and mark the subscription as `active`. Possible values: `charge_automatically`, `send_invoice`. Nullable.
    * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
    * `default_payment_method` - ID of the default payment method for the subscription schedule. It must belong to the customer associated with the subscription schedule. If not set, invoices will use the default payment method in the customer's invoice settings. Nullable.
    * `default_tax_rates` - The default tax rates to apply to the subscription during this phase of the subscription schedule. Nullable.
    * `description` - Subscription description, meant to be displayable to the customer. Use this field to optionally store an explanation of the subscription for rendering in Stripe surfaces and certain local payment methods UIs. Max length: 5000. Nullable.
    * `discounts` - The stackable discounts that will be applied to the subscription on this phase. Subscription item discounts are applied before subscription discounts.
    * `end_date` - The end of this phase of the subscription schedule. Format: Unix timestamp.
    * `invoice_settings` - The invoice settings applicable during this phase. Nullable.
    * `items` - Subscription items to configure the subscription to during this phase of the subscription schedule.
    * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to a phase. Metadata on a schedule's phase will update the underlying subscription's `metadata` when the phase is entered. Updating the underlying subscription's `metadata` directly will not affect the current phase's `metadata`. Nullable.
    * `on_behalf_of` - The account (if any) the charge was made on behalf of for charges associated with the schedule's subscription. See the Connect documentation for details. Nullable.
    * `proration_behavior` - When transitioning phases, controls how prorations are handled (if any). Possible values are `create_prorations`, `none`, and `always_invoice`. Possible values: `always_invoice`, `create_prorations`, `none`.
    * `start_date` - The start of this phase of the subscription schedule. Format: Unix timestamp.
    * `transfer_data` - The account (if any) the associated subscription's payments will be attributed to for tax reporting, and where funds from each payment will be transferred to for each of the subscription's invoices. Nullable.
    * `trial_end` - When the trial ends within the phase. Format: Unix timestamp. Nullable.
    """
    @type t :: %__MODULE__{
            add_invoice_items: [__MODULE__.AddInvoiceItems.t()] | nil,
            application_fee_percent: float() | nil,
            automatic_tax: __MODULE__.AutomaticTax.t() | nil,
            billing_cycle_anchor: String.t() | nil,
            billing_thresholds: __MODULE__.BillingThresholds.t() | nil,
            collection_method: String.t() | nil,
            currency: String.t() | nil,
            default_payment_method: String.t() | Stripe.Resources.PaymentMethod.t() | nil,
            default_tax_rates: [Stripe.Resources.TaxRate.t()] | nil,
            description: String.t() | nil,
            discounts: [__MODULE__.Discounts.t()] | nil,
            end_date: integer() | nil,
            invoice_settings: __MODULE__.InvoiceSettings.t() | nil,
            items: [__MODULE__.Items.t()] | nil,
            metadata: %{String.t() => String.t()} | nil,
            on_behalf_of: String.t() | Stripe.Resources.Account.t() | nil,
            proration_behavior: String.t() | nil,
            start_date: integer() | nil,
            transfer_data: __MODULE__.TransferData.t() | nil,
            trial_end: integer() | nil
          }
    defstruct [
      :add_invoice_items,
      :application_fee_percent,
      :automatic_tax,
      :billing_cycle_anchor,
      :billing_thresholds,
      :collection_method,
      :currency,
      :default_payment_method,
      :default_tax_rates,
      :description,
      :discounts,
      :end_date,
      :invoice_settings,
      :items,
      :metadata,
      :on_behalf_of,
      :proration_behavior,
      :start_date,
      :transfer_data,
      :trial_end
    ]

    defmodule AddInvoiceItems do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `discounts` - The stackable discounts that will be applied to the item.
      * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Nullable.
      * `period`
      * `price` - ID of the price used to generate the invoice item.
      * `quantity` - The quantity of the invoice item. Nullable.
      * `tax_rates` - The tax rates which apply to the item. When set, the `default_tax_rates` do not apply to this item. Nullable.
      """
      @type t :: %__MODULE__{
              discounts: [__MODULE__.Discounts.t()] | nil,
              metadata: %{String.t() => String.t()} | nil,
              period: __MODULE__.Period.t() | nil,
              price: String.t() | Stripe.Resources.Price.t() | nil,
              quantity: integer() | nil,
              tax_rates: [Stripe.Resources.TaxRate.t()] | nil
            }
      defstruct [:discounts, :metadata, :period, :price, :quantity, :tax_rates]

      defmodule Discounts do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `coupon` - ID of the coupon to create a new discount for. Nullable.
        * `discount` - ID of an existing discount on the object (or one of its ancestors) to reuse. Nullable.
        * `promotion_code` - ID of the promotion code to create a new discount for. Nullable.
        """
        @type t :: %__MODULE__{
                coupon: String.t() | Stripe.Resources.Coupon.t() | nil,
                discount: String.t() | Stripe.Resources.Discount.t() | nil,
                promotion_code: String.t() | Stripe.Resources.PromotionCode.t() | nil
              }
        defstruct [:coupon, :discount, :promotion_code]
      end

      defmodule Period do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `end`
        * `start`
        """
        @type t :: %__MODULE__{
                end: __MODULE__.End.t() | nil,
                start: __MODULE__.Start.t() | nil
              }
        defstruct [:end, :start]

        defmodule End do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `timestamp` - A precise Unix timestamp for the end of the invoice item period. Must be greater than or equal to `period.start`. Format: Unix timestamp.
          * `type` - Select how to calculate the end of the invoice item period. Possible values: `min_item_period_end`, `phase_end`, `timestamp`.
          """
          @type t :: %__MODULE__{
                  timestamp: integer() | nil,
                  type: String.t() | nil
                }
          defstruct [:timestamp, :type]
        end

        defmodule Start do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `timestamp` - A precise Unix timestamp for the start of the invoice item period. Must be less than or equal to `period.end`. Format: Unix timestamp.
          * `type` - Select how to calculate the start of the invoice item period. Possible values: `max_item_period_start`, `phase_start`, `timestamp`.
          """
          @type t :: %__MODULE__{
                  timestamp: integer() | nil,
                  type: String.t() | nil
                }
          defstruct [:timestamp, :type]
        end

        def __inner_types__ do
          %{
            "end" => __MODULE__.End,
            "start" => __MODULE__.Start
          }
        end
      end

      def __inner_types__ do
        %{
          "discounts" => __MODULE__.Discounts,
          "period" => __MODULE__.Period
        }
      end
    end

    defmodule AutomaticTax do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `disabled_reason` - If Stripe disabled automatic tax, this enum describes why. Possible values: `requires_location_inputs`. Nullable.
      * `enabled` - Whether Stripe automatically computes tax on invoices created during this phase.
      * `liability` - The account that's liable for tax. If set, the business address and tax registrations required to perform the tax calculation are loaded from this account. The tax transaction is returned in the report of the connected account. Nullable.
      """
      @type t :: %__MODULE__{
              disabled_reason: String.t() | nil,
              enabled: boolean() | nil,
              liability: __MODULE__.Liability.t() | nil
            }
      defstruct [:disabled_reason, :enabled, :liability]

      defmodule Liability do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `account` - The connected account being referenced when `type` is `account`.
        * `type` - Type of the account referenced. Possible values: `account`, `self`.
        """
        @type t :: %__MODULE__{
                account: String.t() | Stripe.Resources.Account.t() | nil,
                type: String.t() | nil
              }
        defstruct [:account, :type]
      end

      def __inner_types__ do
        %{
          "liability" => __MODULE__.Liability
        }
      end
    end

    defmodule BillingThresholds do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `amount_gte` - Monetary threshold that triggers the subscription to create an invoice Nullable.
      * `reset_billing_cycle_anchor` - Indicates if the `billing_cycle_anchor` should be reset when a threshold is reached. If true, `billing_cycle_anchor` will be updated to the date/time the threshold was last reached; otherwise, the value will remain unchanged. This value may not be `true` if the subscription contains items with plans that have `aggregate_usage=last_ever`. Nullable.
      """
      @type t :: %__MODULE__{
              amount_gte: integer() | nil,
              reset_billing_cycle_anchor: boolean() | nil
            }
      defstruct [:amount_gte, :reset_billing_cycle_anchor]
    end

    defmodule Discounts do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `coupon` - ID of the coupon to create a new discount for. Nullable.
      * `discount` - ID of an existing discount on the object (or one of its ancestors) to reuse. Nullable.
      * `promotion_code` - ID of the promotion code to create a new discount for. Nullable.
      """
      @type t :: %__MODULE__{
              coupon: String.t() | Stripe.Resources.Coupon.t() | nil,
              discount: String.t() | Stripe.Resources.Discount.t() | nil,
              promotion_code: String.t() | Stripe.Resources.PromotionCode.t() | nil
            }
      defstruct [:coupon, :discount, :promotion_code]
    end

    defmodule InvoiceSettings do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `account_tax_ids` - The account tax IDs associated with this phase of the subscription schedule. Will be set on invoices generated by this phase of the subscription schedule. Nullable.
      * `days_until_due` - Number of days within which a customer must pay invoices generated by this subscription schedule. This value will be `null` for subscription schedules where `billing=charge_automatically`. Nullable.
      * `issuer` - The connected account that issues the invoice. The invoice is presented with the branding and support information of the specified account. Nullable.
      """
      @type t :: %__MODULE__{
              account_tax_ids: [String.t() | Stripe.Resources.TaxId.t()] | nil,
              days_until_due: integer() | nil,
              issuer: __MODULE__.Issuer.t() | nil
            }
      defstruct [:account_tax_ids, :days_until_due, :issuer]

      defmodule Issuer do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `account` - The connected account being referenced when `type` is `account`.
        * `type` - Type of the account referenced. Possible values: `account`, `self`.
        """
        @type t :: %__MODULE__{
                account: String.t() | Stripe.Resources.Account.t() | nil,
                type: String.t() | nil
              }
        defstruct [:account, :type]
      end

      def __inner_types__ do
        %{
          "issuer" => __MODULE__.Issuer
        }
      end
    end

    defmodule Items do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `billing_thresholds` - Define thresholds at which an invoice will be sent, and the related subscription advanced to a new billing period Nullable.
      * `discounts` - The discounts applied to the subscription item. Subscription item discounts are applied before subscription discounts. Use `expand[]=discounts` to expand each discount.
      * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an item. Metadata on this item will update the underlying subscription item's `metadata` when the phase is entered. Nullable.
      * `plan` - ID of the plan to which the customer should be subscribed.
      * `price` - ID of the price to which the customer should be subscribed.
      * `quantity` - Quantity of the plan to which the customer should be subscribed.
      * `tax_rates` - The tax rates which apply to this `phase_item`. When set, the `default_tax_rates` on the phase do not apply to this `phase_item`. Nullable.
      """
      @type t :: %__MODULE__{
              billing_thresholds: __MODULE__.BillingThresholds.t() | nil,
              discounts: [__MODULE__.Discounts.t()] | nil,
              metadata: %{String.t() => String.t()} | nil,
              plan: String.t() | Stripe.Resources.Plan.t() | nil,
              price: String.t() | Stripe.Resources.Price.t() | nil,
              quantity: integer() | nil,
              tax_rates: [Stripe.Resources.TaxRate.t()] | nil
            }
      defstruct [:billing_thresholds, :discounts, :metadata, :plan, :price, :quantity, :tax_rates]

      defmodule BillingThresholds do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `usage_gte` - Usage threshold that triggers the subscription to create an invoice Nullable.
        """
        @type t :: %__MODULE__{
                usage_gte: integer() | nil
              }
        defstruct [:usage_gte]
      end

      defmodule Discounts do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `coupon` - ID of the coupon to create a new discount for. Nullable.
        * `discount` - ID of an existing discount on the object (or one of its ancestors) to reuse. Nullable.
        * `promotion_code` - ID of the promotion code to create a new discount for. Nullable.
        """
        @type t :: %__MODULE__{
                coupon: String.t() | Stripe.Resources.Coupon.t() | nil,
                discount: String.t() | Stripe.Resources.Discount.t() | nil,
                promotion_code: String.t() | Stripe.Resources.PromotionCode.t() | nil
              }
        defstruct [:coupon, :discount, :promotion_code]
      end

      def __inner_types__ do
        %{
          "billing_thresholds" => __MODULE__.BillingThresholds,
          "discounts" => __MODULE__.Discounts
        }
      end
    end

    defmodule TransferData do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `amount_percent` - A non-negative decimal between 0 and 100, with at most two decimal places. This represents the percentage of the subscription invoice total that will be transferred to the destination account. By default, the entire amount is transferred to the destination. Nullable.
      * `destination` - The account where funds from the payment will be transferred to upon payment success.
      """
      @type t :: %__MODULE__{
              amount_percent: float() | nil,
              destination: String.t() | Stripe.Resources.Account.t() | nil
            }
      defstruct [:amount_percent, :destination]
    end

    def __inner_types__ do
      %{
        "add_invoice_items" => __MODULE__.AddInvoiceItems,
        "automatic_tax" => __MODULE__.AutomaticTax,
        "billing_thresholds" => __MODULE__.BillingThresholds,
        "discounts" => __MODULE__.Discounts,
        "invoice_settings" => __MODULE__.InvoiceSettings,
        "items" => __MODULE__.Items,
        "transfer_data" => __MODULE__.TransferData
      }
    end
  end

  def __inner_types__ do
    %{
      "billing_mode" => __MODULE__.BillingMode,
      "current_phase" => __MODULE__.CurrentPhase,
      "default_settings" => __MODULE__.DefaultSettings,
      "phases" => __MODULE__.Phases
    }
  end
end
