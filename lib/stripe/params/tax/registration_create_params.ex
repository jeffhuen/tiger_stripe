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
          country_options: __MODULE__.CountryOptions.t(),
          expand: [String.t()] | nil,
          expires_at: integer() | nil
        }

  defstruct [:active_from, :country, :country_options, :expand, :expires_at]

  defmodule CountryOptions do
    @moduledoc "Nested parameters."

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
    @type t :: %__MODULE__{
            ae: __MODULE__.Ae.t() | nil,
            al: __MODULE__.Al.t() | nil,
            am: __MODULE__.Am.t() | nil,
            ao: __MODULE__.Ao.t() | nil,
            at: __MODULE__.At.t() | nil,
            au: __MODULE__.Au.t() | nil,
            aw: __MODULE__.Aw.t() | nil,
            az: __MODULE__.Az.t() | nil,
            ba: __MODULE__.Ba.t() | nil,
            bb: __MODULE__.Bb.t() | nil,
            bd: __MODULE__.Bd.t() | nil,
            be: __MODULE__.Be.t() | nil,
            bf: __MODULE__.Bf.t() | nil,
            bg: __MODULE__.Bg.t() | nil,
            bh: __MODULE__.Bh.t() | nil,
            bj: __MODULE__.Bj.t() | nil,
            bs: __MODULE__.Bs.t() | nil,
            by: __MODULE__.By.t() | nil,
            ca: __MODULE__.Ca.t() | nil,
            cd: __MODULE__.Cd.t() | nil,
            ch: __MODULE__.Ch.t() | nil,
            cl: __MODULE__.Cl.t() | nil,
            cm: __MODULE__.Cm.t() | nil,
            co: __MODULE__.Co.t() | nil,
            cr: __MODULE__.Cr.t() | nil,
            cv: __MODULE__.Cv.t() | nil,
            cy: __MODULE__.Cy.t() | nil,
            cz: __MODULE__.Cz.t() | nil,
            de: __MODULE__.De.t() | nil,
            dk: __MODULE__.Dk.t() | nil,
            ec: __MODULE__.Ec.t() | nil,
            ee: __MODULE__.Ee.t() | nil,
            eg: __MODULE__.Eg.t() | nil,
            es: __MODULE__.Es.t() | nil,
            et: __MODULE__.Et.t() | nil,
            fi: __MODULE__.Fi.t() | nil,
            fr: __MODULE__.Fr.t() | nil,
            gb: __MODULE__.Gb.t() | nil,
            ge: __MODULE__.Ge.t() | nil,
            gn: __MODULE__.Gn.t() | nil,
            gr: __MODULE__.Gr.t() | nil,
            hr: __MODULE__.Hr.t() | nil,
            hu: __MODULE__.Hu.t() | nil,
            id: __MODULE__.Id.t() | nil,
            ie: __MODULE__.Ie.t() | nil,
            in: __MODULE__.In.t() | nil,
            is: __MODULE__.Is.t() | nil,
            it: __MODULE__.It.t() | nil,
            jp: __MODULE__.Jp.t() | nil,
            ke: __MODULE__.Ke.t() | nil,
            kg: __MODULE__.Kg.t() | nil,
            kh: __MODULE__.Kh.t() | nil,
            kr: __MODULE__.Kr.t() | nil,
            kz: __MODULE__.Kz.t() | nil,
            la: __MODULE__.La.t() | nil,
            lt: __MODULE__.Lt.t() | nil,
            lu: __MODULE__.Lu.t() | nil,
            lv: __MODULE__.Lv.t() | nil,
            ma: __MODULE__.Ma.t() | nil,
            md: __MODULE__.Md.t() | nil,
            me: __MODULE__.Me.t() | nil,
            mk: __MODULE__.Mk.t() | nil,
            mr: __MODULE__.Mr.t() | nil,
            mt: __MODULE__.Mt.t() | nil,
            mx: __MODULE__.Mx.t() | nil,
            my: __MODULE__.My.t() | nil,
            ng: __MODULE__.Ng.t() | nil,
            nl: __MODULE__.Nl.t() | nil,
            no: __MODULE__.No.t() | nil,
            np: __MODULE__.Np.t() | nil,
            nz: __MODULE__.Nz.t() | nil,
            om: __MODULE__.Om.t() | nil,
            pe: __MODULE__.Pe.t() | nil,
            ph: __MODULE__.Ph.t() | nil,
            pl: __MODULE__.Pl.t() | nil,
            pt: __MODULE__.Pt.t() | nil,
            ro: __MODULE__.Ro.t() | nil,
            rs: __MODULE__.Rs.t() | nil,
            ru: __MODULE__.Ru.t() | nil,
            sa: __MODULE__.Sa.t() | nil,
            se: __MODULE__.Se.t() | nil,
            sg: __MODULE__.Sg.t() | nil,
            si: __MODULE__.Si.t() | nil,
            sk: __MODULE__.Sk.t() | nil,
            sn: __MODULE__.Sn.t() | nil,
            sr: __MODULE__.Sr.t() | nil,
            th: __MODULE__.Th.t() | nil,
            tj: __MODULE__.Tj.t() | nil,
            tr: __MODULE__.Tr.t() | nil,
            tw: __MODULE__.Tw.t() | nil,
            tz: __MODULE__.Tz.t() | nil,
            ua: __MODULE__.Ua.t() | nil,
            ug: __MODULE__.Ug.t() | nil,
            us: __MODULE__.Us.t() | nil,
            uy: __MODULE__.Uy.t() | nil,
            uz: __MODULE__.Uz.t() | nil,
            vn: __MODULE__.Vn.t() | nil,
            za: __MODULE__.Za.t() | nil,
            zm: __MODULE__.Zm.t() | nil,
            zw: __MODULE__.Zw.t() | nil
          }
    defstruct [
      :ae,
      :al,
      :am,
      :ao,
      :at,
      :au,
      :aw,
      :az,
      :ba,
      :bb,
      :bd,
      :be,
      :bf,
      :bg,
      :bh,
      :bj,
      :bs,
      :by,
      :ca,
      :cd,
      :ch,
      :cl,
      :cm,
      :co,
      :cr,
      :cv,
      :cy,
      :cz,
      :de,
      :dk,
      :ec,
      :ee,
      :eg,
      :es,
      :et,
      :fi,
      :fr,
      :gb,
      :ge,
      :gn,
      :gr,
      :hr,
      :hu,
      :id,
      :ie,
      :in,
      :is,
      :it,
      :jp,
      :ke,
      :kg,
      :kh,
      :kr,
      :kz,
      :la,
      :lt,
      :lu,
      :lv,
      :ma,
      :md,
      :me,
      :mk,
      :mr,
      :mt,
      :mx,
      :my,
      :ng,
      :nl,
      :no,
      :np,
      :nz,
      :om,
      :pe,
      :ph,
      :pl,
      :pt,
      :ro,
      :rs,
      :ru,
      :sa,
      :se,
      :sg,
      :si,
      :sk,
      :sn,
      :sr,
      :th,
      :tj,
      :tr,
      :tw,
      :tz,
      :ua,
      :ug,
      :us,
      :uy,
      :uz,
      :vn,
      :za,
      :zm,
      :zw
    ]

    defmodule Ae do
      @moduledoc "Nested parameters."

      @typedoc """
      * `standard` - Options for the standard registration.
      * `type` - Type of registration to be created in `country`. Possible values: `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested parameters."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an standard registration. Possible values: `inbound_goods`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end
    end

    defmodule Al do
      @moduledoc "Nested parameters."

      @typedoc """
      * `standard` - Options for the standard registration.
      * `type` - Type of registration to be created in `country`. Possible values: `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested parameters."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an standard registration. Possible values: `inbound_goods`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end
    end

    defmodule Am do
      @moduledoc "Nested parameters."

      @typedoc """
      * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Ao do
      @moduledoc "Nested parameters."

      @typedoc """
      * `standard` - Options for the standard registration.
      * `type` - Type of registration to be created in `country`. Possible values: `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested parameters."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an standard registration. Possible values: `inbound_goods`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end
    end

    defmodule At do
      @moduledoc "Nested parameters."

      @typedoc """
      * `standard` - Options for the standard registration.
      * `type` - Type of registration to be created in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested parameters."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end
    end

    defmodule Au do
      @moduledoc "Nested parameters."

      @typedoc """
      * `standard` - Options for the standard registration.
      * `type` - Type of registration to be created in `country`. Possible values: `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested parameters."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an standard registration. Possible values: `inbound_goods`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end
    end

    defmodule Aw do
      @moduledoc "Nested parameters."

      @typedoc """
      * `standard` - Options for the standard registration.
      * `type` - Type of registration to be created in `country`. Possible values: `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested parameters."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an standard registration. Possible values: `inbound_goods`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end
    end

    defmodule Az do
      @moduledoc "Nested parameters."

      @typedoc """
      * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Ba do
      @moduledoc "Nested parameters."

      @typedoc """
      * `standard` - Options for the standard registration.
      * `type` - Type of registration to be created in `country`. Possible values: `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested parameters."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an standard registration. Possible values: `inbound_goods`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end
    end

    defmodule Bb do
      @moduledoc "Nested parameters."

      @typedoc """
      * `standard` - Options for the standard registration.
      * `type` - Type of registration to be created in `country`. Possible values: `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested parameters."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an standard registration. Possible values: `inbound_goods`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end
    end

    defmodule Bd do
      @moduledoc "Nested parameters."

      @typedoc """
      * `standard` - Options for the standard registration.
      * `type` - Type of registration to be created in `country`. Possible values: `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested parameters."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an standard registration. Possible values: `inbound_goods`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end
    end

    defmodule Be do
      @moduledoc "Nested parameters."

      @typedoc """
      * `standard` - Options for the standard registration.
      * `type` - Type of registration to be created in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested parameters."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end
    end

    defmodule Bf do
      @moduledoc "Nested parameters."

      @typedoc """
      * `standard` - Options for the standard registration.
      * `type` - Type of registration to be created in `country`. Possible values: `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested parameters."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an standard registration. Possible values: `inbound_goods`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end
    end

    defmodule Bg do
      @moduledoc "Nested parameters."

      @typedoc """
      * `standard` - Options for the standard registration.
      * `type` - Type of registration to be created in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested parameters."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end
    end

    defmodule Bh do
      @moduledoc "Nested parameters."

      @typedoc """
      * `standard` - Options for the standard registration.
      * `type` - Type of registration to be created in `country`. Possible values: `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested parameters."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an standard registration. Possible values: `inbound_goods`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end
    end

    defmodule Bj do
      @moduledoc "Nested parameters."

      @typedoc """
      * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Bs do
      @moduledoc "Nested parameters."

      @typedoc """
      * `standard` - Options for the standard registration.
      * `type` - Type of registration to be created in `country`. Possible values: `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested parameters."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an standard registration. Possible values: `inbound_goods`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end
    end

    defmodule By do
      @moduledoc "Nested parameters."

      @typedoc """
      * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Ca do
      @moduledoc "Nested parameters."

      @typedoc """
      * `province_standard` - Options for the provincial tax registration.
      * `type` - Type of registration to be created in Canada. Possible values: `province_standard`, `simplified`, `standard`.
      """
      @type t :: %__MODULE__{
              province_standard: __MODULE__.ProvinceStandard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:province_standard, :type]

      defmodule ProvinceStandard do
        @moduledoc "Nested parameters."

        @typedoc """
        * `province` - Two-letter CA province code ([ISO 3166-2](https://en.wikipedia.org/wiki/ISO_3166-2)). Max length: 5000.
        """
        @type t :: %__MODULE__{
                province: String.t() | nil
              }
        defstruct [:province]
      end
    end

    defmodule Cd do
      @moduledoc "Nested parameters."

      @typedoc """
      * `standard` - Options for the standard registration.
      * `type` - Type of registration to be created in `country`. Possible values: `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested parameters."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an standard registration. Possible values: `inbound_goods`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end
    end

    defmodule Ch do
      @moduledoc "Nested parameters."

      @typedoc """
      * `standard` - Options for the standard registration.
      * `type` - Type of registration to be created in `country`. Possible values: `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested parameters."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an standard registration. Possible values: `inbound_goods`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end
    end

    defmodule Cl do
      @moduledoc "Nested parameters."

      @typedoc """
      * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Cm do
      @moduledoc "Nested parameters."

      @typedoc """
      * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Co do
      @moduledoc "Nested parameters."

      @typedoc """
      * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Cr do
      @moduledoc "Nested parameters."

      @typedoc """
      * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Cv do
      @moduledoc "Nested parameters."

      @typedoc """
      * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Cy do
      @moduledoc "Nested parameters."

      @typedoc """
      * `standard` - Options for the standard registration.
      * `type` - Type of registration to be created in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested parameters."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end
    end

    defmodule Cz do
      @moduledoc "Nested parameters."

      @typedoc """
      * `standard` - Options for the standard registration.
      * `type` - Type of registration to be created in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested parameters."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end
    end

    defmodule De do
      @moduledoc "Nested parameters."

      @typedoc """
      * `standard` - Options for the standard registration.
      * `type` - Type of registration to be created in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested parameters."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end
    end

    defmodule Dk do
      @moduledoc "Nested parameters."

      @typedoc """
      * `standard` - Options for the standard registration.
      * `type` - Type of registration to be created in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested parameters."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end
    end

    defmodule Ec do
      @moduledoc "Nested parameters."

      @typedoc """
      * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Ee do
      @moduledoc "Nested parameters."

      @typedoc """
      * `standard` - Options for the standard registration.
      * `type` - Type of registration to be created in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested parameters."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end
    end

    defmodule Eg do
      @moduledoc "Nested parameters."

      @typedoc """
      * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Es do
      @moduledoc "Nested parameters."

      @typedoc """
      * `standard` - Options for the standard registration.
      * `type` - Type of registration to be created in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested parameters."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end
    end

    defmodule Et do
      @moduledoc "Nested parameters."

      @typedoc """
      * `standard` - Options for the standard registration.
      * `type` - Type of registration to be created in `country`. Possible values: `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested parameters."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an standard registration. Possible values: `inbound_goods`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end
    end

    defmodule Fi do
      @moduledoc "Nested parameters."

      @typedoc """
      * `standard` - Options for the standard registration.
      * `type` - Type of registration to be created in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested parameters."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end
    end

    defmodule Fr do
      @moduledoc "Nested parameters."

      @typedoc """
      * `standard` - Options for the standard registration.
      * `type` - Type of registration to be created in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested parameters."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end
    end

    defmodule Gb do
      @moduledoc "Nested parameters."

      @typedoc """
      * `standard` - Options for the standard registration.
      * `type` - Type of registration to be created in `country`. Possible values: `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested parameters."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an standard registration. Possible values: `inbound_goods`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end
    end

    defmodule Ge do
      @moduledoc "Nested parameters."

      @typedoc """
      * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Gn do
      @moduledoc "Nested parameters."

      @typedoc """
      * `standard` - Options for the standard registration.
      * `type` - Type of registration to be created in `country`. Possible values: `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested parameters."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an standard registration. Possible values: `inbound_goods`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end
    end

    defmodule Gr do
      @moduledoc "Nested parameters."

      @typedoc """
      * `standard` - Options for the standard registration.
      * `type` - Type of registration to be created in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested parameters."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end
    end

    defmodule Hr do
      @moduledoc "Nested parameters."

      @typedoc """
      * `standard` - Options for the standard registration.
      * `type` - Type of registration to be created in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested parameters."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end
    end

    defmodule Hu do
      @moduledoc "Nested parameters."

      @typedoc """
      * `standard` - Options for the standard registration.
      * `type` - Type of registration to be created in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested parameters."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end
    end

    defmodule Id do
      @moduledoc "Nested parameters."

      @typedoc """
      * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Ie do
      @moduledoc "Nested parameters."

      @typedoc """
      * `standard` - Options for the standard registration.
      * `type` - Type of registration to be created in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested parameters."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end
    end

    defmodule In do
      @moduledoc "Nested parameters."

      @typedoc """
      * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Is do
      @moduledoc "Nested parameters."

      @typedoc """
      * `standard` - Options for the standard registration.
      * `type` - Type of registration to be created in `country`. Possible values: `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested parameters."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an standard registration. Possible values: `inbound_goods`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end
    end

    defmodule It do
      @moduledoc "Nested parameters."

      @typedoc """
      * `standard` - Options for the standard registration.
      * `type` - Type of registration to be created in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested parameters."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end
    end

    defmodule Jp do
      @moduledoc "Nested parameters."

      @typedoc """
      * `standard` - Options for the standard registration.
      * `type` - Type of registration to be created in `country`. Possible values: `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested parameters."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an standard registration. Possible values: `inbound_goods`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end
    end

    defmodule Ke do
      @moduledoc "Nested parameters."

      @typedoc """
      * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Kg do
      @moduledoc "Nested parameters."

      @typedoc """
      * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Kh do
      @moduledoc "Nested parameters."

      @typedoc """
      * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Kr do
      @moduledoc "Nested parameters."

      @typedoc """
      * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Kz do
      @moduledoc "Nested parameters."

      @typedoc """
      * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule La do
      @moduledoc "Nested parameters."

      @typedoc """
      * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Lt do
      @moduledoc "Nested parameters."

      @typedoc """
      * `standard` - Options for the standard registration.
      * `type` - Type of registration to be created in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested parameters."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end
    end

    defmodule Lu do
      @moduledoc "Nested parameters."

      @typedoc """
      * `standard` - Options for the standard registration.
      * `type` - Type of registration to be created in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested parameters."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end
    end

    defmodule Lv do
      @moduledoc "Nested parameters."

      @typedoc """
      * `standard` - Options for the standard registration.
      * `type` - Type of registration to be created in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested parameters."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end
    end

    defmodule Ma do
      @moduledoc "Nested parameters."

      @typedoc """
      * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Md do
      @moduledoc "Nested parameters."

      @typedoc """
      * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Me do
      @moduledoc "Nested parameters."

      @typedoc """
      * `standard` - Options for the standard registration.
      * `type` - Type of registration to be created in `country`. Possible values: `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested parameters."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an standard registration. Possible values: `inbound_goods`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end
    end

    defmodule Mk do
      @moduledoc "Nested parameters."

      @typedoc """
      * `standard` - Options for the standard registration.
      * `type` - Type of registration to be created in `country`. Possible values: `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested parameters."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an standard registration. Possible values: `inbound_goods`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end
    end

    defmodule Mr do
      @moduledoc "Nested parameters."

      @typedoc """
      * `standard` - Options for the standard registration.
      * `type` - Type of registration to be created in `country`. Possible values: `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested parameters."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an standard registration. Possible values: `inbound_goods`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end
    end

    defmodule Mt do
      @moduledoc "Nested parameters."

      @typedoc """
      * `standard` - Options for the standard registration.
      * `type` - Type of registration to be created in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested parameters."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end
    end

    defmodule Mx do
      @moduledoc "Nested parameters."

      @typedoc """
      * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule My do
      @moduledoc "Nested parameters."

      @typedoc """
      * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Ng do
      @moduledoc "Nested parameters."

      @typedoc """
      * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Nl do
      @moduledoc "Nested parameters."

      @typedoc """
      * `standard` - Options for the standard registration.
      * `type` - Type of registration to be created in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested parameters."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end
    end

    defmodule No do
      @moduledoc "Nested parameters."

      @typedoc """
      * `standard` - Options for the standard registration.
      * `type` - Type of registration to be created in `country`. Possible values: `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested parameters."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an standard registration. Possible values: `inbound_goods`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end
    end

    defmodule Np do
      @moduledoc "Nested parameters."

      @typedoc """
      * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Nz do
      @moduledoc "Nested parameters."

      @typedoc """
      * `standard` - Options for the standard registration.
      * `type` - Type of registration to be created in `country`. Possible values: `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested parameters."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an standard registration. Possible values: `inbound_goods`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end
    end

    defmodule Om do
      @moduledoc "Nested parameters."

      @typedoc """
      * `standard` - Options for the standard registration.
      * `type` - Type of registration to be created in `country`. Possible values: `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested parameters."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an standard registration. Possible values: `inbound_goods`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end
    end

    defmodule Pe do
      @moduledoc "Nested parameters."

      @typedoc """
      * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Ph do
      @moduledoc "Nested parameters."

      @typedoc """
      * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Pl do
      @moduledoc "Nested parameters."

      @typedoc """
      * `standard` - Options for the standard registration.
      * `type` - Type of registration to be created in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested parameters."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end
    end

    defmodule Pt do
      @moduledoc "Nested parameters."

      @typedoc """
      * `standard` - Options for the standard registration.
      * `type` - Type of registration to be created in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested parameters."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end
    end

    defmodule Ro do
      @moduledoc "Nested parameters."

      @typedoc """
      * `standard` - Options for the standard registration.
      * `type` - Type of registration to be created in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested parameters."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end
    end

    defmodule Rs do
      @moduledoc "Nested parameters."

      @typedoc """
      * `standard` - Options for the standard registration.
      * `type` - Type of registration to be created in `country`. Possible values: `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested parameters."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an standard registration. Possible values: `inbound_goods`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end
    end

    defmodule Ru do
      @moduledoc "Nested parameters."

      @typedoc """
      * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Sa do
      @moduledoc "Nested parameters."

      @typedoc """
      * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Se do
      @moduledoc "Nested parameters."

      @typedoc """
      * `standard` - Options for the standard registration.
      * `type` - Type of registration to be created in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested parameters."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end
    end

    defmodule Sg do
      @moduledoc "Nested parameters."

      @typedoc """
      * `standard` - Options for the standard registration.
      * `type` - Type of registration to be created in `country`. Possible values: `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested parameters."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an standard registration. Possible values: `inbound_goods`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end
    end

    defmodule Si do
      @moduledoc "Nested parameters."

      @typedoc """
      * `standard` - Options for the standard registration.
      * `type` - Type of registration to be created in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested parameters."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end
    end

    defmodule Sk do
      @moduledoc "Nested parameters."

      @typedoc """
      * `standard` - Options for the standard registration.
      * `type` - Type of registration to be created in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested parameters."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end
    end

    defmodule Sn do
      @moduledoc "Nested parameters."

      @typedoc """
      * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Sr do
      @moduledoc "Nested parameters."

      @typedoc """
      * `standard` - Options for the standard registration.
      * `type` - Type of registration to be created in `country`. Possible values: `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested parameters."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an standard registration. Possible values: `inbound_goods`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end
    end

    defmodule Th do
      @moduledoc "Nested parameters."

      @typedoc """
      * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Tj do
      @moduledoc "Nested parameters."

      @typedoc """
      * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Tr do
      @moduledoc "Nested parameters."

      @typedoc """
      * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Tw do
      @moduledoc "Nested parameters."

      @typedoc """
      * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Tz do
      @moduledoc "Nested parameters."

      @typedoc """
      * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Ua do
      @moduledoc "Nested parameters."

      @typedoc """
      * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Ug do
      @moduledoc "Nested parameters."

      @typedoc """
      * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Us do
      @moduledoc "Nested parameters."

      @typedoc """
      * `local_amusement_tax` - Options for the local amusement tax registration.
      * `local_lease_tax` - Options for the local lease tax registration.
      * `state` - Two-letter US state code ([ISO 3166-2](https://en.wikipedia.org/wiki/ISO_3166-2)). Max length: 5000.
      * `state_sales_tax` - Options for the state sales tax registration.
      * `type` - Type of registration to be created in the US. Possible values: `local_amusement_tax`, `local_lease_tax`, `state_communications_tax`, `state_retail_delivery_fee`, `state_sales_tax`.
      """
      @type t :: %__MODULE__{
              local_amusement_tax: __MODULE__.LocalAmusementTax.t() | nil,
              local_lease_tax: __MODULE__.LocalLeaseTax.t() | nil,
              state: String.t() | nil,
              state_sales_tax: __MODULE__.StateSalesTax.t() | nil,
              type: String.t() | nil
            }
      defstruct [:local_amusement_tax, :local_lease_tax, :state, :state_sales_tax, :type]

      defmodule LocalAmusementTax do
        @moduledoc "Nested parameters."

        @typedoc """
        * `jurisdiction` - A [FIPS code](https://www.census.gov/library/reference/code-lists/ansi.html) representing the local jurisdiction. Supported FIPS codes are: `14000` (Chicago), `02154` (Arlington Heights), `06613` (Bloomington), `10906` (Campton Hills), `21696` (East Dundee), `24582` (Evanston), `45421` (Lynwood), `48892` (Midlothian), `64343` (River Grove), and `68081` (Schiller Park). Max length: 5000.
        """
        @type t :: %__MODULE__{
                jurisdiction: String.t() | nil
              }
        defstruct [:jurisdiction]
      end

      defmodule LocalLeaseTax do
        @moduledoc "Nested parameters."

        @typedoc """
        * `jurisdiction` - A [FIPS code](https://www.census.gov/library/reference/code-lists/ansi.html) representing the local jurisdiction. Supported FIPS codes are: `14000` (Chicago). Max length: 5000.
        """
        @type t :: %__MODULE__{
                jurisdiction: String.t() | nil
              }
        defstruct [:jurisdiction]
      end

      defmodule StateSalesTax do
        @moduledoc "Nested parameters."

        @typedoc """
        * `elections` - Elections for the state sales tax registration.
        """
        @type t :: %__MODULE__{
                elections: [__MODULE__.Elections.t()] | nil
              }
        defstruct [:elections]

        defmodule Elections do
          @moduledoc "Nested parameters."

          @typedoc """
          * `jurisdiction` - A [FIPS code](https://www.census.gov/library/reference/code-lists/ansi.html) representing the local jurisdiction. Supported FIPS codes are: `003` (Allegheny County) and `60000` (Philadelphia City). Max length: 5000.
          * `type` - The type of the election for the state sales tax registration. Possible values: `local_use_tax`, `simplified_sellers_use_tax`, `single_local_use_tax`.
          """
          @type t :: %__MODULE__{
                  jurisdiction: String.t() | nil,
                  type: String.t() | nil
                }
          defstruct [:jurisdiction, :type]
        end
      end
    end

    defmodule Uy do
      @moduledoc "Nested parameters."

      @typedoc """
      * `standard` - Options for the standard registration.
      * `type` - Type of registration to be created in `country`. Possible values: `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested parameters."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an standard registration. Possible values: `inbound_goods`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end
    end

    defmodule Uz do
      @moduledoc "Nested parameters."

      @typedoc """
      * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Vn do
      @moduledoc "Nested parameters."

      @typedoc """
      * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Za do
      @moduledoc "Nested parameters."

      @typedoc """
      * `standard` - Options for the standard registration.
      * `type` - Type of registration to be created in `country`. Possible values: `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested parameters."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an standard registration. Possible values: `inbound_goods`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end
    end

    defmodule Zm do
      @moduledoc "Nested parameters."

      @typedoc """
      * `type` - Type of registration to be created in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Zw do
      @moduledoc "Nested parameters."

      @typedoc """
      * `standard` - Options for the standard registration.
      * `type` - Type of registration to be created in `country`. Possible values: `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested parameters."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an standard registration. Possible values: `inbound_goods`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end
    end
  end
end
