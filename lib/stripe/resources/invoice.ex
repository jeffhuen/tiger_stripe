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
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
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
          automatic_tax: __MODULE__.AutomaticTax.t(),
          automatically_finalizes_at: integer(),
          billing_reason: String.t(),
          collection_method: String.t(),
          confirmation_secret: __MODULE__.ConfirmationSecret.t() | nil,
          created: integer(),
          currency: String.t(),
          custom_fields: [__MODULE__.CustomFields.t()],
          customer: String.t() | Stripe.Resources.Customer.t(),
          customer_account: String.t(),
          customer_address: Stripe.Resources.Address.t(),
          customer_email: String.t(),
          customer_name: String.t(),
          customer_phone: String.t(),
          customer_shipping: Stripe.Resources.ShippingDetails.t(),
          customer_tax_exempt: String.t(),
          customer_tax_ids: [__MODULE__.CustomerTaxIds.t()] | nil,
          default_payment_method: String.t() | Stripe.Resources.PaymentMethod.t(),
          default_source: String.t() | Stripe.Resources.PaymentSource.t(),
          default_tax_rates: [Stripe.Resources.TaxRate.t()],
          description: String.t(),
          discounts: [String.t() | Stripe.Resources.Discount.t()],
          due_date: integer(),
          effective_at: integer(),
          ending_balance: integer(),
          footer: String.t(),
          from_invoice: __MODULE__.FromInvoice.t(),
          hosted_invoice_url: String.t() | nil,
          id: String.t() | nil,
          invoice_pdf: String.t() | nil,
          issuer: __MODULE__.Issuer.t(),
          last_finalization_error: Stripe.Resources.StripeError.t(),
          latest_revision: String.t() | Stripe.Resources.Invoice.t(),
          lines: __MODULE__.Lines.t(),
          livemode: boolean(),
          metadata: %{String.t() => String.t()},
          next_payment_attempt: integer(),
          number: String.t(),
          object: String.t(),
          on_behalf_of: String.t() | Stripe.Resources.Account.t(),
          parent: __MODULE__.Parent.t(),
          payment_settings: __MODULE__.PaymentSettings.t(),
          payments: __MODULE__.Payments.t() | nil,
          period_end: integer(),
          period_start: integer(),
          post_payment_credit_notes_amount: integer(),
          pre_payment_credit_notes_amount: integer(),
          receipt_number: String.t(),
          rendering: __MODULE__.Rendering.t(),
          shipping_cost: __MODULE__.ShippingCost.t(),
          shipping_details: Stripe.Resources.ShippingDetails.t(),
          starting_balance: integer(),
          statement_descriptor: String.t(),
          status: String.t(),
          status_transitions: __MODULE__.StatusTransitions.t(),
          subscription: String.t() | Stripe.Resources.Subscription.t() | nil,
          subtotal: integer(),
          subtotal_excluding_tax: integer(),
          test_clock: String.t() | Stripe.Resources.TestHelpers.TestClock.t(),
          threshold_reason: __MODULE__.ThresholdReason.t() | nil,
          total: integer(),
          total_discount_amounts: [__MODULE__.TotalDiscountAmounts.t()],
          total_excluding_tax: integer(),
          total_pretax_credit_amounts: [__MODULE__.TotalPretaxCreditAmounts.t()],
          total_taxes: [__MODULE__.TotalTaxes.t()],
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

  defmodule AutomaticTax do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `disabled_reason` - If Stripe disabled automatic tax, this enum describes why. Possible values: `finalization_requires_location_inputs`, `finalization_system_error`. Nullable.
    * `enabled` - Whether Stripe automatically computes tax on this invoice. Note that incompatible invoice items (invoice items with manually specified [tax rates](https://docs.stripe.com/api/tax_rates), negative amounts, or `tax_behavior=unspecified`) cannot be added to automatic tax invoices.
    * `liability` - The account that's liable for tax. If set, the business address and tax registrations required to perform the tax calculation are loaded from this account. The tax transaction is returned in the report of the connected account. Nullable.
    * `provider` - The tax provider powering automatic tax. Max length: 5000. Nullable.
    * `status` - The status of the most recent automated tax calculation for this invoice. Possible values: `complete`, `failed`, `requires_location_inputs`. Nullable.
    """
    @type t :: %__MODULE__{
            disabled_reason: String.t() | nil,
            enabled: boolean() | nil,
            liability: __MODULE__.Liability.t() | nil,
            provider: String.t() | nil,
            status: String.t() | nil
          }
    defstruct [:disabled_reason, :enabled, :liability, :provider, :status]

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

  defmodule ConfirmationSecret do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `client_secret` - The client_secret of the payment that Stripe creates for the invoice after finalization. Max length: 5000.
    * `type` - The type of client_secret. Currently this is always payment_intent, referencing the default payment_intent that Stripe creates during invoice finalization Max length: 5000.
    """
    @type t :: %__MODULE__{
            client_secret: String.t() | nil,
            type: String.t() | nil
          }
    defstruct [:client_secret, :type]
  end

  defmodule CustomFields do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `name` - The name of the custom field. Max length: 5000.
    * `value` - The value of the custom field. Max length: 5000.
    """
    @type t :: %__MODULE__{
            name: String.t() | nil,
            value: String.t() | nil
          }
    defstruct [:name, :value]
  end

  defmodule CustomerTaxIds do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `type` - The type of the tax ID, one of `ad_nrt`, `ar_cuit`, `eu_vat`, `bo_tin`, `br_cnpj`, `br_cpf`, `cn_tin`, `co_nit`, `cr_tin`, `do_rcn`, `ec_ruc`, `eu_oss_vat`, `hr_oib`, `pe_ruc`, `ro_tin`, `rs_pib`, `sv_nit`, `uy_ruc`, `ve_rif`, `vn_tin`, `gb_vat`, `nz_gst`, `au_abn`, `au_arn`, `in_gst`, `no_vat`, `no_voec`, `za_vat`, `ch_vat`, `mx_rfc`, `sg_uen`, `ru_inn`, `ru_kpp`, `ca_bn`, `hk_br`, `es_cif`, `pl_nip`, `tw_vat`, `th_vat`, `jp_cn`, `jp_rn`, `jp_trn`, `li_uid`, `li_vat`, `lk_vat`, `my_itn`, `us_ein`, `kr_brn`, `ca_qst`, `ca_gst_hst`, `ca_pst_bc`, `ca_pst_mb`, `ca_pst_sk`, `my_sst`, `sg_gst`, `ae_trn`, `cl_tin`, `sa_vat`, `id_npwp`, `my_frp`, `il_vat`, `ge_vat`, `ua_vat`, `is_vat`, `bg_uic`, `hu_tin`, `si_tin`, `ke_pin`, `tr_tin`, `eg_tin`, `ph_tin`, `al_tin`, `bh_vat`, `kz_bin`, `ng_tin`, `om_vat`, `de_stn`, `ch_uid`, `tz_vat`, `uz_vat`, `uz_tin`, `md_vat`, `ma_vat`, `by_tin`, `ao_tin`, `bs_tin`, `bb_tin`, `cd_nif`, `mr_nif`, `me_pib`, `zw_tin`, `ba_tin`, `gn_nif`, `mk_vat`, `sr_fin`, `sn_ninea`, `am_tin`, `np_pan`, `tj_tin`, `ug_tin`, `zm_tin`, `kh_tin`, `aw_tin`, `az_tin`, `bd_bin`, `bj_ifu`, `et_tin`, `kg_tin`, `la_tin`, `cm_niu`, `cv_nif`, `bf_ifu`, or `unknown` Possible values: `ad_nrt`, `ae_trn`, `al_tin`, `am_tin`, `ao_tin`, `ar_cuit`, `au_abn`, `au_arn`, `aw_tin`, `az_tin`, `ba_tin`, `bb_tin`, `bd_bin`, `bf_ifu`, `bg_uic`, `bh_vat`, `bj_ifu`, `bo_tin`, `br_cnpj`, `br_cpf`, `bs_tin`, `by_tin`, `ca_bn`, `ca_gst_hst`, `ca_pst_bc`, `ca_pst_mb`, `ca_pst_sk`, `ca_qst`, `cd_nif`, `ch_uid`, `ch_vat`, `cl_tin`, `cm_niu`, `cn_tin`, `co_nit`, `cr_tin`, `cv_nif`, `de_stn`, `do_rcn`, `ec_ruc`, `eg_tin`, `es_cif`, `et_tin`, `eu_oss_vat`, `eu_vat`, `gb_vat`, `ge_vat`, `gn_nif`, `hk_br`, `hr_oib`, `hu_tin`, `id_npwp`, `il_vat`, `in_gst`, `is_vat`, `jp_cn`, `jp_rn`, `jp_trn`, `ke_pin`, `kg_tin`, `kh_tin`, `kr_brn`, `kz_bin`, `la_tin`, `li_uid`, `li_vat`, `lk_vat`, `ma_vat`, `md_vat`, `me_pib`, `mk_vat`, `mr_nif`, `mx_rfc`, `my_frp`, `my_itn`, `my_sst`, `ng_tin`, `no_vat`, `no_voec`, `np_pan`, `nz_gst`, `om_vat`, `pe_ruc`, `ph_tin`, `pl_nip`, `ro_tin`, `rs_pib`, `ru_inn`, `ru_kpp`, `sa_vat`, `sg_gst`, `sg_uen`, `si_tin`, `sn_ninea`, `sr_fin`, `sv_nit`, `th_vat`, `tj_tin`, `tr_tin`, `tw_vat`, `tz_vat`, `ua_vat`, `ug_tin`, `unknown`, `us_ein`, `uy_ruc`, `uz_tin`, `uz_vat`, `ve_rif`, `vn_tin`, `za_vat`, `zm_tin`, `zw_tin`.
    * `value` - The value of the tax ID. Max length: 5000. Nullable.
    """
    @type t :: %__MODULE__{
            type: String.t() | nil,
            value: String.t() | nil
          }
    defstruct [:type, :value]
  end

  defmodule FromInvoice do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `action` - The relation between this invoice and the cloned invoice Max length: 5000.
    * `invoice` - The invoice that was cloned.
    """
    @type t :: %__MODULE__{
            action: String.t() | nil,
            invoice: String.t() | Stripe.Resources.Invoice.t() | nil
          }
    defstruct [:action, :invoice]
  end

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

  defmodule Lines do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `data` - Details about each object.
    * `has_more` - True if this list has another page of items after this one that can be fetched.
    * `object` - String representing the object's type. Objects of the same type share the same value. Always has the value `list`. Possible values: `list`.
    * `url` - The URL where this list can be accessed. Max length: 5000.
    """
    @type t :: %__MODULE__{
            data: [Stripe.Resources.InvoiceLineItem.t()] | nil,
            has_more: boolean() | nil,
            object: String.t() | nil,
            url: String.t() | nil
          }
    defstruct [:data, :has_more, :object, :url]
  end

  defmodule Parent do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `quote_details` - Details about the quote that generated this invoice Nullable.
    * `subscription_details` - Details about the subscription that generated this invoice Nullable.
    * `type` - The type of parent that generated this invoice Possible values: `quote_details`, `subscription_details`.
    """
    @type t :: %__MODULE__{
            quote_details: __MODULE__.QuoteDetails.t() | nil,
            subscription_details: __MODULE__.SubscriptionDetails.t() | nil,
            type: String.t() | nil
          }
    defstruct [:quote_details, :subscription_details, :type]

    defmodule QuoteDetails do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `quote` - The quote that generated this invoice Max length: 5000.
      """
      @type t :: %__MODULE__{
              quote: String.t() | nil
            }
      defstruct [:quote]
    end

    defmodule SubscriptionDetails do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) defined as subscription metadata when an invoice is created. Becomes an immutable snapshot of the subscription metadata at the time of invoice finalization.
      *Note: This attribute is populated only for invoices created on or after June 29, 2023.* Nullable.
      * `subscription` - The subscription that generated this invoice
      * `subscription_proration_date` - Only set for upcoming invoices that preview prorations. The time used to calculate prorations. Format: Unix timestamp.
      """
      @type t :: %__MODULE__{
              metadata: %{String.t() => String.t()} | nil,
              subscription: String.t() | Stripe.Resources.Subscription.t() | nil,
              subscription_proration_date: integer() | nil
            }
      defstruct [:metadata, :subscription, :subscription_proration_date]
    end

    def __inner_types__ do
      %{
        "quote_details" => __MODULE__.QuoteDetails,
        "subscription_details" => __MODULE__.SubscriptionDetails
      }
    end
  end

  defmodule PaymentSettings do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `default_mandate` - ID of the mandate to be used for this invoice. It must correspond to the payment method used to pay the invoice, including the invoice's default_payment_method or default_source, if set. Max length: 5000. Nullable.
    * `payment_method_options` - Payment-method-specific configuration to provide to the invoice’s PaymentIntent. Nullable.
    * `payment_method_types` - The list of payment method types (e.g. card) to provide to the invoice’s PaymentIntent. If not set, Stripe attempts to automatically determine the types to use by looking at the invoice’s default payment method, the subscription’s default payment method, the customer’s default payment method, and your [invoice template settings](https://dashboard.stripe.com/settings/billing/invoice). Nullable.
    """
    @type t :: %__MODULE__{
            default_mandate: String.t() | nil,
            payment_method_options: __MODULE__.PaymentMethodOptions.t() | nil,
            payment_method_types: [String.t()] | nil
          }
    defstruct [:default_mandate, :payment_method_options, :payment_method_types]

    defmodule PaymentMethodOptions do
      @moduledoc "Nested struct within the parent resource."

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
      @type t :: %__MODULE__{
              acss_debit: __MODULE__.AcssDebit.t() | nil,
              bancontact: __MODULE__.Bancontact.t() | nil,
              card: __MODULE__.Card.t() | nil,
              customer_balance: __MODULE__.CustomerBalance.t() | nil,
              konbini: map() | nil,
              payto: __MODULE__.Payto.t() | nil,
              sepa_debit: map() | nil,
              us_bank_account: __MODULE__.UsBankAccount.t() | nil
            }
      defstruct [
        :acss_debit,
        :bancontact,
        :card,
        :customer_balance,
        :konbini,
        :payto,
        :sepa_debit,
        :us_bank_account
      ]

      defmodule AcssDebit do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `mandate_options`
        * `verification_method` - Bank account verification method. Possible values: `automatic`, `instant`, `microdeposits`.
        """
        @type t :: %__MODULE__{
                mandate_options: __MODULE__.MandateOptions.t() | nil,
                verification_method: String.t() | nil
              }
        defstruct [:mandate_options, :verification_method]

        defmodule MandateOptions do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `transaction_type` - Transaction type of the mandate. Possible values: `business`, `personal`. Nullable.
          """
          @type t :: %__MODULE__{
                  transaction_type: String.t() | nil
                }
          defstruct [:transaction_type]
        end

        def __inner_types__ do
          %{
            "mandate_options" => __MODULE__.MandateOptions
          }
        end
      end

      defmodule Bancontact do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `preferred_language` - Preferred language of the Bancontact authorization page that the customer is redirected to. Possible values: `de`, `en`, `fr`, `nl`.
        """
        @type t :: %__MODULE__{
                preferred_language: String.t() | nil
              }
        defstruct [:preferred_language]
      end

      defmodule Card do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `installments`
        * `request_three_d_secure` - We strongly recommend that you rely on our SCA Engine to automatically prompt your customers for authentication based on risk level and [other requirements](https://docs.stripe.com/strong-customer-authentication). However, if you wish to request 3D Secure based on logic from your own fraud engine, provide this option. Read our guide on [manually requesting 3D Secure](https://docs.stripe.com/payments/3d-secure/authentication-flow#manual-three-ds) for more information on how this configuration interacts with Radar and our SCA Engine. Possible values: `any`, `automatic`, `challenge`. Nullable.
        """
        @type t :: %__MODULE__{
                installments: __MODULE__.Installments.t() | nil,
                request_three_d_secure: String.t() | nil
              }
        defstruct [:installments, :request_three_d_secure]

        defmodule Installments do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `enabled` - Whether Installments are enabled for this Invoice. Nullable.
          """
          @type t :: %__MODULE__{
                  enabled: boolean() | nil
                }
          defstruct [:enabled]
        end

        def __inner_types__ do
          %{
            "installments" => __MODULE__.Installments
          }
        end
      end

      defmodule CustomerBalance do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `bank_transfer`
        * `funding_type` - The funding method type to be used when there are not enough funds in the customer balance. Permitted values include: `bank_transfer`. Possible values: `bank_transfer`. Nullable.
        """
        @type t :: %__MODULE__{
                bank_transfer: __MODULE__.BankTransfer.t() | nil,
                funding_type: String.t() | nil
              }
        defstruct [:bank_transfer, :funding_type]

        defmodule BankTransfer do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `eu_bank_transfer`
          * `type` - The bank transfer type that can be used for funding. Permitted values include: `eu_bank_transfer`, `gb_bank_transfer`, `jp_bank_transfer`, `mx_bank_transfer`, or `us_bank_transfer`. Nullable.
          """
          @type t :: %__MODULE__{
                  eu_bank_transfer: __MODULE__.EuBankTransfer.t() | nil,
                  type: String.t() | nil
                }
          defstruct [:eu_bank_transfer, :type]

          defmodule EuBankTransfer do
            @moduledoc "Nested struct within the parent resource."

            @typedoc """
            * `country` - The desired country code of the bank account information. Permitted values include: `DE`, `FR`, `IE`, or `NL`. Possible values: `BE`, `DE`, `ES`, `FR`, `IE`, `NL`.
            """
            @type t :: %__MODULE__{
                    country: String.t() | nil
                  }
            defstruct [:country]
          end

          def __inner_types__ do
            %{
              "eu_bank_transfer" => __MODULE__.EuBankTransfer
            }
          end
        end

        def __inner_types__ do
          %{
            "bank_transfer" => __MODULE__.BankTransfer
          }
        end
      end

      defmodule Payto do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `mandate_options`
        """
        @type t :: %__MODULE__{
                mandate_options: __MODULE__.MandateOptions.t() | nil
              }
        defstruct [:mandate_options]

        defmodule MandateOptions do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `amount` - The maximum amount that can be collected in a single invoice. If you don't specify a maximum, then there is no limit. Nullable.
          * `amount_type` - Only `maximum` is supported. Possible values: `fixed`, `maximum`. Nullable.
          * `purpose` - The purpose for which payments are made. Has a default value based on your merchant category code. Possible values: `dependant_support`, `government`, `loan`, `mortgage`, `other`, `pension`, `personal`, `retail`, `salary`, `tax`, `utility`. Nullable.
          """
          @type t :: %__MODULE__{
                  amount: integer() | nil,
                  amount_type: String.t() | nil,
                  purpose: String.t() | nil
                }
          defstruct [:amount, :amount_type, :purpose]
        end

        def __inner_types__ do
          %{
            "mandate_options" => __MODULE__.MandateOptions
          }
        end
      end

      defmodule UsBankAccount do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `financial_connections`
        * `verification_method` - Bank account verification method. Possible values: `automatic`, `instant`, `microdeposits`.
        """
        @type t :: %__MODULE__{
                financial_connections: __MODULE__.FinancialConnections.t() | nil,
                verification_method: String.t() | nil
              }
        defstruct [:financial_connections, :verification_method]

        defmodule FinancialConnections do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `filters`
          * `permissions` - The list of permissions to request. The `payment_method` permission must be included.
          * `prefetch` - Data features requested to be retrieved upon account creation. Nullable.
          """
          @type t :: %__MODULE__{
                  filters: __MODULE__.Filters.t() | nil,
                  permissions: [String.t()] | nil,
                  prefetch: [String.t()] | nil
                }
          defstruct [:filters, :permissions, :prefetch]

          defmodule Filters do
            @moduledoc "Nested struct within the parent resource."

            @typedoc """
            * `account_subcategories` - The account subcategories to use to filter for possible accounts to link. Valid subcategories are `checking` and `savings`.
            """
            @type t :: %__MODULE__{
                    account_subcategories: [String.t()] | nil
                  }
            defstruct [:account_subcategories]
          end

          def __inner_types__ do
            %{
              "filters" => __MODULE__.Filters
            }
          end
        end

        def __inner_types__ do
          %{
            "financial_connections" => __MODULE__.FinancialConnections
          }
        end
      end

      def __inner_types__ do
        %{
          "acss_debit" => __MODULE__.AcssDebit,
          "bancontact" => __MODULE__.Bancontact,
          "card" => __MODULE__.Card,
          "customer_balance" => __MODULE__.CustomerBalance,
          "payto" => __MODULE__.Payto,
          "us_bank_account" => __MODULE__.UsBankAccount
        }
      end
    end

    def __inner_types__ do
      %{
        "payment_method_options" => __MODULE__.PaymentMethodOptions
      }
    end
  end

  defmodule Payments do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `data` - Details about each object.
    * `has_more` - True if this list has another page of items after this one that can be fetched.
    * `object` - String representing the object's type. Objects of the same type share the same value. Always has the value `list`. Possible values: `list`.
    * `url` - The URL where this list can be accessed. Max length: 5000.
    """
    @type t :: %__MODULE__{
            data: [Stripe.Resources.InvoicePayment.t()] | nil,
            has_more: boolean() | nil,
            object: String.t() | nil,
            url: String.t() | nil
          }
    defstruct [:data, :has_more, :object, :url]
  end

  defmodule Rendering do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `amount_tax_display` - How line-item prices and amounts will be displayed with respect to tax on invoice PDFs. Max length: 5000. Nullable.
    * `pdf` - Invoice pdf rendering options Nullable.
    * `template` - ID of the rendering template that the invoice is formatted by. Max length: 5000. Nullable.
    * `template_version` - Version of the rendering template that the invoice is using. Nullable.
    """
    @type t :: %__MODULE__{
            amount_tax_display: String.t() | nil,
            pdf: __MODULE__.Pdf.t() | nil,
            template: String.t() | nil,
            template_version: integer() | nil
          }
    defstruct [:amount_tax_display, :pdf, :template, :template_version]

    defmodule Pdf do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `page_size` - Page size of invoice pdf. Options include a4, letter, and auto. If set to auto, page size will be switched to a4 or letter based on customer locale. Possible values: `a4`, `auto`, `letter`. Nullable.
      """
      @type t :: %__MODULE__{
              page_size: String.t() | nil
            }
      defstruct [:page_size]
    end

    def __inner_types__ do
      %{
        "pdf" => __MODULE__.Pdf
      }
    end
  end

  defmodule ShippingCost do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `amount_subtotal` - Total shipping cost before any taxes are applied.
    * `amount_tax` - Total tax amount applied due to shipping costs. If no tax was applied, defaults to 0.
    * `amount_total` - Total shipping cost after taxes are applied.
    * `shipping_rate` - The ID of the ShippingRate for this invoice. Nullable.
    * `taxes` - The taxes applied to the shipping rate.
    """
    @type t :: %__MODULE__{
            amount_subtotal: integer() | nil,
            amount_tax: integer() | nil,
            amount_total: integer() | nil,
            shipping_rate: String.t() | Stripe.Resources.ShippingRate.t() | nil,
            taxes: [__MODULE__.Taxes.t()] | nil
          }
    defstruct [:amount_subtotal, :amount_tax, :amount_total, :shipping_rate, :taxes]

    defmodule Taxes do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `amount` - Amount of tax applied for this rate.
      * `rate`
      * `taxability_reason` - The reasoning behind this tax, for example, if the product is tax exempt. The possible values for this field may be extended as new tax rules are supported. Possible values: `customer_exempt`, `not_collecting`, `not_subject_to_tax`, `not_supported`, `portion_product_exempt`, `portion_reduced_rated`, `portion_standard_rated`, `product_exempt`, `product_exempt_holiday`, `proportionally_rated`, `reduced_rated`, `reverse_charge`, `standard_rated`, `taxable_basis_reduced`, `zero_rated`. Nullable.
      * `taxable_amount` - The amount on which tax is calculated, in cents (or local equivalent). Nullable.
      """
      @type t :: %__MODULE__{
              amount: integer() | nil,
              rate: Stripe.Resources.TaxRate.t() | nil,
              taxability_reason: String.t() | nil,
              taxable_amount: integer() | nil
            }
      defstruct [:amount, :rate, :taxability_reason, :taxable_amount]
    end

    def __inner_types__ do
      %{
        "taxes" => __MODULE__.Taxes
      }
    end
  end

  defmodule StatusTransitions do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `finalized_at` - The time that the invoice draft was finalized. Format: Unix timestamp. Nullable.
    * `marked_uncollectible_at` - The time that the invoice was marked uncollectible. Format: Unix timestamp. Nullable.
    * `paid_at` - The time that the invoice was paid. Format: Unix timestamp. Nullable.
    * `voided_at` - The time that the invoice was voided. Format: Unix timestamp. Nullable.
    """
    @type t :: %__MODULE__{
            finalized_at: integer() | nil,
            marked_uncollectible_at: integer() | nil,
            paid_at: integer() | nil,
            voided_at: integer() | nil
          }
    defstruct [:finalized_at, :marked_uncollectible_at, :paid_at, :voided_at]
  end

  defmodule ThresholdReason do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `amount_gte` - The total invoice amount threshold boundary if it triggered the threshold invoice. Nullable.
    * `item_reasons` - Indicates which line items triggered a threshold invoice.
    """
    @type t :: %__MODULE__{
            amount_gte: integer() | nil,
            item_reasons: [__MODULE__.ItemReasons.t()] | nil
          }
    defstruct [:amount_gte, :item_reasons]

    defmodule ItemReasons do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `line_item_ids` - The IDs of the line items that triggered the threshold invoice.
      * `usage_gte` - The quantity threshold boundary that applied to the given line item.
      """
      @type t :: %__MODULE__{
              line_item_ids: [String.t()] | nil,
              usage_gte: integer() | nil
            }
      defstruct [:line_item_ids, :usage_gte]
    end

    def __inner_types__ do
      %{
        "item_reasons" => __MODULE__.ItemReasons
      }
    end
  end

  defmodule TotalDiscountAmounts do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `amount` - The amount, in cents (or local equivalent), of the discount.
    * `discount` - The discount that was applied to get this discount amount.
    """
    @type t :: %__MODULE__{
            amount: integer() | nil,
            discount: String.t() | Stripe.Resources.Discount.t() | nil
          }
    defstruct [:amount, :discount]
  end

  defmodule TotalPretaxCreditAmounts do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `amount` - The amount, in cents (or local equivalent), of the pretax credit amount.
    * `credit_balance_transaction` - The credit balance transaction that was applied to get this pretax credit amount. Nullable.
    * `discount` - The discount that was applied to get this pretax credit amount.
    * `type` - Type of the pretax credit amount referenced. Possible values: `credit_balance_transaction`, `discount`.
    """
    @type t :: %__MODULE__{
            amount: integer() | nil,
            credit_balance_transaction:
              String.t() | Stripe.Resources.Billing.CreditBalanceTransaction.t() | nil,
            discount: String.t() | Stripe.Resources.Discount.t() | nil,
            type: String.t() | nil
          }
    defstruct [:amount, :credit_balance_transaction, :discount, :type]
  end

  defmodule TotalTaxes do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `amount` - The amount of the tax, in cents (or local equivalent).
    * `tax_behavior` - Whether this tax is inclusive or exclusive. Possible values: `exclusive`, `inclusive`.
    * `tax_rate_details` - Additional details about the tax rate. Only present when `type` is `tax_rate_details`. Nullable.
    * `taxability_reason` - The reasoning behind this tax, for example, if the product is tax exempt. The possible values for this field may be extended as new tax rules are supported. Possible values: `customer_exempt`, `not_available`, `not_collecting`, `not_subject_to_tax`, `not_supported`, `portion_product_exempt`, `portion_reduced_rated`, `portion_standard_rated`, `product_exempt`, `product_exempt_holiday`, `proportionally_rated`, `reduced_rated`, `reverse_charge`, `standard_rated`, `taxable_basis_reduced`, `zero_rated`.
    * `taxable_amount` - The amount on which tax is calculated, in cents (or local equivalent). Nullable.
    * `type` - The type of tax information. Possible values: `tax_rate_details`.
    """
    @type t :: %__MODULE__{
            amount: integer() | nil,
            tax_behavior: String.t() | nil,
            tax_rate_details: __MODULE__.TaxRateDetails.t() | nil,
            taxability_reason: String.t() | nil,
            taxable_amount: integer() | nil,
            type: String.t() | nil
          }
    defstruct [
      :amount,
      :tax_behavior,
      :tax_rate_details,
      :taxability_reason,
      :taxable_amount,
      :type
    ]

    defmodule TaxRateDetails do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `tax_rate` - ID of the tax rate Max length: 5000.
      """
      @type t :: %__MODULE__{
              tax_rate: String.t() | nil
            }
      defstruct [:tax_rate]
    end

    def __inner_types__ do
      %{
        "tax_rate_details" => __MODULE__.TaxRateDetails
      }
    end
  end

  def __inner_types__ do
    %{
      "automatic_tax" => __MODULE__.AutomaticTax,
      "confirmation_secret" => __MODULE__.ConfirmationSecret,
      "custom_fields" => __MODULE__.CustomFields,
      "customer_address" => Stripe.Resources.Address,
      "customer_shipping" => Stripe.Resources.ShippingDetails,
      "customer_tax_ids" => __MODULE__.CustomerTaxIds,
      "from_invoice" => __MODULE__.FromInvoice,
      "issuer" => __MODULE__.Issuer,
      "last_finalization_error" => Stripe.Resources.StripeError,
      "lines" => __MODULE__.Lines,
      "parent" => __MODULE__.Parent,
      "payment_settings" => __MODULE__.PaymentSettings,
      "payments" => __MODULE__.Payments,
      "rendering" => __MODULE__.Rendering,
      "shipping_cost" => __MODULE__.ShippingCost,
      "shipping_details" => Stripe.Resources.ShippingDetails,
      "status_transitions" => __MODULE__.StatusTransitions,
      "threshold_reason" => __MODULE__.ThresholdReason,
      "total_discount_amounts" => __MODULE__.TotalDiscountAmounts,
      "total_pretax_credit_amounts" => __MODULE__.TotalPretaxCreditAmounts,
      "total_taxes" => __MODULE__.TotalTaxes
    }
  end
end
