# File generated from our OpenAPI spec
defmodule Stripe.Params.AccountPersonUpdateParams do
  @moduledoc "Parameters for account person update."

  @typedoc """
  * `additional_tos_acceptances` - Details on the legal guardian's or authorizer's acceptance of the required Stripe agreements.
  * `address` - The person's address.
  * `address_kana` - The Kana variation of the person's address (Japan only).
  * `address_kanji` - The Kanji variation of the person's address (Japan only).
  * `dob` - The person's date of birth.
  * `documents` - Documents that may be submitted to satisfy various informational requests.
  * `email` - The person's email address.
  * `expand` - Specifies which fields in the response should be expanded.
  * `first_name` - The person's first name. Max length: 5000.
  * `first_name_kana` - The Kana variation of the person's first name (Japan only). Max length: 5000.
  * `first_name_kanji` - The Kanji variation of the person's first name (Japan only). Max length: 5000.
  * `full_name_aliases` - A list of alternate names or aliases that the person is known by.
  * `gender` - The person's gender (International regulations require either "male" or "female").
  * `id_number` - The person's ID number, as appropriate for their country. For example, a social security number in the U.S., social insurance number in Canada, etc. Instead of the number itself, you can also provide a [PII token provided by Stripe.js](https://docs.stripe.com/js/tokens/create_token?type=pii).

  Changing this value for the account's representative requires that the account re-accept the [terms of service](https://docs.stripe.com/api/accounts/object#account_object-tos_acceptance). Max length: 5000.
  * `id_number_secondary` - The person's secondary ID number, as appropriate for their country, will be used for enhanced verification checks. In Thailand, this would be the laser code found on the back of an ID card. Instead of the number itself, you can also provide a [PII token provided by Stripe.js](https://docs.stripe.com/js/tokens/create_token?type=pii).

  Changing this value for the account's representative requires that the account re-accept the [terms of service](https://docs.stripe.com/api/accounts/object#account_object-tos_acceptance). Max length: 5000.
  * `last_name` - The person's last name. Max length: 5000.
  * `last_name_kana` - The Kana variation of the person's last name (Japan only). Max length: 5000.
  * `last_name_kanji` - The Kanji variation of the person's last name (Japan only). Max length: 5000.
  * `maiden_name` - The person's maiden name. Max length: 5000.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `nationality` - The country where the person is a national. Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)), or "XX" if unavailable. Max length: 5000.
  * `person_token` - A [person token](https://docs.stripe.com/connect/account-tokens), used to securely provide details to the person. Max length: 5000.
  * `phone` - The person's phone number.
  * `political_exposure` - Indicates if the person or any of their representatives, family members, or other closely related persons, declares that they hold or have held an important public job or function, in any jurisdiction. Possible values: `existing`, `none`.
  * `registered_address` - The person's registered address.
  * `relationship` - The relationship that this person has with the account's legal entity.
  * `ssn_last_4` - The last four digits of the person's Social Security number (U.S. only).

  Changing this value for the account's representative requires that the account re-accept the [terms of service](https://docs.stripe.com/api/accounts/object#account_object-tos_acceptance).
  * `us_cfpb_data` - Demographic data related to the person.
  * `verification` - The person's verification status.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :additional_tos_acceptances,
    :address,
    :address_kana,
    :address_kanji,
    :dob,
    :documents,
    :email,
    :expand,
    :first_name,
    :first_name_kana,
    :first_name_kanji,
    :full_name_aliases,
    :gender,
    :id_number,
    :id_number_secondary,
    :last_name,
    :last_name_kana,
    :last_name_kanji,
    :maiden_name,
    :metadata,
    :nationality,
    :person_token,
    :phone,
    :political_exposure,
    :registered_address,
    :relationship,
    :ssn_last_4,
    :us_cfpb_data,
    :verification
  ]
end
