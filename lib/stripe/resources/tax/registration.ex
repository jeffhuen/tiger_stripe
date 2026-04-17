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
          country_options: __MODULE__.CountryOptions.t(),
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

  defmodule CountryOptions do
    @moduledoc "Nested struct within the parent resource."

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
            lk: __MODULE__.Lk.t() | nil,
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
      :lk,
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
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `standard`
      * `type` - Type of registration in `country`. Possible values: `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an Default standard registration. Possible values: `inbound_goods`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end

      def __inner_types__ do
        %{
          "standard" => __MODULE__.Standard
        }
      end
    end

    defmodule Al do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `type` - Type of registration in `country`. Possible values: `standard`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Am do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `type` - Type of registration in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Ao do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `type` - Type of registration in `country`. Possible values: `standard`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule At do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `standard`
      * `type` - Type of registration in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end

      def __inner_types__ do
        %{
          "standard" => __MODULE__.Standard
        }
      end
    end

    defmodule Au do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `standard`
      * `type` - Type of registration in `country`. Possible values: `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an Default standard registration. Possible values: `inbound_goods`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end

      def __inner_types__ do
        %{
          "standard" => __MODULE__.Standard
        }
      end
    end

    defmodule Aw do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `type` - Type of registration in `country`. Possible values: `standard`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Az do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `type` - Type of registration in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Ba do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `type` - Type of registration in `country`. Possible values: `standard`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Bb do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `type` - Type of registration in `country`. Possible values: `standard`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Bd do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `type` - Type of registration in `country`. Possible values: `standard`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Be do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `standard`
      * `type` - Type of registration in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end

      def __inner_types__ do
        %{
          "standard" => __MODULE__.Standard
        }
      end
    end

    defmodule Bf do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `type` - Type of registration in `country`. Possible values: `standard`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Bg do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `standard`
      * `type` - Type of registration in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end

      def __inner_types__ do
        %{
          "standard" => __MODULE__.Standard
        }
      end
    end

    defmodule Bh do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `type` - Type of registration in `country`. Possible values: `standard`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Bj do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `type` - Type of registration in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Bs do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `type` - Type of registration in `country`. Possible values: `standard`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule By do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `type` - Type of registration in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Ca do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `province_standard`
      * `type` - Type of registration in Canada. Possible values: `province_standard`, `simplified`, `standard`.
      """
      @type t :: %__MODULE__{
              province_standard: __MODULE__.ProvinceStandard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:province_standard, :type]

      defmodule ProvinceStandard do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `province` - Two-letter CA province code ([ISO 3166-2](https://en.wikipedia.org/wiki/ISO_3166-2)). Max length: 5000.
        """
        @type t :: %__MODULE__{
                province: String.t() | nil
              }
        defstruct [:province]
      end

      def __inner_types__ do
        %{
          "province_standard" => __MODULE__.ProvinceStandard
        }
      end
    end

    defmodule Cd do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `type` - Type of registration in `country`. Possible values: `standard`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Ch do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `standard`
      * `type` - Type of registration in `country`. Possible values: `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an Default standard registration. Possible values: `inbound_goods`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end

      def __inner_types__ do
        %{
          "standard" => __MODULE__.Standard
        }
      end
    end

    defmodule Cl do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `type` - Type of registration in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Cm do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `type` - Type of registration in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Co do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `type` - Type of registration in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Cr do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `type` - Type of registration in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Cv do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `type` - Type of registration in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Cy do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `standard`
      * `type` - Type of registration in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end

      def __inner_types__ do
        %{
          "standard" => __MODULE__.Standard
        }
      end
    end

    defmodule Cz do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `standard`
      * `type` - Type of registration in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end

      def __inner_types__ do
        %{
          "standard" => __MODULE__.Standard
        }
      end
    end

    defmodule De do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `standard`
      * `type` - Type of registration in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end

      def __inner_types__ do
        %{
          "standard" => __MODULE__.Standard
        }
      end
    end

    defmodule Dk do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `standard`
      * `type` - Type of registration in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end

      def __inner_types__ do
        %{
          "standard" => __MODULE__.Standard
        }
      end
    end

    defmodule Ec do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `type` - Type of registration in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Ee do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `standard`
      * `type` - Type of registration in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end

      def __inner_types__ do
        %{
          "standard" => __MODULE__.Standard
        }
      end
    end

    defmodule Eg do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `type` - Type of registration in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Es do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `standard`
      * `type` - Type of registration in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end

      def __inner_types__ do
        %{
          "standard" => __MODULE__.Standard
        }
      end
    end

    defmodule Et do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `type` - Type of registration in `country`. Possible values: `standard`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Fi do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `standard`
      * `type` - Type of registration in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end

      def __inner_types__ do
        %{
          "standard" => __MODULE__.Standard
        }
      end
    end

    defmodule Fr do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `standard`
      * `type` - Type of registration in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end

      def __inner_types__ do
        %{
          "standard" => __MODULE__.Standard
        }
      end
    end

    defmodule Gb do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `standard`
      * `type` - Type of registration in `country`. Possible values: `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an Default standard registration. Possible values: `inbound_goods`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end

      def __inner_types__ do
        %{
          "standard" => __MODULE__.Standard
        }
      end
    end

    defmodule Ge do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `type` - Type of registration in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Gn do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `type` - Type of registration in `country`. Possible values: `standard`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Gr do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `standard`
      * `type` - Type of registration in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end

      def __inner_types__ do
        %{
          "standard" => __MODULE__.Standard
        }
      end
    end

    defmodule Hr do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `standard`
      * `type` - Type of registration in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end

      def __inner_types__ do
        %{
          "standard" => __MODULE__.Standard
        }
      end
    end

    defmodule Hu do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `standard`
      * `type` - Type of registration in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end

      def __inner_types__ do
        %{
          "standard" => __MODULE__.Standard
        }
      end
    end

    defmodule Id do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `type` - Type of registration in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Ie do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `standard`
      * `type` - Type of registration in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end

      def __inner_types__ do
        %{
          "standard" => __MODULE__.Standard
        }
      end
    end

    defmodule In do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `type` - Type of registration in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Is do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `type` - Type of registration in `country`. Possible values: `standard`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule It do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `standard`
      * `type` - Type of registration in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end

      def __inner_types__ do
        %{
          "standard" => __MODULE__.Standard
        }
      end
    end

    defmodule Jp do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `standard`
      * `type` - Type of registration in `country`. Possible values: `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an Default standard registration. Possible values: `inbound_goods`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end

      def __inner_types__ do
        %{
          "standard" => __MODULE__.Standard
        }
      end
    end

    defmodule Ke do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `type` - Type of registration in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Kg do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `type` - Type of registration in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Kh do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `type` - Type of registration in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Kr do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `type` - Type of registration in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Kz do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `type` - Type of registration in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule La do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `type` - Type of registration in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Lk do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `type` - Type of registration in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Lt do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `standard`
      * `type` - Type of registration in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end

      def __inner_types__ do
        %{
          "standard" => __MODULE__.Standard
        }
      end
    end

    defmodule Lu do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `standard`
      * `type` - Type of registration in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end

      def __inner_types__ do
        %{
          "standard" => __MODULE__.Standard
        }
      end
    end

    defmodule Lv do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `standard`
      * `type` - Type of registration in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end

      def __inner_types__ do
        %{
          "standard" => __MODULE__.Standard
        }
      end
    end

    defmodule Ma do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `type` - Type of registration in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Md do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `type` - Type of registration in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Me do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `type` - Type of registration in `country`. Possible values: `standard`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Mk do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `type` - Type of registration in `country`. Possible values: `standard`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Mr do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `type` - Type of registration in `country`. Possible values: `standard`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Mt do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `standard`
      * `type` - Type of registration in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end

      def __inner_types__ do
        %{
          "standard" => __MODULE__.Standard
        }
      end
    end

    defmodule Mx do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `type` - Type of registration in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule My do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `type` - Type of registration in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Ng do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `type` - Type of registration in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Nl do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `standard`
      * `type` - Type of registration in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end

      def __inner_types__ do
        %{
          "standard" => __MODULE__.Standard
        }
      end
    end

    defmodule No do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `standard`
      * `type` - Type of registration in `country`. Possible values: `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an Default standard registration. Possible values: `inbound_goods`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end

      def __inner_types__ do
        %{
          "standard" => __MODULE__.Standard
        }
      end
    end

    defmodule Np do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `type` - Type of registration in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Nz do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `standard`
      * `type` - Type of registration in `country`. Possible values: `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an Default standard registration. Possible values: `inbound_goods`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end

      def __inner_types__ do
        %{
          "standard" => __MODULE__.Standard
        }
      end
    end

    defmodule Om do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `type` - Type of registration in `country`. Possible values: `standard`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Pe do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `type` - Type of registration in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Ph do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `type` - Type of registration in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Pl do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `standard`
      * `type` - Type of registration in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end

      def __inner_types__ do
        %{
          "standard" => __MODULE__.Standard
        }
      end
    end

    defmodule Pt do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `standard`
      * `type` - Type of registration in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end

      def __inner_types__ do
        %{
          "standard" => __MODULE__.Standard
        }
      end
    end

    defmodule Ro do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `standard`
      * `type` - Type of registration in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end

      def __inner_types__ do
        %{
          "standard" => __MODULE__.Standard
        }
      end
    end

    defmodule Rs do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `type` - Type of registration in `country`. Possible values: `standard`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Ru do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `type` - Type of registration in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Sa do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `type` - Type of registration in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Se do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `standard`
      * `type` - Type of registration in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end

      def __inner_types__ do
        %{
          "standard" => __MODULE__.Standard
        }
      end
    end

    defmodule Sg do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `standard`
      * `type` - Type of registration in `country`. Possible values: `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an Default standard registration. Possible values: `inbound_goods`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end

      def __inner_types__ do
        %{
          "standard" => __MODULE__.Standard
        }
      end
    end

    defmodule Si do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `standard`
      * `type` - Type of registration in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end

      def __inner_types__ do
        %{
          "standard" => __MODULE__.Standard
        }
      end
    end

    defmodule Sk do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `standard`
      * `type` - Type of registration in an EU country. Possible values: `ioss`, `oss_non_union`, `oss_union`, `standard`.
      """
      @type t :: %__MODULE__{
              standard: __MODULE__.Standard.t() | nil,
              type: String.t() | nil
            }
      defstruct [:standard, :type]

      defmodule Standard do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `place_of_supply_scheme` - Place of supply scheme used in an EU standard registration. Possible values: `inbound_goods`, `small_seller`, `standard`.
        """
        @type t :: %__MODULE__{
                place_of_supply_scheme: String.t() | nil
              }
        defstruct [:place_of_supply_scheme]
      end

      def __inner_types__ do
        %{
          "standard" => __MODULE__.Standard
        }
      end
    end

    defmodule Sn do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `type` - Type of registration in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Sr do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `type` - Type of registration in `country`. Possible values: `standard`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Th do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `type` - Type of registration in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Tj do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `type` - Type of registration in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Tr do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `type` - Type of registration in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Tw do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `type` - Type of registration in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Tz do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `type` - Type of registration in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Ua do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `type` - Type of registration in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Ug do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `type` - Type of registration in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Us do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `local_amusement_tax`
      * `local_lease_tax`
      * `state` - Two-letter US state code ([ISO 3166-2](https://en.wikipedia.org/wiki/ISO_3166-2)). Max length: 5000.
      * `state_sales_tax`
      * `type` - Type of registration in the US. Possible values: `local_amusement_tax`, `local_lease_tax`, `state_communications_tax`, `state_retail_delivery_fee`, `state_sales_tax`.
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
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `jurisdiction` - A [FIPS code](https://www.census.gov/library/reference/code-lists/ansi.html) representing the local jurisdiction. Max length: 5000.
        """
        @type t :: %__MODULE__{
                jurisdiction: String.t() | nil
              }
        defstruct [:jurisdiction]
      end

      defmodule LocalLeaseTax do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `jurisdiction` - A [FIPS code](https://www.census.gov/library/reference/code-lists/ansi.html) representing the local jurisdiction. Max length: 5000.
        """
        @type t :: %__MODULE__{
                jurisdiction: String.t() | nil
              }
        defstruct [:jurisdiction]
      end

      defmodule StateSalesTax do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `elections` - Elections for the state sales tax registration.
        """
        @type t :: %__MODULE__{
                elections: [__MODULE__.Elections.t()] | nil
              }
        defstruct [:elections]

        defmodule Elections do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `jurisdiction` - A [FIPS code](https://www.census.gov/library/reference/code-lists/ansi.html) representing the local jurisdiction. Max length: 5000.
          * `type` - The type of the election for the state sales tax registration. Possible values: `local_use_tax`, `simplified_sellers_use_tax`, `single_local_use_tax`.
          """
          @type t :: %__MODULE__{
                  jurisdiction: String.t() | nil,
                  type: String.t() | nil
                }
          defstruct [:jurisdiction, :type]
        end

        def __inner_types__ do
          %{
            "elections" => __MODULE__.Elections
          }
        end
      end

      def __inner_types__ do
        %{
          "local_amusement_tax" => __MODULE__.LocalAmusementTax,
          "local_lease_tax" => __MODULE__.LocalLeaseTax,
          "state_sales_tax" => __MODULE__.StateSalesTax
        }
      end
    end

    defmodule Uy do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `type` - Type of registration in `country`. Possible values: `standard`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Uz do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `type` - Type of registration in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Vn do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `type` - Type of registration in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Za do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `type` - Type of registration in `country`. Possible values: `standard`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Zm do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `type` - Type of registration in `country`. Possible values: `simplified`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    defmodule Zw do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `type` - Type of registration in `country`. Possible values: `standard`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    def __inner_types__ do
      %{
        "ae" => __MODULE__.Ae,
        "al" => __MODULE__.Al,
        "am" => __MODULE__.Am,
        "ao" => __MODULE__.Ao,
        "at" => __MODULE__.At,
        "au" => __MODULE__.Au,
        "aw" => __MODULE__.Aw,
        "az" => __MODULE__.Az,
        "ba" => __MODULE__.Ba,
        "bb" => __MODULE__.Bb,
        "bd" => __MODULE__.Bd,
        "be" => __MODULE__.Be,
        "bf" => __MODULE__.Bf,
        "bg" => __MODULE__.Bg,
        "bh" => __MODULE__.Bh,
        "bj" => __MODULE__.Bj,
        "bs" => __MODULE__.Bs,
        "by" => __MODULE__.By,
        "ca" => __MODULE__.Ca,
        "cd" => __MODULE__.Cd,
        "ch" => __MODULE__.Ch,
        "cl" => __MODULE__.Cl,
        "cm" => __MODULE__.Cm,
        "co" => __MODULE__.Co,
        "cr" => __MODULE__.Cr,
        "cv" => __MODULE__.Cv,
        "cy" => __MODULE__.Cy,
        "cz" => __MODULE__.Cz,
        "de" => __MODULE__.De,
        "dk" => __MODULE__.Dk,
        "ec" => __MODULE__.Ec,
        "ee" => __MODULE__.Ee,
        "eg" => __MODULE__.Eg,
        "es" => __MODULE__.Es,
        "et" => __MODULE__.Et,
        "fi" => __MODULE__.Fi,
        "fr" => __MODULE__.Fr,
        "gb" => __MODULE__.Gb,
        "ge" => __MODULE__.Ge,
        "gn" => __MODULE__.Gn,
        "gr" => __MODULE__.Gr,
        "hr" => __MODULE__.Hr,
        "hu" => __MODULE__.Hu,
        "id" => __MODULE__.Id,
        "ie" => __MODULE__.Ie,
        "in" => __MODULE__.In,
        "is" => __MODULE__.Is,
        "it" => __MODULE__.It,
        "jp" => __MODULE__.Jp,
        "ke" => __MODULE__.Ke,
        "kg" => __MODULE__.Kg,
        "kh" => __MODULE__.Kh,
        "kr" => __MODULE__.Kr,
        "kz" => __MODULE__.Kz,
        "la" => __MODULE__.La,
        "lk" => __MODULE__.Lk,
        "lt" => __MODULE__.Lt,
        "lu" => __MODULE__.Lu,
        "lv" => __MODULE__.Lv,
        "ma" => __MODULE__.Ma,
        "md" => __MODULE__.Md,
        "me" => __MODULE__.Me,
        "mk" => __MODULE__.Mk,
        "mr" => __MODULE__.Mr,
        "mt" => __MODULE__.Mt,
        "mx" => __MODULE__.Mx,
        "my" => __MODULE__.My,
        "ng" => __MODULE__.Ng,
        "nl" => __MODULE__.Nl,
        "no" => __MODULE__.No,
        "np" => __MODULE__.Np,
        "nz" => __MODULE__.Nz,
        "om" => __MODULE__.Om,
        "pe" => __MODULE__.Pe,
        "ph" => __MODULE__.Ph,
        "pl" => __MODULE__.Pl,
        "pt" => __MODULE__.Pt,
        "ro" => __MODULE__.Ro,
        "rs" => __MODULE__.Rs,
        "ru" => __MODULE__.Ru,
        "sa" => __MODULE__.Sa,
        "se" => __MODULE__.Se,
        "sg" => __MODULE__.Sg,
        "si" => __MODULE__.Si,
        "sk" => __MODULE__.Sk,
        "sn" => __MODULE__.Sn,
        "sr" => __MODULE__.Sr,
        "th" => __MODULE__.Th,
        "tj" => __MODULE__.Tj,
        "tr" => __MODULE__.Tr,
        "tw" => __MODULE__.Tw,
        "tz" => __MODULE__.Tz,
        "ua" => __MODULE__.Ua,
        "ug" => __MODULE__.Ug,
        "us" => __MODULE__.Us,
        "uy" => __MODULE__.Uy,
        "uz" => __MODULE__.Uz,
        "vn" => __MODULE__.Vn,
        "za" => __MODULE__.Za,
        "zm" => __MODULE__.Zm,
        "zw" => __MODULE__.Zw
      }
    end
  end

  def __inner_types__ do
    %{
      "country_options" => __MODULE__.CountryOptions
    }
  end
end
