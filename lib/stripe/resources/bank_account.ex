# File generated from our OpenAPI spec
defmodule Stripe.Resources.BankAccount do
  @moduledoc """
  BankAccount

  These bank accounts are payment methods on `Customer` objects.

  On the other hand [External Accounts](https://stripe.com/api#external_accounts) are transfer
  destinations on `Account` objects for connected accounts.
  They can be bank accounts or debit cards as well, and are documented in the links above.

  Related guide: [Bank debits and transfers](https://stripe.com/payments/bank-debits-transfers)
  """

  @typedoc """
  * `account` - The account this bank account belongs to. Only applicable on Accounts (not customers or recipients) This property is only available when returned as an [External Account](https://docs.stripe.com/api/external_account_bank_accounts/object) where [controller.is_controller](https://docs.stripe.com/api/accounts/object#account_object-controller-is_controller) is `true`. Nullable. Expandable.
  * `account_holder_name` - The name of the person or business that owns the bank account. Max length: 5000. Nullable.
  * `account_holder_type` - The type of entity that holds the account. This can be either `individual` or `company`. Max length: 5000. Nullable.
  * `account_type` - The bank account type. This can only be `checking` or `savings` in most countries. In Japan, this can only be `futsu` or `toza`. Max length: 5000. Nullable.
  * `available_payout_methods` - A set of available payout methods for this bank account. Only values from this set should be passed as the `method` when creating a payout. Nullable.
  * `bank_name` - Name of the bank associated with the routing number (e.g., `WELLS FARGO`). Max length: 5000. Nullable.
  * `country` - Two-letter ISO code representing the country the bank account is located in. Max length: 5000.
  * `currency` - Three-letter [ISO code for the currency](https://stripe.com/docs/payouts) paid out to the bank account. Format: ISO 4217 currency code.
  * `customer` - The ID of the customer that the bank account is associated with. Nullable. Expandable.
  * `default_for_currency` - Whether this bank account is the default external account for its currency. Nullable.
  * `fingerprint` - Uniquely identifies this particular bank account. You can use this attribute to check whether two bank accounts are the same. Max length: 5000. Nullable.
  * `future_requirements` - Information about the [upcoming new requirements for the bank account](https://docs.stripe.com/connect/custom-accounts/future-requirements), including what information needs to be collected, and by when. Nullable. Expandable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `last4` - The last four digits of the bank account number. Max length: 5000.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Nullable.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `bank_account`.
  * `requirements` - Information about the requirements for the bank account, including what information needs to be collected. Nullable. Expandable.
  * `routing_number` - The routing transit number for the bank account. Max length: 5000. Nullable.
  * `status` - For bank accounts, possible values are `new`, `validated`, `verified`, `verification_failed`, `tokenized_account_number_deactivated` or `errored`. A bank account that hasn't had any activity or validation performed is `new`. If Stripe can determine that the bank account exists, its status will be `validated`. Note that there often isn’t enough information to know (e.g., for smaller credit unions), and the validation is not always run. If customer bank account verification has succeeded, the bank account status will be `verified`. If the verification failed for any reason, such as microdeposit failure, the status will be `verification_failed`. If the status is `tokenized_account_number_deactivated`, the account utilizes a tokenized account number which has been deactivated due to expiration or revocation. This account will need to be reverified to continue using it for money movement. If a payout sent to this bank account fails, we'll set the status to `errored` and will not continue to send [scheduled payouts](https://stripe.com/docs/payouts#payout-schedule) until the bank details are updated.

  For external accounts, possible values are `new`, `errored`, `verification_failed`, and `tokenized_account_number_deactivated`. If a payout fails, the status is set to `errored` and scheduled payouts are stopped until account details are updated. In the US and India, if we can't [verify the owner of the bank account](https://support.stripe.com/questions/bank-account-ownership-verification), we'll set the status to `verification_failed`. Other validations aren't run against external accounts because they're only used for payouts. This means the other statuses don't apply. Max length: 5000.
  """
  @type t :: %__MODULE__{
          account: String.t() | Stripe.Resources.Account.t() | nil,
          account_holder_name: String.t(),
          account_holder_type: String.t(),
          account_type: String.t(),
          available_payout_methods: [String.t()] | nil,
          bank_name: String.t(),
          country: String.t(),
          currency: String.t(),
          customer: String.t() | Stripe.Resources.Customer.t() | nil,
          default_for_currency: boolean() | nil,
          fingerprint: String.t(),
          future_requirements: future_requirements() | nil,
          id: String.t(),
          last4: String.t(),
          metadata: %{String.t() => String.t()} | nil,
          object: String.t(),
          requirements: requirements() | nil,
          routing_number: String.t(),
          status: String.t()
        }

  defstruct [
    :account,
    :account_holder_name,
    :account_holder_type,
    :account_type,
    :available_payout_methods,
    :bank_name,
    :country,
    :currency,
    :customer,
    :default_for_currency,
    :fingerprint,
    :future_requirements,
    :id,
    :last4,
    :metadata,
    :object,
    :requirements,
    :routing_number,
    :status
  ]

  @object_name "bank_account"
  def object_name, do: @object_name

  def expandable_fields, do: ["account", "customer", "future_requirements", "requirements"]

  @typedoc """
  * `currently_due` - Fields that need to be resolved to keep the external account enabled. If not resolved by `current_deadline`, these fields will appear in `past_due` as well, and the account is disabled. Nullable.
  * `errors` - Details about validation and verification failures for `due` requirements that must be resolved. Nullable.
  * `past_due` - Fields that haven't been resolved by `current_deadline`. These fields need to be resolved to enable the external account. Nullable.
  * `pending_verification` - Fields that are being reviewed, or might become required depending on the results of a review. If the review fails, these fields can move to `eventually_due`, `currently_due`, `past_due` or `alternatives`. Fields might appear in `eventually_due`, `currently_due`, `past_due` or `alternatives` and in `pending_verification` if one verification fails but another is still pending. Nullable.
  """
  @type future_requirements :: %{
          optional(:currently_due) => [String.t()] | nil,
          optional(:errors) => [future_requirements_errors()] | nil,
          optional(:past_due) => [String.t()] | nil,
          optional(:pending_verification) => [String.t()] | nil,
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
  * `currently_due` - Fields that need to be resolved to keep the external account enabled. If not resolved by `current_deadline`, these fields will appear in `past_due` as well, and the account is disabled. Nullable.
  * `errors` - Details about validation and verification failures for `due` requirements that must be resolved. Nullable.
  * `past_due` - Fields that haven't been resolved by `current_deadline`. These fields need to be resolved to enable the external account. Nullable.
  * `pending_verification` - Fields that are being reviewed, or might become required depending on the results of a review. If the review fails, these fields can move to `eventually_due`, `currently_due`, `past_due` or `alternatives`. Fields might appear in `eventually_due`, `currently_due`, `past_due` or `alternatives` and in `pending_verification` if one verification fails but another is still pending. Nullable.
  """
  @type requirements :: %{
          optional(:currently_due) => [String.t()] | nil,
          optional(:errors) => [requirements_errors()] | nil,
          optional(:past_due) => [String.t()] | nil,
          optional(:pending_verification) => [String.t()] | nil,
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

  def __nested_fields__ do
    %{
      "future_requirements" => %{
        fields: %{
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
          "past_due" => {:list, :scalar},
          "pending_verification" => {:list, :scalar}
        }
      },
      "requirements" => %{
        fields: %{
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
          "past_due" => {:list, :scalar},
          "pending_verification" => {:list, :scalar}
        }
      }
    }
  end
end
