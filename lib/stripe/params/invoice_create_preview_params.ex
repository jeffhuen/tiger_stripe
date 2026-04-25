# File generated from our OpenAPI spec
defmodule Stripe.Params.InvoiceCreatePreviewParams do
  @moduledoc "Parameters for invoice create preview."

  @typedoc """
  * `automatic_tax` - Settings for automatic tax lookup for this invoice preview.
  * `currency` - The currency to preview this invoice in. Defaults to that of `customer` if not specified. Format: ISO 4217 currency code.
  * `customer` - The identifier of the customer whose upcoming invoice you're retrieving. If `automatic_tax` is enabled then one of `customer`, `customer_details`, `subscription`, or `schedule` must be set. Max length: 5000.
  * `customer_account` - The identifier of the account representing the customer whose upcoming invoice you're retrieving. If `automatic_tax` is enabled then one of `customer`, `customer_account`, `customer_details`, `subscription`, or `schedule` must be set. Max length: 5000.
  * `customer_details` - Details about the customer you want to invoice or overrides for an existing customer. If `automatic_tax` is enabled then one of `customer`, `customer_details`, `subscription`, or `schedule` must be set.
  * `discounts` - The coupons to redeem into discounts for the invoice preview. If not specified, inherits the discount from the subscription or customer. This works for both coupons directly applied to an invoice and coupons applied to a subscription. Pass an empty string to avoid inheriting any discounts.
  * `expand` - Specifies which fields in the response should be expanded.
  * `invoice_items` - List of invoice items to add or update in the upcoming invoice preview (up to 250).
  * `issuer` - The connected account that issues the invoice. The invoice is presented with the branding and support information of the specified account.
  * `on_behalf_of` - The account (if any) for which the funds of the invoice payment are intended. If set, the invoice will be presented with the branding and support information of the specified account. See the [Invoices with Connect](https://docs.stripe.com/billing/invoices/connect) documentation for details.
  * `preview_mode` - Customizes the types of values to include when calculating the invoice. Defaults to `next` if unspecified. Possible values: `next`, `recurring`.
  * `schedule` - The identifier of the schedule whose upcoming invoice you'd like to retrieve. Cannot be used with subscription or subscription fields. Max length: 5000.
  * `schedule_details` - The schedule creation or modification params to apply as a preview. Cannot be used with `subscription` or `subscription_` prefixed fields.
  * `subscription` - The identifier of the subscription for which you'd like to retrieve the upcoming invoice. If not provided, but a `subscription_details.items` is provided, you will preview creating a subscription with those items. If neither `subscription` nor `subscription_details.items` is provided, you will retrieve the next upcoming invoice from among the customer's subscriptions. Max length: 5000.
  * `subscription_details` - The subscription creation or modification params to apply as a preview. Cannot be used with `schedule` or `schedule_details` fields.
  """
  @type t :: %__MODULE__{
          automatic_tax: automatic_tax() | nil,
          currency: String.t() | nil,
          customer: String.t() | nil,
          customer_account: String.t() | nil,
          customer_details: customer_details() | nil,
          discounts: map() | nil,
          expand: [String.t()] | nil,
          invoice_items: [invoice_items()] | nil,
          issuer: issuer() | nil,
          on_behalf_of: map() | nil,
          preview_mode: String.t() | nil,
          schedule: String.t() | nil,
          schedule_details: schedule_details() | nil,
          subscription: String.t() | nil,
          subscription_details: subscription_details() | nil
        }

  defstruct [
    :automatic_tax,
    :currency,
    :customer,
    :customer_account,
    :customer_details,
    :discounts,
    :expand,
    :invoice_items,
    :issuer,
    :on_behalf_of,
    :preview_mode,
    :schedule,
    :schedule_details,
    :subscription,
    :subscription_details
  ]

  @typedoc """
  * `enabled` - Whether Stripe automatically computes tax on this invoice. Note that incompatible invoice items (invoice items with manually specified [tax rates](https://docs.stripe.com/api/tax_rates), negative amounts, or `tax_behavior=unspecified`) cannot be added to automatic tax invoices.
  * `liability` - The account that's liable for tax. If set, the business address and tax registrations required to perform the tax calculation are loaded from this account. The tax transaction is returned in the report of the connected account.
  """
  @type automatic_tax :: %{
          optional(:enabled) => boolean() | nil,
          optional(:liability) => automatic_tax_liability() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `account` - The connected account being referenced when `type` is `account`.
  * `type` - Type of the account referenced in the request. Possible values: `account`, `self`.
  """
  @type automatic_tax_liability :: %{
          optional(:account) => String.t() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `address` - The customer's address. Learn about [country-specific requirements for calculating tax](https://stripe.com/invoicing/taxes?dashboard-or-api=dashboard#set-up-customer).
  * `shipping` - The customer's shipping information. Appears on invoices emailed to this customer.
  * `tax` - Tax details about the customer.
  * `tax_exempt` - The customer's tax exemption. One of `none`, `exempt`, or `reverse`. Possible values: `exempt`, `none`, `reverse`.
  * `tax_ids` - The customer's tax IDs.
  """
  @type customer_details :: %{
          optional(:address) => map() | nil,
          optional(:shipping) => map() | nil,
          optional(:tax) => customer_details_tax() | nil,
          optional(:tax_exempt) => String.t() | nil,
          optional(:tax_ids) => [customer_details_tax_ids()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `ip_address` - A recent IP address of the customer used for tax reporting and tax location inference. Stripe recommends updating the IP address when a new PaymentMethod is attached or the address field on the customer is updated. We recommend against updating this field more frequently since it could result in unexpected tax location/reporting outcomes.
  """
  @type customer_details_tax :: %{
          optional(:ip_address) => map() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of the tax ID, one of `ad_nrt`, `ae_trn`, `al_tin`, `am_tin`, `ao_tin`, `ar_cuit`, `au_abn`, `au_arn`, `aw_tin`, `az_tin`, `ba_tin`, `bb_tin`, `bd_bin`, `bf_ifu`, `bg_uic`, `bh_vat`, `bj_ifu`, `bo_tin`, `br_cnpj`, `br_cpf`, `bs_tin`, `by_tin`, `ca_bn`, `ca_gst_hst`, `ca_pst_bc`, `ca_pst_mb`, `ca_pst_sk`, `ca_qst`, `cd_nif`, `ch_uid`, `ch_vat`, `cl_tin`, `cm_niu`, `cn_tin`, `co_nit`, `cr_tin`, `cv_nif`, `de_stn`, `do_rcn`, `ec_ruc`, `eg_tin`, `es_cif`, `et_tin`, `eu_oss_vat`, `eu_vat`, `gb_vat`, `ge_vat`, `gn_nif`, `hk_br`, `hr_oib`, `hu_tin`, `id_npwp`, `il_vat`, `in_gst`, `is_vat`, `jp_cn`, `jp_rn`, `jp_trn`, `ke_pin`, `kg_tin`, `kh_tin`, `kr_brn`, `kz_bin`, `la_tin`, `li_uid`, `li_vat`, `ma_vat`, `md_vat`, `me_pib`, `mk_vat`, `mr_nif`, `mx_rfc`, `my_frp`, `my_itn`, `my_sst`, `ng_tin`, `no_vat`, `no_voec`, `np_pan`, `nz_gst`, `om_vat`, `pe_ruc`, `ph_tin`, `pl_nip`, `ro_tin`, `rs_pib`, `ru_inn`, `ru_kpp`, `sa_vat`, `sg_gst`, `sg_uen`, `si_tin`, `sn_ninea`, `sr_fin`, `sv_nit`, `th_vat`, `tj_tin`, `tr_tin`, `tw_vat`, `tz_vat`, `ua_vat`, `ug_tin`, `us_ein`, `uy_ruc`, `uz_tin`, `uz_vat`, `ve_rif`, `vn_tin`, `za_vat`, `zm_tin`, or `zw_tin` Possible values: `ad_nrt`, `ae_trn`, `al_tin`, `am_tin`, `ao_tin`, `ar_cuit`, `au_abn`, `au_arn`, `aw_tin`, `az_tin`, `ba_tin`, `bb_tin`, `bd_bin`, `bf_ifu`, `bg_uic`, `bh_vat`, `bj_ifu`, `bo_tin`, `br_cnpj`, `br_cpf`, `bs_tin`, `by_tin`, `ca_bn`, `ca_gst_hst`, `ca_pst_bc`, `ca_pst_mb`, `ca_pst_sk`, `ca_qst`, `cd_nif`, `ch_uid`, `ch_vat`, `cl_tin`, `cm_niu`, `cn_tin`, `co_nit`, `cr_tin`, `cv_nif`, `de_stn`, `do_rcn`, `ec_ruc`, `eg_tin`, `es_cif`, `et_tin`, `eu_oss_vat`, `eu_vat`, `gb_vat`, `ge_vat`, `gn_nif`, `hk_br`, `hr_oib`, `hu_tin`, `id_npwp`, `il_vat`, `in_gst`, `is_vat`, `jp_cn`, `jp_rn`, `jp_trn`, `ke_pin`, `kg_tin`, `kh_tin`, `kr_brn`, `kz_bin`, `la_tin`, `li_uid`, `li_vat`, `ma_vat`, `md_vat`, `me_pib`, `mk_vat`, `mr_nif`, `mx_rfc`, `my_frp`, `my_itn`, `my_sst`, `ng_tin`, `no_vat`, `no_voec`, `np_pan`, `nz_gst`, `om_vat`, `pe_ruc`, `ph_tin`, `pl_nip`, `ro_tin`, `rs_pib`, `ru_inn`, `ru_kpp`, `sa_vat`, `sg_gst`, `sg_uen`, `si_tin`, `sn_ninea`, `sr_fin`, `sv_nit`, `th_vat`, `tj_tin`, `tr_tin`, `tw_vat`, `tz_vat`, `ua_vat`, `ug_tin`, `us_ein`, `uy_ruc`, `uz_tin`, `uz_vat`, `ve_rif`, `vn_tin`, `za_vat`, `zm_tin`, `zw_tin`. Max length: 5000.
  * `value` - Value of the tax ID.
  """
  @type customer_details_tax_ids :: %{
          optional(:type) => String.t() | nil,
          optional(:value) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `amount` - The integer amount in cents (or local equivalent) of previewed invoice item.
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Only applicable to new invoice items. Format: ISO 4217 currency code.
  * `description` - An arbitrary string which you can attach to the invoice item. The description is displayed in the invoice for easy tracking. Max length: 5000.
  * `discountable` - Explicitly controls whether discounts apply to this invoice item. Defaults to true, except for negative invoice items.
  * `discounts` - The coupons to redeem into discounts for the invoice item in the preview.
  * `invoiceitem` - The ID of the invoice item to update in preview. If not specified, a new invoice item will be added to the preview of the upcoming invoice. Max length: 5000.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `period` - The period associated with this invoice item. When set to different values, the period will be rendered on the invoice. If you have [Stripe Revenue Recognition](https://docs.stripe.com/revenue-recognition) enabled, the period will be used to recognize and defer revenue. See the [Revenue Recognition documentation](https://docs.stripe.com/revenue-recognition/methodology/subscriptions-and-invoicing) for details.
  * `price` - The ID of the price object. One of `price` or `price_data` is required. Max length: 5000.
  * `price_data` - Data used to generate a new [Price](https://docs.stripe.com/api/prices) object inline. One of `price` or `price_data` is required.
  * `quantity` - Non-negative integer. The quantity of units for the invoice item.
  * `tax_behavior` - Only required if a [default tax behavior](https://docs.stripe.com/tax/products-prices-tax-categories-tax-behavior#setting-a-default-tax-behavior-(recommended)) was not provided in the Stripe Tax settings. Specifies whether the price is considered inclusive of taxes or exclusive of taxes. One of `inclusive`, `exclusive`, or `unspecified`. Once specified as either `inclusive` or `exclusive`, it cannot be changed. Possible values: `exclusive`, `inclusive`, `unspecified`.
  * `tax_code` - A [tax code](https://docs.stripe.com/tax/tax-categories) ID.
  * `tax_rates` - The tax rates that apply to the item. When set, any `default_tax_rates` do not apply to this item.
  * `unit_amount` - The integer unit amount in cents (or local equivalent) of the charge to be applied to the upcoming invoice. This unit_amount will be multiplied by the quantity to get the full amount. If you want to apply a credit to the customer's account, pass a negative unit_amount.
  * `unit_amount_decimal` - Same as `unit_amount`, but accepts a decimal value in cents (or local equivalent) with at most 12 decimal places. Only one of `unit_amount` and `unit_amount_decimal` can be set. Format: decimal string.
  """
  @type invoice_items :: %{
          optional(:amount) => integer() | nil,
          optional(:currency) => String.t() | nil,
          optional(:description) => String.t() | nil,
          optional(:discountable) => boolean() | nil,
          optional(:discounts) => map() | nil,
          optional(:invoiceitem) => String.t() | nil,
          optional(:metadata) => map() | nil,
          optional(:period) => invoice_items_period() | nil,
          optional(:price) => String.t() | nil,
          optional(:price_data) => invoice_items_price_data() | nil,
          optional(:quantity) => integer() | nil,
          optional(:tax_behavior) => String.t() | nil,
          optional(:tax_code) => map() | nil,
          optional(:tax_rates) => map() | nil,
          optional(:unit_amount) => integer() | nil,
          optional(:unit_amount_decimal) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `end` - The end of the period, which must be greater than or equal to the start. This value is inclusive. Format: Unix timestamp.
  * `start` - The start of the period. This value is inclusive. Format: Unix timestamp.
  """
  @type invoice_items_period :: %{
          optional(:end) => integer() | nil,
          optional(:start) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `product` - The ID of the [Product](https://docs.stripe.com/api/products) that this [Price](https://docs.stripe.com/api/prices) will belong to. Max length: 5000.
  * `tax_behavior` - Only required if a [default tax behavior](https://docs.stripe.com/tax/products-prices-tax-categories-tax-behavior#setting-a-default-tax-behavior-(recommended)) was not provided in the Stripe Tax settings. Specifies whether the price is considered inclusive of taxes or exclusive of taxes. One of `inclusive`, `exclusive`, or `unspecified`. Once specified as either `inclusive` or `exclusive`, it cannot be changed. Possible values: `exclusive`, `inclusive`, `unspecified`.
  * `unit_amount` - A positive integer in cents (or local equivalent) (or 0 for a free price) representing how much to charge.
  * `unit_amount_decimal` - Same as `unit_amount`, but accepts a decimal value in cents (or local equivalent) with at most 12 decimal places. Only one of `unit_amount` and `unit_amount_decimal` can be set. Format: decimal string.
  """
  @type invoice_items_price_data :: %{
          optional(:currency) => String.t() | nil,
          optional(:product) => String.t() | nil,
          optional(:tax_behavior) => String.t() | nil,
          optional(:unit_amount) => integer() | nil,
          optional(:unit_amount_decimal) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `account` - The connected account being referenced when `type` is `account`.
  * `type` - Type of the account referenced in the request. Possible values: `account`, `self`.
  """
  @type issuer :: %{
          optional(:account) => String.t() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `billing_mode` - Controls how prorations and invoices for subscriptions are calculated and orchestrated.
  * `end_behavior` - Behavior of the subscription schedule and underlying subscription when it ends. Possible values are `release` or `cancel` with the default being `release`. `release` will end the subscription schedule and keep the underlying subscription running. `cancel` will end the subscription schedule and cancel the underlying subscription. Possible values: `cancel`, `release`.
  * `phases` - List representing phases of the subscription schedule. Each phase can be customized to have different durations, plans, and coupons. If there are multiple phases, the `end_date` of one phase will always equal the `start_date` of the next phase.
  * `proration_behavior` - In cases where the `schedule_details` params update the currently active phase, specifies if and how to prorate at the time of the request. Possible values: `always_invoice`, `create_prorations`, `none`.
  """
  @type schedule_details :: %{
          optional(:billing_mode) => schedule_details_billing_mode() | nil,
          optional(:end_behavior) => String.t() | nil,
          optional(:phases) => [schedule_details_phases()] | nil,
          optional(:proration_behavior) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `flexible` - Configure behavior for flexible billing mode.
  * `type` - Controls the calculation and orchestration of prorations and invoices for subscriptions. If no value is passed, the default is `flexible`. Possible values: `classic`, `flexible`.
  """
  @type schedule_details_billing_mode :: %{
          optional(:flexible) => schedule_details_billing_mode_flexible() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `proration_discounts` - Controls how invoices and invoice items display proration amounts and discount amounts. Possible values: `included`, `itemized`.
  """
  @type schedule_details_billing_mode_flexible :: %{
          optional(:proration_discounts) => String.t() | nil,
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
  @type schedule_details_phases :: %{
          optional(:add_invoice_items) => [schedule_details_phases_add_invoice_items()] | nil,
          optional(:application_fee_percent) => float() | nil,
          optional(:automatic_tax) => schedule_details_phases_automatic_tax() | nil,
          optional(:billing_cycle_anchor) => String.t() | nil,
          optional(:billing_thresholds) => map() | nil,
          optional(:collection_method) => String.t() | nil,
          optional(:currency) => String.t() | nil,
          optional(:default_payment_method) => String.t() | nil,
          optional(:default_tax_rates) => map() | nil,
          optional(:description) => map() | nil,
          optional(:discounts) => map() | nil,
          optional(:duration) => schedule_details_phases_duration() | nil,
          optional(:end_date) => map() | nil,
          optional(:invoice_settings) => schedule_details_phases_invoice_settings() | nil,
          optional(:items) => [schedule_details_phases_items()] | nil,
          optional(:metadata) => %{String.t() => String.t()} | nil,
          optional(:on_behalf_of) => String.t() | nil,
          optional(:proration_behavior) => String.t() | nil,
          optional(:start_date) => map() | nil,
          optional(:transfer_data) => schedule_details_phases_transfer_data() | nil,
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
  @type schedule_details_phases_add_invoice_items :: %{
          optional(:discounts) => [schedule_details_phases_add_invoice_items_discounts()] | nil,
          optional(:metadata) => %{String.t() => String.t()} | nil,
          optional(:period) => schedule_details_phases_add_invoice_items_period() | nil,
          optional(:price) => String.t() | nil,
          optional(:price_data) => schedule_details_phases_add_invoice_items_price_data() | nil,
          optional(:quantity) => integer() | nil,
          optional(:tax_rates) => map() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `coupon` - ID of the coupon to create a new discount for. Max length: 5000.
  * `discount` - ID of an existing discount on the object (or one of its ancestors) to reuse. Max length: 5000.
  * `promotion_code` - ID of the promotion code to create a new discount for. Max length: 5000.
  """
  @type schedule_details_phases_add_invoice_items_discounts :: %{
          optional(:coupon) => String.t() | nil,
          optional(:discount) => String.t() | nil,
          optional(:promotion_code) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `end` - End of the invoice item period.
  * `start` - Start of the invoice item period.
  """
  @type schedule_details_phases_add_invoice_items_period :: %{
          optional(:end) => schedule_details_phases_add_invoice_items_period_end() | nil,
          optional(:start) => schedule_details_phases_add_invoice_items_period_start() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `timestamp` - A precise Unix timestamp for the end of the invoice item period. Must be greater than or equal to `period.start`. Format: Unix timestamp.
  * `type` - Select how to calculate the end of the invoice item period. Possible values: `min_item_period_end`, `phase_end`, `timestamp`.
  """
  @type schedule_details_phases_add_invoice_items_period_end :: %{
          optional(:timestamp) => integer() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `timestamp` - A precise Unix timestamp for the start of the invoice item period. Must be less than or equal to `period.end`. Format: Unix timestamp.
  * `type` - Select how to calculate the start of the invoice item period. Possible values: `max_item_period_start`, `phase_start`, `timestamp`.
  """
  @type schedule_details_phases_add_invoice_items_period_start :: %{
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
  @type schedule_details_phases_add_invoice_items_price_data :: %{
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
  @type schedule_details_phases_automatic_tax :: %{
          optional(:enabled) => boolean() | nil,
          optional(:liability) => schedule_details_phases_automatic_tax_liability() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `account` - The connected account being referenced when `type` is `account`.
  * `type` - Type of the account referenced in the request. Possible values: `account`, `self`.
  """
  @type schedule_details_phases_automatic_tax_liability :: %{
          optional(:account) => String.t() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `interval` - Specifies phase duration. Either `day`, `week`, `month` or `year`. Possible values: `day`, `month`, `week`, `year`.
  * `interval_count` - The multiplier applied to the interval.
  """
  @type schedule_details_phases_duration :: %{
          optional(:interval) => String.t() | nil,
          optional(:interval_count) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `account_tax_ids` - The account tax IDs associated with this phase of the subscription schedule. Will be set on invoices generated by this phase of the subscription schedule.
  * `days_until_due` - Number of days within which a customer must pay invoices generated by this subscription schedule. This value will be `null` for subscription schedules where `billing=charge_automatically`.
  * `issuer` - The connected account that issues the invoice. The invoice is presented with the branding and support information of the specified account.
  """
  @type schedule_details_phases_invoice_settings :: %{
          optional(:account_tax_ids) => map() | nil,
          optional(:days_until_due) => integer() | nil,
          optional(:issuer) => schedule_details_phases_invoice_settings_issuer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `account` - The connected account being referenced when `type` is `account`.
  * `type` - Type of the account referenced in the request. Possible values: `account`, `self`.
  """
  @type schedule_details_phases_invoice_settings_issuer :: %{
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
  @type schedule_details_phases_items :: %{
          optional(:billing_thresholds) => map() | nil,
          optional(:discounts) => map() | nil,
          optional(:metadata) => %{String.t() => String.t()} | nil,
          optional(:plan) => String.t() | nil,
          optional(:price) => String.t() | nil,
          optional(:price_data) => schedule_details_phases_items_price_data() | nil,
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
  @type schedule_details_phases_items_price_data :: %{
          optional(:currency) => String.t() | nil,
          optional(:product) => String.t() | nil,
          optional(:recurring) => schedule_details_phases_items_price_data_recurring() | nil,
          optional(:tax_behavior) => String.t() | nil,
          optional(:unit_amount) => integer() | nil,
          optional(:unit_amount_decimal) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `interval` - Specifies billing frequency. Either `day`, `week`, `month` or `year`. Possible values: `day`, `month`, `week`, `year`.
  * `interval_count` - The number of intervals between subscription billings. For example, `interval=month` and `interval_count=3` bills every 3 months. Maximum of three years interval allowed (3 years, 36 months, or 156 weeks).
  """
  @type schedule_details_phases_items_price_data_recurring :: %{
          optional(:interval) => String.t() | nil,
          optional(:interval_count) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `amount_percent` - A non-negative decimal between 0 and 100, with at most two decimal places. This represents the percentage of the subscription invoice total that will be transferred to the destination account. By default, the entire amount is transferred to the destination.
  * `destination` - ID of an existing, connected Stripe account.
  """
  @type schedule_details_phases_transfer_data :: %{
          optional(:amount_percent) => float() | nil,
          optional(:destination) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `billing_cycle_anchor` - For new subscriptions, a future timestamp to anchor the subscription's [billing cycle](https://docs.stripe.com/subscriptions/billing-cycle). This is used to determine the date of the first full invoice, and, for plans with `month` or `year` intervals, the day of the month for subsequent invoices. For existing subscriptions, the value can only be set to `now` or `unchanged`.
  * `billing_mode` - Controls how prorations and invoices for subscriptions are calculated and orchestrated.
  * `cancel_at` - A timestamp at which the subscription should cancel. If set to a date before the current period ends, this will cause a proration if prorations have been enabled using `proration_behavior`. If set during a future period, this will always cause a proration for that period.
  * `cancel_at_period_end` - Indicate whether this subscription should cancel at the end of the current period (`current_period_end`). Defaults to `false`.
  * `cancel_now` - This simulates the subscription being canceled or expired immediately.
  * `default_tax_rates` - If provided, the invoice returned will preview updating or creating a subscription with these default tax rates. The default tax rates will apply to any line item that does not have `tax_rates` set.
  * `items` - A list of up to 20 subscription items, each with an attached price.
  * `proration_behavior` - Determines how to handle [prorations](https://docs.stripe.com/billing/subscriptions/prorations) when the billing cycle changes (e.g., when switching plans, resetting `billing_cycle_anchor=now`, or starting a trial), or if an item's `quantity` changes. The default value is `create_prorations`. Possible values: `always_invoice`, `create_prorations`, `none`.
  * `proration_date` - If previewing an update to a subscription, and doing proration, `subscription_details.proration_date` forces the proration to be calculated as though the update was done at the specified time. The time given must be within the current subscription period and within the current phase of the schedule backing this subscription, if the schedule exists. If set, `subscription`, and one of `subscription_details.items`, or `subscription_details.trial_end` are required. Also, `subscription_details.proration_behavior` cannot be set to 'none'. Format: Unix timestamp.
  * `resume_at` - For paused subscriptions, setting `subscription_details.resume_at` to `now` will preview the invoice that will be generated if the subscription is resumed. Possible values: `now`. Max length: 5000.
  * `start_date` - Date a subscription is intended to start (can be future or past). Format: Unix timestamp.
  * `trial_end` - If provided, the invoice returned will preview updating or creating a subscription with that trial end. If set, one of `subscription_details.items` or `subscription` is required.
  """
  @type subscription_details :: %{
          optional(:billing_cycle_anchor) => map() | nil,
          optional(:billing_mode) => subscription_details_billing_mode() | nil,
          optional(:cancel_at) => map() | nil,
          optional(:cancel_at_period_end) => boolean() | nil,
          optional(:cancel_now) => boolean() | nil,
          optional(:default_tax_rates) => map() | nil,
          optional(:items) => [subscription_details_items()] | nil,
          optional(:proration_behavior) => String.t() | nil,
          optional(:proration_date) => integer() | nil,
          optional(:resume_at) => String.t() | nil,
          optional(:start_date) => integer() | nil,
          optional(:trial_end) => map() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `flexible` - Configure behavior for flexible billing mode.
  * `type` - Controls the calculation and orchestration of prorations and invoices for subscriptions. If no value is passed, the default is `flexible`. Possible values: `classic`, `flexible`.
  """
  @type subscription_details_billing_mode :: %{
          optional(:flexible) => subscription_details_billing_mode_flexible() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `proration_discounts` - Controls how invoices and invoice items display proration amounts and discount amounts. Possible values: `included`, `itemized`.
  """
  @type subscription_details_billing_mode_flexible :: %{
          optional(:proration_discounts) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `billing_thresholds` - Define thresholds at which an invoice will be sent, and the subscription advanced to a new billing period. Pass an empty string to remove previously-defined thresholds.
  * `clear_usage` - Delete all usage for a given subscription item. You must pass this when deleting a usage records subscription item. `clear_usage` has no effect if the plan has a billing meter attached.
  * `deleted` - A flag that, if set to `true`, will delete the specified item.
  * `discounts` - The coupons to redeem into discounts for the subscription item.
  * `id` - Subscription item to update. Max length: 5000.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `plan` - Plan ID for this item, as a string. Max length: 5000.
  * `price` - The ID of the price object. One of `price` or `price_data` is required. When changing a subscription item's price, `quantity` is set to 1 unless a `quantity` parameter is provided. Max length: 5000.
  * `price_data` - Data used to generate a new [Price](https://docs.stripe.com/api/prices) object inline. One of `price` or `price_data` is required.
  * `quantity` - Quantity for this item.
  * `tax_rates` - A list of [Tax Rate](https://docs.stripe.com/api/tax_rates) ids. These Tax Rates will override the [`default_tax_rates`](https://docs.stripe.com/api/subscriptions/create#create_subscription-default_tax_rates) on the Subscription. When updating, pass an empty string to remove previously-defined tax rates.
  """
  @type subscription_details_items :: %{
          optional(:billing_thresholds) => map() | nil,
          optional(:clear_usage) => boolean() | nil,
          optional(:deleted) => boolean() | nil,
          optional(:discounts) => map() | nil,
          optional(:id) => String.t() | nil,
          optional(:metadata) => map() | nil,
          optional(:plan) => String.t() | nil,
          optional(:price) => String.t() | nil,
          optional(:price_data) => subscription_details_items_price_data() | nil,
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
  @type subscription_details_items_price_data :: %{
          optional(:currency) => String.t() | nil,
          optional(:product) => String.t() | nil,
          optional(:recurring) => subscription_details_items_price_data_recurring() | nil,
          optional(:tax_behavior) => String.t() | nil,
          optional(:unit_amount) => integer() | nil,
          optional(:unit_amount_decimal) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `interval` - Specifies billing frequency. Either `day`, `week`, `month` or `year`. Possible values: `day`, `month`, `week`, `year`.
  * `interval_count` - The number of intervals between subscription billings. For example, `interval=month` and `interval_count=3` bills every 3 months. Maximum of three years interval allowed (3 years, 36 months, or 156 weeks).
  """
  @type subscription_details_items_price_data_recurring :: %{
          optional(:interval) => String.t() | nil,
          optional(:interval_count) => integer() | nil,
          optional(String.t()) => term()
        }
end
