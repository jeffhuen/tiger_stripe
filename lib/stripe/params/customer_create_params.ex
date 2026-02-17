# File generated from our OpenAPI spec
defmodule Stripe.Params.CustomerCreateParams do
  @moduledoc "Parameters for customer create."

  @typedoc """
  * `address` - The customer's address. Learn about [country-specific requirements for calculating tax](https://docs.stripe.com/invoicing/taxes?dashboard-or-api=dashboard#set-up-customer).
  * `balance` - An integer amount in cents (or local equivalent) that represents the customer's current balance, which affect the customer's future invoices. A negative amount represents a credit that decreases the amount due on an invoice; a positive amount increases the amount due on an invoice.
  * `business_name` - The customer's business name. This may be up to *150 characters*.
  * `cash_balance` - Balance information and default balance settings for this customer.
  * `description` - An arbitrary string that you can attach to a customer object. It is displayed alongside the customer in the dashboard. Max length: 5000.
  * `email` - Customer's email address. It's displayed alongside the customer in your dashboard and can be useful for searching and tracking. This may be up to *512 characters*. Max length: 512.
  * `expand` - Specifies which fields in the response should be expanded.
  * `individual_name` - The customer's full name. This may be up to *150 characters*.
  * `invoice_prefix` - The prefix for the customer used to generate unique invoice numbers. Must be 3–12 uppercase letters or numbers. Max length: 5000.
  * `invoice_settings` - Default invoice settings for this customer.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `name` - The customer's full name or business name. Max length: 256.
  * `next_invoice_sequence` - The sequence to be used on the customer's next invoice. Defaults to 1.
  * `payment_method` - Max length: 5000.
  * `phone` - The customer's phone number. Max length: 20.
  * `preferred_locales` - Customer's preferred languages, ordered by preference.
  * `shipping` - The customer's shipping information. Appears on invoices emailed to this customer.
  * `source` - Max length: 5000.
  * `tax` - Tax details about the customer.
  * `tax_exempt` - The customer's tax exemption. One of `none`, `exempt`, or `reverse`. Possible values: `exempt`, `none`, `reverse`.
  * `tax_id_data` - The customer's tax IDs.
  * `test_clock` - ID of the test clock to attach to the customer. Max length: 5000.
  * `validate`
  """
  @type t :: %__MODULE__{
          address: map() | nil,
          balance: integer() | nil,
          business_name: map() | nil,
          cash_balance: __MODULE__.CashBalance.t() | nil,
          description: String.t() | nil,
          email: String.t() | nil,
          expand: [String.t()] | nil,
          individual_name: map() | nil,
          invoice_prefix: String.t() | nil,
          invoice_settings: __MODULE__.InvoiceSettings.t() | nil,
          metadata: map() | nil,
          name: String.t() | nil,
          next_invoice_sequence: integer() | nil,
          payment_method: String.t() | nil,
          phone: String.t() | nil,
          preferred_locales: [String.t()] | nil,
          shipping: map() | nil,
          source: String.t() | nil,
          tax: __MODULE__.Tax.t() | nil,
          tax_exempt: String.t() | nil,
          tax_id_data: [__MODULE__.TaxIdData.t()] | nil,
          test_clock: String.t() | nil,
          validate: boolean() | nil
        }

  defstruct [
    :address,
    :balance,
    :business_name,
    :cash_balance,
    :description,
    :email,
    :expand,
    :individual_name,
    :invoice_prefix,
    :invoice_settings,
    :metadata,
    :name,
    :next_invoice_sequence,
    :payment_method,
    :phone,
    :preferred_locales,
    :shipping,
    :source,
    :tax,
    :tax_exempt,
    :tax_id_data,
    :test_clock,
    :validate
  ]

  defmodule CashBalance do
    @moduledoc "Nested parameters."

    @typedoc """
    * `settings` - Settings controlling the behavior of the customer's cash balance,
    such as reconciliation of funds received.
    """
    @type t :: %__MODULE__{
            settings: __MODULE__.Settings.t() | nil
          }
    defstruct [:settings]

    defmodule Settings do
      @moduledoc "Nested parameters."

      @typedoc """
      * `reconciliation_mode` - Controls how funds transferred by the customer are applied to payment intents and invoices. Valid options are `automatic`, `manual`, or `merchant_default`. For more information about these reconciliation modes, see [Reconciliation](https://docs.stripe.com/payments/customer-balance/reconciliation). Possible values: `automatic`, `manual`, `merchant_default`.
      """
      @type t :: %__MODULE__{
              reconciliation_mode: String.t() | nil
            }
      defstruct [:reconciliation_mode]
    end
  end

  defmodule InvoiceSettings do
    @moduledoc "Nested parameters."

    @typedoc """
    * `custom_fields` - The list of up to 4 default custom fields to be displayed on invoices for this customer. When updating, pass an empty string to remove previously-defined fields.
    * `default_payment_method` - ID of a payment method that's attached to the customer, to be used as the customer's default payment method for subscriptions and invoices. Max length: 5000.
    * `footer` - Default footer to be displayed on invoices for this customer. Max length: 5000.
    * `rendering_options` - Default options for invoice PDF rendering for this customer.
    """
    @type t :: %__MODULE__{
            custom_fields: map() | nil,
            default_payment_method: String.t() | nil,
            footer: String.t() | nil,
            rendering_options: map() | nil
          }
    defstruct [:custom_fields, :default_payment_method, :footer, :rendering_options]
  end

  defmodule Tax do
    @moduledoc "Nested parameters."

    @typedoc """
    * `ip_address` - A recent IP address of the customer used for tax reporting and tax location inference. Stripe recommends updating the IP address when a new PaymentMethod is attached or the address field on the customer is updated. We recommend against updating this field more frequently since it could result in unexpected tax location/reporting outcomes.
    * `validate_location` - A flag that indicates when Stripe should validate the customer tax location. Defaults to `deferred`. Possible values: `deferred`, `immediately`.
    """
    @type t :: %__MODULE__{
            ip_address: map() | nil,
            validate_location: String.t() | nil
          }
    defstruct [:ip_address, :validate_location]
  end

  defmodule TaxIdData do
    @moduledoc "Nested parameters."

    @typedoc """
    * `type` - Type of the tax ID, one of `ad_nrt`, `ae_trn`, `al_tin`, `am_tin`, `ao_tin`, `ar_cuit`, `au_abn`, `au_arn`, `aw_tin`, `az_tin`, `ba_tin`, `bb_tin`, `bd_bin`, `bf_ifu`, `bg_uic`, `bh_vat`, `bj_ifu`, `bo_tin`, `br_cnpj`, `br_cpf`, `bs_tin`, `by_tin`, `ca_bn`, `ca_gst_hst`, `ca_pst_bc`, `ca_pst_mb`, `ca_pst_sk`, `ca_qst`, `cd_nif`, `ch_uid`, `ch_vat`, `cl_tin`, `cm_niu`, `cn_tin`, `co_nit`, `cr_tin`, `cv_nif`, `de_stn`, `do_rcn`, `ec_ruc`, `eg_tin`, `es_cif`, `et_tin`, `eu_oss_vat`, `eu_vat`, `gb_vat`, `ge_vat`, `gn_nif`, `hk_br`, `hr_oib`, `hu_tin`, `id_npwp`, `il_vat`, `in_gst`, `is_vat`, `jp_cn`, `jp_rn`, `jp_trn`, `ke_pin`, `kg_tin`, `kh_tin`, `kr_brn`, `kz_bin`, `la_tin`, `li_uid`, `li_vat`, `ma_vat`, `md_vat`, `me_pib`, `mk_vat`, `mr_nif`, `mx_rfc`, `my_frp`, `my_itn`, `my_sst`, `ng_tin`, `no_vat`, `no_voec`, `np_pan`, `nz_gst`, `om_vat`, `pe_ruc`, `ph_tin`, `pl_nip`, `ro_tin`, `rs_pib`, `ru_inn`, `ru_kpp`, `sa_vat`, `sg_gst`, `sg_uen`, `si_tin`, `sn_ninea`, `sr_fin`, `sv_nit`, `th_vat`, `tj_tin`, `tr_tin`, `tw_vat`, `tz_vat`, `ua_vat`, `ug_tin`, `us_ein`, `uy_ruc`, `uz_tin`, `uz_vat`, `ve_rif`, `vn_tin`, `za_vat`, `zm_tin`, or `zw_tin` Possible values: `ad_nrt`, `ae_trn`, `al_tin`, `am_tin`, `ao_tin`, `ar_cuit`, `au_abn`, `au_arn`, `aw_tin`, `az_tin`, `ba_tin`, `bb_tin`, `bd_bin`, `bf_ifu`, `bg_uic`, `bh_vat`, `bj_ifu`, `bo_tin`, `br_cnpj`, `br_cpf`, `bs_tin`, `by_tin`, `ca_bn`, `ca_gst_hst`, `ca_pst_bc`, `ca_pst_mb`, `ca_pst_sk`, `ca_qst`, `cd_nif`, `ch_uid`, `ch_vat`, `cl_tin`, `cm_niu`, `cn_tin`, `co_nit`, `cr_tin`, `cv_nif`, `de_stn`, `do_rcn`, `ec_ruc`, `eg_tin`, `es_cif`, `et_tin`, `eu_oss_vat`, `eu_vat`, `gb_vat`, `ge_vat`, `gn_nif`, `hk_br`, `hr_oib`, `hu_tin`, `id_npwp`, `il_vat`, `in_gst`, `is_vat`, `jp_cn`, `jp_rn`, `jp_trn`, `ke_pin`, `kg_tin`, `kh_tin`, `kr_brn`, `kz_bin`, `la_tin`, `li_uid`, `li_vat`, `ma_vat`, `md_vat`, `me_pib`, `mk_vat`, `mr_nif`, `mx_rfc`, `my_frp`, `my_itn`, `my_sst`, `ng_tin`, `no_vat`, `no_voec`, `np_pan`, `nz_gst`, `om_vat`, `pe_ruc`, `ph_tin`, `pl_nip`, `ro_tin`, `rs_pib`, `ru_inn`, `ru_kpp`, `sa_vat`, `sg_gst`, `sg_uen`, `si_tin`, `sn_ninea`, `sr_fin`, `sv_nit`, `th_vat`, `tj_tin`, `tr_tin`, `tw_vat`, `tz_vat`, `ua_vat`, `ug_tin`, `us_ein`, `uy_ruc`, `uz_tin`, `uz_vat`, `ve_rif`, `vn_tin`, `za_vat`, `zm_tin`, `zw_tin`. Max length: 5000.
    * `value` - Value of the tax ID.
    """
    @type t :: %__MODULE__{
            type: String.t() | nil,
            value: String.t() | nil
          }
    defstruct [:type, :value]
  end
end
