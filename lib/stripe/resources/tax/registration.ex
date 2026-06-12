# File generated from our OpenAPI spec
defmodule Stripe.Resources.Tax.Registration do
  @moduledoc """
  TaxProductRegistrationsResourceTaxRegistration

  A Tax `Registration` lets us know that your business is registered to collect tax on payments within a region, enabling you to [automatically collect tax](https://docs.stripe.com/tax).

  Stripe doesn't register on your behalf with the relevant authorities when you create a Tax `Registration` object. For more information on how to register to collect tax, see [our guide](https://docs.stripe.com/tax/registering).

  Related guide: [Using the Registrations API](https://docs.stripe.com/tax/registrations-api)
  """

  @typedoc """
  * `active_from` - Time at which the registration becomes active. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)). Max length: 5000.
  * `country_options` - Expandable.
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `expires_at` - If set, the registration stops being active at this time. If not set, the registration will be active indefinitely. Measured in seconds since the Unix epoch. Format: Unix timestamp. Nullable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `tax.registration`.
  * `status` - The status of the registration. This field is present for convenience and can be deduced from `active_from` and `expires_at`. Possible values: `active`, `expired`, `scheduled`.
  """
  @type t :: %__MODULE__{
          active_from: integer(),
          country: String.t(),
          country_options: country_options(),
          created: integer(),
          expires_at: integer(),
          id: String.t(),
          livemode: boolean(),
          object: String.t(),
          status: String.t()
        }

  defstruct [
    :active_from,
    :country,
    :country_options,
    :created,
    :expires_at,
    :id,
    :livemode,
    :object,
    :status
  ]

  @object_name "tax.registration"
  def object_name, do: @object_name

  def expandable_fields, do: ["country_options"]

  @typedoc """
  * `ae`
  * `al`
  * `am`
  * `ao`
  * `at`
  * `au`
  * `aw`
  * `az`
  * `ba`
  * `bb`
  * `bd`
  * `be`
  * `bf`
  * `bg`
  * `bh`
  * `bj`
  * `bs`
  * `by`
  * `ca`
  * `cd`
  * `ch`
  * `cl`
  * `cm`
  * `co`
  * `cr`
  * `cv`
  * `cy`
  * `cz`
  * `de`
  * `dk`
  * `ec`
  * `ee`
  * `eg`
  * `es`
  * `et`
  * `fi`
  * `fr`
  * `gb`
  * `ge`
  * `gn`
  * `gr`
  * `hr`
  * `hu`
  * `id`
  * `ie`
  * `in`
  * `is`
  * `it`
  * `jp`
  * `ke`
  * `kg`
  * `kh`
  * `kr`
  * `kz`
  * `la`
  * `lk`
  * `lt`
  * `lu`
  * `lv`
  * `ma`
  * `md`
  * `me`
  * `mk`
  * `mr`
  * `mt`
  * `mx`
  * `my`
  * `ng`
  * `nl`
  * `no`
  * `np`
  * `nz`
  * `om`
  * `pe`
  * `ph`
  * `pl`
  * `pt`
  * `ro`
  * `rs`
  * `ru`
  * `sa`
  * `se`
  * `sg`
  * `si`
  * `sk`
  * `sn`
  * `sr`
  * `th`
  * `tj`
  * `tr`
  * `tw`
  * `tz`
  * `ua`
  * `ug`
  * `us`
  * `uy`
  * `uz`
  * `vn`
  * `za`
  * `zm`
  * `zw`
  """
  @type country_options :: %{
          optional(:ae) => country_options_ae() | nil,
          optional(:al) => country_options_al() | nil,
          optional(:am) => country_options_am() | nil,
          optional(:ao) => country_options_ao() | nil,
          optional(:at) => country_options_at() | nil,
          optional(:au) => country_options_au() | nil,
          optional(:aw) => country_options_aw() | nil,
          optional(:az) => country_options_az() | nil,
          optional(:ba) => country_options_ba() | nil,
          optional(:bb) => country_options_bb() | nil,
          optional(:bd) => country_options_bd() | nil,
          optional(:be) => country_options_be() | nil,
          optional(:bf) => country_options_bf() | nil,
          optional(:bg) => country_options_bg() | nil,
          optional(:bh) => country_options_bh() | nil,
          optional(:bj) => country_options_bj() | nil,
          optional(:bs) => country_options_bs() | nil,
          optional(:by) => country_options_by() | nil,
          optional(:ca) => country_options_ca() | nil,
          optional(:cd) => country_options_cd() | nil,
          optional(:ch) => country_options_ch() | nil,
          optional(:cl) => country_options_cl() | nil,
          optional(:cm) => country_options_cm() | nil,
          optional(:co) => country_options_co() | nil,
          optional(:cr) => country_options_cr() | nil,
          optional(:cv) => country_options_cv() | nil,
          optional(:cy) => country_options_cy() | nil,
          optional(:cz) => country_options_cz() | nil,
          optional(:de) => country_options_de() | nil,
          optional(:dk) => country_options_dk() | nil,
          optional(:ec) => country_options_ec() | nil,
          optional(:ee) => country_options_ee() | nil,
          optional(:eg) => country_options_eg() | nil,
          optional(:es) => country_options_es() | nil,
          optional(:et) => country_options_et() | nil,
          optional(:fi) => country_options_fi() | nil,
          optional(:fr) => country_options_fr() | nil,
          optional(:gb) => country_options_gb() | nil,
          optional(:ge) => country_options_ge() | nil,
          optional(:gn) => country_options_gn() | nil,
          optional(:gr) => country_options_gr() | nil,
          optional(:hr) => country_options_hr() | nil,
          optional(:hu) => country_options_hu() | nil,
          optional(:id) => country_options_id() | nil,
          optional(:ie) => country_options_ie() | nil,
          optional(:in) => country_options_in() | nil,
          optional(:is) => country_options_is() | nil,
          optional(:it) => country_options_it() | nil,
          optional(:jp) => country_options_jp() | nil,
          optional(:ke) => country_options_ke() | nil,
          optional(:kg) => country_options_kg() | nil,
          optional(:kh) => country_options_kh() | nil,
          optional(:kr) => country_options_kr() | nil,
          optional(:kz) => country_options_kz() | nil,
          optional(:la) => country_options_la() | nil,
          optional(:lk) => country_options_lk() | nil,
          optional(:lt) => country_options_lt() | nil,
          optional(:lu) => country_options_lu() | nil,
          optional(:lv) => country_options_lv() | nil,
          optional(:ma) => country_options_ma() | nil,
          optional(:md) => country_options_md() | nil,
          optional(:me) => country_options_me() | nil,
          optional(:mk) => country_options_mk() | nil,
          optional(:mr) => country_options_mr() | nil,
          optional(:mt) => country_options_mt() | nil,
          optional(:mx) => country_options_mx() | nil,
          optional(:my) => country_options_my() | nil,
          optional(:ng) => country_options_ng() | nil,
          optional(:nl) => country_options_nl() | nil,
          optional(:no) => country_options_no() | nil,
          optional(:np) => country_options_np() | nil,
          optional(:nz) => country_options_nz() | nil,
          optional(:om) => country_options_om() | nil,
          optional(:pe) => country_options_pe() | nil,
          optional(:ph) => country_options_ph() | nil,
          optional(:pl) => country_options_pl() | nil,
          optional(:pt) => country_options_pt() | nil,
          optional(:ro) => country_options_ro() | nil,
          optional(:rs) => country_options_rs() | nil,
          optional(:ru) => country_options_ru() | nil,
          optional(:sa) => country_options_sa() | nil,
          optional(:se) => country_options_se() | nil,
          optional(:sg) => country_options_sg() | nil,
          optional(:si) => country_options_si() | nil,
          optional(:sk) => country_options_sk() | nil,
          optional(:sn) => country_options_sn() | nil,
          optional(:sr) => country_options_sr() | nil,
          optional(:th) => country_options_th() | nil,
          optional(:tj) => country_options_tj() | nil,
          optional(:tr) => country_options_tr() | nil,
          optional(:tw) => country_options_tw() | nil,
          optional(:tz) => country_options_tz() | nil,
          optional(:ua) => country_options_ua() | nil,
          optional(:ug) => country_options_ug() | nil,
          optional(:us) => country_options_us() | nil,
          optional(:uy) => country_options_uy() | nil,
          optional(:uz) => country_options_uz() | nil,
          optional(:vn) => country_options_vn() | nil,
          optional(:za) => country_options_za() | nil,
          optional(:zm) => country_options_zm() | nil,
          optional(:zw) => country_options_zw() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `standard`
  * `type` - Type of registration in `country`. Possible values: `standard`.
  """
  @type country_options_ae :: %{
          optional(:standard) => country_options_ae_standard() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `place_of_supply_scheme` - Place of supply scheme used in an Default standard registration. Possible values: `inbound_goods`, `standard`.
  """
  @type country_options_ae_standard :: %{
          optional(:place_of_supply_scheme) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration in `country`. Possible values: `standard`.
  """
  @type country_options_al :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration in `country`. Possible values: `simplified`.
  """
  @type country_options_am :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration in `country`. Possible values: `standard`.
  """
  @type country_options_ao :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `standard`
  * `type` - Type of registration in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
  """
  @type country_options_at :: %{
          optional(:standard) => country_options_at_standard() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
  """
  @type country_options_at_standard :: %{
          optional(:place_of_supply_scheme) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `standard`
  * `type` - Type of registration in `country`. Possible values: `standard`.
  """
  @type country_options_au :: %{
          optional(:standard) => country_options_au_standard() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `place_of_supply_scheme` - Place of supply scheme used in an Default standard registration. Possible values: `inbound_goods`, `standard`.
  """
  @type country_options_au_standard :: %{
          optional(:place_of_supply_scheme) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration in `country`. Possible values: `standard`.
  """
  @type country_options_aw :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration in `country`. Possible values: `simplified`.
  """
  @type country_options_az :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration in `country`. Possible values: `standard`.
  """
  @type country_options_ba :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration in `country`. Possible values: `standard`.
  """
  @type country_options_bb :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration in `country`. Possible values: `standard`.
  """
  @type country_options_bd :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `standard`
  * `type` - Type of registration in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
  """
  @type country_options_be :: %{
          optional(:standard) => country_options_be_standard() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
  """
  @type country_options_be_standard :: %{
          optional(:place_of_supply_scheme) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration in `country`. Possible values: `standard`.
  """
  @type country_options_bf :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `standard`
  * `type` - Type of registration in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
  """
  @type country_options_bg :: %{
          optional(:standard) => country_options_bg_standard() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
  """
  @type country_options_bg_standard :: %{
          optional(:place_of_supply_scheme) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration in `country`. Possible values: `standard`.
  """
  @type country_options_bh :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration in `country`. Possible values: `simplified`.
  """
  @type country_options_bj :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration in `country`. Possible values: `standard`.
  """
  @type country_options_bs :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration in `country`. Possible values: `simplified`.
  """
  @type country_options_by :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `province_standard`
  * `type` - Type of registration in Canada. Possible values: `province_standard`, `simplified`, `standard`.
  """
  @type country_options_ca :: %{
          optional(:province_standard) => country_options_ca_province_standard() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `province` - Two-letter CA province code ([ISO 3166-2](https://en.wikipedia.org/wiki/ISO_3166-2)). Max length: 5000.
  """
  @type country_options_ca_province_standard :: %{
          optional(:province) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration in `country`. Possible values: `standard`.
  """
  @type country_options_cd :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `standard`
  * `type` - Type of registration in `country`. Possible values: `standard`.
  """
  @type country_options_ch :: %{
          optional(:standard) => country_options_ch_standard() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `place_of_supply_scheme` - Place of supply scheme used in an Default standard registration. Possible values: `inbound_goods`, `standard`.
  """
  @type country_options_ch_standard :: %{
          optional(:place_of_supply_scheme) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration in `country`. Possible values: `simplified`.
  """
  @type country_options_cl :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration in `country`. Possible values: `simplified`.
  """
  @type country_options_cm :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration in `country`. Possible values: `simplified`.
  """
  @type country_options_co :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration in `country`. Possible values: `simplified`.
  """
  @type country_options_cr :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration in `country`. Possible values: `simplified`.
  """
  @type country_options_cv :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `standard`
  * `type` - Type of registration in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
  """
  @type country_options_cy :: %{
          optional(:standard) => country_options_cy_standard() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
  """
  @type country_options_cy_standard :: %{
          optional(:place_of_supply_scheme) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `standard`
  * `type` - Type of registration in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
  """
  @type country_options_cz :: %{
          optional(:standard) => country_options_cz_standard() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
  """
  @type country_options_cz_standard :: %{
          optional(:place_of_supply_scheme) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `standard`
  * `type` - Type of registration in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
  """
  @type country_options_de :: %{
          optional(:standard) => country_options_de_standard() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
  """
  @type country_options_de_standard :: %{
          optional(:place_of_supply_scheme) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `standard`
  * `type` - Type of registration in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
  """
  @type country_options_dk :: %{
          optional(:standard) => country_options_dk_standard() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
  """
  @type country_options_dk_standard :: %{
          optional(:place_of_supply_scheme) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration in `country`. Possible values: `simplified`.
  """
  @type country_options_ec :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `standard`
  * `type` - Type of registration in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
  """
  @type country_options_ee :: %{
          optional(:standard) => country_options_ee_standard() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
  """
  @type country_options_ee_standard :: %{
          optional(:place_of_supply_scheme) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration in `country`. Possible values: `simplified`.
  """
  @type country_options_eg :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `standard`
  * `type` - Type of registration in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
  """
  @type country_options_es :: %{
          optional(:standard) => country_options_es_standard() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
  """
  @type country_options_es_standard :: %{
          optional(:place_of_supply_scheme) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration in `country`. Possible values: `standard`.
  """
  @type country_options_et :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `standard`
  * `type` - Type of registration in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
  """
  @type country_options_fi :: %{
          optional(:standard) => country_options_fi_standard() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
  """
  @type country_options_fi_standard :: %{
          optional(:place_of_supply_scheme) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `standard`
  * `type` - Type of registration in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
  """
  @type country_options_fr :: %{
          optional(:standard) => country_options_fr_standard() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
  """
  @type country_options_fr_standard :: %{
          optional(:place_of_supply_scheme) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `standard`
  * `type` - Type of registration in `country`. Possible values: `standard`.
  """
  @type country_options_gb :: %{
          optional(:standard) => country_options_gb_standard() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `place_of_supply_scheme` - Place of supply scheme used in an Default standard registration. Possible values: `inbound_goods`, `standard`.
  """
  @type country_options_gb_standard :: %{
          optional(:place_of_supply_scheme) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration in `country`. Possible values: `simplified`.
  """
  @type country_options_ge :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration in `country`. Possible values: `standard`.
  """
  @type country_options_gn :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `standard`
  * `type` - Type of registration in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
  """
  @type country_options_gr :: %{
          optional(:standard) => country_options_gr_standard() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
  """
  @type country_options_gr_standard :: %{
          optional(:place_of_supply_scheme) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `standard`
  * `type` - Type of registration in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
  """
  @type country_options_hr :: %{
          optional(:standard) => country_options_hr_standard() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
  """
  @type country_options_hr_standard :: %{
          optional(:place_of_supply_scheme) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `standard`
  * `type` - Type of registration in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
  """
  @type country_options_hu :: %{
          optional(:standard) => country_options_hu_standard() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
  """
  @type country_options_hu_standard :: %{
          optional(:place_of_supply_scheme) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration in `country`. Possible values: `simplified`.
  """
  @type country_options_id :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `standard`
  * `type` - Type of registration in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
  """
  @type country_options_ie :: %{
          optional(:standard) => country_options_ie_standard() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
  """
  @type country_options_ie_standard :: %{
          optional(:place_of_supply_scheme) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration in `country`. Possible values: `simplified`.
  """
  @type country_options_in :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration in `country`. Possible values: `standard`.
  """
  @type country_options_is :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `standard`
  * `type` - Type of registration in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
  """
  @type country_options_it :: %{
          optional(:standard) => country_options_it_standard() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
  """
  @type country_options_it_standard :: %{
          optional(:place_of_supply_scheme) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `standard`
  * `type` - Type of registration in `country`. Possible values: `standard`.
  """
  @type country_options_jp :: %{
          optional(:standard) => country_options_jp_standard() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `place_of_supply_scheme` - Place of supply scheme used in an Default standard registration. Possible values: `inbound_goods`, `standard`.
  """
  @type country_options_jp_standard :: %{
          optional(:place_of_supply_scheme) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration in `country`. Possible values: `simplified`.
  """
  @type country_options_ke :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration in `country`. Possible values: `simplified`.
  """
  @type country_options_kg :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration in `country`. Possible values: `simplified`.
  """
  @type country_options_kh :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration in `country`. Possible values: `simplified`.
  """
  @type country_options_kr :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration in `country`. Possible values: `simplified`.
  """
  @type country_options_kz :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration in `country`. Possible values: `simplified`.
  """
  @type country_options_la :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration in `country`. Possible values: `simplified`.
  """
  @type country_options_lk :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `standard`
  * `type` - Type of registration in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
  """
  @type country_options_lt :: %{
          optional(:standard) => country_options_lt_standard() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
  """
  @type country_options_lt_standard :: %{
          optional(:place_of_supply_scheme) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `standard`
  * `type` - Type of registration in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
  """
  @type country_options_lu :: %{
          optional(:standard) => country_options_lu_standard() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
  """
  @type country_options_lu_standard :: %{
          optional(:place_of_supply_scheme) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `standard`
  * `type` - Type of registration in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
  """
  @type country_options_lv :: %{
          optional(:standard) => country_options_lv_standard() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
  """
  @type country_options_lv_standard :: %{
          optional(:place_of_supply_scheme) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration in `country`. Possible values: `simplified`.
  """
  @type country_options_ma :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration in `country`. Possible values: `simplified`.
  """
  @type country_options_md :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration in `country`. Possible values: `standard`.
  """
  @type country_options_me :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration in `country`. Possible values: `standard`.
  """
  @type country_options_mk :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration in `country`. Possible values: `standard`.
  """
  @type country_options_mr :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `standard`
  * `type` - Type of registration in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
  """
  @type country_options_mt :: %{
          optional(:standard) => country_options_mt_standard() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
  """
  @type country_options_mt_standard :: %{
          optional(:place_of_supply_scheme) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration in `country`. Possible values: `simplified`.
  """
  @type country_options_mx :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration in `country`. Possible values: `simplified`.
  """
  @type country_options_my :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration in `country`. Possible values: `simplified`.
  """
  @type country_options_ng :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `standard`
  * `type` - Type of registration in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
  """
  @type country_options_nl :: %{
          optional(:standard) => country_options_nl_standard() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
  """
  @type country_options_nl_standard :: %{
          optional(:place_of_supply_scheme) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `standard`
  * `type` - Type of registration in `country`. Possible values: `standard`.
  """
  @type country_options_no :: %{
          optional(:standard) => country_options_no_standard() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `place_of_supply_scheme` - Place of supply scheme used in an Default standard registration. Possible values: `inbound_goods`, `standard`.
  """
  @type country_options_no_standard :: %{
          optional(:place_of_supply_scheme) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration in `country`. Possible values: `simplified`.
  """
  @type country_options_np :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `standard`
  * `type` - Type of registration in `country`. Possible values: `standard`.
  """
  @type country_options_nz :: %{
          optional(:standard) => country_options_nz_standard() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `place_of_supply_scheme` - Place of supply scheme used in an Default standard registration. Possible values: `inbound_goods`, `standard`.
  """
  @type country_options_nz_standard :: %{
          optional(:place_of_supply_scheme) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration in `country`. Possible values: `standard`.
  """
  @type country_options_om :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration in `country`. Possible values: `simplified`.
  """
  @type country_options_pe :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration in `country`. Possible values: `simplified`.
  """
  @type country_options_ph :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `standard`
  * `type` - Type of registration in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
  """
  @type country_options_pl :: %{
          optional(:standard) => country_options_pl_standard() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
  """
  @type country_options_pl_standard :: %{
          optional(:place_of_supply_scheme) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `standard`
  * `type` - Type of registration in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
  """
  @type country_options_pt :: %{
          optional(:standard) => country_options_pt_standard() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
  """
  @type country_options_pt_standard :: %{
          optional(:place_of_supply_scheme) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `standard`
  * `type` - Type of registration in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
  """
  @type country_options_ro :: %{
          optional(:standard) => country_options_ro_standard() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
  """
  @type country_options_ro_standard :: %{
          optional(:place_of_supply_scheme) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration in `country`. Possible values: `standard`.
  """
  @type country_options_rs :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration in `country`. Possible values: `simplified`.
  """
  @type country_options_ru :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration in `country`. Possible values: `simplified`.
  """
  @type country_options_sa :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `standard`
  * `type` - Type of registration in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
  """
  @type country_options_se :: %{
          optional(:standard) => country_options_se_standard() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
  """
  @type country_options_se_standard :: %{
          optional(:place_of_supply_scheme) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `standard`
  * `type` - Type of registration in `country`. Possible values: `standard`.
  """
  @type country_options_sg :: %{
          optional(:standard) => country_options_sg_standard() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `place_of_supply_scheme` - Place of supply scheme used in an Default standard registration. Possible values: `inbound_goods`, `standard`.
  """
  @type country_options_sg_standard :: %{
          optional(:place_of_supply_scheme) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `standard`
  * `type` - Type of registration in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
  """
  @type country_options_si :: %{
          optional(:standard) => country_options_si_standard() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
  """
  @type country_options_si_standard :: %{
          optional(:place_of_supply_scheme) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `standard`
  * `type` - Type of registration in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
  """
  @type country_options_sk :: %{
          optional(:standard) => country_options_sk_standard() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
  """
  @type country_options_sk_standard :: %{
          optional(:place_of_supply_scheme) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration in `country`. Possible values: `simplified`.
  """
  @type country_options_sn :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration in `country`. Possible values: `standard`.
  """
  @type country_options_sr :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration in `country`. Possible values: `simplified`.
  """
  @type country_options_th :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration in `country`. Possible values: `simplified`.
  """
  @type country_options_tj :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration in `country`. Possible values: `simplified`.
  """
  @type country_options_tr :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration in `country`. Possible values: `simplified`.
  """
  @type country_options_tw :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration in `country`. Possible values: `simplified`.
  """
  @type country_options_tz :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration in `country`. Possible values: `simplified`.
  """
  @type country_options_ua :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration in `country`. Possible values: `simplified`.
  """
  @type country_options_ug :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `local_amusement_tax`
  * `local_lease_tax`
  * `state` - Two-letter US state code ([ISO 3166-2](https://en.wikipedia.org/wiki/ISO_3166-2)). Max length: 5000.
  * `state_sales_tax`
  * `type` - Type of registration in the US. Possible values: `local_amusement_tax`, `local_lease_tax`, `state_communications_tax`, `state_retail_delivery_fee`, `state_sales_tax`.
  """
  @type country_options_us :: %{
          optional(:local_amusement_tax) => country_options_us_local_amusement_tax() | nil,
          optional(:local_lease_tax) => country_options_us_local_lease_tax() | nil,
          optional(:state) => String.t() | nil,
          optional(:state_sales_tax) => country_options_us_state_sales_tax() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `jurisdiction` - A [FIPS code](https://www.census.gov/library/reference/code-lists/ansi.html) representing the local jurisdiction. Max length: 5000.
  """
  @type country_options_us_local_amusement_tax :: %{
          optional(:jurisdiction) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `jurisdiction` - A [FIPS code](https://www.census.gov/library/reference/code-lists/ansi.html) representing the local jurisdiction. Max length: 5000.
  """
  @type country_options_us_local_lease_tax :: %{
          optional(:jurisdiction) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `elections` - Elections for the state sales tax registration.
  """
  @type country_options_us_state_sales_tax :: %{
          optional(:elections) => [country_options_us_state_sales_tax_elections()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `jurisdiction` - A [FIPS code](https://www.census.gov/library/reference/code-lists/ansi.html) representing the local jurisdiction. Max length: 5000.
  * `type` - The type of the election for the state sales tax registration. Possible values: `local_use_tax`, `simplified_sellers_use_tax`, `single_local_use_tax`.
  """
  @type country_options_us_state_sales_tax_elections :: %{
          optional(:jurisdiction) => String.t() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration in `country`. Possible values: `standard`.
  """
  @type country_options_uy :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration in `country`. Possible values: `simplified`.
  """
  @type country_options_uz :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration in `country`. Possible values: `simplified`.
  """
  @type country_options_vn :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration in `country`. Possible values: `standard`.
  """
  @type country_options_za :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration in `country`. Possible values: `simplified`.
  """
  @type country_options_zm :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration in `country`. Possible values: `standard`.
  """
  @type country_options_zw :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  def __nested_fields__ do
    %{
      "country_options" => %{
        fields: %{
          "ae" => %{
            fields: %{
              "standard" => %{
                fields: %{
                  "place_of_supply_scheme" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "al" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "am" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "ao" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "at" => %{
            fields: %{
              "standard" => %{
                fields: %{
                  "place_of_supply_scheme" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "au" => %{
            fields: %{
              "standard" => %{
                fields: %{
                  "place_of_supply_scheme" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "aw" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "az" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "ba" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "bb" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "bd" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "be" => %{
            fields: %{
              "standard" => %{
                fields: %{
                  "place_of_supply_scheme" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "bf" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "bg" => %{
            fields: %{
              "standard" => %{
                fields: %{
                  "place_of_supply_scheme" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "bh" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "bj" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "bs" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "by" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "ca" => %{
            fields: %{
              "province_standard" => %{
                fields: %{
                  "province" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "cd" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "ch" => %{
            fields: %{
              "standard" => %{
                fields: %{
                  "place_of_supply_scheme" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "cl" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "cm" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "co" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "cr" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "cv" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "cy" => %{
            fields: %{
              "standard" => %{
                fields: %{
                  "place_of_supply_scheme" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "cz" => %{
            fields: %{
              "standard" => %{
                fields: %{
                  "place_of_supply_scheme" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "de" => %{
            fields: %{
              "standard" => %{
                fields: %{
                  "place_of_supply_scheme" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "dk" => %{
            fields: %{
              "standard" => %{
                fields: %{
                  "place_of_supply_scheme" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "ec" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "ee" => %{
            fields: %{
              "standard" => %{
                fields: %{
                  "place_of_supply_scheme" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "eg" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "es" => %{
            fields: %{
              "standard" => %{
                fields: %{
                  "place_of_supply_scheme" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "et" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "fi" => %{
            fields: %{
              "standard" => %{
                fields: %{
                  "place_of_supply_scheme" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "fr" => %{
            fields: %{
              "standard" => %{
                fields: %{
                  "place_of_supply_scheme" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "gb" => %{
            fields: %{
              "standard" => %{
                fields: %{
                  "place_of_supply_scheme" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "ge" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "gn" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "gr" => %{
            fields: %{
              "standard" => %{
                fields: %{
                  "place_of_supply_scheme" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "hr" => %{
            fields: %{
              "standard" => %{
                fields: %{
                  "place_of_supply_scheme" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "hu" => %{
            fields: %{
              "standard" => %{
                fields: %{
                  "place_of_supply_scheme" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "id" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "ie" => %{
            fields: %{
              "standard" => %{
                fields: %{
                  "place_of_supply_scheme" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "in" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "is" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "it" => %{
            fields: %{
              "standard" => %{
                fields: %{
                  "place_of_supply_scheme" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "jp" => %{
            fields: %{
              "standard" => %{
                fields: %{
                  "place_of_supply_scheme" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "ke" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "kg" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "kh" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "kr" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "kz" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "la" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "lk" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "lt" => %{
            fields: %{
              "standard" => %{
                fields: %{
                  "place_of_supply_scheme" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "lu" => %{
            fields: %{
              "standard" => %{
                fields: %{
                  "place_of_supply_scheme" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "lv" => %{
            fields: %{
              "standard" => %{
                fields: %{
                  "place_of_supply_scheme" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "ma" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "md" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "me" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "mk" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "mr" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "mt" => %{
            fields: %{
              "standard" => %{
                fields: %{
                  "place_of_supply_scheme" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "mx" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "my" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "ng" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "nl" => %{
            fields: %{
              "standard" => %{
                fields: %{
                  "place_of_supply_scheme" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "no" => %{
            fields: %{
              "standard" => %{
                fields: %{
                  "place_of_supply_scheme" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "np" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "nz" => %{
            fields: %{
              "standard" => %{
                fields: %{
                  "place_of_supply_scheme" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "om" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "pe" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "ph" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "pl" => %{
            fields: %{
              "standard" => %{
                fields: %{
                  "place_of_supply_scheme" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "pt" => %{
            fields: %{
              "standard" => %{
                fields: %{
                  "place_of_supply_scheme" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "ro" => %{
            fields: %{
              "standard" => %{
                fields: %{
                  "place_of_supply_scheme" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "rs" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "ru" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "sa" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "se" => %{
            fields: %{
              "standard" => %{
                fields: %{
                  "place_of_supply_scheme" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "sg" => %{
            fields: %{
              "standard" => %{
                fields: %{
                  "place_of_supply_scheme" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "si" => %{
            fields: %{
              "standard" => %{
                fields: %{
                  "place_of_supply_scheme" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "sk" => %{
            fields: %{
              "standard" => %{
                fields: %{
                  "place_of_supply_scheme" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "sn" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "sr" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "th" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "tj" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "tr" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "tw" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "tz" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "ua" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "ug" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "us" => %{
            fields: %{
              "local_amusement_tax" => %{
                fields: %{
                  "jurisdiction" => :scalar
                }
              },
              "local_lease_tax" => %{
                fields: %{
                  "jurisdiction" => :scalar
                }
              },
              "state" => :scalar,
              "state_sales_tax" => %{
                fields: %{
                  "elections" =>
                    {:list,
                     %{
                       fields: %{
                         "jurisdiction" => :scalar,
                         "type" => :scalar
                       }
                     }}
                }
              },
              "type" => :scalar
            }
          },
          "uy" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "uz" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "vn" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "za" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "zm" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "zw" => %{
            fields: %{
              "type" => :scalar
            }
          }
        }
      }
    }
  end
end
