# File generated from our OpenAPI spec
defmodule Stripe.Resources.Tax.Calculation do
  @moduledoc """
  TaxProductResourceTaxCalculation

  A Tax Calculation allows you to calculate the tax to collect from your customer.

  Related guide: [Calculate tax in your custom payment flow](https://docs.stripe.com/tax/custom)
  """

  @typedoc """
  * `amount_total` - Total amount after taxes in the [smallest currency unit](https://docs.stripe.com/currencies#minor-units).
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Max length: 5000.
  * `customer` - The ID of an existing [Customer](https://docs.stripe.com/api/customers/object) used for the resource. Max length: 5000. Nullable.
  * `customer_details` - Expandable.
  * `expires_at` - Timestamp of date at which the tax calculation will expire. Format: Unix timestamp. Nullable.
  * `id` - Unique identifier for the calculation. Max length: 5000. Nullable.
  * `line_items` - The list of items the customer is purchasing. Nullable. Expandable.
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `tax.calculation`.
  * `ship_from_details` - The details of the ship from location, such as the address. Nullable. Expandable.
  * `shipping_cost` - The shipping cost details for the calculation. Nullable. Expandable.
  * `tax_amount_exclusive` - The amount of tax to be collected on top of the line item prices.
  * `tax_amount_inclusive` - The amount of tax already included in the line item prices.
  * `tax_breakdown` - Breakdown of individual tax amounts that add up to the total. Expandable.
  * `tax_date` - Timestamp of date at which the tax rules and rates in effect applies for the calculation. Format: Unix timestamp.
  """
  @type t :: %__MODULE__{
          amount_total: integer(),
          currency: String.t(),
          customer: String.t(),
          customer_details: customer_details(),
          expires_at: integer(),
          id: String.t(),
          line_items: line_items() | nil,
          livemode: boolean(),
          object: String.t(),
          ship_from_details: ship_from_details(),
          shipping_cost: shipping_cost(),
          tax_amount_exclusive: integer(),
          tax_amount_inclusive: integer(),
          tax_breakdown: [tax_breakdown()],
          tax_date: integer()
        }

  defstruct [
    :amount_total,
    :currency,
    :customer,
    :customer_details,
    :expires_at,
    :id,
    :line_items,
    :livemode,
    :object,
    :ship_from_details,
    :shipping_cost,
    :tax_amount_exclusive,
    :tax_amount_inclusive,
    :tax_breakdown,
    :tax_date
  ]

  @object_name "tax.calculation"
  def object_name, do: @object_name

  def expandable_fields,
    do: ["customer_details", "line_items", "ship_from_details", "shipping_cost", "tax_breakdown"]

  @typedoc """
  * `address` - The customer's postal address (for example, home or business location). Nullable.
  * `address_source` - The type of customer address provided. Possible values: `billing`, `shipping`. Nullable.
  * `ip_address` - The customer's IP address (IPv4 or IPv6). Max length: 5000. Nullable.
  * `tax_ids` - The customer's tax IDs (for example, EU VAT numbers).
  * `taxability_override` - The taxability override used for taxation. Possible values: `customer_exempt`, `none`, `reverse_charge`.
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
  * `city` - City, district, suburb, town, or village. Max length: 5000. Nullable.
  * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)). Max length: 5000.
  * `line1` - Address line 1, such as the street, PO Box, or company name. Max length: 5000. Nullable.
  * `line2` - Address line 2, such as the apartment, suite, unit, or building. Max length: 5000. Nullable.
  * `postal_code` - ZIP or postal code. Max length: 5000. Nullable.
  * `state` - State/province as an [ISO 3166-2](https://en.wikipedia.org/wiki/ISO_3166-2) subdivision code, without country prefix, such as "NY" or "TX". Max length: 5000. Nullable.
  """
  @type customer_details_address :: %{
          optional(:city) => String.t() | nil,
          optional(:country) => String.t() | nil,
          optional(:line1) => String.t() | nil,
          optional(:line2) => String.t() | nil,
          optional(:postal_code) => String.t() | nil,
          optional(:state) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - The type of the tax ID, one of `ad_nrt`, `ar_cuit`, `eu_vat`, `bo_tin`, `br_cnpj`, `br_cpf`, `cn_tin`, `co_nit`, `cr_tin`, `do_rcn`, `ec_ruc`, `eu_oss_vat`, `hr_oib`, `pe_ruc`, `ro_tin`, `rs_pib`, `sv_nit`, `uy_ruc`, `ve_rif`, `vn_tin`, `gb_vat`, `nz_gst`, `au_abn`, `au_arn`, `in_gst`, `no_vat`, `no_voec`, `za_vat`, `ch_vat`, `mx_rfc`, `sg_uen`, `ru_inn`, `ru_kpp`, `ca_bn`, `hk_br`, `es_cif`, `pl_nip`, `tw_vat`, `th_vat`, `jp_cn`, `jp_rn`, `jp_trn`, `li_uid`, `li_vat`, `lk_vat`, `my_itn`, `us_ein`, `kr_brn`, `ca_qst`, `ca_gst_hst`, `ca_pst_bc`, `ca_pst_mb`, `ca_pst_sk`, `my_sst`, `sg_gst`, `ae_trn`, `cl_tin`, `sa_vat`, `id_npwp`, `my_frp`, `il_vat`, `ge_vat`, `ua_vat`, `is_vat`, `bg_uic`, `hu_tin`, `si_tin`, `ke_pin`, `tr_tin`, `eg_tin`, `ph_tin`, `al_tin`, `bh_vat`, `kz_bin`, `ng_tin`, `om_vat`, `de_stn`, `ch_uid`, `tz_vat`, `uz_vat`, `uz_tin`, `md_vat`, `ma_vat`, `by_tin`, `ao_tin`, `bs_tin`, `bb_tin`, `cd_nif`, `mr_nif`, `me_pib`, `zw_tin`, `ba_tin`, `gn_nif`, `mk_vat`, `sr_fin`, `sn_ninea`, `am_tin`, `np_pan`, `tj_tin`, `ug_tin`, `zm_tin`, `kh_tin`, `aw_tin`, `az_tin`, `bd_bin`, `bj_ifu`, `et_tin`, `kg_tin`, `la_tin`, `cm_niu`, `cv_nif`, `bf_ifu`, or `unknown` Possible values: `ad_nrt`, `ae_trn`, `al_tin`, `am_tin`, `ao_tin`, `ar_cuit`, `au_abn`, `au_arn`, `aw_tin`, `az_tin`, `ba_tin`, `bb_tin`, `bd_bin`, `bf_ifu`, `bg_uic`, `bh_vat`, `bj_ifu`, `bo_tin`, `br_cnpj`, `br_cpf`, `bs_tin`, `by_tin`, `ca_bn`, `ca_gst_hst`, `ca_pst_bc`, `ca_pst_mb`, `ca_pst_sk`, `ca_qst`, `cd_nif`, `ch_uid`, `ch_vat`, `cl_tin`, `cm_niu`, `cn_tin`, `co_nit`, `cr_tin`, `cv_nif`, `de_stn`, `do_rcn`, `ec_ruc`, `eg_tin`, `es_cif`, `et_tin`, `eu_oss_vat`, `eu_vat`, `gb_vat`, `ge_vat`, `gn_nif`, `hk_br`, `hr_oib`, `hu_tin`, `id_npwp`, `il_vat`, `in_gst`, `is_vat`, `jp_cn`, `jp_rn`, `jp_trn`, `ke_pin`, `kg_tin`, `kh_tin`, `kr_brn`, `kz_bin`, `la_tin`, `li_uid`, `li_vat`, `lk_vat`, `ma_vat`, `md_vat`, `me_pib`, `mk_vat`, `mr_nif`, `mx_rfc`, `my_frp`, `my_itn`, `my_sst`, `ng_tin`, `no_vat`, `no_voec`, `np_pan`, `nz_gst`, `om_vat`, `pe_ruc`, `ph_tin`, `pl_nip`, `ro_tin`, `rs_pib`, `ru_inn`, `ru_kpp`, `sa_vat`, `sg_gst`, `sg_uen`, `si_tin`, `sn_ninea`, `sr_fin`, `sv_nit`, `th_vat`, `tj_tin`, `tr_tin`, `tw_vat`, `tz_vat`, `ua_vat`, `ug_tin`, `unknown`, `us_ein`, `uy_ruc`, `uz_tin`, `uz_vat`, `ve_rif`, `vn_tin`, `za_vat`, `zm_tin`, `zw_tin`.
  * `value` - The value of the tax ID. Max length: 5000.
  """
  @type customer_details_tax_ids :: %{
          optional(:type) => String.t() | nil,
          optional(:value) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `data` - Details about each object.
  * `has_more` - True if this list has another page of items after this one that can be fetched.
  * `object` - String representing the object's type. Objects of the same type share the same value. Always has the value `list`. Possible values: `list`.
  * `url` - The URL where this list can be accessed. Max length: 5000.
  """
  @type line_items :: %{
          optional(:data) => [Stripe.Resources.Tax.CalculationLineItem.t()] | nil,
          optional(:has_more) => boolean() | nil,
          optional(:object) => String.t() | nil,
          optional(:url) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `address`
  """
  @type ship_from_details :: %{
          optional(:address) => ship_from_details_address() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `city` - City, district, suburb, town, or village. Max length: 5000. Nullable.
  * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)). Max length: 5000.
  * `line1` - Address line 1, such as the street, PO Box, or company name. Max length: 5000. Nullable.
  * `line2` - Address line 2, such as the apartment, suite, unit, or building. Max length: 5000. Nullable.
  * `postal_code` - ZIP or postal code. Max length: 5000. Nullable.
  * `state` - State/province as an [ISO 3166-2](https://en.wikipedia.org/wiki/ISO_3166-2) subdivision code, without country prefix, such as "NY" or "TX". Max length: 5000. Nullable.
  """
  @type ship_from_details_address :: %{
          optional(:city) => String.t() | nil,
          optional(:country) => String.t() | nil,
          optional(:line1) => String.t() | nil,
          optional(:line2) => String.t() | nil,
          optional(:postal_code) => String.t() | nil,
          optional(:state) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `amount` - The shipping amount in the [smallest currency unit](https://docs.stripe.com/currencies#minor-units). If `tax_behavior=inclusive`, then this amount includes taxes. Otherwise, taxes were calculated on top of this amount.
  * `amount_tax` - The amount of tax calculated for shipping, in the [smallest currency unit](https://docs.stripe.com/currencies#minor-units).
  * `shipping_rate` - The ID of an existing [ShippingRate](https://docs.stripe.com/api/shipping_rates/object). Max length: 5000.
  * `tax_behavior` - Specifies whether the `amount` includes taxes. If `tax_behavior=inclusive`, then the amount includes taxes. Possible values: `exclusive`, `inclusive`.
  * `tax_breakdown` - Detailed account of taxes relevant to shipping cost.
  * `tax_code` - The [tax code](https://docs.stripe.com/tax/tax-categories) ID used for shipping. Max length: 5000.
  """
  @type shipping_cost :: %{
          optional(:amount) => integer() | nil,
          optional(:amount_tax) => integer() | nil,
          optional(:shipping_rate) => String.t() | nil,
          optional(:tax_behavior) => String.t() | nil,
          optional(:tax_breakdown) => [shipping_cost_tax_breakdown()] | nil,
          optional(:tax_code) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `amount` - The amount of tax, in the [smallest currency unit](https://docs.stripe.com/currencies#minor-units).
  * `jurisdiction`
  * `sourcing` - Indicates whether the jurisdiction was determined by the origin (merchant's address) or destination (customer's address). Possible values: `destination`, `origin`.
  * `tax_rate_details` - Details regarding the rate for this tax. This field will be `null` when the tax is not imposed, for example if the product is exempt from tax. Nullable.
  * `taxability_reason` - The reasoning behind this tax, for example, if the product is tax exempt. The possible values for this field may be extended as new tax rules are supported. Possible values: `customer_exempt`, `not_collecting`, `not_subject_to_tax`, `not_supported`, `portion_product_exempt`, `portion_reduced_rated`, `portion_standard_rated`, `product_exempt`, `product_exempt_holiday`, `proportionally_rated`, `reduced_rated`, `reverse_charge`, `standard_rated`, `taxable_basis_reduced`, `zero_rated`.
  * `taxable_amount` - The amount on which tax is calculated, in the [smallest currency unit](https://docs.stripe.com/currencies#minor-units).
  """
  @type shipping_cost_tax_breakdown :: %{
          optional(:amount) => integer() | nil,
          optional(:jurisdiction) => shipping_cost_tax_breakdown_jurisdiction() | nil,
          optional(:sourcing) => String.t() | nil,
          optional(:tax_rate_details) => shipping_cost_tax_breakdown_tax_rate_details() | nil,
          optional(:taxability_reason) => String.t() | nil,
          optional(:taxable_amount) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)). Max length: 5000.
  * `display_name` - A human-readable name for the jurisdiction imposing the tax. Max length: 5000.
  * `level` - Indicates the level of the jurisdiction imposing the tax. Possible values: `city`, `country`, `county`, `district`, `state`.
  * `state` - [ISO 3166-2 subdivision code](https://en.wikipedia.org/wiki/ISO_3166-2), without country prefix. For example, "NY" for New York, United States. Max length: 5000. Nullable.
  """
  @type shipping_cost_tax_breakdown_jurisdiction :: %{
          optional(:country) => String.t() | nil,
          optional(:display_name) => String.t() | nil,
          optional(:level) => String.t() | nil,
          optional(:state) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `display_name` - A localized display name for tax type, intended to be human-readable. For example, "Local Sales and Use Tax", "Value-added tax (VAT)", or "Umsatzsteuer (USt.)". Max length: 5000.
  * `percentage_decimal` - The tax rate percentage as a string. For example, 8.5% is represented as "8.5". Max length: 5000.
  * `tax_type` - The tax type, such as `vat` or `sales_tax`. Possible values: `amusement_tax`, `communications_tax`, `gst`, `hst`, `igst`, `jct`, `lease_tax`, `pst`, `qst`, `retail_delivery_fee`, `rst`, `sales_tax`, `service_tax`, `vat`.
  """
  @type shipping_cost_tax_breakdown_tax_rate_details :: %{
          optional(:display_name) => String.t() | nil,
          optional(:percentage_decimal) => String.t() | nil,
          optional(:tax_type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `amount` - The amount of tax, in the [smallest currency unit](https://docs.stripe.com/currencies#minor-units).
  * `inclusive` - Specifies whether the tax amount is included in the line item amount.
  * `tax_rate_details`
  * `taxability_reason` - The reasoning behind this tax, for example, if the product is tax exempt. We might extend the possible values for this field to support new tax rules. Possible values: `customer_exempt`, `not_collecting`, `not_subject_to_tax`, `not_supported`, `portion_product_exempt`, `portion_reduced_rated`, `portion_standard_rated`, `product_exempt`, `product_exempt_holiday`, `proportionally_rated`, `reduced_rated`, `reverse_charge`, `standard_rated`, `taxable_basis_reduced`, `zero_rated`.
  * `taxable_amount` - The amount on which tax is calculated, in the [smallest currency unit](https://docs.stripe.com/currencies#minor-units).
  """
  @type tax_breakdown :: %{
          optional(:amount) => integer() | nil,
          optional(:inclusive) => boolean() | nil,
          optional(:tax_rate_details) => tax_breakdown_tax_rate_details() | nil,
          optional(:taxability_reason) => String.t() | nil,
          optional(:taxable_amount) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)). Max length: 5000. Nullable.
  * `flat_amount` - The amount of the tax rate when the `rate_type` is `flat_amount`. Tax rates with `rate_type` `percentage` can vary based on the transaction, resulting in this field being `null`. This field exposes the amount and currency of the flat tax rate. Nullable.
  * `percentage_decimal` - The tax rate percentage as a string. For example, 8.5% is represented as `"8.5"`. Max length: 5000.
  * `rate_type` - Indicates the type of tax rate applied to the taxable amount. This value can be `null` when no tax applies to the location. This field is only present for TaxRates created by Stripe Tax. Possible values: `flat_amount`, `percentage`. Nullable.
  * `state` - State, county, province, or region ([ISO 3166-2](https://en.wikipedia.org/wiki/ISO_3166-2)). Max length: 5000. Nullable.
  * `tax_type` - The tax type, such as `vat` or `sales_tax`. Possible values: `amusement_tax`, `communications_tax`, `gst`, `hst`, `igst`, `jct`, `lease_tax`, `pst`, `qst`, `retail_delivery_fee`, `rst`, `sales_tax`, `service_tax`, `vat`. Nullable.
  """
  @type tax_breakdown_tax_rate_details :: %{
          optional(:country) => String.t() | nil,
          optional(:flat_amount) => Stripe.Resources.TaxRateFlatAmount.t() | nil,
          optional(:percentage_decimal) => String.t() | nil,
          optional(:rate_type) => String.t() | nil,
          optional(:state) => String.t() | nil,
          optional(:tax_type) => String.t() | nil,
          optional(String.t()) => term()
        }

  def __nested_fields__ do
    %{
      "customer_details" => %{
        fields: %{
          "address" => %{
            fields: %{
              "city" => :scalar,
              "country" => :scalar,
              "line1" => :scalar,
              "line2" => :scalar,
              "postal_code" => :scalar,
              "state" => :scalar
            }
          },
          "address_source" => :scalar,
          "ip_address" => :scalar,
          "tax_ids" =>
            {:list,
             %{
               fields: %{
                 "type" => :scalar,
                 "value" => :scalar
               }
             }},
          "taxability_override" => :scalar
        }
      },
      "line_items" => %{
        fields: %{
          "data" => {:list, {:resource, Stripe.Resources.Tax.CalculationLineItem}},
          "has_more" => :scalar,
          "object" => :scalar,
          "url" => :scalar
        }
      },
      "ship_from_details" => %{
        fields: %{
          "address" => %{
            fields: %{
              "city" => :scalar,
              "country" => :scalar,
              "line1" => :scalar,
              "line2" => :scalar,
              "postal_code" => :scalar,
              "state" => :scalar
            }
          }
        }
      },
      "shipping_cost" => %{
        fields: %{
          "amount" => :scalar,
          "amount_tax" => :scalar,
          "shipping_rate" => :scalar,
          "tax_behavior" => :scalar,
          "tax_breakdown" =>
            {:list,
             %{
               fields: %{
                 "amount" => :scalar,
                 "jurisdiction" => %{
                   fields: %{
                     "country" => :scalar,
                     "display_name" => :scalar,
                     "level" => :scalar,
                     "state" => :scalar
                   }
                 },
                 "sourcing" => :scalar,
                 "tax_rate_details" => %{
                   fields: %{
                     "display_name" => :scalar,
                     "percentage_decimal" => :scalar,
                     "tax_type" => :scalar
                   }
                 },
                 "taxability_reason" => :scalar,
                 "taxable_amount" => :scalar
               }
             }},
          "tax_code" => :scalar
        }
      },
      "tax_breakdown" => %{
        fields: %{
          "amount" => :scalar,
          "inclusive" => :scalar,
          "tax_rate_details" => %{
            fields: %{
              "country" => :scalar,
              "flat_amount" => {:resource, Stripe.Resources.TaxRateFlatAmount},
              "percentage_decimal" => :scalar,
              "rate_type" => :scalar,
              "state" => :scalar,
              "tax_type" => :scalar
            }
          },
          "taxability_reason" => :scalar,
          "taxable_amount" => :scalar
        }
      }
    }
  end
end
