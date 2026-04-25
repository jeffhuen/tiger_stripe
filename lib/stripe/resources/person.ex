# File generated from our OpenAPI spec
defmodule Stripe.Resources.Person do
  @moduledoc """
  Person

  This is an object representing a person associated with a Stripe account.

  A platform can only access a subset of data in a person for an account where [account.controller.requirement_collection](https://docs.stripe.com/api/accounts/object#account_object-controller-requirement_collection) is `stripe`, which includes Standard and Express accounts, after creating an Account Link or Account Session to start Connect onboarding.

  See the [Standard onboarding](https://stripe.com/connect/standard-accounts) or [Express onboarding](https://stripe.com/connect/express-accounts) documentation for information about prefilling information and account onboarding steps. Learn more about [handling identity verification with the API](https://stripe.com/connect/handling-api-verification#person-information).
  """

  @typedoc """
  * `account` - The account the person is associated with. Max length: 5000.
  * `additional_tos_acceptances` - Expandable.
  * `address` - Expandable.
  * `address_kana` - The Kana variation of the person's address (Japan only). Nullable. Expandable.
  * `address_kanji` - The Kanji variation of the person's address (Japan only). Nullable. Expandable.
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `dob` - Expandable.
  * `email` - The person's email address. Also available for accounts where [controller.requirement_collection](https://docs.stripe.com/api/accounts/object#account_object-controller-requirement_collection) is `stripe`. Max length: 5000. Nullable.
  * `first_name` - The person's first name. Also available for accounts where [controller.requirement_collection](https://docs.stripe.com/api/accounts/object#account_object-controller-requirement_collection) is `stripe`. Max length: 5000. Nullable.
  * `first_name_kana` - The Kana variation of the person's first name (Japan only). Also available for accounts where [controller.requirement_collection](https://docs.stripe.com/api/accounts/object#account_object-controller-requirement_collection) is `stripe`. Max length: 5000. Nullable.
  * `first_name_kanji` - The Kanji variation of the person's first name (Japan only). Also available for accounts where [controller.requirement_collection](https://docs.stripe.com/api/accounts/object#account_object-controller-requirement_collection) is `stripe`. Max length: 5000. Nullable.
  * `full_name_aliases` - A list of alternate names or aliases that the person is known by. Also available for accounts where [controller.requirement_collection](https://docs.stripe.com/api/accounts/object#account_object-controller-requirement_collection) is `stripe`.
  * `future_requirements` - Information about the [upcoming new requirements for this person](https://docs.stripe.com/connect/custom-accounts/future-requirements), including what information needs to be collected, and by when. Nullable. Expandable.
  * `gender` - The person's gender. Nullable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `id_number_provided` - Whether the person's `id_number` was provided. True if either the full ID number was provided or if only the required part of the ID number was provided (ex. last four of an individual's SSN for the US indicated by `ssn_last_4_provided`).
  * `id_number_secondary_provided` - Whether the person's `id_number_secondary` was provided.
  * `last_name` - The person's last name. Also available for accounts where [controller.requirement_collection](https://docs.stripe.com/api/accounts/object#account_object-controller-requirement_collection) is `stripe`. Max length: 5000. Nullable.
  * `last_name_kana` - The Kana variation of the person's last name (Japan only). Also available for accounts where [controller.requirement_collection](https://docs.stripe.com/api/accounts/object#account_object-controller-requirement_collection) is `stripe`. Max length: 5000. Nullable.
  * `last_name_kanji` - The Kanji variation of the person's last name (Japan only). Also available for accounts where [controller.requirement_collection](https://docs.stripe.com/api/accounts/object#account_object-controller-requirement_collection) is `stripe`. Max length: 5000. Nullable.
  * `maiden_name` - The person's maiden name. Max length: 5000. Nullable.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
  * `nationality` - The country where the person is a national. Max length: 5000. Nullable.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `person`.
  * `phone` - The person's phone number. Max length: 5000. Nullable.
  * `political_exposure` - Indicates if the person or any of their representatives, family members, or other closely related persons, declares that they hold or have held an important public job or function, in any jurisdiction. Possible values: `existing`, `none`.
  * `registered_address` - Expandable.
  * `relationship` - Expandable.
  * `requirements` - Information about the requirements for this person, including what information needs to be collected, and by when. Nullable. Expandable.
  * `ssn_last_4_provided` - Whether the last four digits of the person's Social Security number have been provided (U.S. only).
  * `us_cfpb_data` - Demographic data related to the person. Nullable. Expandable.
  * `verification` - Expandable.
  """
  @type t :: %__MODULE__{
          account: String.t() | nil,
          additional_tos_acceptances: additional_tos_acceptances() | nil,
          address: Stripe.Resources.Address.t() | nil,
          address_kana: address_kana() | nil,
          address_kanji: address_kanji() | nil,
          created: integer(),
          dob: dob() | nil,
          email: String.t() | nil,
          first_name: String.t() | nil,
          first_name_kana: String.t() | nil,
          first_name_kanji: String.t() | nil,
          full_name_aliases: [String.t()] | nil,
          future_requirements: future_requirements() | nil,
          gender: String.t() | nil,
          id: String.t(),
          id_number_provided: boolean() | nil,
          id_number_secondary_provided: boolean() | nil,
          last_name: String.t() | nil,
          last_name_kana: String.t() | nil,
          last_name_kanji: String.t() | nil,
          maiden_name: String.t() | nil,
          metadata: %{String.t() => String.t()} | nil,
          nationality: String.t() | nil,
          object: String.t(),
          phone: String.t() | nil,
          political_exposure: String.t() | nil,
          registered_address: Stripe.Resources.Address.t() | nil,
          relationship: relationship() | nil,
          requirements: requirements() | nil,
          ssn_last_4_provided: boolean() | nil,
          us_cfpb_data: us_cfpb_data() | nil,
          verification: verification() | nil
        }

  defstruct [
    :account,
    :additional_tos_acceptances,
    :address,
    :address_kana,
    :address_kanji,
    :created,
    :dob,
    :email,
    :first_name,
    :first_name_kana,
    :first_name_kanji,
    :full_name_aliases,
    :future_requirements,
    :gender,
    :id,
    :id_number_provided,
    :id_number_secondary_provided,
    :last_name,
    :last_name_kana,
    :last_name_kanji,
    :maiden_name,
    :metadata,
    :nationality,
    :object,
    :phone,
    :political_exposure,
    :registered_address,
    :relationship,
    :requirements,
    :ssn_last_4_provided,
    :us_cfpb_data,
    :verification
  ]

  @object_name "person"
  def object_name, do: @object_name

  def expandable_fields,
    do: [
      "additional_tos_acceptances",
      "address",
      "address_kana",
      "address_kanji",
      "dob",
      "future_requirements",
      "registered_address",
      "relationship",
      "requirements",
      "us_cfpb_data",
      "verification"
    ]

  @typedoc """
  * `account` - Details on the legal guardian's acceptance of the main Stripe service agreement. Nullable.
  """
  @type additional_tos_acceptances :: %{
          optional(:account) => additional_tos_acceptances_account() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `date` - The Unix timestamp marking when the legal guardian accepted the service agreement. Format: Unix timestamp. Nullable.
  * `ip` - The IP address from which the legal guardian accepted the service agreement. Max length: 5000. Nullable.
  * `user_agent` - The user agent of the browser from which the legal guardian accepted the service agreement. Max length: 5000. Nullable.
  """
  @type additional_tos_acceptances_account :: %{
          optional(:date) => integer() | nil,
          optional(:ip) => String.t() | nil,
          optional(:user_agent) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `city` - City/Ward. Max length: 5000. Nullable.
  * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)). Max length: 5000. Nullable.
  * `line1` - Block/Building number. Max length: 5000. Nullable.
  * `line2` - Building details. Max length: 5000. Nullable.
  * `postal_code` - ZIP or postal code. Max length: 5000. Nullable.
  * `state` - Prefecture. Max length: 5000. Nullable.
  * `town` - Town/cho-me. Max length: 5000. Nullable.
  """
  @type address_kana :: %{
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
  * `city` - City/Ward. Max length: 5000. Nullable.
  * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)). Max length: 5000. Nullable.
  * `line1` - Block/Building number. Max length: 5000. Nullable.
  * `line2` - Building details. Max length: 5000. Nullable.
  * `postal_code` - ZIP or postal code. Max length: 5000. Nullable.
  * `state` - Prefecture. Max length: 5000. Nullable.
  * `town` - Town/cho-me. Max length: 5000. Nullable.
  """
  @type address_kanji :: %{
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
  * `day` - The day of birth, between 1 and 31. Nullable.
  * `month` - The month of birth, between 1 and 12. Nullable.
  * `year` - The four-digit year of birth. Nullable.
  """
  @type dob :: %{
          optional(:day) => integer() | nil,
          optional(:month) => integer() | nil,
          optional(:year) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `alternatives` - Fields that are due and can be resolved by providing the corresponding alternative fields instead. Many alternatives can list the same `original_fields_due`, and any of these alternatives can serve as a pathway for attempting to resolve the fields again. Re-providing `original_fields_due` also serves as a pathway for attempting to resolve the fields again. Nullable.
  * `currently_due` - Fields that need to be resolved to keep the person's account enabled. If not resolved by the account's `future_requirements[current_deadline]`, these fields will transition to the main `requirements` hash, and may immediately become `past_due`, but the account may also be given a grace period depending on the account's enablement state prior to transition.
  * `errors` - Details about validation and verification failures for `due` requirements that must be resolved.
  * `eventually_due` - Fields you must collect when all thresholds are reached. As they become required, they appear in `currently_due` as well, and the account's `future_requirements[current_deadline]` becomes set.
  * `past_due` - Fields that haven't been resolved by the account's `requirements.current_deadline`. These fields need to be resolved to enable the person's account. `future_requirements.past_due` is a subset of `requirements.past_due`.
  * `pending_verification` - Fields that are being reviewed, or might become required depending on the results of a review. If the review fails, these fields can move to `eventually_due`, `currently_due`, `past_due` or `alternatives`. Fields might appear in `eventually_due`, `currently_due`, `past_due` or `alternatives` and in `pending_verification` if one verification fails but another is still pending.
  """
  @type future_requirements :: %{
          optional(:alternatives) => [future_requirements_alternatives()] | nil,
          optional(:currently_due) => [String.t()] | nil,
          optional(:errors) => [future_requirements_errors()] | nil,
          optional(:eventually_due) => [String.t()] | nil,
          optional(:past_due) => [String.t()] | nil,
          optional(:pending_verification) => [String.t()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `alternative_fields_due` - Fields that can be provided to resolve all fields in `original_fields_due`.
  * `original_fields_due` - Fields that are due and can be resolved by providing all fields in `alternative_fields_due`.
  """
  @type future_requirements_alternatives :: %{
          optional(:alternative_fields_due) => [String.t()] | nil,
          optional(:original_fields_due) => [String.t()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `code` - The code for the type of error. Possible values: `external_request`, `information_missing`, `invalid_address_city_state_postal_code`, `invalid_address_highway_contract_box`, `invalid_address_private_mailbox`, `invalid_business_profile_name`, `invalid_business_profile_name_denylisted`, `invalid_company_name_denylisted`, `invalid_dob_age_over_maximum`, `invalid_dob_age_under_18`, `invalid_dob_age_under_minimum`, `invalid_product_description_length`, `invalid_product_description_url_match`, `invalid_representative_country`, `invalid_signator`, `invalid_statement_descriptor_business_mismatch`, `invalid_statement_descriptor_denylisted`, `invalid_statement_descriptor_length`, `invalid_statement_descriptor_prefix_denylisted`, `invalid_statement_descriptor_prefix_mismatch`, `invalid_street_address`, `invalid_tax_id`, `invalid_tax_id_format`, `invalid_tos_acceptance`, `invalid_url_denylisted`, `invalid_url_format`, `invalid_url_length`, `invalid_url_web_presence_detected`, `invalid_url_website_business_information_mismatch`, `invalid_url_website_empty`, `invalid_url_website_inaccessible`, `invalid_url_website_inaccessible_geoblocked`, `invalid_url_website_inaccessible_password_protected`, `invalid_url_website_incomplete`, `invalid_url_website_incomplete_cancellation_policy`, `invalid_url_website_incomplete_customer_service_details`, `invalid_url_website_incomplete_legal_restrictions`, `invalid_url_website_incomplete_refund_policy`, `invalid_url_website_incomplete_return_policy`, `invalid_url_website_incomplete_terms_and_conditions`, `invalid_url_website_incomplete_under_construction`, `invalid_url_website_other`, `invalid_value_other`, `unsupported_business_type`, `verification_directors_mismatch`, `verification_document_address_mismatch`, `verification_document_address_missing`, `verification_document_corrupt`, `verification_document_country_not_supported`, `verification_document_directors_mismatch`, `verification_document_dob_mismatch`, `verification_document_duplicate_type`, `verification_document_expired`, `verification_document_failed_copy`, `verification_document_failed_greyscale`, `verification_document_failed_other`, `verification_document_failed_test_mode`, `verification_document_fraudulent`, `verification_document_id_number_mismatch`, `verification_document_id_number_missing`, `verification_document_incomplete`, `verification_document_invalid`, `verification_document_issue_or_expiry_date_missing`, `verification_document_manipulated`, `verification_document_missing_back`, `verification_document_missing_front`, `verification_document_name_mismatch`, `verification_document_name_missing`, `verification_document_nationality_mismatch`, `verification_document_not_readable`, `verification_document_not_signed`, `verification_document_not_uploaded`, `verification_document_photo_mismatch`, `verification_document_too_large`, `verification_document_type_not_supported`, `verification_extraneous_directors`, `verification_failed_address_match`, `verification_failed_authorizer_authority`, `verification_failed_business_iec_number`, `verification_failed_document_match`, `verification_failed_id_number_match`, `verification_failed_keyed_identity`, `verification_failed_keyed_match`, `verification_failed_name_match`, `verification_failed_other`, `verification_failed_representative_authority`, `verification_failed_residential_address`, `verification_failed_tax_id_match`, `verification_failed_tax_id_not_issued`, `verification_legal_entity_structure_mismatch`, `verification_missing_directors`, `verification_missing_executives`, `verification_missing_owners`, `verification_rejected_ownership_exemption_reason`, `verification_requires_additional_memorandum_of_associations`, `verification_requires_additional_proof_of_registration`, `verification_supportability`.
  * `reason` - An informative message that indicates the error type and provides additional details about the error. Max length: 5000.
  * `requirement` - The specific user onboarding requirement field (in the requirements hash) that needs to be resolved. Max length: 5000.
  """
  @type future_requirements_errors :: %{
          optional(:code) => String.t() | nil,
          optional(:reason) => String.t() | nil,
          optional(:requirement) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `authorizer` - Whether the person is the authorizer of the account's representative. Nullable.
  * `director` - Whether the person is a director of the account's legal entity. Directors are typically members of the governing board of the company, or responsible for ensuring the company meets its regulatory obligations. Nullable.
  * `executive` - Whether the person has significant responsibility to control, manage, or direct the organization. Nullable.
  * `legal_guardian` - Whether the person is the legal guardian of the account's representative. Nullable.
  * `owner` - Whether the person is an owner of the account’s legal entity. Nullable.
  * `percent_ownership` - The percent owned by the person of the account's legal entity. Nullable.
  * `representative` - Whether the person is authorized as the primary representative of the account. This is the person nominated by the business to provide information about themselves, and general information about the account. There can only be one representative at any given time. At the time the account is created, this person should be set to the person responsible for opening the account. Nullable.
  * `title` - The person's title (e.g., CEO, Support Engineer). Max length: 5000. Nullable.
  """
  @type relationship :: %{
          optional(:authorizer) => boolean() | nil,
          optional(:director) => boolean() | nil,
          optional(:executive) => boolean() | nil,
          optional(:legal_guardian) => boolean() | nil,
          optional(:owner) => boolean() | nil,
          optional(:percent_ownership) => float() | nil,
          optional(:representative) => boolean() | nil,
          optional(:title) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `alternatives` - Fields that are due and can be resolved by providing the corresponding alternative fields instead. Many alternatives can list the same `original_fields_due`, and any of these alternatives can serve as a pathway for attempting to resolve the fields again. Re-providing `original_fields_due` also serves as a pathway for attempting to resolve the fields again. Nullable.
  * `currently_due` - Fields that need to be resolved to keep the person's account enabled. If not resolved by the account's `current_deadline`, these fields will appear in `past_due` as well, and the account is disabled.
  * `errors` - Details about validation and verification failures for `due` requirements that must be resolved.
  * `eventually_due` - Fields you must collect when all thresholds are reached. As they become required, they appear in `currently_due` as well, and the account's `current_deadline` becomes set.
  * `past_due` - Fields that haven't been resolved by `current_deadline`. These fields need to be resolved to enable the person's account.
  * `pending_verification` - Fields that are being reviewed, or might become required depending on the results of a review. If the review fails, these fields can move to `eventually_due`, `currently_due`, `past_due` or `alternatives`. Fields might appear in `eventually_due`, `currently_due`, `past_due` or `alternatives` and in `pending_verification` if one verification fails but another is still pending.
  """
  @type requirements :: %{
          optional(:alternatives) => [requirements_alternatives()] | nil,
          optional(:currently_due) => [String.t()] | nil,
          optional(:errors) => [requirements_errors()] | nil,
          optional(:eventually_due) => [String.t()] | nil,
          optional(:past_due) => [String.t()] | nil,
          optional(:pending_verification) => [String.t()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `alternative_fields_due` - Fields that can be provided to resolve all fields in `original_fields_due`.
  * `original_fields_due` - Fields that are due and can be resolved by providing all fields in `alternative_fields_due`.
  """
  @type requirements_alternatives :: %{
          optional(:alternative_fields_due) => [String.t()] | nil,
          optional(:original_fields_due) => [String.t()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `code` - The code for the type of error. Possible values: `external_request`, `information_missing`, `invalid_address_city_state_postal_code`, `invalid_address_highway_contract_box`, `invalid_address_private_mailbox`, `invalid_business_profile_name`, `invalid_business_profile_name_denylisted`, `invalid_company_name_denylisted`, `invalid_dob_age_over_maximum`, `invalid_dob_age_under_18`, `invalid_dob_age_under_minimum`, `invalid_product_description_length`, `invalid_product_description_url_match`, `invalid_representative_country`, `invalid_signator`, `invalid_statement_descriptor_business_mismatch`, `invalid_statement_descriptor_denylisted`, `invalid_statement_descriptor_length`, `invalid_statement_descriptor_prefix_denylisted`, `invalid_statement_descriptor_prefix_mismatch`, `invalid_street_address`, `invalid_tax_id`, `invalid_tax_id_format`, `invalid_tos_acceptance`, `invalid_url_denylisted`, `invalid_url_format`, `invalid_url_length`, `invalid_url_web_presence_detected`, `invalid_url_website_business_information_mismatch`, `invalid_url_website_empty`, `invalid_url_website_inaccessible`, `invalid_url_website_inaccessible_geoblocked`, `invalid_url_website_inaccessible_password_protected`, `invalid_url_website_incomplete`, `invalid_url_website_incomplete_cancellation_policy`, `invalid_url_website_incomplete_customer_service_details`, `invalid_url_website_incomplete_legal_restrictions`, `invalid_url_website_incomplete_refund_policy`, `invalid_url_website_incomplete_return_policy`, `invalid_url_website_incomplete_terms_and_conditions`, `invalid_url_website_incomplete_under_construction`, `invalid_url_website_other`, `invalid_value_other`, `unsupported_business_type`, `verification_directors_mismatch`, `verification_document_address_mismatch`, `verification_document_address_missing`, `verification_document_corrupt`, `verification_document_country_not_supported`, `verification_document_directors_mismatch`, `verification_document_dob_mismatch`, `verification_document_duplicate_type`, `verification_document_expired`, `verification_document_failed_copy`, `verification_document_failed_greyscale`, `verification_document_failed_other`, `verification_document_failed_test_mode`, `verification_document_fraudulent`, `verification_document_id_number_mismatch`, `verification_document_id_number_missing`, `verification_document_incomplete`, `verification_document_invalid`, `verification_document_issue_or_expiry_date_missing`, `verification_document_manipulated`, `verification_document_missing_back`, `verification_document_missing_front`, `verification_document_name_mismatch`, `verification_document_name_missing`, `verification_document_nationality_mismatch`, `verification_document_not_readable`, `verification_document_not_signed`, `verification_document_not_uploaded`, `verification_document_photo_mismatch`, `verification_document_too_large`, `verification_document_type_not_supported`, `verification_extraneous_directors`, `verification_failed_address_match`, `verification_failed_authorizer_authority`, `verification_failed_business_iec_number`, `verification_failed_document_match`, `verification_failed_id_number_match`, `verification_failed_keyed_identity`, `verification_failed_keyed_match`, `verification_failed_name_match`, `verification_failed_other`, `verification_failed_representative_authority`, `verification_failed_residential_address`, `verification_failed_tax_id_match`, `verification_failed_tax_id_not_issued`, `verification_legal_entity_structure_mismatch`, `verification_missing_directors`, `verification_missing_executives`, `verification_missing_owners`, `verification_rejected_ownership_exemption_reason`, `verification_requires_additional_memorandum_of_associations`, `verification_requires_additional_proof_of_registration`, `verification_supportability`.
  * `reason` - An informative message that indicates the error type and provides additional details about the error. Max length: 5000.
  * `requirement` - The specific user onboarding requirement field (in the requirements hash) that needs to be resolved. Max length: 5000.
  """
  @type requirements_errors :: %{
          optional(:code) => String.t() | nil,
          optional(:reason) => String.t() | nil,
          optional(:requirement) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `ethnicity_details` - The persons ethnicity details Nullable.
  * `race_details` - The persons race details Nullable.
  * `self_identified_gender` - The persons self-identified gender Max length: 5000. Nullable.
  """
  @type us_cfpb_data :: %{
          optional(:ethnicity_details) => us_cfpb_data_ethnicity_details() | nil,
          optional(:race_details) => us_cfpb_data_race_details() | nil,
          optional(:self_identified_gender) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `ethnicity` - The persons ethnicity Nullable.
  * `ethnicity_other` - Please specify your origin, when other is selected. Max length: 5000. Nullable.
  """
  @type us_cfpb_data_ethnicity_details :: %{
          optional(:ethnicity) => [String.t()] | nil,
          optional(:ethnicity_other) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `race` - The persons race. Nullable.
  * `race_other` - Please specify your race, when other is selected. Max length: 5000. Nullable.
  """
  @type us_cfpb_data_race_details :: %{
          optional(:race) => [String.t()] | nil,
          optional(:race_other) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `additional_document` - A document showing address, either a passport, local ID card, or utility bill from a well-known utility company. Nullable.
  * `details` - A user-displayable string describing the verification state for the person. For example, this may say "Provided identity information could not be verified". Max length: 5000. Nullable.
  * `details_code` - One of `document_address_mismatch`, `document_dob_mismatch`, `document_duplicate_type`, `document_id_number_mismatch`, `document_name_mismatch`, `document_nationality_mismatch`, `failed_keyed_identity`, or `failed_other`. A machine-readable code specifying the verification state for the person. Max length: 5000. Nullable.
  * `document`
  * `status` - The state of verification for the person. Possible values are `unverified`, `pending`, or `verified`. Please refer [guide](https://docs.stripe.com/connect/handling-api-verification) to handle verification updates. Max length: 5000.
  """
  @type verification :: %{
          optional(:additional_document) => verification_additional_document() | nil,
          optional(:details) => String.t() | nil,
          optional(:details_code) => String.t() | nil,
          optional(:document) => verification_document() | nil,
          optional(:status) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `back` - The back of an ID returned by a [file upload](https://api.stripe.com#create_file) with a `purpose` value of `identity_document`. Nullable.
  * `details` - A user-displayable string describing the verification state of this document. For example, if a document is uploaded and the picture is too fuzzy, this may say "Identity document is too unclear to read". Max length: 5000. Nullable.
  * `details_code` - One of `document_corrupt`, `document_country_not_supported`, `document_expired`, `document_failed_copy`, `document_failed_other`, `document_failed_test_mode`, `document_fraudulent`, `document_failed_greyscale`, `document_incomplete`, `document_invalid`, `document_manipulated`, `document_missing_back`, `document_missing_front`, `document_not_readable`, `document_not_uploaded`, `document_photo_mismatch`, `document_too_large`, or `document_type_not_supported`. A machine-readable code specifying the verification state for this document. Max length: 5000. Nullable.
  * `front` - The front of an ID returned by a [file upload](https://api.stripe.com#create_file) with a `purpose` value of `identity_document`. Nullable.
  """
  @type verification_additional_document :: %{
          optional(:back) => String.t() | Stripe.Resources.File.t() | nil,
          optional(:details) => String.t() | nil,
          optional(:details_code) => String.t() | nil,
          optional(:front) => String.t() | Stripe.Resources.File.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `back` - The back of an ID returned by a [file upload](https://api.stripe.com#create_file) with a `purpose` value of `identity_document`. Nullable.
  * `details` - A user-displayable string describing the verification state of this document. For example, if a document is uploaded and the picture is too fuzzy, this may say "Identity document is too unclear to read". Max length: 5000. Nullable.
  * `details_code` - One of `document_corrupt`, `document_country_not_supported`, `document_expired`, `document_failed_copy`, `document_failed_other`, `document_failed_test_mode`, `document_fraudulent`, `document_failed_greyscale`, `document_incomplete`, `document_invalid`, `document_manipulated`, `document_missing_back`, `document_missing_front`, `document_not_readable`, `document_not_uploaded`, `document_photo_mismatch`, `document_too_large`, or `document_type_not_supported`. A machine-readable code specifying the verification state for this document. Max length: 5000. Nullable.
  * `front` - The front of an ID returned by a [file upload](https://api.stripe.com#create_file) with a `purpose` value of `identity_document`. Nullable.
  """
  @type verification_document :: %{
          optional(:back) => String.t() | Stripe.Resources.File.t() | nil,
          optional(:details) => String.t() | nil,
          optional(:details_code) => String.t() | nil,
          optional(:front) => String.t() | Stripe.Resources.File.t() | nil,
          optional(String.t()) => term()
        }

  def __nested_fields__ do
    %{
      "additional_tos_acceptances" => %{
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
      "address_kana" => %{
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
      "address_kanji" => %{
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
      "dob" => %{
        fields: %{
          "day" => :scalar,
          "month" => :scalar,
          "year" => :scalar
        }
      },
      "future_requirements" => %{
        fields: %{
          "alternatives" =>
            {:list,
             %{
               fields: %{
                 "alternative_fields_due" => {:list, :scalar},
                 "original_fields_due" => {:list, :scalar}
               }
             }},
          "currently_due" => {:list, :scalar},
          "errors" =>
            {:list,
             %{
               fields: %{
                 "code" => :scalar,
                 "reason" => :scalar,
                 "requirement" => :scalar
               }
             }},
          "eventually_due" => {:list, :scalar},
          "past_due" => {:list, :scalar},
          "pending_verification" => {:list, :scalar}
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
      "requirements" => %{
        fields: %{
          "alternatives" =>
            {:list,
             %{
               fields: %{
                 "alternative_fields_due" => {:list, :scalar},
                 "original_fields_due" => {:list, :scalar}
               }
             }},
          "currently_due" => {:list, :scalar},
          "errors" =>
            {:list,
             %{
               fields: %{
                 "code" => :scalar,
                 "reason" => :scalar,
                 "requirement" => :scalar
               }
             }},
          "eventually_due" => {:list, :scalar},
          "past_due" => {:list, :scalar},
          "pending_verification" => {:list, :scalar}
        }
      },
      "us_cfpb_data" => %{
        fields: %{
          "ethnicity_details" => %{
            fields: %{
              "ethnicity" => {:list, :scalar},
              "ethnicity_other" => :scalar
            }
          },
          "race_details" => %{
            fields: %{
              "race" => {:list, :scalar},
              "race_other" => :scalar
            }
          },
          "self_identified_gender" => :scalar
        }
      },
      "verification" => %{
        fields: %{
          "additional_document" => %{
            fields: %{
              "back" => {:resource, Stripe.Resources.File},
              "details" => :scalar,
              "details_code" => :scalar,
              "front" => {:resource, Stripe.Resources.File}
            }
          },
          "details" => :scalar,
          "details_code" => :scalar,
          "document" => %{
            fields: %{
              "back" => {:resource, Stripe.Resources.File},
              "details" => :scalar,
              "details_code" => :scalar,
              "front" => {:resource, Stripe.Resources.File}
            }
          },
          "status" => :scalar
        }
      },
      "address" => {:resource, Stripe.Resources.Address},
      "registered_address" => {:resource, Stripe.Resources.Address}
    }
  end
end
