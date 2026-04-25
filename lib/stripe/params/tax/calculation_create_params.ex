# File generated from our OpenAPI spec
defmodule Stripe.Params.Tax.CalculationCreateParams do
  @moduledoc "Parameters for calculation create."

  @typedoc """
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `customer` - The ID of an existing customer to use for this calculation. If provided, the customer's address and tax IDs are copied to `customer_details`. Max length: 5000.
  * `customer_details` - Details about the customer, including address and tax IDs.
  * `expand` - Specifies which fields in the response should be expanded.
  * `line_items` - A list of items the customer is purchasing.
  * `ship_from_details` - Details about the address from which the goods are being shipped.
  * `shipping_cost` - Shipping cost details to be used for the calculation.
  * `tax_date` - Timestamp of date at which the tax rules and rates in effect applies for the calculation. Measured in seconds since the Unix epoch. Can be up to 48 hours in the past, and up to 48 hours in the future.
  """
  @type t :: %__MODULE__{
          currency: String.t(),
          customer: String.t() | nil,
          customer_details: customer_details() | nil,
          expand: [String.t()] | nil,
          line_items: [line_items()],
          ship_from_details: ship_from_details() | nil,
          shipping_cost: shipping_cost() | nil,
          tax_date: integer() | nil
        }

  defstruct [
    :currency,
    :customer,
    :customer_details,
    :expand,
    :line_items,
    :ship_from_details,
    :shipping_cost,
    :tax_date
  ]

  @typedoc """
  * `address` - The customer's postal address (for example, home or business location).
  * `address_source` - The type of customer address provided. Possible values: `billing`, `shipping`.
  * `ip_address` - The customer's IP address (IPv4 or IPv6).
  * `tax_ids` - The customer's tax IDs. Stripe Tax might consider a transaction with applicable tax IDs to be B2B, which might affect the tax calculation result. Stripe Tax doesn't validate tax IDs for correctness.
  * `taxability_override` - Overrides the tax calculation result to allow you to not collect tax from your customer. Use this if you've manually checked your customer's tax exemptions. Prefer providing the customer's `tax_ids` where possible, which automatically determines whether `reverse_charge` applies. Possible values: `customer_exempt`, `none`, `reverse_charge`.
  """
  @type customer_details :: %{
          optional(:address) => customer_details_address() | nil,
          optional(:address_source) => String.t() | nil,
          optional(:ip_address) => String.t() | nil,
          optional(:tax_ids) => [customer_details_tax_ids()] | nil,
          optional(:taxability_override) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `city` - City, district, suburb, town, or village.
  * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)). Max length: 5000.
  * `line1` - Address line 1, such as the street, PO Box, or company name.
  * `line2` - Address line 2, such as the apartment, suite, unit, or building.
  * `postal_code` - ZIP or postal code.
  * `state` - State, county, province, or region. We recommend sending [ISO 3166-2](https://en.wikipedia.org/wiki/ISO_3166-2) subdivision code value when possible.
  """
  @type customer_details_address :: %{
          optional(:city) => map() | nil,
          optional(:country) => String.t() | nil,
          optional(:line1) => map() | nil,
          optional(:line2) => map() | nil,
          optional(:postal_code) => map() | nil,
          optional(:state) => map() | nil,
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
  * `amount` - A positive integer representing the line item's total price in the [smallest currency unit](https://docs.stripe.com/currencies#zero-decimal).
  If `tax_behavior=inclusive`, then this amount includes taxes. Otherwise, taxes are calculated on top of this amount.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
  * `product` - If provided, the product's `tax_code` will be used as the line item's `tax_code`. Max length: 5000.
  * `quantity` - The number of units of the item being purchased. Used to calculate the per-unit price from the total `amount` for the line. For example, if `amount=100` and `quantity=4`, the calculated unit price is 25.
  * `reference` - A custom identifier for this line item, which must be unique across the line items in the calculation. The reference helps identify each line item in exported [tax reports](https://docs.stripe.com/tax/reports). Max length: 500.
  * `tax_behavior` - Specifies whether the `amount` includes taxes. Defaults to `exclusive`. Possible values: `exclusive`, `inclusive`.
  * `tax_code` - A [tax code](https://docs.stripe.com/tax/tax-categories) ID to use for this line item. If not provided, we will use the tax code from the provided `product` param. If neither `tax_code` nor `product` is provided, we will use the default tax code from your Tax Settings.
  """
  @type line_items :: %{
          optional(:amount) => integer() | nil,
          optional(:metadata) => %{String.t() => String.t()} | nil,
          optional(:product) => String.t() | nil,
          optional(:quantity) => integer() | nil,
          optional(:reference) => String.t() | nil,
          optional(:tax_behavior) => String.t() | nil,
          optional(:tax_code) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `address` - The address from which the goods are being shipped from.
  """
  @type ship_from_details :: %{
          optional(:address) => ship_from_details_address() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `city` - City, district, suburb, town, or village.
  * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)). Max length: 5000.
  * `line1` - Address line 1, such as the street, PO Box, or company name.
  * `line2` - Address line 2, such as the apartment, suite, unit, or building.
  * `postal_code` - ZIP or postal code.
  * `state` - State/province as an [ISO 3166-2](https://en.wikipedia.org/wiki/ISO_3166-2) subdivision code, without country prefix, such as "NY" or "TX".
  """
  @type ship_from_details_address :: %{
          optional(:city) => map() | nil,
          optional(:country) => String.t() | nil,
          optional(:line1) => map() | nil,
          optional(:line2) => map() | nil,
          optional(:postal_code) => map() | nil,
          optional(:state) => map() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `amount` - A positive integer in the [smallest currency unit](https://docs.stripe.com/currencies#zero-decimal) representing the shipping charge. If `tax_behavior=inclusive`, then this amount includes taxes. Otherwise, taxes are calculated on top of this amount.
  * `shipping_rate` - If provided, the [shipping rate](https://docs.stripe.com/api/shipping_rates/object)'s `amount`, `tax_code` and `tax_behavior` are used. If you provide a shipping rate, then you cannot pass the `amount`, `tax_code`, or `tax_behavior` parameters. Max length: 5000.
  * `tax_behavior` - Specifies whether the `amount` includes taxes. If `tax_behavior=inclusive`, then the amount includes taxes. Defaults to `exclusive`. Possible values: `exclusive`, `inclusive`.
  * `tax_code` - The [tax code](https://docs.stripe.com/tax/tax-categories) used to calculate tax on shipping. If not provided, the default shipping tax code from your [Tax Settings](https://dashboard.stripe.com/settings/tax) is used.
  """
  @type shipping_cost :: %{
          optional(:amount) => integer() | nil,
          optional(:shipping_rate) => String.t() | nil,
          optional(:tax_behavior) => String.t() | nil,
          optional(:tax_code) => String.t() | nil,
          optional(String.t()) => term()
        }
end
