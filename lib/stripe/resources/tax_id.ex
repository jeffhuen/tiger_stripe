# File generated from our OpenAPI spec
defmodule Stripe.Resources.TaxId do
  @moduledoc """
  tax_id

  You can add one or multiple tax IDs to a [customer](https://docs.stripe.com/api/customers) or account.
  Customer and account tax IDs get displayed on related invoices and credit notes.

  Related guides: [Customer tax identification numbers](https://docs.stripe.com/billing/taxes/tax-ids), [Account tax IDs](https://docs.stripe.com/invoicing/connect#account-tax-ids)
  """

  @typedoc """
  * `country` - Two-letter ISO code representing the country of the tax ID. Max length: 5000. Nullable.
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `customer` - ID of the customer. Nullable. Expandable.
  * `customer_account` - ID of the Account representing the customer. Max length: 5000. Nullable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `tax_id`.
  * `owner` - The account or customer the tax ID belongs to. Nullable. Expandable.
  * `type` - Type of the tax ID, one of `ad_nrt`, `ae_trn`, `al_tin`, `am_tin`, `ao_tin`, `ar_cuit`, `au_abn`, `au_arn`, `aw_tin`, `az_tin`, `ba_tin`, `bb_tin`, `bd_bin`, `bf_ifu`, `bg_uic`, `bh_vat`, `bj_ifu`, `bo_tin`, `br_cnpj`, `br_cpf`, `bs_tin`, `by_tin`, `ca_bn`, `ca_gst_hst`, `ca_pst_bc`, `ca_pst_mb`, `ca_pst_sk`, `ca_qst`, `cd_nif`, `ch_uid`, `ch_vat`, `cl_tin`, `cm_niu`, `cn_tin`, `co_nit`, `cr_tin`, `cv_nif`, `de_stn`, `do_rcn`, `ec_ruc`, `eg_tin`, `es_cif`, `et_tin`, `eu_oss_vat`, `eu_vat`, `gb_vat`, `ge_vat`, `gn_nif`, `hk_br`, `hr_oib`, `hu_tin`, `id_npwp`, `il_vat`, `in_gst`, `is_vat`, `jp_cn`, `jp_rn`, `jp_trn`, `ke_pin`, `kg_tin`, `kh_tin`, `kr_brn`, `kz_bin`, `la_tin`, `li_uid`, `li_vat`, `ma_vat`, `md_vat`, `me_pib`, `mk_vat`, `mr_nif`, `mx_rfc`, `my_frp`, `my_itn`, `my_sst`, `ng_tin`, `no_vat`, `no_voec`, `np_pan`, `nz_gst`, `om_vat`, `pe_ruc`, `ph_tin`, `pl_nip`, `ro_tin`, `rs_pib`, `ru_inn`, `ru_kpp`, `sa_vat`, `sg_gst`, `sg_uen`, `si_tin`, `sn_ninea`, `sr_fin`, `sv_nit`, `th_vat`, `tj_tin`, `tr_tin`, `tw_vat`, `tz_vat`, `ua_vat`, `ug_tin`, `us_ein`, `uy_ruc`, `uz_tin`, `uz_vat`, `ve_rif`, `vn_tin`, `za_vat`, `zm_tin`, or `zw_tin`. Note that some legacy tax IDs have type `unknown` Possible values: `ad_nrt`, `ae_trn`, `al_tin`, `am_tin`, `ao_tin`, `ar_cuit`, `au_abn`, `au_arn`, `aw_tin`, `az_tin`, `ba_tin`, `bb_tin`, `bd_bin`, `bf_ifu`, `bg_uic`, `bh_vat`, `bj_ifu`, `bo_tin`, `br_cnpj`, `br_cpf`, `bs_tin`, `by_tin`, `ca_bn`, `ca_gst_hst`, `ca_pst_bc`, `ca_pst_mb`, `ca_pst_sk`, `ca_qst`, `cd_nif`, `ch_uid`, `ch_vat`, `cl_tin`, `cm_niu`, `cn_tin`, `co_nit`, `cr_tin`, `cv_nif`, `de_stn`, `do_rcn`, `ec_ruc`, `eg_tin`, `es_cif`, `et_tin`, `eu_oss_vat`, `eu_vat`, `gb_vat`, `ge_vat`, `gn_nif`, `hk_br`, `hr_oib`, `hu_tin`, `id_npwp`, `il_vat`, `in_gst`, `is_vat`, `jp_cn`, `jp_rn`, `jp_trn`, `ke_pin`, `kg_tin`, `kh_tin`, `kr_brn`, `kz_bin`, `la_tin`, `li_uid`, `li_vat`, `ma_vat`, `md_vat`, `me_pib`, `mk_vat`, `mr_nif`, `mx_rfc`, `my_frp`, `my_itn`, `my_sst`, `ng_tin`, `no_vat`, `no_voec`, `np_pan`, `nz_gst`, `om_vat`, `pe_ruc`, `ph_tin`, `pl_nip`, `ro_tin`, `rs_pib`, `ru_inn`, `ru_kpp`, `sa_vat`, `sg_gst`, `sg_uen`, `si_tin`, `sn_ninea`, `sr_fin`, `sv_nit`, `th_vat`, `tj_tin`, `tr_tin`, `tw_vat`, `tz_vat`, `ua_vat`, `ug_tin`, `unknown`, `us_ein`, `uy_ruc`, `uz_tin`, `uz_vat`, `ve_rif`, `vn_tin`, `za_vat`, `zm_tin`, `zw_tin`.
  * `value` - Value of the tax ID. Max length: 5000.
  * `verification` - Tax ID verification information. Nullable. Expandable.
  """
  @type t :: %__MODULE__{
          country: String.t(),
          created: integer(),
          customer: String.t() | Stripe.Resources.Customer.t(),
          customer_account: String.t(),
          id: String.t(),
          livemode: boolean(),
          object: String.t(),
          owner: owner(),
          type: String.t(),
          value: String.t(),
          verification: verification()
        }

  defstruct [
    :country,
    :created,
    :customer,
    :customer_account,
    :id,
    :livemode,
    :object,
    :owner,
    :type,
    :value,
    :verification
  ]

  @object_name "tax_id"
  def object_name, do: @object_name

  def expandable_fields, do: ["customer", "owner", "verification"]

  @typedoc """
  * `account` - The account being referenced when `type` is `account`.
  * `application` - The Connect Application being referenced when `type` is `application`.
  * `customer` - The customer being referenced when `type` is `customer`.
  * `customer_account` - The Account representing the customer being referenced when `type` is `customer`. Max length: 5000. Nullable.
  * `type` - Type of owner referenced. Possible values: `account`, `application`, `customer`, `self`.
  """
  @type owner :: %{
          optional(:account) => String.t() | Stripe.Resources.Account.t() | nil,
          optional(:application) => String.t() | Stripe.Resources.Application.t() | nil,
          optional(:customer) => String.t() | Stripe.Resources.Customer.t() | nil,
          optional(:customer_account) => String.t() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `status` - Verification status, one of `pending`, `verified`, `unverified`, or `unavailable`. Possible values: `pending`, `unavailable`, `unverified`, `verified`.
  * `verified_address` - Verified address. Max length: 5000. Nullable.
  * `verified_name` - Verified name. Max length: 5000. Nullable.
  """
  @type verification :: %{
          optional(:status) => String.t() | nil,
          optional(:verified_address) => String.t() | nil,
          optional(:verified_name) => String.t() | nil,
          optional(String.t()) => term()
        }

  def __nested_fields__ do
    %{
      "owner" => %{
        fields: %{
          "account" => {:resource, Stripe.Resources.Account},
          "application" => {:resource, Stripe.Resources.Application},
          "customer" => {:resource, Stripe.Resources.Customer},
          "customer_account" => :scalar,
          "type" => :scalar
        }
      },
      "verification" => %{
        fields: %{
          "status" => :scalar,
          "verified_address" => :scalar,
          "verified_name" => :scalar
        }
      }
    }
  end
end
