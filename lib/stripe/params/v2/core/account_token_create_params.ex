# File generated from our OpenAPI spec
defmodule Stripe.Params.V2.Core.AccountTokenCreateParams do
  @moduledoc "Parameters for account token create."

  @typedoc """
  * `contact_email` - The default contact email address for the Account. Required when configuring the account as a merchant or recipient.
  * `contact_phone` - The default contact phone for the Account.
  * `display_name` - A descriptive name for the Account. This name will be surfaced in the Stripe Dashboard and on any invoices sent to the Account.
  * `identity` - Information about the company, individual, and business represented by the Account.
  """
  @type t :: %__MODULE__{
          contact_email: String.t() | nil,
          contact_phone: String.t() | nil,
          display_name: String.t() | nil,
          identity: __MODULE__.Identity.t() | nil
        }

  defstruct [:contact_email, :contact_phone, :display_name, :identity]

  defmodule Identity do
    @moduledoc "Nested parameters."

    @typedoc """
    * `attestations` - Attestations from the identity's key people, e.g. owners, executives, directors, representatives.
    * `business_details` - Information about the company or business.
    * `entity_type` - The entity type. Possible values: `company`, `government_entity`, `individual`, `non_profit`.
    * `individual` - Information about the person represented by the account.
    """
    @type t :: %__MODULE__{
            attestations: __MODULE__.Attestations.t() | nil,
            business_details: __MODULE__.BusinessDetails.t() | nil,
            entity_type: String.t() | nil,
            individual: __MODULE__.Individual.t() | nil
          }
    defstruct [:attestations, :business_details, :entity_type, :individual]

    defmodule Attestations do
      @moduledoc "Nested parameters."

      @typedoc """
      * `directorship_declaration` - This hash is used to attest that the directors information provided to Stripe is both current and correct; IP, date, and User Agent are expanded by Stripe.
      * `ownership_declaration` - This hash is used to attest that the beneficial owner information provided to Stripe is both current and correct; IP, date, and User Agent are expanded by Stripe.
      * `persons_provided` - Attestation that all Persons with a specific Relationship value have been provided.
      * `representative_declaration` - This hash is used to attest that the representative is authorized to act as the representative of their legal entity; IP, date, and User Agent are expanded by Stripe.
      * `terms_of_service` - Attestations of accepted terms of service agreements.
      """
      @type t :: %__MODULE__{
              directorship_declaration: __MODULE__.DirectorshipDeclaration.t() | nil,
              ownership_declaration: __MODULE__.OwnershipDeclaration.t() | nil,
              persons_provided: __MODULE__.PersonsProvided.t() | nil,
              representative_declaration: __MODULE__.RepresentativeDeclaration.t() | nil,
              terms_of_service: __MODULE__.TermsOfService.t() | nil
            }
      defstruct [
        :directorship_declaration,
        :ownership_declaration,
        :persons_provided,
        :representative_declaration,
        :terms_of_service
      ]

      defmodule DirectorshipDeclaration do
        @moduledoc "Nested parameters."

        @typedoc """
        * `attested` - A boolean indicating if the directors information has been attested.
        """
        @type t :: %__MODULE__{
                attested: boolean() | nil
              }
        defstruct [:attested]
      end

      defmodule OwnershipDeclaration do
        @moduledoc "Nested parameters."

        @typedoc """
        * `attested` - A boolean indicating if the beneficial owner information has been attested.
        """
        @type t :: %__MODULE__{
                attested: boolean() | nil
              }
        defstruct [:attested]
      end

      defmodule PersonsProvided do
        @moduledoc "Nested parameters."

        @typedoc """
        * `directors` - Whether the company’s directors have been provided. Set this Boolean to true after creating all the company’s directors with the [Persons API](https://docs.stripe.com/api/v2/core/accounts/createperson).
        * `executives` - Whether the company’s executives have been provided. Set this Boolean to true after creating all the company’s executives with the [Persons API](https://docs.stripe.com/api/v2/core/accounts/createperson).
        * `owners` - Whether the company’s owners have been provided. Set this Boolean to true after creating all the company’s owners with the [Persons API](https://docs.stripe.com/api/v2/core/accounts/createperson).
        * `ownership_exemption_reason` - Reason for why the company is exempt from providing ownership information. Possible values: `qualified_entity_exceeds_ownership_threshold`, `qualifies_as_financial_institution`.
        """
        @type t :: %__MODULE__{
                directors: boolean() | nil,
                executives: boolean() | nil,
                owners: boolean() | nil,
                ownership_exemption_reason: String.t() | nil
              }
        defstruct [:directors, :executives, :owners, :ownership_exemption_reason]
      end

      defmodule RepresentativeDeclaration do
        @moduledoc "Nested parameters."

        @typedoc """
        * `attested` - A boolean indicating if the representative is authorized to act as the representative of their legal entity.
        """
        @type t :: %__MODULE__{
                attested: boolean() | nil
              }
        defstruct [:attested]
      end

      defmodule TermsOfService do
        @moduledoc "Nested parameters."

        @typedoc """
        * `account` - Details on the Account's acceptance of the [Stripe Services Agreement]; IP, date, and User Agent are expanded by Stripe.
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
    end

    defmodule BusinessDetails do
      @moduledoc "Nested parameters."

      @typedoc """
      * `address` - The business registration address of the business entity.
      * `annual_revenue` - The business gross annual revenue for its preceding fiscal year.
      * `documents` - A document verifying the business.
      * `estimated_worker_count` - Estimated maximum number of workers currently engaged by the business (including employees, contractors, and vendors).
      * `id_numbers` - The ID numbers of a business entity.
      * `monthly_estimated_revenue` - An estimate of the monthly revenue of the business.
      * `phone` - The phone number of the Business Entity.
      * `registered_name` - The business legal name.
      * `registration_date` - When the business was incorporated or registered.
      * `script_addresses` - The business registration address of the business entity in non latin script.
      * `script_names` - The business legal name in non latin script.
      * `structure` - The category identifying the legal structure of the business. Possible values: `cooperative`, `free_zone_establishment`, `free_zone_llc`, `governmental_unit`, `government_instrumentality`, `incorporated_association`, `incorporated_non_profit`, `incorporated_partnership`, `limited_liability_partnership`, `llc`, `multi_member_llc`, `private_company`, `private_corporation`, `private_partnership`, `public_company`, `public_corporation`, `public_listed_corporation`, `public_partnership`, `registered_charity`, `single_member_llc`, `sole_establishment`, `sole_proprietorship`, `tax_exempt_government_instrumentality`, `trust`, `unincorporated_association`, `unincorporated_non_profit`, `unincorporated_partnership`.
      """
      @type t :: %__MODULE__{
              address: __MODULE__.Address.t() | nil,
              annual_revenue: __MODULE__.AnnualRevenue.t() | nil,
              documents: __MODULE__.Documents.t() | nil,
              estimated_worker_count: integer() | nil,
              id_numbers: [__MODULE__.IdNumbers.t()] | nil,
              monthly_estimated_revenue: __MODULE__.MonthlyEstimatedRevenue.t() | nil,
              phone: String.t() | nil,
              registered_name: String.t() | nil,
              registration_date: __MODULE__.RegistrationDate.t() | nil,
              script_addresses: __MODULE__.ScriptAddresses.t() | nil,
              script_names: __MODULE__.ScriptNames.t() | nil,
              structure: String.t() | nil
            }
      defstruct [
        :address,
        :annual_revenue,
        :documents,
        :estimated_worker_count,
        :id_numbers,
        :monthly_estimated_revenue,
        :phone,
        :registered_name,
        :registration_date,
        :script_addresses,
        :script_names,
        :structure
      ]

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

      defmodule AnnualRevenue do
        @moduledoc "Nested parameters."

        @typedoc """
        * `amount` - A non-negative integer representing the amount in the smallest currency unit.
        * `fiscal_year_end` - The close-out date of the preceding fiscal year in ISO 8601 format. E.g. 2023-12-31 for the 31st of December, 2023.
        """
        @type t :: %__MODULE__{
                amount: __MODULE__.Amount.t() | nil,
                fiscal_year_end: String.t() | nil
              }
        defstruct [:amount, :fiscal_year_end]

        defmodule Amount do
          @moduledoc "Nested parameters."

          @typedoc """
          * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
          * `value` - A non-negative integer representing how much to charge in the [smallest currency unit](https://docs.stripe.com/currencies#minor-units).
          """
          @type t :: %__MODULE__{
                  currency: String.t() | nil,
                  value: integer() | nil
                }
          defstruct [:currency, :value]
        end
      end

      defmodule Documents do
        @moduledoc "Nested parameters."

        @typedoc """
        * `bank_account_ownership_verification` - One or more documents that support the bank account ownership verification requirement. Must be a document associated with the account’s primary active bank account that displays the last 4 digits of the account number, either a statement or a check.
        * `company_license` - One or more documents that demonstrate proof of a company’s license to operate.
        * `company_memorandum_of_association` - One or more documents showing the company’s Memorandum of Association.
        * `company_ministerial_decree` - Certain countries only: One or more documents showing the ministerial decree legalizing the company’s establishment.
        * `company_registration_verification` - One or more documents that demonstrate proof of a company’s registration with the appropriate local authorities.
        * `company_tax_id_verification` - One or more documents that demonstrate proof of a company’s tax ID.
        * `primary_verification` - A document verifying the business.
        * `proof_of_address` - One or more documents that demonstrate proof of address.
        * `proof_of_registration` - One or more documents showing the company’s proof of registration with the national business registry.
        * `proof_of_ultimate_beneficial_ownership` - One or more documents that demonstrate proof of ultimate beneficial ownership.
        """
        @type t :: %__MODULE__{
                bank_account_ownership_verification:
                  __MODULE__.BankAccountOwnershipVerification.t() | nil,
                company_license: __MODULE__.CompanyLicense.t() | nil,
                company_memorandum_of_association:
                  __MODULE__.CompanyMemorandumOfAssociation.t() | nil,
                company_ministerial_decree: __MODULE__.CompanyMinisterialDecree.t() | nil,
                company_registration_verification:
                  __MODULE__.CompanyRegistrationVerification.t() | nil,
                company_tax_id_verification: __MODULE__.CompanyTaxIdVerification.t() | nil,
                primary_verification: __MODULE__.PrimaryVerification.t() | nil,
                proof_of_address: __MODULE__.ProofOfAddress.t() | nil,
                proof_of_registration: __MODULE__.ProofOfRegistration.t() | nil,
                proof_of_ultimate_beneficial_ownership:
                  __MODULE__.ProofOfUltimateBeneficialOwnership.t() | nil
              }
        defstruct [
          :bank_account_ownership_verification,
          :company_license,
          :company_memorandum_of_association,
          :company_ministerial_decree,
          :company_registration_verification,
          :company_tax_id_verification,
          :primary_verification,
          :proof_of_address,
          :proof_of_registration,
          :proof_of_ultimate_beneficial_ownership
        ]

        defmodule BankAccountOwnershipVerification do
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

        defmodule CompanyLicense do
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

        defmodule CompanyMemorandumOfAssociation do
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

        defmodule CompanyMinisterialDecree do
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

        defmodule CompanyRegistrationVerification do
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

        defmodule CompanyTaxIdVerification do
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

        defmodule ProofOfAddress do
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

        defmodule ProofOfRegistration do
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

        defmodule ProofOfUltimateBeneficialOwnership do
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
        * `registrar` - The registrar of the ID number (Only valid for DE ID number types).
        * `type` - Open Enum. The ID number type of a business entity. Possible values: `ae_crn`, `ae_vat`, `ao_nif`, `ar_cuit`, `at_fn`, `at_stn`, `at_vat`, `au_abn`, `au_acn`, `au_in`, `az_tin`, `bd_etin`, `be_cbe`, `be_vat`, `bg_uic`, `bg_vat`, `br_cnpj`, `ca_cn`, `ca_crarr`, `ca_gst_hst`, `ca_neq`, `ca_rid`, `ch_chid`, `ch_uid`, `cr_cpj`, `cr_nite`, `cy_he`, `cy_tic`, `cy_vat`, `cz_ico`, `cz_vat`, `de_hrn`, `de_stn`, `de_vat`, `dk_cvr`, `dk_vat`, `do_rcn`, `ee_rk`, `ee_vat`, `es_cif`, `es_vat`, `fi_vat`, `fi_yt`, `fr_rna`, `fr_siren`, `fr_vat`, `gb_crn`, `gb_vat`, `gi_crn`, `gr_afm`, `gr_gemi`, `gr_vat`, `gt_nit`, `hk_br`, `hk_cr`, `hr_mbs`, `hr_oib`, `hr_vat`, `hu_cjs`, `hu_tin`, `hu_vat`, `ie_crn`, `ie_trn`, `ie_vat`, `it_rea`, `it_vat`, `jp_cn`, `kz_bin`, `li_uid`, `lt_ccrn`, `lt_vat`, `lu_nif`, `lu_rcs`, `lu_vat`, `lv_urn`, `lv_vat`, `mt_crn`, `mt_tin`, `mt_vat`, `mx_rfc`, `my_brn`, `my_coid`, `my_itn`, `my_sst`, `mz_nuit`, `nl_kvk`, `nl_rsin`, `nl_vat`, `no_orgnr`, `nz_bn`, `nz_ird`, `pe_ruc`, `pk_ntn`, `pl_nip`, `pl_regon`, `pl_vat`, `pt_vat`, `ro_cui`, `ro_orc`, `ro_vat`, `sa_crn`, `sa_tin`, `se_orgnr`, `se_vat`, `sg_uen`, `si_msp`, `si_tin`, `si_vat`, `sk_dic`, `sk_ico`, `sk_vat`, `th_crn`, `th_prn`, `th_tin`, `us_ein`.
        * `value` - The value of the ID number.
        """
        @type t :: %__MODULE__{
                registrar: String.t() | nil,
                type: String.t() | nil,
                value: String.t() | nil
              }
        defstruct [:registrar, :type, :value]
      end

      defmodule MonthlyEstimatedRevenue do
        @moduledoc "Nested parameters."

        @typedoc """
        * `amount` - A non-negative integer representing the amount in the smallest currency unit.
        """
        @type t :: %__MODULE__{
                amount: __MODULE__.Amount.t() | nil
              }
        defstruct [:amount]

        defmodule Amount do
          @moduledoc "Nested parameters."

          @typedoc """
          * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
          * `value` - A non-negative integer representing how much to charge in the [smallest currency unit](https://docs.stripe.com/currencies#minor-units).
          """
          @type t :: %__MODULE__{
                  currency: String.t() | nil,
                  value: integer() | nil
                }
          defstruct [:currency, :value]
        end
      end

      defmodule RegistrationDate do
        @moduledoc "Nested parameters."

        @typedoc """
        * `day` - The day of registration, between 1 and 31.
        * `month` - The month of registration, between 1 and 12.
        * `year` - The four-digit year of registration.
        """
        @type t :: %__MODULE__{
                day: integer() | nil,
                month: integer() | nil,
                year: integer() | nil
              }
        defstruct [:day, :month, :year]
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
        * `kana` - Kana name.
        * `kanji` - Kanji name.
        """
        @type t :: %__MODULE__{
                kana: __MODULE__.Kana.t() | nil,
                kanji: __MODULE__.Kanji.t() | nil
              }
        defstruct [:kana, :kanji]

        defmodule Kana do
          @moduledoc "Nested parameters."

          @typedoc """
          * `registered_name` - Registered name of the business.
          """
          @type t :: %__MODULE__{
                  registered_name: String.t() | nil
                }
          defstruct [:registered_name]
        end

        defmodule Kanji do
          @moduledoc "Nested parameters."

          @typedoc """
          * `registered_name` - Registered name of the business.
          """
          @type t :: %__MODULE__{
                  registered_name: String.t() | nil
                }
          defstruct [:registered_name]
        end
      end
    end

    defmodule Individual do
      @moduledoc "Nested parameters."

      @typedoc """
      * `additional_addresses` - Additional addresses associated with the individual.
      * `additional_names` - Additional names (e.g. aliases) associated with the individual.
      * `address` - The individual's residential address.
      * `date_of_birth` - The individual's date of birth.
      * `documents` - Documents that may be submitted to satisfy various informational requests.
      * `email` - The individual's email address.
      * `given_name` - The individual's first name.
      * `id_numbers` - The identification numbers (e.g., SSN) associated with the individual.
      * `legal_gender` - The individual's gender (International regulations require either "male" or "female"). Possible values: `female`, `male`.
      * `metadata` - Set of key-value pairs that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
      * `nationalities` - The countries where the individual is a national. Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)).
      * `phone` - The individual's phone number.
      * `political_exposure` - The individual's political exposure. Possible values: `existing`, `none`.
      * `relationship` - The relationship that this individual has with the account's identity.
      * `script_addresses` - The script addresses (e.g., non-Latin characters) associated with the individual.
      * `script_names` - The individuals primary name in non latin script.
      * `surname` - The individual's last name.
      """
      @type t :: %__MODULE__{
              additional_addresses: [__MODULE__.AdditionalAddresses.t()] | nil,
              additional_names: [__MODULE__.AdditionalNames.t()] | nil,
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
        * `director` - Whether the person is a director of the account's identity. Directors are typically members of the governing board of the company, or responsible for ensuring the company meets its regulatory obligations.
        * `executive` - Whether the person has significant responsibility to control, manage, or direct the organization.
        * `owner` - Whether the person is an owner of the account’s identity.
        * `percent_ownership` - The percent owned by the person of the account's legal entity. Format: decimal string.
        * `title` - The person's title (e.g., CEO, Support Engineer).
        """
        @type t :: %__MODULE__{
                director: boolean() | nil,
                executive: boolean() | nil,
                owner: boolean() | nil,
                percent_ownership: String.t() | nil,
                title: String.t() | nil
              }
        defstruct [:director, :executive, :owner, :percent_ownership, :title]
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
  end
end
