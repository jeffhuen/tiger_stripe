# File generated from our OpenAPI spec
defmodule Stripe.Resources.Invoice do
  @moduledoc """
  Invoice

  Invoices are statements of amounts owed by a customer, and are either
  generated one-off, or generated periodically from a subscription.

  They contain [invoice items](https://api.stripe.com#invoiceitems), and proration adjustments
  that may be caused by subscription upgrades/downgrades (if necessary).

  If your invoice is configured to be billed through automatic charges,
  Stripe automatically finalizes your invoice and attempts payment. Note
  that finalizing the invoice,
  [when automatic](https://docs.stripe.com/invoicing/integration/automatic-advancement-collection), does
  not happen immediately as the invoice is created. Stripe waits
  until one hour after the last webhook was successfully sent (or the last
  webhook timed out after failing). If you (and the platforms you may have
  connected to) have no webhooks configured, Stripe waits one hour after
  creation to finalize the invoice.

  If your invoice is configured to be billed by sending an email, then based on your
  [email settings](https://dashboard.stripe.com/account/billing/automatic),
  Stripe will email the invoice to your customer and await payment. These
  emails can contain a link to a hosted page to pay the invoice.

  Stripe applies any customer credit on the account before determining the
  amount due for the invoice (i.e., the amount that will be actually
  charged). If the amount due for the invoice is less than Stripe's [minimum allowed charge
  per currency](https://docs.stripe.com/docs/currencies#minimum-and-maximum-charge-amounts), the
  invoice is automatically marked paid, and we add the amount due to the
  customer's credit balance which is applied to the next invoice.

  More details on the customer's credit balance are
  [here](https://docs.stripe.com/billing/customer/balance).

  Related guide: [Send invoices to customers](https://docs.stripe.com/billing/invoices/sending)
  """

  @typedoc """
  * `account_country` - The country of the business associated with this invoice, most often the business creating the invoice. Max length: 5000. Nullable.
  * `account_name` - The public name of the business associated with this invoice, most often the business creating the invoice. Max length: 5000. Nullable.
  * `account_tax_ids` - The account tax IDs associated with the invoice. Only editable when the invoice is a draft. Nullable. Expandable.
  * `amount_due` - Final amount due at this time for this invoice. If the invoice's total is smaller than the minimum charge amount, for example, or if there is account credit that can be applied to the invoice, the `amount_due` may be 0. If there is a positive `starting_balance` for the invoice (the customer owes money), the `amount_due` will also take that into account. The charge that gets generated for the invoice will be for the amount specified in `amount_due`.
  * `amount_overpaid` - Amount that was overpaid on the invoice. The amount overpaid is credited to the customer's credit balance.
  * `amount_paid` - The amount, in cents (or local equivalent), that was paid.
  * `amount_remaining` - The difference between amount_due and amount_paid, in cents (or local equivalent).
  * `amount_shipping` - This is the sum of all the shipping amounts.
  * `application` - ID of the Connect Application that created the invoice. Nullable. Expandable.
  * `attempt_count` - Number of payment attempts made for this invoice, from the perspective of the payment retry schedule. Any payment attempt counts as the first attempt, and subsequently only automatic retries increment the attempt count. In other words, manual payment attempts after the first attempt do not affect the retry schedule. If a failure is returned with a non-retryable return code, the invoice can no longer be retried unless a new payment method is obtained. Retries will continue to be scheduled, and attempt_count will continue to increment, but retries will only be executed if a new payment method is obtained.
  * `attempted` - Whether an attempt has been made to pay the invoice. An invoice is not attempted until 1 hour after the `invoice.created` webhook, for example, so you might not want to display that invoice as unpaid to your users.
  * `auto_advance` - Controls whether Stripe performs [automatic collection](https://docs.stripe.com/invoicing/integration/automatic-advancement-collection) of the invoice. If `false`, the invoice's state doesn't automatically advance without an explicit action.
  * `automatic_tax` - Expandable.
  * `automatically_finalizes_at` - The time when this invoice is currently scheduled to be automatically finalized. The field will be `null` if the invoice is not scheduled to finalize in the future. If the invoice is not in the draft state, this field will always be `null` - see `finalized_at` for the time when an already-finalized invoice was finalized. Format: Unix timestamp. Nullable.
  * `billing_reason` - Indicates the reason why the invoice was created.

  * `manual`: Unrelated to a subscription, for example, created via the invoice editor.
  * `subscription`: No longer in use. Applies to subscriptions from before May 2018 where no distinction was made between updates, cycles, and thresholds.
  * `subscription_create`: A new subscription was created.
  * `subscription_cycle`: A subscription advanced into a new period.
  * `subscription_threshold`: A subscription reached a billing threshold.
  * `subscription_update`: A subscription was updated.
  * `upcoming`: Reserved for upcoming invoices created through the Create Preview Invoice API or when an `invoice.upcoming` event is generated for an upcoming invoice on a subscription. Possible values: `automatic_pending_invoice_item_invoice`, `manual`, `quote_accept`, `subscription`, `subscription_create`, `subscription_cycle`, `subscription_threshold`, `subscription_update`, `upcoming`. Nullable.
  * `collection_method` - Either `charge_automatically`, or `send_invoice`. When charging automatically, Stripe will attempt to pay this invoice using the default source attached to the customer. When sending an invoice, Stripe will email this invoice to the customer with payment instructions. Possible values: `charge_automatically`, `send_invoice`.
  * `confirmation_secret` - The confirmation secret associated with this invoice. Currently, this contains the client_secret of the PaymentIntent that Stripe creates during invoice finalization. Nullable. Expandable.
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `custom_fields` - Custom fields displayed on the invoice. Nullable. Expandable.
  * `customer` - The ID of the customer to bill. Nullable. Expandable.
  * `customer_account` - The ID of the account representing the customer to bill. Max length: 5000. Nullable.
  * `customer_address` - The customer's address. Until the invoice is finalized, this field will equal `customer.address`. Once the invoice is finalized, this field will no longer be updated. Nullable. Expandable.
  * `customer_email` - The customer's email. Until the invoice is finalized, this field will equal `customer.email`. Once the invoice is finalized, this field will no longer be updated. Max length: 5000. Nullable.
  * `customer_name` - The customer's name. Until the invoice is finalized, this field will equal `customer.name`. Once the invoice is finalized, this field will no longer be updated. Max length: 5000. Nullable.
  * `customer_phone` - The customer's phone number. Until the invoice is finalized, this field will equal `customer.phone`. Once the invoice is finalized, this field will no longer be updated. Max length: 5000. Nullable.
  * `customer_shipping` - The customer's shipping information. Until the invoice is finalized, this field will equal `customer.shipping`. Once the invoice is finalized, this field will no longer be updated. Nullable. Expandable.
  * `customer_tax_exempt` - The customer's tax exempt status. Until the invoice is finalized, this field will equal `customer.tax_exempt`. Once the invoice is finalized, this field will no longer be updated. Possible values: `exempt`, `none`, `reverse`. Nullable.
  * `customer_tax_ids` - The customer's tax IDs. Until the invoice is finalized, this field will contain the same tax IDs as `customer.tax_ids`. Once the invoice is finalized, this field will no longer be updated. Nullable. Expandable.
  * `default_payment_method` - ID of the default payment method for the invoice. It must belong to the customer associated with the invoice. If not set, defaults to the subscription's default payment method, if any, or to the default payment method in the customer's invoice settings. Nullable. Expandable.
  * `default_source` - ID of the default payment source for the invoice. It must belong to the customer associated with the invoice and be in a chargeable state. If not set, defaults to the subscription's default source, if any, or to the customer's default source. Nullable. Expandable.
  * `default_tax_rates` - The tax rates applied to this invoice, if any. Expandable.
  * `description` - An arbitrary string attached to the object. Often useful for displaying to users. Referenced as 'memo' in the Dashboard. Max length: 5000. Nullable.
  * `discounts` - The discounts applied to the invoice. Line item discounts are applied before invoice discounts. Use `expand[]=discounts` to expand each discount. Expandable.
  * `due_date` - The date on which payment for this invoice is due. This value will be `null` for invoices where `collection_method=charge_automatically`. Format: Unix timestamp. Nullable.
  * `effective_at` - The date when this invoice is in effect. Same as `finalized_at` unless overwritten. When defined, this value replaces the system-generated 'Date of issue' printed on the invoice PDF and receipt. Format: Unix timestamp. Nullable.
  * `ending_balance` - Ending customer balance after the invoice is finalized. Invoices are finalized approximately an hour after successful webhook delivery or when payment collection is attempted for the invoice. If the invoice has not been finalized yet, this will be null. Nullable.
  * `footer` - Footer displayed on the invoice. Max length: 5000. Nullable.
  * `from_invoice` - Details of the invoice that was cloned. See the [revision documentation](https://docs.stripe.com/invoicing/invoice-revisions) for more details. Nullable. Expandable.
  * `hosted_invoice_url` - The URL for the hosted invoice page, which allows customers to view and pay an invoice. If the invoice has not been finalized yet, this will be null. Max length: 5000. Nullable.
  * `id` - Unique identifier for the object. For preview invoices created using the [create preview](https://stripe.com/docs/api/invoices/create_preview) endpoint, this id will be prefixed with `upcoming_in`. Max length: 5000.
  * `invoice_pdf` - The link to download the PDF for the invoice. If the invoice has not been finalized yet, this will be null. Max length: 5000. Nullable.
  * `issuer` - Expandable.
  * `last_finalization_error` - The error encountered during the previous attempt to finalize the invoice. This field is cleared when the invoice is successfully finalized. Nullable. Expandable.
  * `latest_revision` - The ID of the most recent non-draft revision of this invoice Nullable. Expandable.
  * `lines` - The individual line items that make up the invoice. `lines` is sorted as follows: (1) pending invoice items (including prorations) in reverse chronological order, (2) subscription items in reverse chronological order, and (3) invoice items added after invoice creation in chronological order. Expandable.
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Nullable.
  * `next_payment_attempt` - The time at which payment will next be attempted. This value will be `null` for invoices where `collection_method=send_invoice`. Format: Unix timestamp. Nullable.
  * `number` - A unique, identifying string that appears on emails sent to the customer for this invoice. This starts with the customer's unique invoice_prefix if it is specified. Max length: 5000. Nullable.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `invoice`.
  * `on_behalf_of` - The account (if any) for which the funds of the invoice payment are intended. If set, the invoice will be presented with the branding and support information of the specified account. See the [Invoices with Connect](https://docs.stripe.com/billing/invoices/connect) documentation for details. Nullable. Expandable.
  * `parent` - The parent that generated this invoice Nullable. Expandable.
  * `payment_settings` - Expandable.
  * `payments` - Payments for this invoice. Use [invoice payment](https://docs.stripe.com/api/invoice-payment) to get more details. Expandable.
  * `period_end` - End of the usage period during which invoice items were added to this invoice. This looks back one period for a subscription invoice. Use the [line item period](https://docs.stripe.com/api/invoices/line_item#invoice_line_item_object-period) to get the service period for each price. Format: Unix timestamp.
  * `period_start` - Start of the usage period during which invoice items were added to this invoice. This looks back one period for a subscription invoice. Use the [line item period](https://docs.stripe.com/api/invoices/line_item#invoice_line_item_object-period) to get the service period for each price. Format: Unix timestamp.
  * `post_payment_credit_notes_amount` - Total amount of all post-payment credit notes issued for this invoice.
  * `pre_payment_credit_notes_amount` - Total amount of all pre-payment credit notes issued for this invoice.
  * `receipt_number` - This is the transaction number that appears on email receipts sent for this invoice. Max length: 5000. Nullable.
  * `rendering` - The rendering-related settings that control how the invoice is displayed on customer-facing surfaces such as PDF and Hosted Invoice Page. Nullable. Expandable.
  * `shipping_cost` - The details of the cost of shipping, including the ShippingRate applied on the invoice. Nullable. Expandable.
  * `shipping_details` - Shipping details for the invoice. The Invoice PDF will use the `shipping_details` value if it is set, otherwise the PDF will render the shipping address from the customer. Nullable. Expandable.
  * `starting_balance` - Starting customer balance before the invoice is finalized. If the invoice has not been finalized yet, this will be the current customer balance. For revision invoices, this also includes any customer balance that was applied to the original invoice.
  * `statement_descriptor` - Extra information about an invoice for the customer's credit card statement. Max length: 5000. Nullable.
  * `status` - The status of the invoice, one of `draft`, `open`, `paid`, `uncollectible`, or `void`. [Learn more](https://docs.stripe.com/billing/invoices/workflow#workflow-overview) Possible values: `draft`, `open`, `paid`, `uncollectible`, `void`. Nullable.
  * `status_transitions` - Expandable.
  * `subscription` - Nullable. Expandable.
  * `subtotal` - Total of all subscriptions, invoice items, and prorations on the invoice before any invoice level discount or exclusive tax is applied. Item discounts are already incorporated
  * `subtotal_excluding_tax` - The integer amount in cents (or local equivalent) representing the subtotal of the invoice before any invoice level discount or tax is applied. Item discounts are already incorporated Nullable.
  * `test_clock` - ID of the test clock this invoice belongs to. Nullable. Expandable.
  * `threshold_reason` - Expandable.
  * `total` - Total after discounts and taxes.
  * `total_discount_amounts` - The aggregate amounts calculated per discount across all line items. Nullable. Expandable.
  * `total_excluding_tax` - The integer amount in cents (or local equivalent) representing the total amount of the invoice including all discounts but excluding all tax. Nullable.
  * `total_pretax_credit_amounts` - Contains pretax credit amounts (ex: discount, credit grants, etc) that apply to this invoice. This is a combined list of total_pretax_credit_amounts across all invoice line items. Nullable. Expandable.
  * `total_taxes` - The aggregate tax information of all line items. Nullable. Expandable.
  * `webhooks_delivered_at` - Invoices are automatically paid or sent 1 hour after webhooks are delivered, or until all webhook delivery attempts have [been exhausted](https://docs.stripe.com/billing/webhooks#understand). This field tracks the time when webhooks for this invoice were successfully delivered. If the invoice had no webhooks to deliver, this will be set while the invoice is being created. Format: Unix timestamp. Nullable.
  """
  @type t :: %__MODULE__{
          account_country: String.t(),
          account_name: String.t(),
          account_tax_ids: [String.t() | Stripe.Resources.TaxId.t()],
          amount_due: integer(),
          amount_overpaid: integer(),
          amount_paid: integer(),
          amount_remaining: integer(),
          amount_shipping: integer(),
          application: String.t() | Stripe.Resources.Application.t(),
          attempt_count: integer(),
          attempted: boolean(),
          auto_advance: boolean() | nil,
          automatic_tax: automatic_tax(),
          automatically_finalizes_at: integer(),
          billing_reason: String.t(),
          collection_method: String.t(),
          confirmation_secret: confirmation_secret() | nil,
          created: integer(),
          currency: String.t(),
          custom_fields: [custom_fields()],
          customer: String.t() | Stripe.Resources.Customer.t(),
          customer_account: String.t(),
          customer_address: Stripe.Resources.Address.t(),
          customer_email: String.t(),
          customer_name: String.t(),
          customer_phone: String.t(),
          customer_shipping: Stripe.Resources.ShippingDetails.t(),
          customer_tax_exempt: String.t(),
          customer_tax_ids: [customer_tax_ids()] | nil,
          default_payment_method: String.t() | Stripe.Resources.PaymentMethod.t(),
          default_source: String.t() | Stripe.Resources.PaymentSource.t(),
          default_tax_rates: [Stripe.Resources.TaxRate.t()],
          description: String.t(),
          discounts: [String.t() | Stripe.Resources.Discount.t()],
          due_date: integer(),
          effective_at: integer(),
          ending_balance: integer(),
          footer: String.t(),
          from_invoice: from_invoice(),
          hosted_invoice_url: String.t() | nil,
          id: String.t() | nil,
          invoice_pdf: String.t() | nil,
          issuer: issuer(),
          last_finalization_error: Stripe.Resources.StripeError.t(),
          latest_revision: String.t() | Stripe.Resources.Invoice.t(),
          lines: lines(),
          livemode: boolean(),
          metadata: %{String.t() => String.t()},
          next_payment_attempt: integer(),
          number: String.t(),
          object: String.t(),
          on_behalf_of: String.t() | Stripe.Resources.Account.t(),
          parent: parent(),
          payment_settings: payment_settings(),
          payments: payments() | nil,
          period_end: integer(),
          period_start: integer(),
          post_payment_credit_notes_amount: integer(),
          pre_payment_credit_notes_amount: integer(),
          receipt_number: String.t(),
          rendering: rendering(),
          shipping_cost: shipping_cost(),
          shipping_details: Stripe.Resources.ShippingDetails.t(),
          starting_balance: integer(),
          statement_descriptor: String.t(),
          status: String.t(),
          status_transitions: status_transitions(),
          subscription: String.t() | Stripe.Resources.Subscription.t() | nil,
          subtotal: integer(),
          subtotal_excluding_tax: integer(),
          test_clock: String.t() | Stripe.Resources.TestHelpers.TestClock.t(),
          threshold_reason: threshold_reason() | nil,
          total: integer(),
          total_discount_amounts: [total_discount_amounts()],
          total_excluding_tax: integer(),
          total_pretax_credit_amounts: [total_pretax_credit_amounts()],
          total_taxes: [total_taxes()],
          webhooks_delivered_at: integer()
        }

  defstruct [
    :account_country,
    :account_name,
    :account_tax_ids,
    :amount_due,
    :amount_overpaid,
    :amount_paid,
    :amount_remaining,
    :amount_shipping,
    :application,
    :attempt_count,
    :attempted,
    :auto_advance,
    :automatic_tax,
    :automatically_finalizes_at,
    :billing_reason,
    :collection_method,
    :confirmation_secret,
    :created,
    :currency,
    :custom_fields,
    :customer,
    :customer_account,
    :customer_address,
    :customer_email,
    :customer_name,
    :customer_phone,
    :customer_shipping,
    :customer_tax_exempt,
    :customer_tax_ids,
    :default_payment_method,
    :default_source,
    :default_tax_rates,
    :description,
    :discounts,
    :due_date,
    :effective_at,
    :ending_balance,
    :footer,
    :from_invoice,
    :hosted_invoice_url,
    :id,
    :invoice_pdf,
    :issuer,
    :last_finalization_error,
    :latest_revision,
    :lines,
    :livemode,
    :metadata,
    :next_payment_attempt,
    :number,
    :object,
    :on_behalf_of,
    :parent,
    :payment_settings,
    :payments,
    :period_end,
    :period_start,
    :post_payment_credit_notes_amount,
    :pre_payment_credit_notes_amount,
    :receipt_number,
    :rendering,
    :shipping_cost,
    :shipping_details,
    :starting_balance,
    :statement_descriptor,
    :status,
    :status_transitions,
    :subscription,
    :subtotal,
    :subtotal_excluding_tax,
    :test_clock,
    :threshold_reason,
    :total,
    :total_discount_amounts,
    :total_excluding_tax,
    :total_pretax_credit_amounts,
    :total_taxes,
    :webhooks_delivered_at
  ]

  @object_name "invoice"
  def object_name, do: @object_name

  def expandable_fields,
    do: [
      "account_tax_ids",
      "application",
      "automatic_tax",
      "confirmation_secret",
      "custom_fields",
      "customer",
      "customer_address",
      "customer_shipping",
      "customer_tax_ids",
      "default_payment_method",
      "default_source",
      "default_tax_rates",
      "discounts",
      "from_invoice",
      "issuer",
      "last_finalization_error",
      "latest_revision",
      "lines",
      "on_behalf_of",
      "parent",
      "payment_settings",
      "payments",
      "rendering",
      "shipping_cost",
      "shipping_details",
      "status_transitions",
      "subscription",
      "test_clock",
      "threshold_reason",
      "total_discount_amounts",
      "total_pretax_credit_amounts",
      "total_taxes"
    ]

  @typedoc """
  * `disabled_reason` - If Stripe disabled automatic tax, this enum describes why. Possible values: `finalization_requires_location_inputs`, `finalization_system_error`. Nullable.
  * `enabled` - Whether Stripe automatically computes tax on this invoice. Note that incompatible invoice items (invoice items with manually specified [tax rates](https://docs.stripe.com/api/tax_rates), negative amounts, or `tax_behavior=unspecified`) cannot be added to automatic tax invoices.
  * `liability` - The account that's liable for tax. If set, the business address and tax registrations required to perform the tax calculation are loaded from this account. The tax transaction is returned in the report of the connected account. Nullable.
  * `provider` - The tax provider powering automatic tax. Max length: 5000. Nullable.
  * `status` - The status of the most recent automated tax calculation for this invoice. Possible values: `complete`, `failed`, `requires_location_inputs`. Nullable.
  """
  @type automatic_tax :: %{
          optional(:disabled_reason) => String.t() | nil,
          optional(:enabled) => boolean() | nil,
          optional(:liability) => automatic_tax_liability() | nil,
          optional(:provider) => String.t() | nil,
          optional(:status) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `account` - The connected account being referenced when `type` is `account`.
  * `type` - Type of the account referenced. Possible values: `account`, `self`.
  """
  @type automatic_tax_liability :: %{
          optional(:account) => String.t() | Stripe.Resources.Account.t() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `client_secret` - The client_secret of the payment that Stripe creates for the invoice after finalization. Max length: 5000.
  * `type` - The type of client_secret. Currently this is always payment_intent, referencing the default payment_intent that Stripe creates during invoice finalization Max length: 5000.
  """
  @type confirmation_secret :: %{
          optional(:client_secret) => String.t() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `name` - The name of the custom field. Max length: 5000.
  * `value` - The value of the custom field. Max length: 5000.
  """
  @type custom_fields :: %{
          optional(:name) => String.t() | nil,
          optional(:value) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - The type of the tax ID, one of `ad_nrt`, `ar_cuit`, `eu_vat`, `bo_tin`, `br_cnpj`, `br_cpf`, `cn_tin`, `co_nit`, `cr_tin`, `do_rcn`, `ec_ruc`, `eu_oss_vat`, `hr_oib`, `pe_ruc`, `ro_tin`, `rs_pib`, `sv_nit`, `uy_ruc`, `ve_rif`, `vn_tin`, `gb_vat`, `nz_gst`, `au_abn`, `au_arn`, `in_gst`, `no_vat`, `no_voec`, `za_vat`, `ch_vat`, `mx_rfc`, `sg_uen`, `ru_inn`, `ru_kpp`, `ca_bn`, `hk_br`, `es_cif`, `pl_nip`, `tw_vat`, `th_vat`, `jp_cn`, `jp_rn`, `jp_trn`, `li_uid`, `li_vat`, `lk_vat`, `my_itn`, `us_ein`, `kr_brn`, `ca_qst`, `ca_gst_hst`, `ca_pst_bc`, `ca_pst_mb`, `ca_pst_sk`, `my_sst`, `sg_gst`, `ae_trn`, `cl_tin`, `sa_vat`, `id_npwp`, `my_frp`, `il_vat`, `ge_vat`, `ua_vat`, `is_vat`, `bg_uic`, `hu_tin`, `si_tin`, `ke_pin`, `tr_tin`, `eg_tin`, `ph_tin`, `al_tin`, `bh_vat`, `kz_bin`, `ng_tin`, `om_vat`, `de_stn`, `ch_uid`, `tz_vat`, `uz_vat`, `uz_tin`, `md_vat`, `ma_vat`, `by_tin`, `ao_tin`, `bs_tin`, `bb_tin`, `cd_nif`, `mr_nif`, `me_pib`, `zw_tin`, `ba_tin`, `gn_nif`, `mk_vat`, `sr_fin`, `sn_ninea`, `am_tin`, `np_pan`, `tj_tin`, `ug_tin`, `zm_tin`, `kh_tin`, `aw_tin`, `az_tin`, `bd_bin`, `bj_ifu`, `et_tin`, `kg_tin`, `la_tin`, `cm_niu`, `cv_nif`, `bf_ifu`, or `unknown` Possible values: `ad_nrt`, `ae_trn`, `al_tin`, `am_tin`, `ao_tin`, `ar_cuit`, `au_abn`, `au_arn`, `aw_tin`, `az_tin`, `ba_tin`, `bb_tin`, `bd_bin`, `bf_ifu`, `bg_uic`, `bh_vat`, `bj_ifu`, `bo_tin`, `br_cnpj`, `br_cpf`, `bs_tin`, `by_tin`, `ca_bn`, `ca_gst_hst`, `ca_pst_bc`, `ca_pst_mb`, `ca_pst_sk`, `ca_qst`, `cd_nif`, `ch_uid`, `ch_vat`, `cl_tin`, `cm_niu`, `cn_tin`, `co_nit`, `cr_tin`, `cv_nif`, `de_stn`, `do_rcn`, `ec_ruc`, `eg_tin`, `es_cif`, `et_tin`, `eu_oss_vat`, `eu_vat`, `gb_vat`, `ge_vat`, `gn_nif`, `hk_br`, `hr_oib`, `hu_tin`, `id_npwp`, `il_vat`, `in_gst`, `is_vat`, `jp_cn`, `jp_rn`, `jp_trn`, `ke_pin`, `kg_tin`, `kh_tin`, `kr_brn`, `kz_bin`, `la_tin`, `li_uid`, `li_vat`, `lk_vat`, `ma_vat`, `md_vat`, `me_pib`, `mk_vat`, `mr_nif`, `mx_rfc`, `my_frp`, `my_itn`, `my_sst`, `ng_tin`, `no_vat`, `no_voec`, `np_pan`, `nz_gst`, `om_vat`, `pe_ruc`, `ph_tin`, `pl_nip`, `ro_tin`, `rs_pib`, `ru_inn`, `ru_kpp`, `sa_vat`, `sg_gst`, `sg_uen`, `si_tin`, `sn_ninea`, `sr_fin`, `sv_nit`, `th_vat`, `tj_tin`, `tr_tin`, `tw_vat`, `tz_vat`, `ua_vat`, `ug_tin`, `unknown`, `us_ein`, `uy_ruc`, `uz_tin`, `uz_vat`, `ve_rif`, `vn_tin`, `za_vat`, `zm_tin`, `zw_tin`.
  * `value` - The value of the tax ID. Max length: 5000. Nullable.
  """
  @type customer_tax_ids :: %{
          optional(:type) => String.t() | nil,
          optional(:value) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `action` - The relation between this invoice and the cloned invoice Max length: 5000.
  * `invoice` - The invoice that was cloned.
  """
  @type from_invoice :: %{
          optional(:action) => String.t() | nil,
          optional(:invoice) => String.t() | Stripe.Resources.Invoice.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `account` - The connected account being referenced when `type` is `account`.
  * `type` - Type of the account referenced. Possible values: `account`, `self`.
  """
  @type issuer :: %{
          optional(:account) => String.t() | Stripe.Resources.Account.t() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `data` - Details about each object.
  * `has_more` - True if this list has another page of items after this one that can be fetched.
  * `object` - String representing the object's type. Objects of the same type share the same value. Always has the value `list`. Possible values: `list`.
  * `url` - The URL where this list can be accessed. Max length: 5000.
  """
  @type lines :: %{
          optional(:data) => [Stripe.Resources.InvoiceLineItem.t()] | nil,
          optional(:has_more) => boolean() | nil,
          optional(:object) => String.t() | nil,
          optional(:url) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `quote_details` - Details about the quote that generated this invoice Nullable.
  * `subscription_details` - Details about the subscription that generated this invoice Nullable.
  * `type` - The type of parent that generated this invoice Possible values: `quote_details`, `subscription_details`.
  """
  @type parent :: %{
          optional(:quote_details) => parent_quote_details() | nil,
          optional(:subscription_details) => parent_subscription_details() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `quote` - The quote that generated this invoice Max length: 5000.
  """
  @type parent_quote_details :: %{
          optional(:quote) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) defined as subscription metadata when an invoice is created. Becomes an immutable snapshot of the subscription metadata at the time of invoice finalization.
  *Note: This attribute is populated only for invoices created on or after June 29, 2023.* Nullable.
  * `subscription` - The subscription that generated this invoice
  * `subscription_proration_date` - Only set for upcoming invoices that preview prorations. The time used to calculate prorations. Format: Unix timestamp.
  """
  @type parent_subscription_details :: %{
          optional(:metadata) => %{String.t() => String.t()} | nil,
          optional(:subscription) => String.t() | Stripe.Resources.Subscription.t() | nil,
          optional(:subscription_proration_date) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `default_mandate` - ID of the mandate to be used for this invoice. It must correspond to the payment method used to pay the invoice, including the invoice's default_payment_method or default_source, if set. Max length: 5000. Nullable.
  * `payment_method_options` - Payment-method-specific configuration to provide to the invoice’s PaymentIntent. Nullable.
  * `payment_method_types` - The list of payment method types (e.g. card) to provide to the invoice’s PaymentIntent. If not set, Stripe attempts to automatically determine the types to use by looking at the invoice’s default payment method, the subscription’s default payment method, the customer’s default payment method, and your [invoice template settings](https://dashboard.stripe.com/settings/billing/invoice). Nullable.
  """
  @type payment_settings :: %{
          optional(:default_mandate) => String.t() | nil,
          optional(:payment_method_options) => payment_settings_payment_method_options() | nil,
          optional(:payment_method_types) => [String.t()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `acss_debit` - If paying by `acss_debit`, this sub-hash contains details about the Canadian pre-authorized debit payment method options to pass to the invoice’s PaymentIntent. Nullable.
  * `bancontact` - If paying by `bancontact`, this sub-hash contains details about the Bancontact payment method options to pass to the invoice’s PaymentIntent. Nullable.
  * `card` - If paying by `card`, this sub-hash contains details about the Card payment method options to pass to the invoice’s PaymentIntent. Nullable.
  * `customer_balance` - If paying by `customer_balance`, this sub-hash contains details about the Bank transfer payment method options to pass to the invoice’s PaymentIntent. Nullable.
  * `konbini` - If paying by `konbini`, this sub-hash contains details about the Konbini payment method options to pass to the invoice’s PaymentIntent. Nullable.
  * `payto` - If paying by `payto`, this sub-hash contains details about the PayTo payment method options to pass to the invoice’s PaymentIntent. Nullable.
  * `sepa_debit` - If paying by `sepa_debit`, this sub-hash contains details about the SEPA Direct Debit payment method options to pass to the invoice’s PaymentIntent. Nullable.
  * `us_bank_account` - If paying by `us_bank_account`, this sub-hash contains details about the ACH direct debit payment method options to pass to the invoice’s PaymentIntent. Nullable.
  """
  @type payment_settings_payment_method_options :: %{
          optional(:acss_debit) => payment_settings_payment_method_options_acss_debit() | nil,
          optional(:bancontact) => payment_settings_payment_method_options_bancontact() | nil,
          optional(:card) => payment_settings_payment_method_options_card() | nil,
          optional(:customer_balance) =>
            payment_settings_payment_method_options_customer_balance() | nil,
          optional(:konbini) => map() | nil,
          optional(:payto) => payment_settings_payment_method_options_payto() | nil,
          optional(:sepa_debit) => map() | nil,
          optional(:us_bank_account) =>
            payment_settings_payment_method_options_us_bank_account() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `mandate_options`
  * `verification_method` - Bank account verification method. The default value is `automatic`. Possible values: `automatic`, `instant`, `microdeposits`.
  """
  @type payment_settings_payment_method_options_acss_debit :: %{
          optional(:mandate_options) =>
            payment_settings_payment_method_options_acss_debit_mandate_options() | nil,
          optional(:verification_method) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `transaction_type` - Transaction type of the mandate. Possible values: `business`, `personal`. Nullable.
  """
  @type payment_settings_payment_method_options_acss_debit_mandate_options :: %{
          optional(:transaction_type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `preferred_language` - Preferred language of the Bancontact authorization page that the customer is redirected to. Possible values: `de`, `en`, `fr`, `nl`.
  """
  @type payment_settings_payment_method_options_bancontact :: %{
          optional(:preferred_language) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `installments`
  * `request_three_d_secure` - We strongly recommend that you rely on our SCA Engine to automatically prompt your customers for authentication based on risk level and [other requirements](https://docs.stripe.com/strong-customer-authentication). However, if you wish to request 3D Secure based on logic from your own fraud engine, provide this option. Read our guide on [manually requesting 3D Secure](https://docs.stripe.com/payments/3d-secure/authentication-flow#manual-three-ds) for more information on how this configuration interacts with Radar and our SCA Engine. Possible values: `any`, `automatic`, `challenge`. Nullable.
  """
  @type payment_settings_payment_method_options_card :: %{
          optional(:installments) =>
            payment_settings_payment_method_options_card_installments() | nil,
          optional(:request_three_d_secure) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `enabled` - Whether Installments are enabled for this Invoice. Nullable.
  """
  @type payment_settings_payment_method_options_card_installments :: %{
          optional(:enabled) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `bank_transfer`
  * `funding_type` - The funding method type to be used when there are not enough funds in the customer balance. Permitted values include: `bank_transfer`. Possible values: `bank_transfer`. Nullable.
  """
  @type payment_settings_payment_method_options_customer_balance :: %{
          optional(:bank_transfer) =>
            payment_settings_payment_method_options_customer_balance_bank_transfer() | nil,
          optional(:funding_type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `eu_bank_transfer`
  * `type` - The bank transfer type that can be used for funding. Permitted values include: `eu_bank_transfer`, `gb_bank_transfer`, `jp_bank_transfer`, `mx_bank_transfer`, or `us_bank_transfer`. Nullable.
  """
  @type payment_settings_payment_method_options_customer_balance_bank_transfer :: %{
          optional(:eu_bank_transfer) =>
            payment_settings_payment_method_options_customer_balance_bank_transfer_eu_bank_transfer()
            | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `country` - The desired country code of the bank account information. Permitted values include: `DE`, `FR`, `IE`, or `NL`. Possible values: `BE`, `DE`, `ES`, `FR`, `IE`, `NL`.
  """
  @type payment_settings_payment_method_options_customer_balance_bank_transfer_eu_bank_transfer ::
          %{
            optional(:country) => String.t() | nil,
            optional(String.t()) => term()
          }

  @typedoc """
  * `mandate_options`
  """
  @type payment_settings_payment_method_options_payto :: %{
          optional(:mandate_options) =>
            payment_settings_payment_method_options_payto_mandate_options() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `amount` - The maximum amount that can be collected in a single invoice. If you don't specify a maximum, then there is no limit. Nullable.
  * `amount_type` - Only `maximum` is supported. Possible values: `fixed`, `maximum`. Nullable.
  * `purpose` - The purpose for which payments are made. Has a default value based on your merchant category code. Possible values: `dependant_support`, `government`, `loan`, `mortgage`, `other`, `pension`, `personal`, `retail`, `salary`, `tax`, `utility`. Nullable.
  """
  @type payment_settings_payment_method_options_payto_mandate_options :: %{
          optional(:amount) => integer() | nil,
          optional(:amount_type) => String.t() | nil,
          optional(:purpose) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `financial_connections`
  * `verification_method` - Bank account verification method. The default value is `automatic`. Possible values: `automatic`, `instant`, `microdeposits`.
  """
  @type payment_settings_payment_method_options_us_bank_account :: %{
          optional(:financial_connections) =>
            payment_settings_payment_method_options_us_bank_account_financial_connections() | nil,
          optional(:verification_method) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `filters`
  * `permissions` - The list of permissions to request. The `payment_method` permission must be included.
  * `prefetch` - Data features requested to be retrieved upon account creation. Nullable.
  """
  @type payment_settings_payment_method_options_us_bank_account_financial_connections :: %{
          optional(:filters) =>
            payment_settings_payment_method_options_us_bank_account_financial_connections_filters()
            | nil,
          optional(:permissions) => [String.t()] | nil,
          optional(:prefetch) => [String.t()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `account_subcategories` - The account subcategories to use to filter for possible accounts to link. Valid subcategories are `checking` and `savings`.
  """
  @type payment_settings_payment_method_options_us_bank_account_financial_connections_filters ::
          %{
            optional(:account_subcategories) => [String.t()] | nil,
            optional(String.t()) => term()
          }

  @typedoc """
  * `data` - Details about each object.
  * `has_more` - True if this list has another page of items after this one that can be fetched.
  * `object` - String representing the object's type. Objects of the same type share the same value. Always has the value `list`. Possible values: `list`.
  * `url` - The URL where this list can be accessed. Max length: 5000.
  """
  @type payments :: %{
          optional(:data) => [Stripe.Resources.InvoicePayment.t()] | nil,
          optional(:has_more) => boolean() | nil,
          optional(:object) => String.t() | nil,
          optional(:url) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `amount_tax_display` - How line-item prices and amounts will be displayed with respect to tax on invoice PDFs. Max length: 5000. Nullable.
  * `pdf` - Invoice pdf rendering options Nullable.
  * `template` - ID of the rendering template that the invoice is formatted by. Max length: 5000. Nullable.
  * `template_version` - Version of the rendering template that the invoice is using. Nullable.
  """
  @type rendering :: %{
          optional(:amount_tax_display) => String.t() | nil,
          optional(:pdf) => rendering_pdf() | nil,
          optional(:template) => String.t() | nil,
          optional(:template_version) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `page_size` - Page size of invoice pdf. Options include a4, letter, and auto. If set to auto, page size will be switched to a4 or letter based on customer locale. Possible values: `a4`, `auto`, `letter`. Nullable.
  """
  @type rendering_pdf :: %{
          optional(:page_size) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `amount_subtotal` - Total shipping cost before any taxes are applied.
  * `amount_tax` - Total tax amount applied due to shipping costs. If no tax was applied, defaults to 0.
  * `amount_total` - Total shipping cost after taxes are applied.
  * `shipping_rate` - The ID of the ShippingRate for this invoice. Nullable.
  * `taxes` - The taxes applied to the shipping rate.
  """
  @type shipping_cost :: %{
          optional(:amount_subtotal) => integer() | nil,
          optional(:amount_tax) => integer() | nil,
          optional(:amount_total) => integer() | nil,
          optional(:shipping_rate) => String.t() | Stripe.Resources.ShippingRate.t() | nil,
          optional(:taxes) => [shipping_cost_taxes()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `amount` - Amount of tax applied for this rate.
  * `rate`
  * `taxability_reason` - The reasoning behind this tax, for example, if the product is tax exempt. The possible values for this field may be extended as new tax rules are supported. Possible values: `customer_exempt`, `not_collecting`, `not_subject_to_tax`, `not_supported`, `portion_product_exempt`, `portion_reduced_rated`, `portion_standard_rated`, `product_exempt`, `product_exempt_holiday`, `proportionally_rated`, `reduced_rated`, `reverse_charge`, `standard_rated`, `taxable_basis_reduced`, `zero_rated`. Nullable.
  * `taxable_amount` - The amount on which tax is calculated, in cents (or local equivalent). Nullable.
  """
  @type shipping_cost_taxes :: %{
          optional(:amount) => integer() | nil,
          optional(:rate) => Stripe.Resources.TaxRate.t() | nil,
          optional(:taxability_reason) => String.t() | nil,
          optional(:taxable_amount) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `finalized_at` - The time that the invoice draft was finalized. Format: Unix timestamp. Nullable.
  * `marked_uncollectible_at` - The time that the invoice was marked uncollectible. Format: Unix timestamp. Nullable.
  * `paid_at` - The time that the invoice was paid. Format: Unix timestamp. Nullable.
  * `voided_at` - The time that the invoice was voided. Format: Unix timestamp. Nullable.
  """
  @type status_transitions :: %{
          optional(:finalized_at) => integer() | nil,
          optional(:marked_uncollectible_at) => integer() | nil,
          optional(:paid_at) => integer() | nil,
          optional(:voided_at) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `amount_gte` - The total invoice amount threshold boundary if it triggered the threshold invoice. Nullable.
  * `item_reasons` - Indicates which line items triggered a threshold invoice.
  """
  @type threshold_reason :: %{
          optional(:amount_gte) => integer() | nil,
          optional(:item_reasons) => [threshold_reason_item_reasons()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `line_item_ids` - The IDs of the line items that triggered the threshold invoice.
  * `usage_gte` - The quantity threshold boundary that applied to the given line item.
  """
  @type threshold_reason_item_reasons :: %{
          optional(:line_item_ids) => [String.t()] | nil,
          optional(:usage_gte) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `amount` - The amount, in cents (or local equivalent), of the discount.
  * `discount` - The discount that was applied to get this discount amount.
  """
  @type total_discount_amounts :: %{
          optional(:amount) => integer() | nil,
          optional(:discount) => String.t() | Stripe.Resources.Discount.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `amount` - The amount, in cents (or local equivalent), of the pretax credit amount.
  * `credit_balance_transaction` - The credit balance transaction that was applied to get this pretax credit amount. Nullable.
  * `discount` - The discount that was applied to get this pretax credit amount.
  * `type` - Type of the pretax credit amount referenced. Possible values: `credit_balance_transaction`, `discount`.
  """
  @type total_pretax_credit_amounts :: %{
          optional(:amount) => integer() | nil,
          optional(:credit_balance_transaction) =>
            String.t() | Stripe.Resources.Billing.CreditBalanceTransaction.t() | nil,
          optional(:discount) => String.t() | Stripe.Resources.Discount.t() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `amount` - The amount of the tax, in cents (or local equivalent).
  * `tax_behavior` - Whether this tax is inclusive or exclusive. Possible values: `exclusive`, `inclusive`.
  * `tax_rate_details` - Additional details about the tax rate. Only present when `type` is `tax_rate_details`. Nullable.
  * `taxability_reason` - The reasoning behind this tax, for example, if the product is tax exempt. The possible values for this field may be extended as new tax rules are supported. Possible values: `customer_exempt`, `not_available`, `not_collecting`, `not_subject_to_tax`, `not_supported`, `portion_product_exempt`, `portion_reduced_rated`, `portion_standard_rated`, `product_exempt`, `product_exempt_holiday`, `proportionally_rated`, `reduced_rated`, `reverse_charge`, `standard_rated`, `taxable_basis_reduced`, `zero_rated`.
  * `taxable_amount` - The amount on which tax is calculated, in cents (or local equivalent). Nullable.
  * `type` - The type of tax information. Possible values: `tax_rate_details`.
  """
  @type total_taxes :: %{
          optional(:amount) => integer() | nil,
          optional(:tax_behavior) => String.t() | nil,
          optional(:tax_rate_details) => total_taxes_tax_rate_details() | nil,
          optional(:taxability_reason) => String.t() | nil,
          optional(:taxable_amount) => integer() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `tax_rate` - ID of the tax rate Max length: 5000.
  """
  @type total_taxes_tax_rate_details :: %{
          optional(:tax_rate) => String.t() | nil,
          optional(String.t()) => term()
        }

  def __nested_fields__ do
    %{
      "automatic_tax" => %{
        fields: %{
          "disabled_reason" => :scalar,
          "enabled" => :scalar,
          "liability" => %{
            fields: %{
              "account" => {:resource, Stripe.Resources.Account},
              "type" => :scalar
            }
          },
          "provider" => :scalar,
          "status" => :scalar
        }
      },
      "confirmation_secret" => %{
        fields: %{
          "client_secret" => :scalar,
          "type" => :scalar
        }
      },
      "custom_fields" => %{
        fields: %{
          "name" => :scalar,
          "value" => :scalar
        }
      },
      "customer_tax_ids" => %{
        fields: %{
          "type" => :scalar,
          "value" => :scalar
        }
      },
      "from_invoice" => %{
        fields: %{
          "action" => :scalar,
          "invoice" => {:resource, Stripe.Resources.Invoice}
        }
      },
      "issuer" => %{
        fields: %{
          "account" => {:resource, Stripe.Resources.Account},
          "type" => :scalar
        }
      },
      "lines" => %{
        fields: %{
          "data" => {:list, {:resource, Stripe.Resources.InvoiceLineItem}},
          "has_more" => :scalar,
          "object" => :scalar,
          "url" => :scalar
        }
      },
      "parent" => %{
        fields: %{
          "quote_details" => %{
            fields: %{
              "quote" => :scalar
            }
          },
          "subscription_details" => %{
            fields: %{
              "metadata" => {:map, :scalar},
              "subscription" => {:resource, Stripe.Resources.Subscription},
              "subscription_proration_date" => :scalar
            }
          },
          "type" => :scalar
        }
      },
      "payment_settings" => %{
        fields: %{
          "default_mandate" => :scalar,
          "payment_method_options" => %{
            fields: %{
              "acss_debit" => %{
                fields: %{
                  "mandate_options" => %{
                    fields: %{
                      "transaction_type" => :scalar
                    }
                  },
                  "verification_method" => :scalar
                }
              },
              "bancontact" => %{
                fields: %{
                  "preferred_language" => :scalar
                }
              },
              "card" => %{
                fields: %{
                  "installments" => %{
                    fields: %{
                      "enabled" => :scalar
                    }
                  },
                  "request_three_d_secure" => :scalar
                }
              },
              "customer_balance" => %{
                fields: %{
                  "bank_transfer" => %{
                    fields: %{
                      "eu_bank_transfer" => %{
                        fields: %{
                          "country" => :scalar
                        }
                      },
                      "type" => :scalar
                    }
                  },
                  "funding_type" => :scalar
                }
              },
              "konbini" => :scalar,
              "payto" => %{
                fields: %{
                  "mandate_options" => %{
                    fields: %{
                      "amount" => :scalar,
                      "amount_type" => :scalar,
                      "purpose" => :scalar
                    }
                  }
                }
              },
              "sepa_debit" => :scalar,
              "us_bank_account" => %{
                fields: %{
                  "financial_connections" => %{
                    fields: %{
                      "filters" => %{
                        fields: %{
                          "account_subcategories" => {:list, :scalar}
                        }
                      },
                      "permissions" => {:list, :scalar},
                      "prefetch" => {:list, :scalar}
                    }
                  },
                  "verification_method" => :scalar
                }
              }
            }
          },
          "payment_method_types" => {:list, :scalar}
        }
      },
      "payments" => %{
        fields: %{
          "data" => {:list, {:resource, Stripe.Resources.InvoicePayment}},
          "has_more" => :scalar,
          "object" => :scalar,
          "url" => :scalar
        }
      },
      "rendering" => %{
        fields: %{
          "amount_tax_display" => :scalar,
          "pdf" => %{
            fields: %{
              "page_size" => :scalar
            }
          },
          "template" => :scalar,
          "template_version" => :scalar
        }
      },
      "shipping_cost" => %{
        fields: %{
          "amount_subtotal" => :scalar,
          "amount_tax" => :scalar,
          "amount_total" => :scalar,
          "shipping_rate" => {:resource, Stripe.Resources.ShippingRate},
          "taxes" =>
            {:list,
             %{
               fields: %{
                 "amount" => :scalar,
                 "rate" => {:resource, Stripe.Resources.TaxRate},
                 "taxability_reason" => :scalar,
                 "taxable_amount" => :scalar
               }
             }}
        }
      },
      "status_transitions" => %{
        fields: %{
          "finalized_at" => :scalar,
          "marked_uncollectible_at" => :scalar,
          "paid_at" => :scalar,
          "voided_at" => :scalar
        }
      },
      "threshold_reason" => %{
        fields: %{
          "amount_gte" => :scalar,
          "item_reasons" =>
            {:list,
             %{
               fields: %{
                 "line_item_ids" => {:list, :scalar},
                 "usage_gte" => :scalar
               }
             }}
        }
      },
      "total_discount_amounts" => %{
        fields: %{
          "amount" => :scalar,
          "discount" => {:resource, Stripe.Resources.Discount}
        }
      },
      "total_pretax_credit_amounts" => %{
        fields: %{
          "amount" => :scalar,
          "credit_balance_transaction" =>
            {:resource, Stripe.Resources.Billing.CreditBalanceTransaction},
          "discount" => {:resource, Stripe.Resources.Discount},
          "type" => :scalar
        }
      },
      "total_taxes" => %{
        fields: %{
          "amount" => :scalar,
          "tax_behavior" => :scalar,
          "tax_rate_details" => %{
            fields: %{
              "tax_rate" => :scalar
            }
          },
          "taxability_reason" => :scalar,
          "taxable_amount" => :scalar,
          "type" => :scalar
        }
      },
      "customer_address" => {:resource, Stripe.Resources.Address},
      "customer_shipping" => {:resource, Stripe.Resources.ShippingDetails},
      "last_finalization_error" => {:resource, Stripe.Resources.StripeError},
      "shipping_details" => {:resource, Stripe.Resources.ShippingDetails}
    }
  end
end
