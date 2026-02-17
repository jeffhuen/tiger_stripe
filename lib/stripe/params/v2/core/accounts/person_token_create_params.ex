# File generated from our OpenAPI spec
defmodule Stripe.Params.V2.Core.Accounts.PersonTokenCreateParams do
  @moduledoc "Parameters for person token create."

  @typedoc """
  * `additional_addresses` - Additional addresses associated with the person.
  * `additional_names` - Additional names (e.g. aliases) associated with the person.
  * `additional_terms_of_service` - Attestations of accepted terms of service agreements.
  * `address` - The person's residential address.
  * `date_of_birth` - The person's date of birth.
  * `documents` - Documents that may be submitted to satisfy various informational requests.
  * `email` - Email.
  * `given_name` - The person's first name.
  * `id_numbers` - The identification numbers (e.g., SSN) associated with the person.
  * `legal_gender` - The person's gender (International regulations require either "male" or "female"). Possible values: `female`, `male`.
  * `metadata` - Set of key-value pairs that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
  * `nationalities` - The nationalities (countries) this person is associated with.
  * `phone` - The phone number for this person.
  * `political_exposure` - The person's political exposure. Possible values: `existing`, `none`.
  * `relationship` - The relationship that this person has with the Account's business or legal entity.
  * `script_addresses` - The script addresses (e.g., non-Latin characters) associated with the person.
  * `script_names` - The script names (e.g. non-Latin characters) associated with the person.
  * `surname` - The person's last name.
  """
  @type t :: %__MODULE__{
          additional_addresses: [__MODULE__.AdditionalAddresses.t()] | nil,
          additional_names: [__MODULE__.AdditionalNames.t()] | nil,
          additional_terms_of_service: __MODULE__.AdditionalTermsOfService.t() | nil,
          address: __MODULE__.Address.t() | nil,
          date_of_birth: __MODULE__.DateOfBirth.t() | nil,
          documents: __MODULE__.Documents.t() | nil,
          email: String.t() | nil,
          given_name: String.t() | nil,
          id_numbers: [__MODULE__.IdNumbers.t()] | nil,
          legal_gender: String.t() | nil,
          metadata: %{String.t() => String.t()} | nil,
          nationalities: [String.t()] | nil,
          phone: String.t() | nil,
          political_exposure: String.t() | nil,
          relationship: __MODULE__.Relationship.t() | nil,
          script_addresses: __MODULE__.ScriptAddresses.t() | nil,
          script_names: __MODULE__.ScriptNames.t() | nil,
          surname: String.t() | nil
        }

  defstruct [
    :additional_addresses,
    :additional_names,
    :additional_terms_of_service,
    :address,
    :date_of_birth,
    :documents,
    :email,
    :given_name,
    :id_numbers,
    :legal_gender,
    :metadata,
    :nationalities,
    :phone,
    :political_exposure,
    :relationship,
    :script_addresses,
    :script_names,
    :surname
  ]

  defmodule AdditionalAddresses do
    @moduledoc "Nested parameters."

    @typedoc """
    * `city` - City, district, suburb, town, or village.
    * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)).
    * `line1` - Address line 1 (e.g., street, PO Box, or company name).
    * `line2` - Address line 2 (e.g., apartment, suite, unit, or building).
    * `postal_code` - ZIP or postal code.
    * `purpose` - Purpose of additional address. Possible values: `registered`.
    * `state` - State, county, province, or region.
    * `town` - Town or district.
    """
    @type t :: %__MODULE__{
            city: String.t() | nil,
            country: String.t() | nil,
            line1: String.t() | nil,
            line2: String.t() | nil,
            postal_code: String.t() | nil,
            purpose: String.t() | nil,
            state: String.t() | nil,
            town: String.t() | nil
          }
    defstruct [:city, :country, :line1, :line2, :postal_code, :purpose, :state, :town]
  end

  defmodule AdditionalNames do
    @moduledoc "Nested parameters."

    @typedoc """
    * `full_name` - The person's full name.
    * `given_name` - The person's first or given name.
    * `purpose` - The purpose or type of the additional name. Possible values: `alias`, `maiden`.
    * `surname` - The person's last or family name.
    """
    @type t :: %__MODULE__{
            full_name: String.t() | nil,
            given_name: String.t() | nil,
            purpose: String.t() | nil,
            surname: String.t() | nil
          }
    defstruct [:full_name, :given_name, :purpose, :surname]
  end

  defmodule AdditionalTermsOfService do
    @moduledoc "Nested parameters."

    @typedoc """
    * `account` - Details on the Person's acceptance of the [Stripe Services Agreement]; IP, date, and User Agent are expanded by Stripe.
    """
    @type t :: %__MODULE__{
            account: __MODULE__.Account.t() | nil
          }
    defstruct [:account]

    defmodule Account do
      @moduledoc "Nested parameters."

      @typedoc """
      * `shown_and_accepted` - The boolean value indicating if the terms of service have been accepted.
      """
      @type t :: %__MODULE__{
              shown_and_accepted: boolean() | nil
            }
      defstruct [:shown_and_accepted]
    end
  end

  defmodule Address do
    @moduledoc "Nested parameters."

    @typedoc """
    * `city` - City, district, suburb, town, or village.
    * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)).
    * `line1` - Address line 1 (e.g., street, PO Box, or company name).
    * `line2` - Address line 2 (e.g., apartment, suite, unit, or building).
    * `postal_code` - ZIP or postal code.
    * `state` - State, county, province, or region.
    * `town` - Town or district.
    """
    @type t :: %__MODULE__{
            city: String.t() | nil,
            country: String.t() | nil,
            line1: String.t() | nil,
            line2: String.t() | nil,
            postal_code: String.t() | nil,
            state: String.t() | nil,
            town: String.t() | nil
          }
    defstruct [:city, :country, :line1, :line2, :postal_code, :state, :town]
  end

  defmodule DateOfBirth do
    @moduledoc "Nested parameters."

    @typedoc """
    * `day` - The day of the birth.
    * `month` - The month of birth.
    * `year` - The year of birth.
    """
    @type t :: %__MODULE__{
            day: integer() | nil,
            month: integer() | nil,
            year: integer() | nil
          }
    defstruct [:day, :month, :year]
  end

  defmodule Documents do
    @moduledoc "Nested parameters."

    @typedoc """
    * `company_authorization` - One or more documents that demonstrate proof that this person is authorized to represent the company.
    * `passport` - One or more documents showing the person’s passport page with photo and personal data.
    * `primary_verification` - An identifying document showing the person's name, either a passport or local ID card.
    * `secondary_verification` - A document showing address, either a passport, local ID card, or utility bill from a well-known utility company.
    * `visa` - One or more documents showing the person’s visa required for living in the country where they are residing.
    """
    @type t :: %__MODULE__{
            company_authorization: __MODULE__.CompanyAuthorization.t() | nil,
            passport: __MODULE__.Passport.t() | nil,
            primary_verification: __MODULE__.PrimaryVerification.t() | nil,
            secondary_verification: __MODULE__.SecondaryVerification.t() | nil,
            visa: __MODULE__.Visa.t() | nil
          }
    defstruct [
      :company_authorization,
      :passport,
      :primary_verification,
      :secondary_verification,
      :visa
    ]

    defmodule CompanyAuthorization do
      @moduledoc "Nested parameters."

      @typedoc """
      * `files` - One or more document IDs returned by a [file upload](https://docs.stripe.com/api/persons/update#create_file) with a purpose value of `account_requirement`.
      * `type` - The format of the document. Currently supports `files` only. Possible values: `files`.
      """
      @type t :: %__MODULE__{
              files: [String.t()] | nil,
              type: String.t() | nil
            }
      defstruct [:files, :type]
    end

    defmodule Passport do
      @moduledoc "Nested parameters."

      @typedoc """
      * `files` - One or more document IDs returned by a [file upload](https://docs.stripe.com/api/persons/update#create_file) with a purpose value of `account_requirement`.
      * `type` - The format of the document. Currently supports `files` only. Possible values: `files`.
      """
      @type t :: %__MODULE__{
              files: [String.t()] | nil,
              type: String.t() | nil
            }
      defstruct [:files, :type]
    end

    defmodule PrimaryVerification do
      @moduledoc "Nested parameters."

      @typedoc """
      * `front_back` - The [file upload](https://docs.stripe.com/api/persons/update#create_file) tokens referring to each side of the document.
      * `type` - The format of the verification document. Currently supports `front_back` only. Possible values: `front_back`.
      """
      @type t :: %__MODULE__{
              front_back: __MODULE__.FrontBack.t() | nil,
              type: String.t() | nil
            }
      defstruct [:front_back, :type]

      defmodule FrontBack do
        @moduledoc "Nested parameters."

        @typedoc """
        * `back` - A [file upload](https://docs.stripe.com/api/persons/update#create_file) token representing the back of the verification document. The purpose of the uploaded file should be 'identity_document'. The uploaded file needs to be a color image (smaller than 8,000px by 8,000px), in JPG, PNG, or PDF format, and less than 10 MB in size.
        * `front` - A [file upload](https://docs.stripe.com/api/persons/update#create_file) token representing the front of the verification document. The purpose of the uploaded file should be 'identity_document'. The uploaded file needs to be a color image (smaller than 8,000px by 8,000px), in JPG, PNG, or PDF format, and less than 10 MB in size.
        """
        @type t :: %__MODULE__{
                back: String.t() | nil,
                front: String.t() | nil
              }
        defstruct [:back, :front]
      end
    end

    defmodule SecondaryVerification do
      @moduledoc "Nested parameters."

      @typedoc """
      * `front_back` - The [file upload](https://docs.stripe.com/api/persons/update#create_file) tokens referring to each side of the document.
      * `type` - The format of the verification document. Currently supports `front_back` only. Possible values: `front_back`.
      """
      @type t :: %__MODULE__{
              front_back: __MODULE__.FrontBack.t() | nil,
              type: String.t() | nil
            }
      defstruct [:front_back, :type]

      defmodule FrontBack do
        @moduledoc "Nested parameters."

        @typedoc """
        * `back` - A [file upload](https://docs.stripe.com/api/persons/update#create_file) token representing the back of the verification document. The purpose of the uploaded file should be 'identity_document'. The uploaded file needs to be a color image (smaller than 8,000px by 8,000px), in JPG, PNG, or PDF format, and less than 10 MB in size.
        * `front` - A [file upload](https://docs.stripe.com/api/persons/update#create_file) token representing the front of the verification document. The purpose of the uploaded file should be 'identity_document'. The uploaded file needs to be a color image (smaller than 8,000px by 8,000px), in JPG, PNG, or PDF format, and less than 10 MB in size.
        """
        @type t :: %__MODULE__{
                back: String.t() | nil,
                front: String.t() | nil
              }
        defstruct [:back, :front]
      end
    end

    defmodule Visa do
      @moduledoc "Nested parameters."

      @typedoc """
      * `files` - One or more document IDs returned by a [file upload](https://docs.stripe.com/api/persons/update#create_file) with a purpose value of `account_requirement`.
      * `type` - The format of the document. Currently supports `files` only. Possible values: `files`.
      """
      @type t :: %__MODULE__{
              files: [String.t()] | nil,
              type: String.t() | nil
            }
      defstruct [:files, :type]
    end
  end

  defmodule IdNumbers do
    @moduledoc "Nested parameters."

    @typedoc """
    * `type` - The ID number type of an individual. Possible values: `ae_eid`, `ao_nif`, `ar_cuil`, `ar_dni`, `at_stn`, `az_tin`, `bd_brc`, `bd_etin`, `bd_nid`, `be_nrn`, `bg_ucn`, `bn_nric`, `br_cpf`, `ca_sin`, `ch_oasi`, `cl_rut`, `cn_pp`, `co_nuip`, `cr_ci`, `cr_cpf`, `cr_dimex`, `cr_nite`, `cy_tic`, `cz_rc`, `de_stn`, `dk_cpr`, `do_cie`, `do_rcn`, `ec_ci`, `ee_ik`, `es_nif`, `fi_hetu`, `fr_nir`, `gb_nino`, `gr_afm`, `gt_nit`, `hk_id`, `hr_oib`, `hu_ad`, `id_nik`, `ie_ppsn`, `is_kt`, `it_cf`, `jp_inc`, `ke_pin`, `kz_iin`, `li_peid`, `lt_ak`, `lu_nif`, `lv_pk`, `mx_rfc`, `my_nric`, `mz_nuit`, `ng_nin`, `nl_bsn`, `no_nin`, `nz_ird`, `pe_dni`, `pk_cnic`, `pk_snic`, `pl_pesel`, `pt_nif`, `ro_cnp`, `sa_tin`, `se_pin`, `sg_fin`, `sg_nric`, `sk_dic`, `th_lc`, `th_pin`, `tr_tin`, `us_itin`, `us_itin_last_4`, `us_ssn`, `us_ssn_last_4`, `uy_dni`, `za_id`.
    * `value` - The value of the ID number.
    """
    @type t :: %__MODULE__{
            type: String.t() | nil,
            value: String.t() | nil
          }
    defstruct [:type, :value]
  end

  defmodule Relationship do
    @moduledoc "Nested parameters."

    @typedoc """
    * `authorizer` - Whether the individual is an authorizer of the Account's identity.
    * `director` - Indicates whether the person is a director of the associated legal entity.
    * `executive` - Indicates whether the person is an executive of the associated legal entity.
    * `legal_guardian` - Indicates whether the person is a legal guardian of the associated legal entity.
    * `owner` - Indicates whether the person is an owner of the associated legal entity.
    * `percent_ownership` - The percentage of ownership the person has in the associated legal entity. Format: decimal string.
    * `representative` - Indicates whether the person is a representative of the associated legal entity.
    * `title` - The title or position the person holds in the associated legal entity.
    """
    @type t :: %__MODULE__{
            authorizer: boolean() | nil,
            director: boolean() | nil,
            executive: boolean() | nil,
            legal_guardian: boolean() | nil,
            owner: boolean() | nil,
            percent_ownership: String.t() | nil,
            representative: boolean() | nil,
            title: String.t() | nil
          }
    defstruct [
      :authorizer,
      :director,
      :executive,
      :legal_guardian,
      :owner,
      :percent_ownership,
      :representative,
      :title
    ]
  end

  defmodule ScriptAddresses do
    @moduledoc "Nested parameters."

    @typedoc """
    * `kana` - Kana Address.
    * `kanji` - Kanji Address.
    """
    @type t :: %__MODULE__{
            kana: __MODULE__.Kana.t() | nil,
            kanji: __MODULE__.Kanji.t() | nil
          }
    defstruct [:kana, :kanji]

    defmodule Kana do
      @moduledoc "Nested parameters."

      @typedoc """
      * `city` - City, district, suburb, town, or village.
      * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)).
      * `line1` - Address line 1 (e.g., street, PO Box, or company name).
      * `line2` - Address line 2 (e.g., apartment, suite, unit, or building).
      * `postal_code` - ZIP or postal code.
      * `state` - State, county, province, or region.
      * `town` - Town or district.
      """
      @type t :: %__MODULE__{
              city: String.t() | nil,
              country: String.t() | nil,
              line1: String.t() | nil,
              line2: String.t() | nil,
              postal_code: String.t() | nil,
              state: String.t() | nil,
              town: String.t() | nil
            }
      defstruct [:city, :country, :line1, :line2, :postal_code, :state, :town]
    end

    defmodule Kanji do
      @moduledoc "Nested parameters."

      @typedoc """
      * `city` - City, district, suburb, town, or village.
      * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)).
      * `line1` - Address line 1 (e.g., street, PO Box, or company name).
      * `line2` - Address line 2 (e.g., apartment, suite, unit, or building).
      * `postal_code` - ZIP or postal code.
      * `state` - State, county, province, or region.
      * `town` - Town or district.
      """
      @type t :: %__MODULE__{
              city: String.t() | nil,
              country: String.t() | nil,
              line1: String.t() | nil,
              line2: String.t() | nil,
              postal_code: String.t() | nil,
              state: String.t() | nil,
              town: String.t() | nil
            }
      defstruct [:city, :country, :line1, :line2, :postal_code, :state, :town]
    end
  end

  defmodule ScriptNames do
    @moduledoc "Nested parameters."

    @typedoc """
    * `kana` - Persons name in kana script.
    * `kanji` - Persons name in kanji script.
    """
    @type t :: %__MODULE__{
            kana: __MODULE__.Kana.t() | nil,
            kanji: __MODULE__.Kanji.t() | nil
          }
    defstruct [:kana, :kanji]

    defmodule Kana do
      @moduledoc "Nested parameters."

      @typedoc """
      * `given_name` - The person's first or given name.
      * `surname` - The person's last or family name.
      """
      @type t :: %__MODULE__{
              given_name: String.t() | nil,
              surname: String.t() | nil
            }
      defstruct [:given_name, :surname]
    end

    defmodule Kanji do
      @moduledoc "Nested parameters."

      @typedoc """
      * `given_name` - The person's first or given name.
      * `surname` - The person's last or family name.
      """
      @type t :: %__MODULE__{
              given_name: String.t() | nil,
              surname: String.t() | nil
            }
      defstruct [:given_name, :surname]
    end
  end
end
