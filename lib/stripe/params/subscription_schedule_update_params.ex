# File generated from our OpenAPI spec
defmodule Stripe.Params.SubscriptionScheduleUpdateParams do
  @moduledoc "Parameters for subscription schedule update."

  @typedoc """
  * `default_settings` - Object representing the subscription schedule's default settings.
  * `end_behavior` - Behavior of the subscription schedule and underlying subscription when it ends. Possible values are `release` or `cancel` with the default being `release`. `release` will end the subscription schedule and keep the underlying subscription running. `cancel` will end the subscription schedule and cancel the underlying subscription. Possible values: `cancel`, `none`, `release`, `renew`.
  * `expand` - Specifies which fields in the response should be expanded.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `phases` - List representing phases of the subscription schedule. Each phase can be customized to have different durations, plans, and coupons. If there are multiple phases, the `end_date` of one phase will always equal the `start_date` of the next phase. Note that past phases can be omitted.
  * `proration_behavior` - If the update changes the billing configuration (item price, quantity, etc.) of the current phase, indicates how prorations from this change should be handled. The default value is `create_prorations`. Possible values: `always_invoice`, `create_prorations`, `none`.
  """
  @type t :: %__MODULE__{
          default_settings: default_settings() | nil,
          end_behavior: String.t() | nil,
          expand: [String.t()] | nil,
          metadata: map() | nil,
          phases: [phases()] | nil,
          proration_behavior: String.t() | nil
        }

  defstruct [:default_settings, :end_behavior, :expand, :metadata, :phases, :proration_behavior]

  @typedoc """
  * `application_fee_percent` - A non-negative decimal between 0 and 100, with at most two decimal places. This represents the percentage of the subscription invoice total that will be transferred to the application owner's Stripe account. The request must be made by a platform account on a connected account in order to set an application fee percentage. For more information, see the application fees [documentation](https://stripe.com/docs/connect/subscriptions#collecting-fees-on-subscriptions).
  * `automatic_tax` - Default settings for automatic tax computation.
  * `billing_cycle_anchor` - Can be set to `phase_start` to set the anchor to the start of the phase or `automatic` to automatically change it if needed. Cannot be set to `phase_start` if this phase specifies a trial. For more information, see the billing cycle [documentation](https://docs.stripe.com/billing/subscriptions/billing-cycle). Possible values: `automatic`, `phase_start`.
  * `billing_thresholds` - Define thresholds at which an invoice will be sent, and the subscription advanced to a new billing period. Pass an empty string to remove previously-defined thresholds.
  * `collection_method` - Either `charge_automatically`, or `send_invoice`. When charging automatically, Stripe will attempt to pay the underlying subscription at the end of each billing cycle using the default source attached to the customer. When sending an invoice, Stripe will email your customer an invoice with payment instructions and mark the subscription as `active`. Defaults to `charge_automatically` on creation. Possible values: `charge_automatically`, `send_invoice`.
  * `default_payment_method` - ID of the default payment method for the subscription schedule. It must belong to the customer associated with the subscription schedule. If not set, invoices will use the default payment method in the customer's invoice settings. Max length: 5000.
  * `description` - Subscription description, meant to be displayable to the customer. Use this field to optionally store an explanation of the subscription for rendering in Stripe surfaces and certain local payment methods UIs.
  * `invoice_settings` - All invoices will be billed using the specified settings.
  * `on_behalf_of` - The account on behalf of which to charge, for each of the associated subscription's invoices.
  * `transfer_data` - The data with which to automatically create a Transfer for each of the associated subscription's invoices.
  """
  @type default_settings :: %{
          optional(:application_fee_percent) => float() | nil,
          optional(:automatic_tax) => default_settings_automatic_tax() | nil,
          optional(:billing_cycle_anchor) => String.t() | nil,
          optional(:billing_thresholds) => map() | nil,
          optional(:collection_method) => String.t() | nil,
          optional(:default_payment_method) => String.t() | nil,
          optional(:description) => map() | nil,
          optional(:invoice_settings) => default_settings_invoice_settings() | nil,
          optional(:on_behalf_of) => map() | nil,
          optional(:transfer_data) => map() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `enabled` - Enabled automatic tax calculation which will automatically compute tax rates on all invoices generated by the subscription.
  * `liability` - The account that's liable for tax. If set, the business address and tax registrations required to perform the tax calculation are loaded from this account. The tax transaction is returned in the report of the connected account.
  """
  @type default_settings_automatic_tax :: %{
          optional(:enabled) => boolean() | nil,
          optional(:liability) => default_settings_automatic_tax_liability() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `account` - The connected account being referenced when `type` is `account`.
  * `type` - Type of the account referenced in the request. Possible values: `account`, `self`.
  """
  @type default_settings_automatic_tax_liability :: %{
          optional(:account) => String.t() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `account_tax_ids` - The account tax IDs associated with the subscription schedule. Will be set on invoices generated by the subscription schedule.
  * `days_until_due` - Number of days within which a customer must pay invoices generated by this subscription schedule. This value will be `null` for subscription schedules where `collection_method=charge_automatically`.
  * `issuer` - The connected account that issues the invoice. The invoice is presented with the branding and support information of the specified account.
  """
  @type default_settings_invoice_settings :: %{
          optional(:account_tax_ids) => map() | nil,
          optional(:days_until_due) => integer() | nil,
          optional(:issuer) => default_settings_invoice_settings_issuer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `account` - The connected account being referenced when `type` is `account`.
  * `type` - Type of the account referenced in the request. Possible values: `account`, `self`.
  """
  @type default_settings_invoice_settings_issuer :: %{
          optional(:account) => String.t() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `add_invoice_items` - A list of prices and quantities that will generate invoice items appended to the next invoice for this phase. You may pass up to 20 items.
  * `application_fee_percent` - A non-negative decimal between 0 and 100, with at most two decimal places. This represents the percentage of the subscription invoice total that will be transferred to the application owner's Stripe account. The request must be made by a platform account on a connected account in order to set an application fee percentage. For more information, see the application fees [documentation](https://stripe.com/docs/connect/subscriptions#collecting-fees-on-subscriptions).
  * `automatic_tax` - Automatic tax settings for this phase.
  * `billing_cycle_anchor` - Can be set to `phase_start` to set the anchor to the start of the phase or `automatic` to automatically change it if needed. Cannot be set to `phase_start` if this phase specifies a trial. For more information, see the billing cycle [documentation](https://docs.stripe.com/billing/subscriptions/billing-cycle). Possible values: `automatic`, `phase_start`.
  * `billing_thresholds` - Define thresholds at which an invoice will be sent, and the subscription advanced to a new billing period. Pass an empty string to remove previously-defined thresholds.
  * `collection_method` - Either `charge_automatically`, or `send_invoice`. When charging automatically, Stripe will attempt to pay the underlying subscription at the end of each billing cycle using the default source attached to the customer. When sending an invoice, Stripe will email your customer an invoice with payment instructions and mark the subscription as `active`. Defaults to `charge_automatically` on creation. Possible values: `charge_automatically`, `send_invoice`.
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `default_payment_method` - ID of the default payment method for the subscription schedule. It must belong to the customer associated with the subscription schedule. If not set, invoices will use the default payment method in the customer's invoice settings. Max length: 5000.
  * `default_tax_rates` - A list of [Tax Rate](https://docs.stripe.com/api/tax_rates) ids. These Tax Rates will set the Subscription's [`default_tax_rates`](https://docs.stripe.com/api/subscriptions/create#create_subscription-default_tax_rates), which means they will be the Invoice's [`default_tax_rates`](https://docs.stripe.com/api/invoices/create#create_invoice-default_tax_rates) for any Invoices issued by the Subscription during this Phase.
  * `description` - Subscription description, meant to be displayable to the customer. Use this field to optionally store an explanation of the subscription for rendering in Stripe surfaces and certain local payment methods UIs.
  * `discounts` - The coupons to redeem into discounts for the schedule phase. If not specified, inherits the discount from the subscription's customer. Pass an empty string to avoid inheriting any discounts.
  * `duration` - The number of intervals the phase should last. If set, `end_date` must not be set.
  * `end_date` - The date at which this phase of the subscription schedule ends. If set, `duration` must not be set.
  * `invoice_settings` - All invoices will be billed using the specified settings.
  * `items` - List of configuration items, each with an attached price, to apply during this phase of the subscription schedule.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to a phase. Metadata on a schedule's phase will update the underlying subscription's `metadata` when the phase is entered, adding new keys and replacing existing keys in the subscription's `metadata`. Individual keys in the subscription's `metadata` can be unset by posting an empty value to them in the phase's `metadata`. To unset all keys in the subscription's `metadata`, update the subscription directly or unset every key individually from the phase's `metadata`.
  * `on_behalf_of` - The account on behalf of which to charge, for each of the associated subscription's invoices.
  * `proration_behavior` - Controls whether the subscription schedule should create [prorations](https://docs.stripe.com/billing/subscriptions/prorations) when transitioning to this phase if there is a difference in billing configuration. It's different from the request-level [proration_behavior](https://docs.stripe.com/api/subscription_schedules/update#update_subscription_schedule-proration_behavior) parameter which controls what happens if the update request affects the billing configuration (item price, quantity, etc.) of the current phase. Possible values: `always_invoice`, `create_prorations`, `none`.
  * `start_date` - The date at which this phase of the subscription schedule starts or `now`. Must be set on the first phase.
  * `transfer_data` - The data with which to automatically create a Transfer for each of the associated subscription's invoices.
  * `trial` - If set to true the entire phase is counted as a trial and the customer will not be charged for any fees.
  * `trial_end` - Sets the phase to trialing from the start date to this date. Must be before the phase end date, can not be combined with `trial`
  """
  @type phases :: %{
          optional(:add_invoice_items) => [phases_add_invoice_items()] | nil,
          optional(:application_fee_percent) => float() | nil,
          optional(:automatic_tax) => phases_automatic_tax() | nil,
          optional(:billing_cycle_anchor) => String.t() | nil,
          optional(:billing_thresholds) => map() | nil,
          optional(:collection_method) => String.t() | nil,
          optional(:currency) => String.t() | nil,
          optional(:default_payment_method) => String.t() | nil,
          optional(:default_tax_rates) => map() | nil,
          optional(:description) => map() | nil,
          optional(:discounts) => map() | nil,
          optional(:duration) => phases_duration() | nil,
          optional(:end_date) => map() | nil,
          optional(:invoice_settings) => phases_invoice_settings() | nil,
          optional(:items) => [phases_items()] | nil,
          optional(:metadata) => %{String.t() => String.t()} | nil,
          optional(:on_behalf_of) => String.t() | nil,
          optional(:proration_behavior) => String.t() | nil,
          optional(:start_date) => map() | nil,
          optional(:transfer_data) => phases_transfer_data() | nil,
          optional(:trial) => boolean() | nil,
          optional(:trial_end) => map() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `discounts` - The coupons to redeem into discounts for the item.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `period` - The period associated with this invoice item. If not set, `period.start.type` defaults to `max_item_period_start` and `period.end.type` defaults to `min_item_period_end`.
  * `price` - The ID of the price object. One of `price` or `price_data` is required. Max length: 5000.
  * `price_data` - Data used to generate a new [Price](https://docs.stripe.com/api/prices) object inline. One of `price` or `price_data` is required.
  * `quantity` - Quantity for this item. Defaults to 1.
  * `tax_rates` - The tax rates which apply to the item. When set, the `default_tax_rates` do not apply to this item.
  """
  @type phases_add_invoice_items :: %{
          optional(:discounts) => [phases_add_invoice_items_discounts()] | nil,
          optional(:metadata) => %{String.t() => String.t()} | nil,
          optional(:period) => phases_add_invoice_items_period() | nil,
          optional(:price) => String.t() | nil,
          optional(:price_data) => phases_add_invoice_items_price_data() | nil,
          optional(:quantity) => integer() | nil,
          optional(:tax_rates) => map() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `coupon` - ID of the coupon to create a new discount for. Max length: 5000.
  * `discount` - ID of an existing discount on the object (or one of its ancestors) to reuse. Max length: 5000.
  * `promotion_code` - ID of the promotion code to create a new discount for. Max length: 5000.
  """
  @type phases_add_invoice_items_discounts :: %{
          optional(:coupon) => String.t() | nil,
          optional(:discount) => String.t() | nil,
          optional(:promotion_code) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `end` - End of the invoice item period.
  * `start` - Start of the invoice item period.
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
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `product` - The ID of the [Product](https://docs.stripe.com/api/products) that this [Price](https://docs.stripe.com/api/prices) will belong to. Max length: 5000.
  * `tax_behavior` - Only required if a [default tax behavior](https://docs.stripe.com/tax/products-prices-tax-categories-tax-behavior#setting-a-default-tax-behavior-(recommended)) was not provided in the Stripe Tax settings. Specifies whether the price is considered inclusive of taxes or exclusive of taxes. One of `inclusive`, `exclusive`, or `unspecified`. Once specified as either `inclusive` or `exclusive`, it cannot be changed. Possible values: `exclusive`, `inclusive`, `unspecified`.
  * `unit_amount` - A positive integer in cents (or local equivalent) (or 0 for a free price) representing how much to charge or a negative integer representing the amount to credit to the customer.
  * `unit_amount_decimal` - Same as `unit_amount`, but accepts a decimal value in cents (or local equivalent) with at most 12 decimal places. Only one of `unit_amount` and `unit_amount_decimal` can be set. Format: decimal string.
  """
  @type phases_add_invoice_items_price_data :: %{
          optional(:currency) => String.t() | nil,
          optional(:product) => String.t() | nil,
          optional(:tax_behavior) => String.t() | nil,
          optional(:unit_amount) => integer() | nil,
          optional(:unit_amount_decimal) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `enabled` - Enabled automatic tax calculation which will automatically compute tax rates on all invoices generated by the subscription.
  * `liability` - The account that's liable for tax. If set, the business address and tax registrations required to perform the tax calculation are loaded from this account. The tax transaction is returned in the report of the connected account.
  """
  @type phases_automatic_tax :: %{
          optional(:enabled) => boolean() | nil,
          optional(:liability) => phases_automatic_tax_liability() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `account` - The connected account being referenced when `type` is `account`.
  * `type` - Type of the account referenced in the request. Possible values: `account`, `self`.
  """
  @type phases_automatic_tax_liability :: %{
          optional(:account) => String.t() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `interval` - Specifies phase duration. Either `day`, `week`, `month` or `year`. Possible values: `day`, `month`, `week`, `year`.
  * `interval_count` - The multiplier applied to the interval.
  """
  @type phases_duration :: %{
          optional(:interval) => String.t() | nil,
          optional(:interval_count) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `account_tax_ids` - The account tax IDs associated with this phase of the subscription schedule. Will be set on invoices generated by this phase of the subscription schedule.
  * `days_until_due` - Number of days within which a customer must pay invoices generated by this subscription schedule. This value will be `null` for subscription schedules where `billing=charge_automatically`.
  * `issuer` - The connected account that issues the invoice. The invoice is presented with the branding and support information of the specified account.
  """
  @type phases_invoice_settings :: %{
          optional(:account_tax_ids) => map() | nil,
          optional(:days_until_due) => integer() | nil,
          optional(:issuer) => phases_invoice_settings_issuer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `account` - The connected account being referenced when `type` is `account`.
  * `type` - Type of the account referenced in the request. Possible values: `account`, `self`.
  """
  @type phases_invoice_settings_issuer :: %{
          optional(:account) => String.t() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `billing_thresholds` - Define thresholds at which an invoice will be sent, and the subscription advanced to a new billing period. Pass an empty string to remove previously-defined thresholds.
  * `discounts` - The coupons to redeem into discounts for the subscription item.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to a configuration item. Metadata on a configuration item will update the underlying subscription item's `metadata` when the phase is entered, adding new keys and replacing existing keys. Individual keys in the subscription item's `metadata` can be unset by posting an empty value to them in the configuration item's `metadata`. To unset all keys in the subscription item's `metadata`, update the subscription item directly or unset every key individually from the configuration item's `metadata`.
  * `plan` - The plan ID to subscribe to. You may specify the same ID in `plan` and `price`. Max length: 5000.
  * `price` - The ID of the price object. Max length: 5000.
  * `price_data` - Data used to generate a new [Price](https://docs.stripe.com/api/prices) object inline.
  * `quantity` - Quantity for the given price. Can be set only if the price's `usage_type` is `licensed` and not `metered`.
  * `tax_rates` - A list of [Tax Rate](https://docs.stripe.com/api/tax_rates) ids. These Tax Rates will override the [`default_tax_rates`](https://docs.stripe.com/api/subscriptions/create#create_subscription-default_tax_rates) on the Subscription. When updating, pass an empty string to remove previously-defined tax rates.
  """
  @type phases_items :: %{
          optional(:billing_thresholds) => map() | nil,
          optional(:discounts) => map() | nil,
          optional(:metadata) => %{String.t() => String.t()} | nil,
          optional(:plan) => String.t() | nil,
          optional(:price) => String.t() | nil,
          optional(:price_data) => phases_items_price_data() | nil,
          optional(:quantity) => integer() | nil,
          optional(:tax_rates) => map() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `product` - The ID of the [Product](https://docs.stripe.com/api/products) that this [Price](https://docs.stripe.com/api/prices) will belong to. Max length: 5000.
  * `recurring` - The recurring components of a price such as `interval` and `interval_count`.
  * `tax_behavior` - Only required if a [default tax behavior](https://docs.stripe.com/tax/products-prices-tax-categories-tax-behavior#setting-a-default-tax-behavior-(recommended)) was not provided in the Stripe Tax settings. Specifies whether the price is considered inclusive of taxes or exclusive of taxes. One of `inclusive`, `exclusive`, or `unspecified`. Once specified as either `inclusive` or `exclusive`, it cannot be changed. Possible values: `exclusive`, `inclusive`, `unspecified`.
  * `unit_amount` - A positive integer in cents (or local equivalent) (or 0 for a free price) representing how much to charge.
  * `unit_amount_decimal` - Same as `unit_amount`, but accepts a decimal value in cents (or local equivalent) with at most 12 decimal places. Only one of `unit_amount` and `unit_amount_decimal` can be set. Format: decimal string.
  """
  @type phases_items_price_data :: %{
          optional(:currency) => String.t() | nil,
          optional(:product) => String.t() | nil,
          optional(:recurring) => phases_items_price_data_recurring() | nil,
          optional(:tax_behavior) => String.t() | nil,
          optional(:unit_amount) => integer() | nil,
          optional(:unit_amount_decimal) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `interval` - Specifies billing frequency. Either `day`, `week`, `month` or `year`. Possible values: `day`, `month`, `week`, `year`.
  * `interval_count` - The number of intervals between subscription billings. For example, `interval=month` and `interval_count=3` bills every 3 months. Maximum of three years interval allowed (3 years, 36 months, or 156 weeks).
  """
  @type phases_items_price_data_recurring :: %{
          optional(:interval) => String.t() | nil,
          optional(:interval_count) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `amount_percent` - A non-negative decimal between 0 and 100, with at most two decimal places. This represents the percentage of the subscription invoice total that will be transferred to the destination account. By default, the entire amount is transferred to the destination.
  * `destination` - ID of an existing, connected Stripe account.
  """
  @type phases_transfer_data :: %{
          optional(:amount_percent) => float() | nil,
          optional(:destination) => String.t() | nil,
          optional(String.t()) => term()
        }
end
