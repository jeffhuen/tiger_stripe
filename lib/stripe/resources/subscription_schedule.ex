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
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
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
          billing_mode: billing_mode(),
          canceled_at: integer(),
          completed_at: integer(),
          created: integer(),
          current_phase: current_phase(),
          customer: String.t() | Stripe.Resources.Customer.t(),
          customer_account: String.t(),
          default_settings: default_settings(),
          end_behavior: String.t(),
          id: String.t(),
          livemode: boolean(),
          metadata: %{String.t() => String.t()},
          object: String.t(),
          phases: [phases()],
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

  @typedoc """
  * `flexible` - Configure behavior for flexible billing mode Nullable.
  * `type` - Controls how prorations and invoices for subscriptions are calculated and orchestrated. Possible values: `classic`, `flexible`.
  * `updated_at` - Details on when the current billing_mode was adopted. Format: Unix timestamp.
  """
  @type billing_mode :: %{
          optional(:flexible) => billing_mode_flexible() | nil,
          optional(:type) => String.t() | nil,
          optional(:updated_at) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `proration_discounts` - Controls how invoices and invoice items display proration amounts and discount amounts. Possible values: `included`, `itemized`.
  """
  @type billing_mode_flexible :: %{
          optional(:proration_discounts) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `end_date` - The end of this phase of the subscription schedule. Format: Unix timestamp.
  * `start_date` - The start of this phase of the subscription schedule. Format: Unix timestamp.
  """
  @type current_phase :: %{
          optional(:end_date) => integer() | nil,
          optional(:start_date) => integer() | nil,
          optional(String.t()) => term()
        }

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
  @type default_settings :: %{
          optional(:application_fee_percent) => float() | nil,
          optional(:automatic_tax) => default_settings_automatic_tax() | nil,
          optional(:billing_cycle_anchor) => String.t() | nil,
          optional(:billing_thresholds) => default_settings_billing_thresholds() | nil,
          optional(:collection_method) => String.t() | nil,
          optional(:default_payment_method) =>
            String.t() | Stripe.Resources.PaymentMethod.t() | nil,
          optional(:description) => String.t() | nil,
          optional(:invoice_settings) => default_settings_invoice_settings() | nil,
          optional(:on_behalf_of) => String.t() | Stripe.Resources.Account.t() | nil,
          optional(:transfer_data) => default_settings_transfer_data() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `disabled_reason` - If Stripe disabled automatic tax, this enum describes why. Possible values: `requires_location_inputs`. Nullable.
  * `enabled` - Whether Stripe automatically computes tax on invoices created during this phase.
  * `liability` - The account that's liable for tax. If set, the business address and tax registrations required to perform the tax calculation are loaded from this account. The tax transaction is returned in the report of the connected account. Nullable.
  """
  @type default_settings_automatic_tax :: %{
          optional(:disabled_reason) => String.t() | nil,
          optional(:enabled) => boolean() | nil,
          optional(:liability) => default_settings_automatic_tax_liability() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `account` - The connected account being referenced when `type` is `account`.
  * `type` - Type of the account referenced. Possible values: `account`, `self`.
  """
  @type default_settings_automatic_tax_liability :: %{
          optional(:account) => String.t() | Stripe.Resources.Account.t() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `amount_gte` - Monetary threshold that triggers the subscription to create an invoice Nullable.
  * `reset_billing_cycle_anchor` - Indicates if the `billing_cycle_anchor` should be reset when a threshold is reached. If true, `billing_cycle_anchor` will be updated to the date/time the threshold was last reached; otherwise, the value will remain unchanged. This value may not be `true` if the subscription contains items with plans that have `aggregate_usage=last_ever`. Nullable.
  """
  @type default_settings_billing_thresholds :: %{
          optional(:amount_gte) => integer() | nil,
          optional(:reset_billing_cycle_anchor) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `account_tax_ids` - The account tax IDs associated with the subscription schedule. Will be set on invoices generated by the subscription schedule. Nullable.
  * `days_until_due` - Number of days within which a customer must pay invoices generated by this subscription schedule. This value will be `null` for subscription schedules where `billing=charge_automatically`. Nullable.
  * `issuer`
  """
  @type default_settings_invoice_settings :: %{
          optional(:account_tax_ids) => [String.t() | Stripe.Resources.TaxId.t()] | nil,
          optional(:days_until_due) => integer() | nil,
          optional(:issuer) => default_settings_invoice_settings_issuer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `account` - The connected account being referenced when `type` is `account`.
  * `type` - Type of the account referenced. Possible values: `account`, `self`.
  """
  @type default_settings_invoice_settings_issuer :: %{
          optional(:account) => String.t() | Stripe.Resources.Account.t() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `amount_percent` - A non-negative decimal between 0 and 100, with at most two decimal places. This represents the percentage of the subscription invoice total that will be transferred to the destination account. By default, the entire amount is transferred to the destination. Nullable.
  * `destination` - The account where funds from the payment will be transferred to upon payment success.
  """
  @type default_settings_transfer_data :: %{
          optional(:amount_percent) => float() | nil,
          optional(:destination) => String.t() | Stripe.Resources.Account.t() | nil,
          optional(String.t()) => term()
        }

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
  @type phases :: %{
          optional(:add_invoice_items) => [phases_add_invoice_items()] | nil,
          optional(:application_fee_percent) => float() | nil,
          optional(:automatic_tax) => phases_automatic_tax() | nil,
          optional(:billing_cycle_anchor) => String.t() | nil,
          optional(:billing_thresholds) => phases_billing_thresholds() | nil,
          optional(:collection_method) => String.t() | nil,
          optional(:currency) => String.t() | nil,
          optional(:default_payment_method) =>
            String.t() | Stripe.Resources.PaymentMethod.t() | nil,
          optional(:default_tax_rates) => [Stripe.Resources.TaxRate.t()] | nil,
          optional(:description) => String.t() | nil,
          optional(:discounts) => [phases_discounts()] | nil,
          optional(:end_date) => integer() | nil,
          optional(:invoice_settings) => phases_invoice_settings() | nil,
          optional(:items) => [phases_items()] | nil,
          optional(:metadata) => %{String.t() => String.t()} | nil,
          optional(:on_behalf_of) => String.t() | Stripe.Resources.Account.t() | nil,
          optional(:proration_behavior) => String.t() | nil,
          optional(:start_date) => integer() | nil,
          optional(:transfer_data) => phases_transfer_data() | nil,
          optional(:trial_end) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `discounts` - The stackable discounts that will be applied to the item.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Nullable.
  * `period`
  * `price` - ID of the price used to generate the invoice item.
  * `quantity` - The quantity of the invoice item. Nullable.
  * `tax_rates` - The tax rates which apply to the item. When set, the `default_tax_rates` do not apply to this item. Nullable.
  """
  @type phases_add_invoice_items :: %{
          optional(:discounts) => [phases_add_invoice_items_discounts()] | nil,
          optional(:metadata) => %{String.t() => String.t()} | nil,
          optional(:period) => phases_add_invoice_items_period() | nil,
          optional(:price) => String.t() | Stripe.Resources.Price.t() | nil,
          optional(:quantity) => integer() | nil,
          optional(:tax_rates) => [Stripe.Resources.TaxRate.t()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `coupon` - ID of the coupon to create a new discount for. Nullable.
  * `discount` - ID of an existing discount on the object (or one of its ancestors) to reuse. Nullable.
  * `promotion_code` - ID of the promotion code to create a new discount for. Nullable.
  """
  @type phases_add_invoice_items_discounts :: %{
          optional(:coupon) => String.t() | Stripe.Resources.Coupon.t() | nil,
          optional(:discount) => String.t() | Stripe.Resources.Discount.t() | nil,
          optional(:promotion_code) => String.t() | Stripe.Resources.PromotionCode.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `end`
  * `start`
  """
  @type phases_add_invoice_items_period :: %{
          optional(:end) => phases_add_invoice_items_period_end() | nil,
          optional(:start) => phases_add_invoice_items_period_start() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `timestamp` - A precise Unix timestamp for the end of the invoice item period. Must be greater than or equal to `period.start`. Format: Unix timestamp.
  * `type` - Select how to calculate the end of the invoice item period. Possible values: `min_item_period_end`, `phase_end`, `timestamp`.
  """
  @type phases_add_invoice_items_period_end :: %{
          optional(:timestamp) => integer() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `timestamp` - A precise Unix timestamp for the start of the invoice item period. Must be less than or equal to `period.end`. Format: Unix timestamp.
  * `type` - Select how to calculate the start of the invoice item period. Possible values: `max_item_period_start`, `phase_start`, `timestamp`.
  """
  @type phases_add_invoice_items_period_start :: %{
          optional(:timestamp) => integer() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `disabled_reason` - If Stripe disabled automatic tax, this enum describes why. Possible values: `requires_location_inputs`. Nullable.
  * `enabled` - Whether Stripe automatically computes tax on invoices created during this phase.
  * `liability` - The account that's liable for tax. If set, the business address and tax registrations required to perform the tax calculation are loaded from this account. The tax transaction is returned in the report of the connected account. Nullable.
  """
  @type phases_automatic_tax :: %{
          optional(:disabled_reason) => String.t() | nil,
          optional(:enabled) => boolean() | nil,
          optional(:liability) => phases_automatic_tax_liability() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `account` - The connected account being referenced when `type` is `account`.
  * `type` - Type of the account referenced. Possible values: `account`, `self`.
  """
  @type phases_automatic_tax_liability :: %{
          optional(:account) => String.t() | Stripe.Resources.Account.t() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `amount_gte` - Monetary threshold that triggers the subscription to create an invoice Nullable.
  * `reset_billing_cycle_anchor` - Indicates if the `billing_cycle_anchor` should be reset when a threshold is reached. If true, `billing_cycle_anchor` will be updated to the date/time the threshold was last reached; otherwise, the value will remain unchanged. This value may not be `true` if the subscription contains items with plans that have `aggregate_usage=last_ever`. Nullable.
  """
  @type phases_billing_thresholds :: %{
          optional(:amount_gte) => integer() | nil,
          optional(:reset_billing_cycle_anchor) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `coupon` - ID of the coupon to create a new discount for. Nullable.
  * `discount` - ID of an existing discount on the object (or one of its ancestors) to reuse. Nullable.
  * `promotion_code` - ID of the promotion code to create a new discount for. Nullable.
  """
  @type phases_discounts :: %{
          optional(:coupon) => String.t() | Stripe.Resources.Coupon.t() | nil,
          optional(:discount) => String.t() | Stripe.Resources.Discount.t() | nil,
          optional(:promotion_code) => String.t() | Stripe.Resources.PromotionCode.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `account_tax_ids` - The account tax IDs associated with this phase of the subscription schedule. Will be set on invoices generated by this phase of the subscription schedule. Nullable.
  * `days_until_due` - Number of days within which a customer must pay invoices generated by this subscription schedule. This value will be `null` for subscription schedules where `billing=charge_automatically`. Nullable.
  * `issuer` - The connected account that issues the invoice. The invoice is presented with the branding and support information of the specified account. Nullable.
  """
  @type phases_invoice_settings :: %{
          optional(:account_tax_ids) => [String.t() | Stripe.Resources.TaxId.t()] | nil,
          optional(:days_until_due) => integer() | nil,
          optional(:issuer) => phases_invoice_settings_issuer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `account` - The connected account being referenced when `type` is `account`.
  * `type` - Type of the account referenced. Possible values: `account`, `self`.
  """
  @type phases_invoice_settings_issuer :: %{
          optional(:account) => String.t() | Stripe.Resources.Account.t() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `billing_thresholds` - Define thresholds at which an invoice will be sent, and the related subscription advanced to a new billing period Nullable.
  * `discounts` - The discounts applied to the subscription item. Subscription item discounts are applied before subscription discounts. Use `expand[]=discounts` to expand each discount.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an item. Metadata on this item will update the underlying subscription item's `metadata` when the phase is entered. Nullable.
  * `plan` - ID of the plan to which the customer should be subscribed.
  * `price` - ID of the price to which the customer should be subscribed.
  * `quantity` - Quantity of the plan to which the customer should be subscribed.
  * `tax_rates` - The tax rates which apply to this `phase_item`. When set, the `default_tax_rates` on the phase do not apply to this `phase_item`. Nullable.
  """
  @type phases_items :: %{
          optional(:billing_thresholds) => phases_items_billing_thresholds() | nil,
          optional(:discounts) => [phases_items_discounts()] | nil,
          optional(:metadata) => %{String.t() => String.t()} | nil,
          optional(:plan) => String.t() | Stripe.Resources.Plan.t() | nil,
          optional(:price) => String.t() | Stripe.Resources.Price.t() | nil,
          optional(:quantity) => integer() | nil,
          optional(:tax_rates) => [Stripe.Resources.TaxRate.t()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `usage_gte` - Usage threshold that triggers the subscription to create an invoice Nullable.
  """
  @type phases_items_billing_thresholds :: %{
          optional(:usage_gte) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `coupon` - ID of the coupon to create a new discount for. Nullable.
  * `discount` - ID of an existing discount on the object (or one of its ancestors) to reuse. Nullable.
  * `promotion_code` - ID of the promotion code to create a new discount for. Nullable.
  """
  @type phases_items_discounts :: %{
          optional(:coupon) => String.t() | Stripe.Resources.Coupon.t() | nil,
          optional(:discount) => String.t() | Stripe.Resources.Discount.t() | nil,
          optional(:promotion_code) => String.t() | Stripe.Resources.PromotionCode.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `amount_percent` - A non-negative decimal between 0 and 100, with at most two decimal places. This represents the percentage of the subscription invoice total that will be transferred to the destination account. By default, the entire amount is transferred to the destination. Nullable.
  * `destination` - The account where funds from the payment will be transferred to upon payment success.
  """
  @type phases_transfer_data :: %{
          optional(:amount_percent) => float() | nil,
          optional(:destination) => String.t() | Stripe.Resources.Account.t() | nil,
          optional(String.t()) => term()
        }

  def __nested_fields__ do
    %{
      "billing_mode" => %{
        fields: %{
          "flexible" => %{
            fields: %{
              "proration_discounts" => :scalar
            }
          },
          "type" => :scalar,
          "updated_at" => :scalar
        }
      },
      "current_phase" => %{
        fields: %{
          "end_date" => :scalar,
          "start_date" => :scalar
        }
      },
      "default_settings" => %{
        fields: %{
          "application_fee_percent" => :scalar,
          "automatic_tax" => %{
            fields: %{
              "disabled_reason" => :scalar,
              "enabled" => :scalar,
              "liability" => %{
                fields: %{
                  "account" => {:resource, Stripe.Resources.Account},
                  "type" => :scalar
                }
              }
            }
          },
          "billing_cycle_anchor" => :scalar,
          "billing_thresholds" => %{
            fields: %{
              "amount_gte" => :scalar,
              "reset_billing_cycle_anchor" => :scalar
            }
          },
          "collection_method" => :scalar,
          "default_payment_method" => {:resource, Stripe.Resources.PaymentMethod},
          "description" => :scalar,
          "invoice_settings" => %{
            fields: %{
              "account_tax_ids" => {:list, {:resource, Stripe.Resources.TaxId}},
              "days_until_due" => :scalar,
              "issuer" => %{
                fields: %{
                  "account" => {:resource, Stripe.Resources.Account},
                  "type" => :scalar
                }
              }
            }
          },
          "on_behalf_of" => {:resource, Stripe.Resources.Account},
          "transfer_data" => %{
            fields: %{
              "amount_percent" => :scalar,
              "destination" => {:resource, Stripe.Resources.Account}
            }
          }
        }
      },
      "phases" => %{
        fields: %{
          "add_invoice_items" =>
            {:list,
             %{
               fields: %{
                 "discounts" =>
                   {:list,
                    %{
                      fields: %{
                        "coupon" => {:resource, Stripe.Resources.Coupon},
                        "discount" => {:resource, Stripe.Resources.Discount},
                        "promotion_code" => {:resource, Stripe.Resources.PromotionCode}
                      }
                    }},
                 "metadata" => {:map, :scalar},
                 "period" => %{
                   fields: %{
                     "end" => %{
                       fields: %{
                         "timestamp" => :scalar,
                         "type" => :scalar
                       }
                     },
                     "start" => %{
                       fields: %{
                         "timestamp" => :scalar,
                         "type" => :scalar
                       }
                     }
                   }
                 },
                 "price" => {:resource, Stripe.Resources.Price},
                 "quantity" => :scalar,
                 "tax_rates" => {:list, {:resource, Stripe.Resources.TaxRate}}
               }
             }},
          "application_fee_percent" => :scalar,
          "automatic_tax" => %{
            fields: %{
              "disabled_reason" => :scalar,
              "enabled" => :scalar,
              "liability" => %{
                fields: %{
                  "account" => {:resource, Stripe.Resources.Account},
                  "type" => :scalar
                }
              }
            }
          },
          "billing_cycle_anchor" => :scalar,
          "billing_thresholds" => %{
            fields: %{
              "amount_gte" => :scalar,
              "reset_billing_cycle_anchor" => :scalar
            }
          },
          "collection_method" => :scalar,
          "currency" => :scalar,
          "default_payment_method" => {:resource, Stripe.Resources.PaymentMethod},
          "default_tax_rates" => {:list, {:resource, Stripe.Resources.TaxRate}},
          "description" => :scalar,
          "discounts" =>
            {:list,
             %{
               fields: %{
                 "coupon" => {:resource, Stripe.Resources.Coupon},
                 "discount" => {:resource, Stripe.Resources.Discount},
                 "promotion_code" => {:resource, Stripe.Resources.PromotionCode}
               }
             }},
          "end_date" => :scalar,
          "invoice_settings" => %{
            fields: %{
              "account_tax_ids" => {:list, {:resource, Stripe.Resources.TaxId}},
              "days_until_due" => :scalar,
              "issuer" => %{
                fields: %{
                  "account" => {:resource, Stripe.Resources.Account},
                  "type" => :scalar
                }
              }
            }
          },
          "items" =>
            {:list,
             %{
               fields: %{
                 "billing_thresholds" => %{
                   fields: %{
                     "usage_gte" => :scalar
                   }
                 },
                 "discounts" =>
                   {:list,
                    %{
                      fields: %{
                        "coupon" => {:resource, Stripe.Resources.Coupon},
                        "discount" => {:resource, Stripe.Resources.Discount},
                        "promotion_code" => {:resource, Stripe.Resources.PromotionCode}
                      }
                    }},
                 "metadata" => {:map, :scalar},
                 "plan" => {:resource, Stripe.Resources.Plan},
                 "price" => {:resource, Stripe.Resources.Price},
                 "quantity" => :scalar,
                 "tax_rates" => {:list, {:resource, Stripe.Resources.TaxRate}}
               }
             }},
          "metadata" => {:map, :scalar},
          "on_behalf_of" => {:resource, Stripe.Resources.Account},
          "proration_behavior" => :scalar,
          "start_date" => :scalar,
          "transfer_data" => %{
            fields: %{
              "amount_percent" => :scalar,
              "destination" => {:resource, Stripe.Resources.Account}
            }
          },
          "trial_end" => :scalar
        }
      }
    }
  end
end
