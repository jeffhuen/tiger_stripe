# File generated from our OpenAPI spec
defmodule Stripe.Params.Tax.RegistrationCreateParams do
  @moduledoc "Parameters for registration create."

  @typedoc """
  * `active_from` - Time at which the Tax Registration becomes active. It can be either `now` to indicate the current time, or a future timestamp measured in seconds since the Unix epoch.
  * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)). Max length: 5000.
  * `country_options` - Specific options for a registration in the specified `country`.
  * `expand` - Specifies which fields in the response should be expanded.
  * `expires_at` - If set, the Tax Registration stops being active at this time. If not set, the Tax Registration will be active indefinitely. Timestamp measured in seconds since the Unix epoch. Format: Unix timestamp.
  """
  @type t :: %__MODULE__{
          active_from: map(),
          country: String.t(),
          country_options: country_options(),
          expand: [String.t()] | nil,
          expires_at: integer() | nil
        }

  defstruct [:active_from, :country, :country_options, :expand, :expires_at]

  @typedoc """
  * `ae` - Options for the registration in AE.
  * `al` - Options for the registration in AL.
  * `am` - Options for the registration in AM.
  * `ao` - Options for the registration in AO.
  * `at` - Options for the registration in AT.
  * `au` - Options for the registration in AU.
  * `aw` - Options for the registration in AW.
  * `az` - Options for the registration in AZ.
  * `ba` - Options for the registration in BA.
  * `bb` - Options for the registration in BB.
  * `bd` - Options for the registration in BD.
  * `be` - Options for the registration in BE.
  * `bf` - Options for the registration in BF.
  * `bg` - Options for the registration in BG.
  * `bh` - Options for the registration in BH.
  * `bj` - Options for the registration in BJ.
  * `bs` - Options for the registration in BS.
  * `by` - Options for the registration in BY.
  * `ca` - Options for the registration in CA.
  * `cd` - Options for the registration in CD.
  * `ch` - Options for the registration in CH.
  * `cl` - Options for the registration in CL.
  * `cm` - Options for the registration in CM.
  * `co` - Options for the registration in CO.
  * `cr` - Options for the registration in CR.
  * `cv` - Options for the registration in CV.
  * `cy` - Options for the registration in CY.
  * `cz` - Options for the registration in CZ.
  * `de` - Options for the registration in DE.
  * `dk` - Options for the registration in DK.
  * `ec` - Options for the registration in EC.
  * `ee` - Options for the registration in EE.
  * `eg` - Options for the registration in EG.
  * `es` - Options for the registration in ES.
  * `et` - Options for the registration in ET.
  * `fi` - Options for the registration in FI.
  * `fr` - Options for the registration in FR.
  * `gb` - Options for the registration in GB.
  * `ge` - Options for the registration in GE.
  * `gn` - Options for the registration in GN.
  * `gr` - Options for the registration in GR.
  * `hr` - Options for the registration in HR.
  * `hu` - Options for the registration in HU.
  * `id` - Options for the registration in ID.
  * `ie` - Options for the registration in IE.
  * `in` - Options for the registration in IN.
  * `is` - Options for the registration in IS.
  * `it` - Options for the registration in IT.
  * `jp` - Options for the registration in JP.
  * `ke` - Options for the registration in KE.
  * `kg` - Options for the registration in KG.
  * `kh` - Options for the registration in KH.
  * `kr` - Options for the registration in KR.
  * `kz` - Options for the registration in KZ.
  * `la` - Options for the registration in LA.
  * `lt` - Options for the registration in LT.
  * `lu` - Options for the registration in LU.
  * `lv` - Options for the registration in LV.
  * `ma` - Options for the registration in MA.
  * `md` - Options for the registration in MD.
  * `me` - Options for the registration in ME.
  * `mk` - Options for the registration in MK.
  * `mr` - Options for the registration in MR.
  * `mt` - Options for the registration in MT.
  * `mx` - Options for the registration in MX.
  * `my` - Options for the registration in MY.
  * `ng` - Options for the registration in NG.
  * `nl` - Options for the registration in NL.
  * `no` - Options for the registration in NO.
  * `np` - Options for the registration in NP.
  * `nz` - Options for the registration in NZ.
  * `om` - Options for the registration in OM.
  * `pe` - Options for the registration in PE.
  * `ph` - Options for the registration in PH.
  * `pl` - Options for the registration in PL.
  * `pt` - Options for the registration in PT.
  * `ro` - Options for the registration in RO.
  * `rs` - Options for the registration in RS.
  * `ru` - Options for the registration in RU.
  * `sa` - Options for the registration in SA.
  * `se` - Options for the registration in SE.
  * `sg` - Options for the registration in SG.
  * `si` - Options for the registration in SI.
  * `sk` - Options for the registration in SK.
  * `sn` - Options for the registration in SN.
  * `sr` - Options for the registration in SR.
  * `th` - Options for the registration in TH.
  * `tj` - Options for the registration in TJ.
  * `tr` - Options for the registration in TR.
  * `tw` - Options for the registration in TW.
  * `tz` - Options for the registration in TZ.
  * `ua` - Options for the registration in UA.
  * `ug` - Options for the registration in UG.
  * `us` - Options for the registration in US.
  * `uy` - Options for the registration in UY.
  * `uz` - Options for the registration in UZ.
  * `vn` - Options for the registration in VN.
  * `za` - Options for the registration in ZA.
  * `zm` - Options for the registration in ZM.
  * `zw` - Options for the registration in ZW.
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
  * `standard` - Options for the standard registration.
  * `type` - Type of registration to be created in `country`. Possible values: `standard`.
  """
  @type country_options_ae :: %{
          optional(:standard) => country_options_ae_standard() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `place_of_supply_scheme` - Place of supply scheme used in an standard registration. Possible values: `inbound_goods`, `standard`.
  """
  @type country_options_ae_standard :: %{
          optional(:place_of_supply_scheme) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `standard` - Options for the standard registration.
  * `type` - Type of registration to be created in `country`. Possible values: `standard`.
  """
  @type country_options_al :: %{
          optional(:standard) => country_options_al_standard() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `place_of_supply_scheme` - Place of supply scheme used in an standard registration. Possible values: `inbound_goods`, `standard`.
  """
  @type country_options_al_standard :: %{
          optional(:place_of_supply_scheme) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
  """
  @type country_options_am :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `standard` - Options for the standard registration.
  * `type` - Type of registration to be created in `country`. Possible values: `standard`.
  """
  @type country_options_ao :: %{
          optional(:standard) => country_options_ao_standard() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `place_of_supply_scheme` - Place of supply scheme used in an standard registration. Possible values: `inbound_goods`, `standard`.
  """
  @type country_options_ao_standard :: %{
          optional(:place_of_supply_scheme) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `standard` - Options for the standard registration.
  * `type` - Type of registration to be created in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
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
  * `standard` - Options for the standard registration.
  * `type` - Type of registration to be created in `country`. Possible values: `standard`.
  """
  @type country_options_au :: %{
          optional(:standard) => country_options_au_standard() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `place_of_supply_scheme` - Place of supply scheme used in an standard registration. Possible values: `inbound_goods`, `standard`.
  """
  @type country_options_au_standard :: %{
          optional(:place_of_supply_scheme) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `standard` - Options for the standard registration.
  * `type` - Type of registration to be created in `country`. Possible values: `standard`.
  """
  @type country_options_aw :: %{
          optional(:standard) => country_options_aw_standard() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `place_of_supply_scheme` - Place of supply scheme used in an standard registration. Possible values: `inbound_goods`, `standard`.
  """
  @type country_options_aw_standard :: %{
          optional(:place_of_supply_scheme) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
  """
  @type country_options_az :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `standard` - Options for the standard registration.
  * `type` - Type of registration to be created in `country`. Possible values: `standard`.
  """
  @type country_options_ba :: %{
          optional(:standard) => country_options_ba_standard() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `place_of_supply_scheme` - Place of supply scheme used in an standard registration. Possible values: `inbound_goods`, `standard`.
  """
  @type country_options_ba_standard :: %{
          optional(:place_of_supply_scheme) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `standard` - Options for the standard registration.
  * `type` - Type of registration to be created in `country`. Possible values: `standard`.
  """
  @type country_options_bb :: %{
          optional(:standard) => country_options_bb_standard() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `place_of_supply_scheme` - Place of supply scheme used in an standard registration. Possible values: `inbound_goods`, `standard`.
  """
  @type country_options_bb_standard :: %{
          optional(:place_of_supply_scheme) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `standard` - Options for the standard registration.
  * `type` - Type of registration to be created in `country`. Possible values: `standard`.
  """
  @type country_options_bd :: %{
          optional(:standard) => country_options_bd_standard() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `place_of_supply_scheme` - Place of supply scheme used in an standard registration. Possible values: `inbound_goods`, `standard`.
  """
  @type country_options_bd_standard :: %{
          optional(:place_of_supply_scheme) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `standard` - Options for the standard registration.
  * `type` - Type of registration to be created in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
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
  * `standard` - Options for the standard registration.
  * `type` - Type of registration to be created in `country`. Possible values: `standard`.
  """
  @type country_options_bf :: %{
          optional(:standard) => country_options_bf_standard() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `place_of_supply_scheme` - Place of supply scheme used in an standard registration. Possible values: `inbound_goods`, `standard`.
  """
  @type country_options_bf_standard :: %{
          optional(:place_of_supply_scheme) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `standard` - Options for the standard registration.
  * `type` - Type of registration to be created in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
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
  * `standard` - Options for the standard registration.
  * `type` - Type of registration to be created in `country`. Possible values: `standard`.
  """
  @type country_options_bh :: %{
          optional(:standard) => country_options_bh_standard() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `place_of_supply_scheme` - Place of supply scheme used in an standard registration. Possible values: `inbound_goods`, `standard`.
  """
  @type country_options_bh_standard :: %{
          optional(:place_of_supply_scheme) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
  """
  @type country_options_bj :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `standard` - Options for the standard registration.
  * `type` - Type of registration to be created in `country`. Possible values: `standard`.
  """
  @type country_options_bs :: %{
          optional(:standard) => country_options_bs_standard() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `place_of_supply_scheme` - Place of supply scheme used in an standard registration. Possible values: `inbound_goods`, `standard`.
  """
  @type country_options_bs_standard :: %{
          optional(:place_of_supply_scheme) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
  """
  @type country_options_by :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `province_standard` - Options for the provincial tax registration.
  * `type` - Type of registration to be created in Canada. Possible values: `province_standard`, `simplified`, `standard`.
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
  * `standard` - Options for the standard registration.
  * `type` - Type of registration to be created in `country`. Possible values: `standard`.
  """
  @type country_options_cd :: %{
          optional(:standard) => country_options_cd_standard() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `place_of_supply_scheme` - Place of supply scheme used in an standard registration. Possible values: `inbound_goods`, `standard`.
  """
  @type country_options_cd_standard :: %{
          optional(:place_of_supply_scheme) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `standard` - Options for the standard registration.
  * `type` - Type of registration to be created in `country`. Possible values: `standard`.
  """
  @type country_options_ch :: %{
          optional(:standard) => country_options_ch_standard() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `place_of_supply_scheme` - Place of supply scheme used in an standard registration. Possible values: `inbound_goods`, `standard`.
  """
  @type country_options_ch_standard :: %{
          optional(:place_of_supply_scheme) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
  """
  @type country_options_cl :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
  """
  @type country_options_cm :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
  """
  @type country_options_co :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
  """
  @type country_options_cr :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
  """
  @type country_options_cv :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `standard` - Options for the standard registration.
  * `type` - Type of registration to be created in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
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
  * `standard` - Options for the standard registration.
  * `type` - Type of registration to be created in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
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
  * `standard` - Options for the standard registration.
  * `type` - Type of registration to be created in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
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
  * `standard` - Options for the standard registration.
  * `type` - Type of registration to be created in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
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
  * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
  """
  @type country_options_ec :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `standard` - Options for the standard registration.
  * `type` - Type of registration to be created in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
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
  * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
  """
  @type country_options_eg :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `standard` - Options for the standard registration.
  * `type` - Type of registration to be created in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
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
  * `standard` - Options for the standard registration.
  * `type` - Type of registration to be created in `country`. Possible values: `standard`.
  """
  @type country_options_et :: %{
          optional(:standard) => country_options_et_standard() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `place_of_supply_scheme` - Place of supply scheme used in an standard registration. Possible values: `inbound_goods`, `standard`.
  """
  @type country_options_et_standard :: %{
          optional(:place_of_supply_scheme) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `standard` - Options for the standard registration.
  * `type` - Type of registration to be created in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
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
  * `standard` - Options for the standard registration.
  * `type` - Type of registration to be created in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
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
  * `standard` - Options for the standard registration.
  * `type` - Type of registration to be created in `country`. Possible values: `standard`.
  """
  @type country_options_gb :: %{
          optional(:standard) => country_options_gb_standard() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `place_of_supply_scheme` - Place of supply scheme used in an standard registration. Possible values: `inbound_goods`, `standard`.
  """
  @type country_options_gb_standard :: %{
          optional(:place_of_supply_scheme) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
  """
  @type country_options_ge :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `standard` - Options for the standard registration.
  * `type` - Type of registration to be created in `country`. Possible values: `standard`.
  """
  @type country_options_gn :: %{
          optional(:standard) => country_options_gn_standard() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `place_of_supply_scheme` - Place of supply scheme used in an standard registration. Possible values: `inbound_goods`, `standard`.
  """
  @type country_options_gn_standard :: %{
          optional(:place_of_supply_scheme) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `standard` - Options for the standard registration.
  * `type` - Type of registration to be created in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
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
  * `standard` - Options for the standard registration.
  * `type` - Type of registration to be created in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
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
  * `standard` - Options for the standard registration.
  * `type` - Type of registration to be created in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
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
  * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
  """
  @type country_options_id :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `standard` - Options for the standard registration.
  * `type` - Type of registration to be created in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
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
  * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
  """
  @type country_options_in :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `standard` - Options for the standard registration.
  * `type` - Type of registration to be created in `country`. Possible values: `standard`.
  """
  @type country_options_is :: %{
          optional(:standard) => country_options_is_standard() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `place_of_supply_scheme` - Place of supply scheme used in an standard registration. Possible values: `inbound_goods`, `standard`.
  """
  @type country_options_is_standard :: %{
          optional(:place_of_supply_scheme) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `standard` - Options for the standard registration.
  * `type` - Type of registration to be created in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
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
  * `standard` - Options for the standard registration.
  * `type` - Type of registration to be created in `country`. Possible values: `standard`.
  """
  @type country_options_jp :: %{
          optional(:standard) => country_options_jp_standard() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `place_of_supply_scheme` - Place of supply scheme used in an standard registration. Possible values: `inbound_goods`, `standard`.
  """
  @type country_options_jp_standard :: %{
          optional(:place_of_supply_scheme) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
  """
  @type country_options_ke :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
  """
  @type country_options_kg :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
  """
  @type country_options_kh :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
  """
  @type country_options_kr :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
  """
  @type country_options_kz :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
  """
  @type country_options_la :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `standard` - Options for the standard registration.
  * `type` - Type of registration to be created in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
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
  * `standard` - Options for the standard registration.
  * `type` - Type of registration to be created in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
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
  * `standard` - Options for the standard registration.
  * `type` - Type of registration to be created in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
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
  * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
  """
  @type country_options_ma :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
  """
  @type country_options_md :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `standard` - Options for the standard registration.
  * `type` - Type of registration to be created in `country`. Possible values: `standard`.
  """
  @type country_options_me :: %{
          optional(:standard) => country_options_me_standard() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `place_of_supply_scheme` - Place of supply scheme used in an standard registration. Possible values: `inbound_goods`, `standard`.
  """
  @type country_options_me_standard :: %{
          optional(:place_of_supply_scheme) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `standard` - Options for the standard registration.
  * `type` - Type of registration to be created in `country`. Possible values: `standard`.
  """
  @type country_options_mk :: %{
          optional(:standard) => country_options_mk_standard() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `place_of_supply_scheme` - Place of supply scheme used in an standard registration. Possible values: `inbound_goods`, `standard`.
  """
  @type country_options_mk_standard :: %{
          optional(:place_of_supply_scheme) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `standard` - Options for the standard registration.
  * `type` - Type of registration to be created in `country`. Possible values: `standard`.
  """
  @type country_options_mr :: %{
          optional(:standard) => country_options_mr_standard() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `place_of_supply_scheme` - Place of supply scheme used in an standard registration. Possible values: `inbound_goods`, `standard`.
  """
  @type country_options_mr_standard :: %{
          optional(:place_of_supply_scheme) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `standard` - Options for the standard registration.
  * `type` - Type of registration to be created in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
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
  * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
  """
  @type country_options_mx :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
  """
  @type country_options_my :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
  """
  @type country_options_ng :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `standard` - Options for the standard registration.
  * `type` - Type of registration to be created in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
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
  * `standard` - Options for the standard registration.
  * `type` - Type of registration to be created in `country`. Possible values: `standard`.
  """
  @type country_options_no :: %{
          optional(:standard) => country_options_no_standard() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `place_of_supply_scheme` - Place of supply scheme used in an standard registration. Possible values: `inbound_goods`, `standard`.
  """
  @type country_options_no_standard :: %{
          optional(:place_of_supply_scheme) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
  """
  @type country_options_np :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `standard` - Options for the standard registration.
  * `type` - Type of registration to be created in `country`. Possible values: `standard`.
  """
  @type country_options_nz :: %{
          optional(:standard) => country_options_nz_standard() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `place_of_supply_scheme` - Place of supply scheme used in an standard registration. Possible values: `inbound_goods`, `standard`.
  """
  @type country_options_nz_standard :: %{
          optional(:place_of_supply_scheme) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `standard` - Options for the standard registration.
  * `type` - Type of registration to be created in `country`. Possible values: `standard`.
  """
  @type country_options_om :: %{
          optional(:standard) => country_options_om_standard() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `place_of_supply_scheme` - Place of supply scheme used in an standard registration. Possible values: `inbound_goods`, `standard`.
  """
  @type country_options_om_standard :: %{
          optional(:place_of_supply_scheme) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
  """
  @type country_options_pe :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
  """
  @type country_options_ph :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `standard` - Options for the standard registration.
  * `type` - Type of registration to be created in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
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
  * `standard` - Options for the standard registration.
  * `type` - Type of registration to be created in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
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
  * `standard` - Options for the standard registration.
  * `type` - Type of registration to be created in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
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
  * `standard` - Options for the standard registration.
  * `type` - Type of registration to be created in `country`. Possible values: `standard`.
  """
  @type country_options_rs :: %{
          optional(:standard) => country_options_rs_standard() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `place_of_supply_scheme` - Place of supply scheme used in an standard registration. Possible values: `inbound_goods`, `standard`.
  """
  @type country_options_rs_standard :: %{
          optional(:place_of_supply_scheme) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
  """
  @type country_options_ru :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
  """
  @type country_options_sa :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `standard` - Options for the standard registration.
  * `type` - Type of registration to be created in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
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
  * `standard` - Options for the standard registration.
  * `type` - Type of registration to be created in `country`. Possible values: `standard`.
  """
  @type country_options_sg :: %{
          optional(:standard) => country_options_sg_standard() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `place_of_supply_scheme` - Place of supply scheme used in an standard registration. Possible values: `inbound_goods`, `standard`.
  """
  @type country_options_sg_standard :: %{
          optional(:place_of_supply_scheme) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `standard` - Options for the standard registration.
  * `type` - Type of registration to be created in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
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
  * `standard` - Options for the standard registration.
  * `type` - Type of registration to be created in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
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
  * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
  """
  @type country_options_sn :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `standard` - Options for the standard registration.
  * `type` - Type of registration to be created in `country`. Possible values: `standard`.
  """
  @type country_options_sr :: %{
          optional(:standard) => country_options_sr_standard() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `place_of_supply_scheme` - Place of supply scheme used in an standard registration. Possible values: `inbound_goods`, `standard`.
  """
  @type country_options_sr_standard :: %{
          optional(:place_of_supply_scheme) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
  """
  @type country_options_th :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
  """
  @type country_options_tj :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
  """
  @type country_options_tr :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
  """
  @type country_options_tw :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
  """
  @type country_options_tz :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
  """
  @type country_options_ua :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
  """
  @type country_options_ug :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `local_amusement_tax` - Options for the local amusement tax registration.
  * `local_lease_tax` - Options for the local lease tax registration.
  * `state` - Two-letter US state code ([ISO 3166-2](https://en.wikipedia.org/wiki/ISO_3166-2)). Max length: 5000.
  * `state_sales_tax` - Options for the state sales tax registration.
  * `type` - Type of registration to be created in the US. Possible values: `local_amusement_tax`, `local_lease_tax`, `state_communications_tax`, `state_retail_delivery_fee`, `state_sales_tax`.
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
  * `jurisdiction` - A [FIPS code](https://www.census.gov/library/reference/code-lists/ansi.html) representing the local jurisdiction. Supported FIPS codes are: `14000` (Chicago), `02154` (Arlington Heights), `06613` (Bloomington), `10906` (Campton Hills), `21696` (East Dundee), `24582` (Evanston), `45421` (Lynwood), `48892` (Midlothian), `64343` (River Grove), and `68081` (Schiller Park). Max length: 5000.
  """
  @type country_options_us_local_amusement_tax :: %{
          optional(:jurisdiction) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `jurisdiction` - A [FIPS code](https://www.census.gov/library/reference/code-lists/ansi.html) representing the local jurisdiction. Supported FIPS codes are: `14000` (Chicago). Max length: 5000.
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
  * `jurisdiction` - A [FIPS code](https://www.census.gov/library/reference/code-lists/ansi.html) representing the local jurisdiction. Supported FIPS codes are: `003` (Allegheny County) and `60000` (Philadelphia City). Max length: 5000.
  * `type` - The type of the election for the state sales tax registration. Possible values: `local_use_tax`, `simplified_sellers_use_tax`, `single_local_use_tax`.
  """
  @type country_options_us_state_sales_tax_elections :: %{
          optional(:jurisdiction) => String.t() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `standard` - Options for the standard registration.
  * `type` - Type of registration to be created in `country`. Possible values: `standard`.
  """
  @type country_options_uy :: %{
          optional(:standard) => country_options_uy_standard() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `place_of_supply_scheme` - Place of supply scheme used in an standard registration. Possible values: `inbound_goods`, `standard`.
  """
  @type country_options_uy_standard :: %{
          optional(:place_of_supply_scheme) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
  """
  @type country_options_uz :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
  """
  @type country_options_vn :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `standard` - Options for the standard registration.
  * `type` - Type of registration to be created in `country`. Possible values: `standard`.
  """
  @type country_options_za :: %{
          optional(:standard) => country_options_za_standard() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `place_of_supply_scheme` - Place of supply scheme used in an standard registration. Possible values: `inbound_goods`, `standard`.
  """
  @type country_options_za_standard :: %{
          optional(:place_of_supply_scheme) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
  """
  @type country_options_zm :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `standard` - Options for the standard registration.
  * `type` - Type of registration to be created in `country`. Possible values: `standard`.
  """
  @type country_options_zw :: %{
          optional(:standard) => country_options_zw_standard() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `place_of_supply_scheme` - Place of supply scheme used in an standard registration. Possible values: `inbound_goods`, `standard`.
  """
  @type country_options_zw_standard :: %{
          optional(:place_of_supply_scheme) => String.t() | nil,
          optional(String.t()) => term()
        }
end
