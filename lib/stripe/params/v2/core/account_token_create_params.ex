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
          identity: identity() | nil
        }

  defstruct [:contact_email, :contact_phone, :display_name, :identity]

  @typedoc """
  * `attestations` - Attestations from the identity's key people, e.g. owners, executives, directors, representatives.
  * `business_details` - Information about the company or business.
  * `entity_type` - The entity type. Possible values: `company`, `government_entity`, `individual`, `non_profit`.
  * `individual` - Information about the person represented by the account.
  """
  @type identity :: %{
          optional(:attestations) => identity_attestations() | nil,
          optional(:business_details) => identity_business_details() | nil,
          optional(:entity_type) => String.t() | nil,
          optional(:individual) => identity_individual() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `directorship_declaration` - This hash is used to attest that the directors information provided to Stripe is both current and correct; IP, date, and User Agent are expanded by Stripe.
  * `ownership_declaration` - This hash is used to attest that the beneficial owner information provided to Stripe is both current and correct; IP, date, and User Agent are expanded by Stripe.
  * `persons_provided` - Attestation that all Persons with a specific Relationship value have been provided.
  * `representative_declaration` - This hash is used to attest that the representative is authorized to act as the representative of their legal entity; IP, date, and User Agent are expanded by Stripe.
  * `terms_of_service` - Attestations of accepted terms of service agreements.
  """
  @type identity_attestations :: %{
          optional(:directorship_declaration) =>
            identity_attestations_directorship_declaration() | nil,
          optional(:ownership_declaration) => identity_attestations_ownership_declaration() | nil,
          optional(:persons_provided) => identity_attestations_persons_provided() | nil,
          optional(:representative_declaration) =>
            identity_attestations_representative_declaration() | nil,
          optional(:terms_of_service) => identity_attestations_terms_of_service() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `attested` - A boolean indicating if the directors information has been attested.
  """
  @type identity_attestations_directorship_declaration :: %{
          optional(:attested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `attested` - A boolean indicating if the beneficial owner information has been attested.
  """
  @type identity_attestations_ownership_declaration :: %{
          optional(:attested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `directors` - Whether the company’s directors have been provided. Set this Boolean to true after creating all the company’s directors with the [Persons API](https://docs.stripe.com/api/v2/core/accounts/createperson).
  * `executives` - Whether the company’s executives have been provided. Set this Boolean to true after creating all the company’s executives with the [Persons API](https://docs.stripe.com/api/v2/core/accounts/createperson).
  * `owners` - Whether the company’s owners have been provided. Set this Boolean to true after creating all the company’s owners with the [Persons API](https://docs.stripe.com/api/v2/core/accounts/createperson).
  * `ownership_exemption_reason` - Reason for why the company is exempt from providing ownership information. Possible values: `qualified_entity_exceeds_ownership_threshold`, `qualifies_as_financial_institution`.
  """
  @type identity_attestations_persons_provided :: %{
          optional(:directors) => boolean() | nil,
          optional(:executives) => boolean() | nil,
          optional(:owners) => boolean() | nil,
          optional(:ownership_exemption_reason) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `attested` - A boolean indicating if the representative is authorized to act as the representative of their legal entity.
  """
  @type identity_attestations_representative_declaration :: %{
          optional(:attested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `account` - Details on the Account's acceptance of the [Stripe Services Agreement]; IP, date, and User Agent are expanded by Stripe.
  """
  @type identity_attestations_terms_of_service :: %{
          optional(:account) => identity_attestations_terms_of_service_account() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `shown_and_accepted` - The boolean value indicating if the terms of service have been accepted.
  """
  @type identity_attestations_terms_of_service_account :: %{
          optional(:shown_and_accepted) => boolean() | nil,
          optional(String.t()) => term()
        }

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
  @type identity_business_details :: %{
          optional(:address) => identity_business_details_address() | nil,
          optional(:annual_revenue) => identity_business_details_annual_revenue() | nil,
          optional(:documents) => identity_business_details_documents() | nil,
          optional(:estimated_worker_count) => integer() | nil,
          optional(:id_numbers) => [identity_business_details_id_numbers()] | nil,
          optional(:monthly_estimated_revenue) =>
            identity_business_details_monthly_estimated_revenue() | nil,
          optional(:phone) => String.t() | nil,
          optional(:registered_name) => String.t() | nil,
          optional(:registration_date) => identity_business_details_registration_date() | nil,
          optional(:script_addresses) => identity_business_details_script_addresses() | nil,
          optional(:script_names) => identity_business_details_script_names() | nil,
          optional(:structure) => String.t() | nil,
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
  @type identity_business_details_address :: %{
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
  * `amount` - A non-negative integer representing the amount in the smallest currency unit.
  * `fiscal_year_end` - The close-out date of the preceding fiscal year in ISO 8601 format. E.g. 2023-12-31 for the 31st of December, 2023.
  """
  @type identity_business_details_annual_revenue :: %{
          optional(:amount) => identity_business_details_annual_revenue_amount() | nil,
          optional(:fiscal_year_end) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
  * `value` - A non-negative integer representing how much to charge in the [smallest currency unit](https://docs.stripe.com/currencies#minor-units).
  """
  @type identity_business_details_annual_revenue_amount :: %{
          optional(:currency) => String.t() | nil,
          optional(:value) => integer() | nil,
          optional(String.t()) => term()
        }

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
  @type identity_business_details_documents :: %{
          optional(:bank_account_ownership_verification) =>
            identity_business_details_documents_bank_account_ownership_verification() | nil,
          optional(:company_license) =>
            identity_business_details_documents_company_license() | nil,
          optional(:company_memorandum_of_association) =>
            identity_business_details_documents_company_memorandum_of_association() | nil,
          optional(:company_ministerial_decree) =>
            identity_business_details_documents_company_ministerial_decree() | nil,
          optional(:company_registration_verification) =>
            identity_business_details_documents_company_registration_verification() | nil,
          optional(:company_tax_id_verification) =>
            identity_business_details_documents_company_tax_id_verification() | nil,
          optional(:primary_verification) =>
            identity_business_details_documents_primary_verification() | nil,
          optional(:proof_of_address) =>
            identity_business_details_documents_proof_of_address() | nil,
          optional(:proof_of_registration) =>
            identity_business_details_documents_proof_of_registration() | nil,
          optional(:proof_of_ultimate_beneficial_ownership) =>
            identity_business_details_documents_proof_of_ultimate_beneficial_ownership() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `files` - One or more document IDs returned by a [file upload](https://docs.stripe.com/api/persons/update#create_file) with a purpose value of `account_requirement`.
  * `type` - The format of the document. Currently supports `files` only. Possible values: `files`.
  """
  @type identity_business_details_documents_bank_account_ownership_verification :: %{
          optional(:files) => [String.t()] | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `files` - One or more document IDs returned by a [file upload](https://docs.stripe.com/api/persons/update#create_file) with a purpose value of `account_requirement`.
  * `type` - The format of the document. Currently supports `files` only. Possible values: `files`.
  """
  @type identity_business_details_documents_company_license :: %{
          optional(:files) => [String.t()] | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `files` - One or more document IDs returned by a [file upload](https://docs.stripe.com/api/persons/update#create_file) with a purpose value of `account_requirement`.
  * `type` - The format of the document. Currently supports `files` only. Possible values: `files`.
  """
  @type identity_business_details_documents_company_memorandum_of_association :: %{
          optional(:files) => [String.t()] | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `files` - One or more document IDs returned by a [file upload](https://docs.stripe.com/api/persons/update#create_file) with a purpose value of `account_requirement`.
  * `type` - The format of the document. Currently supports `files` only. Possible values: `files`.
  """
  @type identity_business_details_documents_company_ministerial_decree :: %{
          optional(:files) => [String.t()] | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `files` - One or more document IDs returned by a [file upload](https://docs.stripe.com/api/persons/update#create_file) with a purpose value of `account_requirement`.
  * `type` - The format of the document. Currently supports `files` only. Possible values: `files`.
  """
  @type identity_business_details_documents_company_registration_verification :: %{
          optional(:files) => [String.t()] | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `files` - One or more document IDs returned by a [file upload](https://docs.stripe.com/api/persons/update#create_file) with a purpose value of `account_requirement`.
  * `type` - The format of the document. Currently supports `files` only. Possible values: `files`.
  """
  @type identity_business_details_documents_company_tax_id_verification :: %{
          optional(:files) => [String.t()] | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `front_back` - The [file upload](https://docs.stripe.com/api/persons/update#create_file) tokens referring to each side of the document.
  * `type` - The format of the verification document. Currently supports `front_back` only. Possible values: `front_back`.
  """
  @type identity_business_details_documents_primary_verification :: %{
          optional(:front_back) =>
            identity_business_details_documents_primary_verification_front_back() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `back` - A [file upload](https://docs.stripe.com/api/persons/update#create_file) token representing the back of the verification document. The purpose of the uploaded file should be 'identity_document'. The uploaded file needs to be a color image (smaller than 8,000px by 8,000px), in JPG, PNG, or PDF format, and less than 10 MB in size.
  * `front` - A [file upload](https://docs.stripe.com/api/persons/update#create_file) token representing the front of the verification document. The purpose of the uploaded file should be 'identity_document'. The uploaded file needs to be a color image (smaller than 8,000px by 8,000px), in JPG, PNG, or PDF format, and less than 10 MB in size.
  """
  @type identity_business_details_documents_primary_verification_front_back :: %{
          optional(:back) => String.t() | nil,
          optional(:front) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `files` - One or more document IDs returned by a [file upload](https://docs.stripe.com/api/persons/update#create_file) with a purpose value of `account_requirement`.
  * `type` - The format of the document. Currently supports `files` only. Possible values: `files`.
  """
  @type identity_business_details_documents_proof_of_address :: %{
          optional(:files) => [String.t()] | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `files` - One or more document IDs returned by a [file upload](https://docs.stripe.com/api/persons/update#create_file) with a purpose value of `account_requirement`.
  * `type` - The format of the document. Currently supports `files` only. Possible values: `files`.
  """
  @type identity_business_details_documents_proof_of_registration :: %{
          optional(:files) => [String.t()] | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `files` - One or more document IDs returned by a [file upload](https://docs.stripe.com/api/persons/update#create_file) with a purpose value of `account_requirement`.
  * `type` - The format of the document. Currently supports `files` only. Possible values: `files`.
  """
  @type identity_business_details_documents_proof_of_ultimate_beneficial_ownership :: %{
          optional(:files) => [String.t()] | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `registrar` - The registrar of the ID number (Only valid for DE ID number types).
  * `type` - Open Enum. The ID number type of a business entity. Possible values: `ae_crn`, `ae_vat`, `ao_nif`, `ar_cuit`, `at_fn`, `at_stn`, `at_vat`, `au_abn`, `au_acn`, `au_in`, `az_tin`, `bd_etin`, `be_cbe`, `be_vat`, `bg_uic`, `bg_vat`, `br_cnpj`, `ca_cn`, `ca_crarr`, `ca_gst_hst`, `ca_neq`, `ca_rid`, `ch_chid`, `ch_uid`, `cr_cpj`, `cr_nite`, `cy_he`, `cy_tic`, `cy_vat`, `cz_ico`, `cz_vat`, `de_hrn`, `de_stn`, `de_vat`, `dk_cvr`, `dk_vat`, `do_rcn`, `ee_rk`, `ee_vat`, `es_cif`, `es_vat`, `fi_vat`, `fi_yt`, `fr_rna`, `fr_siren`, `fr_vat`, `gb_crn`, `gb_vat`, `gi_crn`, `gr_afm`, `gr_gemi`, `gr_vat`, `gt_nit`, `hk_br`, `hk_cr`, `hr_mbs`, `hr_oib`, `hr_vat`, `hu_cjs`, `hu_tin`, `hu_vat`, `ie_crn`, `ie_trn`, `ie_vat`, `it_rea`, `it_vat`, `jp_cn`, `kz_bin`, `li_uid`, `lt_ccrn`, `lt_vat`, `lu_nif`, `lu_rcs`, `lu_vat`, `lv_urn`, `lv_vat`, `mt_crn`, `mt_tin`, `mt_vat`, `mx_rfc`, `my_brn`, `my_coid`, `my_itn`, `my_sst`, `mz_nuit`, `nl_kvk`, `nl_rsin`, `nl_vat`, `no_orgnr`, `nz_bn`, `nz_ird`, `pe_ruc`, `pk_ntn`, `pl_nip`, `pl_regon`, `pl_vat`, `pt_vat`, `ro_cui`, `ro_orc`, `ro_vat`, `sa_crn`, `sa_tin`, `se_orgnr`, `se_vat`, `sg_uen`, `si_msp`, `si_tin`, `si_vat`, `sk_dic`, `sk_ico`, `sk_vat`, `th_crn`, `th_prn`, `th_tin`, `us_ein`.
  * `value` - The value of the ID number.
  """
  @type identity_business_details_id_numbers :: %{
          optional(:registrar) => String.t() | nil,
          optional(:type) => String.t() | nil,
          optional(:value) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `amount` - A non-negative integer representing the amount in the smallest currency unit.
  """
  @type identity_business_details_monthly_estimated_revenue :: %{
          optional(:amount) => identity_business_details_monthly_estimated_revenue_amount() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
  * `value` - A non-negative integer representing how much to charge in the [smallest currency unit](https://docs.stripe.com/currencies#minor-units).
  """
  @type identity_business_details_monthly_estimated_revenue_amount :: %{
          optional(:currency) => String.t() | nil,
          optional(:value) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `day` - The day of registration, between 1 and 31.
  * `month` - The month of registration, between 1 and 12.
  * `year` - The four-digit year of registration.
  """
  @type identity_business_details_registration_date :: %{
          optional(:day) => integer() | nil,
          optional(:month) => integer() | nil,
          optional(:year) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `kana` - Kana Address.
  * `kanji` - Kanji Address.
  """
  @type identity_business_details_script_addresses :: %{
          optional(:kana) => identity_business_details_script_addresses_kana() | nil,
          optional(:kanji) => identity_business_details_script_addresses_kanji() | nil,
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
  @type identity_business_details_script_addresses_kana :: %{
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
  @type identity_business_details_script_addresses_kanji :: %{
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
  * `kana` - Kana name.
  * `kanji` - Kanji name.
  """
  @type identity_business_details_script_names :: %{
          optional(:kana) => identity_business_details_script_names_kana() | nil,
          optional(:kanji) => identity_business_details_script_names_kanji() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `registered_name` - Registered name of the business.
  """
  @type identity_business_details_script_names_kana :: %{
          optional(:registered_name) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `registered_name` - Registered name of the business.
  """
  @type identity_business_details_script_names_kanji :: %{
          optional(:registered_name) => String.t() | nil,
          optional(String.t()) => term()
        }

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
  @type identity_individual :: %{
          optional(:additional_addresses) => [identity_individual_additional_addresses()] | nil,
          optional(:additional_names) => [identity_individual_additional_names()] | nil,
          optional(:address) => identity_individual_address() | nil,
          optional(:date_of_birth) => identity_individual_date_of_birth() | nil,
          optional(:documents) => identity_individual_documents() | nil,
          optional(:email) => String.t() | nil,
          optional(:given_name) => String.t() | nil,
          optional(:id_numbers) => [identity_individual_id_numbers()] | nil,
          optional(:legal_gender) => String.t() | nil,
          optional(:metadata) => %{String.t() => String.t()} | nil,
          optional(:nationalities) => [String.t()] | nil,
          optional(:phone) => String.t() | nil,
          optional(:political_exposure) => String.t() | nil,
          optional(:relationship) => identity_individual_relationship() | nil,
          optional(:script_addresses) => identity_individual_script_addresses() | nil,
          optional(:script_names) => identity_individual_script_names() | nil,
          optional(:surname) => String.t() | nil,
          optional(String.t()) => term()
        }

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
  @type identity_individual_additional_addresses :: %{
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
  * `full_name` - The person's full name.
  * `given_name` - The person's first or given name.
  * `purpose` - The purpose or type of the additional name. Possible values: `alias`, `maiden`.
  * `surname` - The person's last or family name.
  """
  @type identity_individual_additional_names :: %{
          optional(:full_name) => String.t() | nil,
          optional(:given_name) => String.t() | nil,
          optional(:purpose) => String.t() | nil,
          optional(:surname) => String.t() | nil,
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
  @type identity_individual_address :: %{
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
  * `day` - The day of the birth.
  * `month` - The month of birth.
  * `year` - The year of birth.
  """
  @type identity_individual_date_of_birth :: %{
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
  @type identity_individual_documents :: %{
          optional(:company_authorization) =>
            identity_individual_documents_company_authorization() | nil,
          optional(:passport) => identity_individual_documents_passport() | nil,
          optional(:primary_verification) =>
            identity_individual_documents_primary_verification() | nil,
          optional(:secondary_verification) =>
            identity_individual_documents_secondary_verification() | nil,
          optional(:visa) => identity_individual_documents_visa() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `files` - One or more document IDs returned by a [file upload](https://docs.stripe.com/api/persons/update#create_file) with a purpose value of `account_requirement`.
  * `type` - The format of the document. Currently supports `files` only. Possible values: `files`.
  """
  @type identity_individual_documents_company_authorization :: %{
          optional(:files) => [String.t()] | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `files` - One or more document IDs returned by a [file upload](https://docs.stripe.com/api/persons/update#create_file) with a purpose value of `account_requirement`.
  * `type` - The format of the document. Currently supports `files` only. Possible values: `files`.
  """
  @type identity_individual_documents_passport :: %{
          optional(:files) => [String.t()] | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `front_back` - The [file upload](https://docs.stripe.com/api/persons/update#create_file) tokens referring to each side of the document.
  * `type` - The format of the verification document. Currently supports `front_back` only. Possible values: `front_back`.
  """
  @type identity_individual_documents_primary_verification :: %{
          optional(:front_back) =>
            identity_individual_documents_primary_verification_front_back() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `back` - A [file upload](https://docs.stripe.com/api/persons/update#create_file) token representing the back of the verification document. The purpose of the uploaded file should be 'identity_document'. The uploaded file needs to be a color image (smaller than 8,000px by 8,000px), in JPG, PNG, or PDF format, and less than 10 MB in size.
  * `front` - A [file upload](https://docs.stripe.com/api/persons/update#create_file) token representing the front of the verification document. The purpose of the uploaded file should be 'identity_document'. The uploaded file needs to be a color image (smaller than 8,000px by 8,000px), in JPG, PNG, or PDF format, and less than 10 MB in size.
  """
  @type identity_individual_documents_primary_verification_front_back :: %{
          optional(:back) => String.t() | nil,
          optional(:front) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `front_back` - The [file upload](https://docs.stripe.com/api/persons/update#create_file) tokens referring to each side of the document.
  * `type` - The format of the verification document. Currently supports `front_back` only. Possible values: `front_back`.
  """
  @type identity_individual_documents_secondary_verification :: %{
          optional(:front_back) =>
            identity_individual_documents_secondary_verification_front_back() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `back` - A [file upload](https://docs.stripe.com/api/persons/update#create_file) token representing the back of the verification document. The purpose of the uploaded file should be 'identity_document'. The uploaded file needs to be a color image (smaller than 8,000px by 8,000px), in JPG, PNG, or PDF format, and less than 10 MB in size.
  * `front` - A [file upload](https://docs.stripe.com/api/persons/update#create_file) token representing the front of the verification document. The purpose of the uploaded file should be 'identity_document'. The uploaded file needs to be a color image (smaller than 8,000px by 8,000px), in JPG, PNG, or PDF format, and less than 10 MB in size.
  """
  @type identity_individual_documents_secondary_verification_front_back :: %{
          optional(:back) => String.t() | nil,
          optional(:front) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `files` - One or more document IDs returned by a [file upload](https://docs.stripe.com/api/persons/update#create_file) with a purpose value of `account_requirement`.
  * `type` - The format of the document. Currently supports `files` only. Possible values: `files`.
  """
  @type identity_individual_documents_visa :: %{
          optional(:files) => [String.t()] | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - The ID number type of an individual. Possible values: `ae_eid`, `ao_nif`, `ar_cuil`, `ar_dni`, `at_stn`, `az_tin`, `bd_brc`, `bd_etin`, `bd_nid`, `be_nrn`, `bg_ucn`, `bn_nric`, `br_cpf`, `ca_sin`, `ch_oasi`, `cl_rut`, `cn_pp`, `co_nuip`, `cr_ci`, `cr_cpf`, `cr_dimex`, `cr_nite`, `cy_tic`, `cz_rc`, `de_stn`, `dk_cpr`, `do_cie`, `do_rcn`, `ec_ci`, `ee_ik`, `es_nif`, `fi_hetu`, `fr_nir`, `gb_nino`, `gr_afm`, `gt_nit`, `hk_id`, `hr_oib`, `hu_ad`, `id_nik`, `ie_ppsn`, `is_kt`, `it_cf`, `jp_inc`, `ke_pin`, `kz_iin`, `li_peid`, `lt_ak`, `lu_nif`, `lv_pk`, `mx_rfc`, `my_nric`, `mz_nuit`, `ng_nin`, `nl_bsn`, `no_nin`, `nz_ird`, `pe_dni`, `pk_cnic`, `pk_snic`, `pl_pesel`, `pt_nif`, `ro_cnp`, `sa_tin`, `se_pin`, `sg_fin`, `sg_nric`, `sk_dic`, `th_lc`, `th_pin`, `tr_tin`, `us_itin`, `us_itin_last_4`, `us_ssn`, `us_ssn_last_4`, `uy_dni`, `za_id`.
  * `value` - The value of the ID number.
  """
  @type identity_individual_id_numbers :: %{
          optional(:type) => String.t() | nil,
          optional(:value) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `director` - Whether the person is a director of the account's identity. Directors are typically members of the governing board of the company, or responsible for ensuring the company meets its regulatory obligations.
  * `executive` - Whether the person has significant responsibility to control, manage, or direct the organization.
  * `owner` - Whether the person is an owner of the account’s identity.
  * `percent_ownership` - The percent owned by the person of the account's legal entity. Format: decimal string.
  * `title` - The person's title (e.g., CEO, Support Engineer).
  """
  @type identity_individual_relationship :: %{
          optional(:director) => boolean() | nil,
          optional(:executive) => boolean() | nil,
          optional(:owner) => boolean() | nil,
          optional(:percent_ownership) => String.t() | nil,
          optional(:title) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `kana` - Kana Address.
  * `kanji` - Kanji Address.
  """
  @type identity_individual_script_addresses :: %{
          optional(:kana) => identity_individual_script_addresses_kana() | nil,
          optional(:kanji) => identity_individual_script_addresses_kanji() | nil,
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
  @type identity_individual_script_addresses_kana :: %{
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
  @type identity_individual_script_addresses_kanji :: %{
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
  @type identity_individual_script_names :: %{
          optional(:kana) => identity_individual_script_names_kana() | nil,
          optional(:kanji) => identity_individual_script_names_kanji() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `given_name` - The person's first or given name.
  * `surname` - The person's last or family name.
  """
  @type identity_individual_script_names_kana :: %{
          optional(:given_name) => String.t() | nil,
          optional(:surname) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `given_name` - The person's first or given name.
  * `surname` - The person's last or family name.
  """
  @type identity_individual_script_names_kanji :: %{
          optional(:given_name) => String.t() | nil,
          optional(:surname) => String.t() | nil,
          optional(String.t()) => term()
        }
end
