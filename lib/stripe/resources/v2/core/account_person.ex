# File generated from our OpenAPI spec
defmodule Stripe.Resources.V2.Core.AccountPerson do
  @moduledoc """
  Person

  A Person represents an individual associated with an Account's identity (for example, an owner, director, executive, or representative). Use Persons to provide and update identity information for verification and compliance.
  """

  @typedoc """
  * `account` - The account ID which the individual belongs to.
  * `additional_addresses` - Additional addresses associated with the person.
  * `additional_names` - Additional names (e.g. aliases) associated with the person.
  * `additional_terms_of_service` - Attestations of accepted terms of service agreements.
  * `address` - The person's residential address.
  * `created` - Time at which the object was created. Represented as a RFC 3339 date & time UTC value in millisecond precision, for example: 2022-09-18T13:22:18.123Z. Format: date-time.
  * `date_of_birth` - The person's date of birth.
  * `documents` - Documents that may be submitted to satisfy various informational requests.
  * `email` - The person's email address.
  * `given_name` - The person's first name.
  * `id` - Unique identifier for the Person.
  * `id_numbers` - The identification numbers (e.g., SSN) associated with the person.
  * `legal_gender` - The person's gender (International regulations require either "male" or "female"). Possible values: `female`, `male`.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `metadata` - Set of key-value pairs that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
  * `nationalities` - The countries where the person is a national. Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)).
  * `object` - String representing the object's type. Objects of the same type share the same value of the object field. Possible values: `v2.core.account_person`.
  * `phone` - The person's phone number.
  * `political_exposure` - The person's political exposure. Possible values: `existing`, `none`.
  * `relationship` - The relationship that this person has with the Account's business or legal entity.
  * `script_addresses` - The script addresses (e.g., non-Latin characters) associated with the person.
  * `script_names` - The script names (e.g. non-Latin characters) associated with the person.
  * `surname` - The person's last name.
  * `updated` - Time at which the object was last updated. Represented as a RFC 3339 date & time UTC value in millisecond precision, for example: 2022-09-18T13:22:18.123Z. Format: date-time.
  """
  @type t :: %__MODULE__{
          account: String.t(),
          additional_addresses: [additional_addresses()] | nil,
          additional_names: [additional_names()] | nil,
          additional_terms_of_service: additional_terms_of_service() | nil,
          address: address() | nil,
          created: String.t(),
          date_of_birth: date_of_birth() | nil,
          documents: documents() | nil,
          email: String.t() | nil,
          given_name: String.t() | nil,
          id: String.t(),
          id_numbers: [id_numbers()] | nil,
          legal_gender: String.t() | nil,
          livemode: boolean(),
          metadata: %{String.t() => String.t()} | nil,
          nationalities: [String.t()] | nil,
          object: String.t(),
          phone: String.t() | nil,
          political_exposure: String.t() | nil,
          relationship: relationship() | nil,
          script_addresses: script_addresses() | nil,
          script_names: script_names() | nil,
          surname: String.t() | nil,
          updated: String.t()
        }

  defstruct [
    :account,
    :additional_addresses,
    :additional_names,
    :additional_terms_of_service,
    :address,
    :created,
    :date_of_birth,
    :documents,
    :email,
    :given_name,
    :id,
    :id_numbers,
    :legal_gender,
    :livemode,
    :metadata,
    :nationalities,
    :object,
    :phone,
    :political_exposure,
    :relationship,
    :script_addresses,
    :script_names,
    :surname,
    :updated
  ]

  @object_name "v2.core.account_person"
  def object_name, do: @object_name

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
  @type additional_addresses :: %{
          optional(:city) => String.t() | nil,
          optional(:country) => String.t() | nil,
          optional(:line1) => String.t() | nil,
          optional(:line2) => String.t() | nil,
          optional(:postal_code) => String.t() | nil,
          optional(:purpose) => String.t() | nil,
          optional(:state) => String.t() | nil,
          optional(:town) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `full_name` - The individual's full name.
  * `given_name` - The individual's first or given name.
  * `purpose` - The purpose or type of the additional name. Possible values: `alias`, `maiden`.
  * `surname` - The individual's last or family name.
  """
  @type additional_names :: %{
          optional(:full_name) => String.t() | nil,
          optional(:given_name) => String.t() | nil,
          optional(:purpose) => String.t() | nil,
          optional(:surname) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `account` - Stripe terms of service agreement.
  """
  @type additional_terms_of_service :: %{
          optional(:account) => additional_terms_of_service_account() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `date` - The time when the Account's representative accepted the terms of service. Represented as a RFC 3339 date & time UTC value in millisecond precision, for example: 2022-09-18T13:22:18.123Z. Format: date-time.
  * `ip` - The IP address from which the Account's representative accepted the terms of service.
  * `user_agent` - The user agent of the browser from which the Account's representative accepted the terms of service.
  """
  @type additional_terms_of_service_account :: %{
          optional(:date) => String.t() | nil,
          optional(:ip) => String.t() | nil,
          optional(:user_agent) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `city` - City, district, suburb, town, or village.
  * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)).
  * `line1` - Address line 1 (e.g., street, PO Box, or company name).
  * `line2` - Address line 2 (e.g., apartment, suite, unit, or building).
  * `postal_code` - ZIP or postal code.
  * `state` - State, county, province, or region.
  * `town` - Town or district.
  """
  @type address :: %{
          optional(:city) => String.t() | nil,
          optional(:country) => String.t() | nil,
          optional(:line1) => String.t() | nil,
          optional(:line2) => String.t() | nil,
          optional(:postal_code) => String.t() | nil,
          optional(:state) => String.t() | nil,
          optional(:town) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `day` - The day of birth, between 1 and 31.
  * `month` - The month of birth, between 1 and 12.
  * `year` - The four-digit year of birth.
  """
  @type date_of_birth :: %{
          optional(:day) => integer() | nil,
          optional(:month) => integer() | nil,
          optional(:year) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `company_authorization` - One or more documents that demonstrate proof that this person is authorized to represent the company.
  * `passport` - One or more documents showing the person’s passport page with photo and personal data.
  * `primary_verification` - An identifying document showing the person's name, either a passport or local ID card.
  * `secondary_verification` - A document showing address, either a passport, local ID card, or utility bill from a well-known utility company.
  * `visa` - One or more documents showing the person’s visa required for living in the country where they are residing.
  """
  @type documents :: %{
          optional(:company_authorization) => documents_company_authorization() | nil,
          optional(:passport) => documents_passport() | nil,
          optional(:primary_verification) => documents_primary_verification() | nil,
          optional(:secondary_verification) => documents_secondary_verification() | nil,
          optional(:visa) => documents_visa() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `files` - One or more document IDs returned by a [file upload](https://docs.stripe.com/api/persons/update#create_file) with a purpose value of `account_requirement`.
  * `type` - The format of the document. Currently supports `files` only. Possible values: `files`.
  """
  @type documents_company_authorization :: %{
          optional(:files) => [String.t()] | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `files` - One or more document IDs returned by a [file upload](https://docs.stripe.com/api/persons/update#create_file) with a purpose value of `account_requirement`.
  * `type` - The format of the document. Currently supports `files` only. Possible values: `files`.
  """
  @type documents_passport :: %{
          optional(:files) => [String.t()] | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `front_back` - The [file upload](https://docs.stripe.com/api/persons/update#create_file) tokens for the front and back of the verification document.
  * `type` - The format of the verification document. Currently supports `front_back` only. Possible values: `front_back`.
  """
  @type documents_primary_verification :: %{
          optional(:front_back) => documents_primary_verification_front_back() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `back` - A [file upload](https://docs.stripe.com/api/persons/update#create_file) token representing the back of the verification document. The purpose of the uploaded file should be 'identity_document'. The uploaded file needs to be a color image (smaller than 8,000px by 8,000px), in JPG, PNG, or PDF format, and less than 10 MB in size.
  * `front` - A [file upload](https://docs.stripe.com/api/persons/update#create_file) token representing the front of the verification document. The purpose of the uploaded file should be 'identity_document'. The uploaded file needs to be a color image (smaller than 8,000px by 8,000px), in JPG, PNG, or PDF format, and less than 10 MB in size.
  """
  @type documents_primary_verification_front_back :: %{
          optional(:back) => String.t() | nil,
          optional(:front) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `front_back` - The [file upload](https://docs.stripe.com/api/persons/update#create_file) tokens for the front and back of the verification document.
  * `type` - The format of the verification document. Currently supports `front_back` only. Possible values: `front_back`.
  """
  @type documents_secondary_verification :: %{
          optional(:front_back) => documents_secondary_verification_front_back() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `back` - A [file upload](https://docs.stripe.com/api/persons/update#create_file) token representing the back of the verification document. The purpose of the uploaded file should be 'identity_document'. The uploaded file needs to be a color image (smaller than 8,000px by 8,000px), in JPG, PNG, or PDF format, and less than 10 MB in size.
  * `front` - A [file upload](https://docs.stripe.com/api/persons/update#create_file) token representing the front of the verification document. The purpose of the uploaded file should be 'identity_document'. The uploaded file needs to be a color image (smaller than 8,000px by 8,000px), in JPG, PNG, or PDF format, and less than 10 MB in size.
  """
  @type documents_secondary_verification_front_back :: %{
          optional(:back) => String.t() | nil,
          optional(:front) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `files` - One or more document IDs returned by a [file upload](https://docs.stripe.com/api/persons/update#create_file) with a purpose value of `account_requirement`.
  * `type` - The format of the document. Currently supports `files` only. Possible values: `files`.
  """
  @type documents_visa :: %{
          optional(:files) => [String.t()] | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - The ID number type of an individual. Possible values: `ae_eid`, `ao_nif`, `ar_cuil`, `ar_dni`, `at_stn`, `az_tin`, `bd_brc`, `bd_etin`, `bd_nid`, `be_nrn`, `bg_ucn`, `bn_nric`, `br_cpf`, `ca_sin`, `ch_oasi`, `cl_rut`, `cn_pp`, `co_nuip`, `cr_ci`, `cr_cpf`, `cr_dimex`, `cr_nite`, `cy_tic`, `cz_rc`, `de_stn`, `dk_cpr`, `do_cie`, `do_rcn`, `ec_ci`, `ee_ik`, `es_nif`, `fi_hetu`, `fr_nir`, `gb_nino`, `gr_afm`, `gt_nit`, `hk_id`, `hr_oib`, `hu_ad`, `id_nik`, `ie_ppsn`, `is_kt`, `it_cf`, `jp_inc`, `ke_pin`, `kz_iin`, `li_peid`, `lt_ak`, `lu_nif`, `lv_pk`, `mx_rfc`, `my_nric`, `mz_nuit`, `ng_nin`, `nl_bsn`, `no_nin`, `nz_ird`, `pe_dni`, `pk_cnic`, `pk_snic`, `pl_pesel`, `pt_nif`, `ro_cnp`, `sa_tin`, `se_pin`, `sg_fin`, `sg_nric`, `sk_dic`, `th_lc`, `th_pin`, `tr_tin`, `us_itin`, `us_itin_last_4`, `us_ssn`, `us_ssn_last_4`, `uy_dni`, `za_id`.
  """
  @type id_numbers :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `authorizer` - Whether the individual is an authorizer of the Account's identity.
  * `director` - Whether the individual is a director of the Account's identity. Directors are typically members of the governing board of the company or are responsible for making sure that the company meets its regulatory obligations.
  * `executive` - Whether the individual has significant responsibility to control, manage, or direct the organization.
  * `legal_guardian` - Whether the individual is the legal guardian of the Account's representative.
  * `owner` - Whether the individual is an owner of the Account's identity.
  * `percent_ownership` - The percentage of the Account's identity that the individual owns. Format: decimal string.
  * `representative` - Whether the individual is authorized as the primary representative of the Account. This is the person nominated by the business to provide information about themselves, and general information about the account. There can only be one representative at any given time. At the time the account is created, this person should be set to the person responsible for opening the account.
  * `title` - The individual's title (e.g., CEO, Support Engineer).
  """
  @type relationship :: %{
          optional(:authorizer) => boolean() | nil,
          optional(:director) => boolean() | nil,
          optional(:executive) => boolean() | nil,
          optional(:legal_guardian) => boolean() | nil,
          optional(:owner) => boolean() | nil,
          optional(:percent_ownership) => String.t() | nil,
          optional(:representative) => boolean() | nil,
          optional(:title) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `kana` - Kana Address.
  * `kanji` - Kanji Address.
  """
  @type script_addresses :: %{
          optional(:kana) => script_addresses_kana() | nil,
          optional(:kanji) => script_addresses_kanji() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `city` - City, district, suburb, town, or village.
  * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)).
  * `line1` - Address line 1 (e.g., street, PO Box, or company name).
  * `line2` - Address line 2 (e.g., apartment, suite, unit, or building).
  * `postal_code` - ZIP or postal code.
  * `state` - State, county, province, or region.
  * `town` - Town or district.
  """
  @type script_addresses_kana :: %{
          optional(:city) => String.t() | nil,
          optional(:country) => String.t() | nil,
          optional(:line1) => String.t() | nil,
          optional(:line2) => String.t() | nil,
          optional(:postal_code) => String.t() | nil,
          optional(:state) => String.t() | nil,
          optional(:town) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `city` - City, district, suburb, town, or village.
  * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)).
  * `line1` - Address line 1 (e.g., street, PO Box, or company name).
  * `line2` - Address line 2 (e.g., apartment, suite, unit, or building).
  * `postal_code` - ZIP or postal code.
  * `state` - State, county, province, or region.
  * `town` - Town or district.
  """
  @type script_addresses_kanji :: %{
          optional(:city) => String.t() | nil,
          optional(:country) => String.t() | nil,
          optional(:line1) => String.t() | nil,
          optional(:line2) => String.t() | nil,
          optional(:postal_code) => String.t() | nil,
          optional(:state) => String.t() | nil,
          optional(:town) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `kana` - Persons name in kana script.
  * `kanji` - Persons name in kanji script.
  """
  @type script_names :: %{
          optional(:kana) => script_names_kana() | nil,
          optional(:kanji) => script_names_kanji() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `given_name` - The person's first or given name.
  * `surname` - The person's last or family name.
  """
  @type script_names_kana :: %{
          optional(:given_name) => String.t() | nil,
          optional(:surname) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `given_name` - The person's first or given name.
  * `surname` - The person's last or family name.
  """
  @type script_names_kanji :: %{
          optional(:given_name) => String.t() | nil,
          optional(:surname) => String.t() | nil,
          optional(String.t()) => term()
        }

  def __nested_fields__ do
    %{
      "additional_addresses" => %{
        fields: %{
          "city" => :scalar,
          "country" => :scalar,
          "line1" => :scalar,
          "line2" => :scalar,
          "postal_code" => :scalar,
          "purpose" => :scalar,
          "state" => :scalar,
          "town" => :scalar
        }
      },
      "additional_names" => %{
        fields: %{
          "full_name" => :scalar,
          "given_name" => :scalar,
          "purpose" => :scalar,
          "surname" => :scalar
        }
      },
      "additional_terms_of_service" => %{
        fields: %{
          "account" => %{
            fields: %{
              "date" => :scalar,
              "ip" => :scalar,
              "user_agent" => :scalar
            }
          }
        }
      },
      "address" => %{
        fields: %{
          "city" => :scalar,
          "country" => :scalar,
          "line1" => :scalar,
          "line2" => :scalar,
          "postal_code" => :scalar,
          "state" => :scalar,
          "town" => :scalar
        }
      },
      "date_of_birth" => %{
        fields: %{
          "day" => :scalar,
          "month" => :scalar,
          "year" => :scalar
        }
      },
      "documents" => %{
        fields: %{
          "company_authorization" => %{
            fields: %{
              "files" => {:list, :scalar},
              "type" => :scalar
            }
          },
          "passport" => %{
            fields: %{
              "files" => {:list, :scalar},
              "type" => :scalar
            }
          },
          "primary_verification" => %{
            fields: %{
              "front_back" => %{
                fields: %{
                  "back" => :scalar,
                  "front" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "secondary_verification" => %{
            fields: %{
              "front_back" => %{
                fields: %{
                  "back" => :scalar,
                  "front" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "visa" => %{
            fields: %{
              "files" => {:list, :scalar},
              "type" => :scalar
            }
          }
        }
      },
      "id_numbers" => %{
        fields: %{
          "type" => :scalar
        }
      },
      "relationship" => %{
        fields: %{
          "authorizer" => :scalar,
          "director" => :scalar,
          "executive" => :scalar,
          "legal_guardian" => :scalar,
          "owner" => :scalar,
          "percent_ownership" => :scalar,
          "representative" => :scalar,
          "title" => :scalar
        }
      },
      "script_addresses" => %{
        fields: %{
          "kana" => %{
            fields: %{
              "city" => :scalar,
              "country" => :scalar,
              "line1" => :scalar,
              "line2" => :scalar,
              "postal_code" => :scalar,
              "state" => :scalar,
              "town" => :scalar
            }
          },
          "kanji" => %{
            fields: %{
              "city" => :scalar,
              "country" => :scalar,
              "line1" => :scalar,
              "line2" => :scalar,
              "postal_code" => :scalar,
              "state" => :scalar,
              "town" => :scalar
            }
          }
        }
      },
      "script_names" => %{
        fields: %{
          "kana" => %{
            fields: %{
              "given_name" => :scalar,
              "surname" => :scalar
            }
          },
          "kanji" => %{
            fields: %{
              "given_name" => :scalar,
              "surname" => :scalar
            }
          }
        }
      }
    }
  end
end
