# File generated from our OpenAPI spec
defmodule Stripe.Params.AccountPersonCreateParams do
  @moduledoc "Parameters for account person create."

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
  * `id_number` - The person's ID number, as appropriate for their country. For example, a social security number in the U.S., social insurance number in Canada, etc. Instead of the number itself, you can also provide a [PII token provided by Stripe.js](https://docs.stripe.com/js/tokens/create_token?type=pii). Max length: 5000.
  * `id_number_secondary` - The person's secondary ID number, as appropriate for their country, will be used for enhanced verification checks. In Thailand, this would be the laser code found on the back of an ID card. Instead of the number itself, you can also provide a [PII token provided by Stripe.js](https://docs.stripe.com/js/tokens/create_token?type=pii). Max length: 5000.
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
  * `us_cfpb_data` - Demographic data related to the person.
  * `verification` - The person's verification status.
  """
  @type t :: %__MODULE__{
          additional_tos_acceptances: __MODULE__.AdditionalTosAcceptances.t() | nil,
          address: __MODULE__.Address.t() | nil,
          address_kana: __MODULE__.AddressKana.t() | nil,
          address_kanji: __MODULE__.AddressKanji.t() | nil,
          dob: map() | nil,
          documents: __MODULE__.Documents.t() | nil,
          email: String.t() | nil,
          expand: [String.t()] | nil,
          first_name: String.t() | nil,
          first_name_kana: String.t() | nil,
          first_name_kanji: String.t() | nil,
          full_name_aliases: map() | nil,
          gender: String.t() | nil,
          id_number: String.t() | nil,
          id_number_secondary: String.t() | nil,
          last_name: String.t() | nil,
          last_name_kana: String.t() | nil,
          last_name_kanji: String.t() | nil,
          maiden_name: String.t() | nil,
          metadata: map() | nil,
          nationality: String.t() | nil,
          person_token: String.t() | nil,
          phone: String.t() | nil,
          political_exposure: String.t() | nil,
          registered_address: __MODULE__.RegisteredAddress.t() | nil,
          relationship: __MODULE__.Relationship.t() | nil,
          ssn_last_4: String.t() | nil,
          us_cfpb_data: __MODULE__.UsCfpbData.t() | nil,
          verification: __MODULE__.Verification.t() | nil
        }

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

  defmodule AdditionalTosAcceptances do
    @moduledoc "Nested parameters."

    @typedoc """
    * `account` - Details on the legal guardian's acceptance of the main Stripe service agreement.
    """
    @type t :: %__MODULE__{
            account: __MODULE__.Account.t() | nil
          }
    defstruct [:account]

    defmodule Account do
      @moduledoc "Nested parameters."

      @typedoc """
      * `date` - The Unix timestamp marking when the account representative accepted the service agreement. Format: Unix timestamp.
      * `ip` - The IP address from which the account representative accepted the service agreement.
      * `user_agent` - The user agent of the browser from which the account representative accepted the service agreement.
      """
      @type t :: %__MODULE__{
              date: integer() | nil,
              ip: String.t() | nil,
              user_agent: map() | nil
            }
      defstruct [:date, :ip, :user_agent]
    end
  end

  defmodule Address do
    @moduledoc "Nested parameters."

    @typedoc """
    * `city` - City, district, suburb, town, or village. Max length: 100.
    * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)). Max length: 5000.
    * `line1` - Address line 1, such as the street, PO Box, or company name. Max length: 200.
    * `line2` - Address line 2, such as the apartment, suite, unit, or building. Max length: 200.
    * `postal_code` - ZIP or postal code. Max length: 5000.
    * `state` - State, county, province, or region ([ISO 3166-2](https://en.wikipedia.org/wiki/ISO_3166-2)). Max length: 5000.
    """
    @type t :: %__MODULE__{
            city: String.t() | nil,
            country: String.t() | nil,
            line1: String.t() | nil,
            line2: String.t() | nil,
            postal_code: String.t() | nil,
            state: String.t() | nil
          }
    defstruct [:city, :country, :line1, :line2, :postal_code, :state]
  end

  defmodule AddressKana do
    @moduledoc "Nested parameters."

    @typedoc """
    * `city` - City or ward. Max length: 5000.
    * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)). Max length: 5000.
    * `line1` - Block or building number. Max length: 5000.
    * `line2` - Building details. Max length: 5000.
    * `postal_code` - Postal code. Max length: 5000.
    * `state` - Prefecture. Max length: 5000.
    * `town` - Town or cho-me. Max length: 5000.
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

  defmodule AddressKanji do
    @moduledoc "Nested parameters."

    @typedoc """
    * `city` - City or ward. Max length: 5000.
    * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)). Max length: 5000.
    * `line1` - Block or building number. Max length: 5000.
    * `line2` - Building details. Max length: 5000.
    * `postal_code` - Postal code. Max length: 5000.
    * `state` - Prefecture. Max length: 5000.
    * `town` - Town or cho-me. Max length: 5000.
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

  defmodule Documents do
    @moduledoc "Nested parameters."

    @typedoc """
    * `company_authorization` - One or more documents that demonstrate proof that this person is authorized to represent the company.
    * `passport` - One or more documents showing the person's passport page with photo and personal data.
    * `visa` - One or more documents showing the person's visa required for living in the country where they are residing.
    """
    @type t :: %__MODULE__{
            company_authorization: __MODULE__.CompanyAuthorization.t() | nil,
            passport: __MODULE__.Passport.t() | nil,
            visa: __MODULE__.Visa.t() | nil
          }
    defstruct [:company_authorization, :passport, :visa]

    defmodule CompanyAuthorization do
      @moduledoc "Nested parameters."

      @typedoc """
      * `files` - One or more document ids returned by a [file upload](https://api.stripe.com#create_file) with a `purpose` value of `account_requirement`.
      """
      @type t :: %__MODULE__{
              files: [map()] | nil
            }
      defstruct [:files]
    end

    defmodule Passport do
      @moduledoc "Nested parameters."

      @typedoc """
      * `files` - One or more document ids returned by a [file upload](https://api.stripe.com#create_file) with a `purpose` value of `account_requirement`.
      """
      @type t :: %__MODULE__{
              files: [map()] | nil
            }
      defstruct [:files]
    end

    defmodule Visa do
      @moduledoc "Nested parameters."

      @typedoc """
      * `files` - One or more document ids returned by a [file upload](https://api.stripe.com#create_file) with a `purpose` value of `account_requirement`.
      """
      @type t :: %__MODULE__{
              files: [map()] | nil
            }
      defstruct [:files]
    end
  end

  defmodule RegisteredAddress do
    @moduledoc "Nested parameters."

    @typedoc """
    * `city` - City, district, suburb, town, or village. Max length: 100.
    * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)). Max length: 5000.
    * `line1` - Address line 1, such as the street, PO Box, or company name. Max length: 200.
    * `line2` - Address line 2, such as the apartment, suite, unit, or building. Max length: 200.
    * `postal_code` - ZIP or postal code. Max length: 5000.
    * `state` - State, county, province, or region ([ISO 3166-2](https://en.wikipedia.org/wiki/ISO_3166-2)). Max length: 5000.
    """
    @type t :: %__MODULE__{
            city: String.t() | nil,
            country: String.t() | nil,
            line1: String.t() | nil,
            line2: String.t() | nil,
            postal_code: String.t() | nil,
            state: String.t() | nil
          }
    defstruct [:city, :country, :line1, :line2, :postal_code, :state]
  end

  defmodule Relationship do
    @moduledoc "Nested parameters."

    @typedoc """
    * `authorizer` - Whether the person is the authorizer of the account's representative.
    * `director` - Whether the person is a director of the account's legal entity. Directors are typically members of the governing board of the company, or responsible for ensuring the company meets its regulatory obligations.
    * `executive` - Whether the person has significant responsibility to control, manage, or direct the organization.
    * `legal_guardian` - Whether the person is the legal guardian of the account's representative.
    * `owner` - Whether the person is an owner of the account’s legal entity.
    * `percent_ownership` - The percent owned by the person of the account's legal entity.
    * `representative` - Whether the person is authorized as the primary representative of the account. This is the person nominated by the business to provide information about themselves, and general information about the account. There can only be one representative at any given time. At the time the account is created, this person should be set to the person responsible for opening the account.
    * `title` - The person's title (e.g., CEO, Support Engineer). Max length: 5000.
    """
    @type t :: %__MODULE__{
            authorizer: boolean() | nil,
            director: boolean() | nil,
            executive: boolean() | nil,
            legal_guardian: boolean() | nil,
            owner: boolean() | nil,
            percent_ownership: map() | nil,
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

  defmodule UsCfpbData do
    @moduledoc "Nested parameters."

    @typedoc """
    * `ethnicity_details` - The persons ethnicity details
    * `race_details` - The persons race details
    * `self_identified_gender` - The persons self-identified gender Max length: 5000.
    """
    @type t :: %__MODULE__{
            ethnicity_details: __MODULE__.EthnicityDetails.t() | nil,
            race_details: __MODULE__.RaceDetails.t() | nil,
            self_identified_gender: String.t() | nil
          }
    defstruct [:ethnicity_details, :race_details, :self_identified_gender]

    defmodule EthnicityDetails do
      @moduledoc "Nested parameters."

      @typedoc """
      * `ethnicity` - The persons ethnicity
      * `ethnicity_other` - Please specify your origin, when other is selected. Max length: 5000.
      """
      @type t :: %__MODULE__{
              ethnicity: [String.t()] | nil,
              ethnicity_other: String.t() | nil
            }
      defstruct [:ethnicity, :ethnicity_other]
    end

    defmodule RaceDetails do
      @moduledoc "Nested parameters."

      @typedoc """
      * `race` - The persons race.
      * `race_other` - Please specify your race, when other is selected. Max length: 5000.
      """
      @type t :: %__MODULE__{
              race: [String.t()] | nil,
              race_other: String.t() | nil
            }
      defstruct [:race, :race_other]
    end
  end

  defmodule Verification do
    @moduledoc "Nested parameters."

    @typedoc """
    * `additional_document` - A document showing address, either a passport, local ID card, or utility bill from a well-known utility company.
    * `document` - An identifying document, either a passport or local ID card.
    """
    @type t :: %__MODULE__{
            additional_document: __MODULE__.AdditionalDocument.t() | nil,
            document: __MODULE__.Document.t() | nil
          }
    defstruct [:additional_document, :document]

    defmodule AdditionalDocument do
      @moduledoc "Nested parameters."

      @typedoc """
      * `back` - The back of an ID returned by a [file upload](https://api.stripe.com#create_file) with a `purpose` value of `identity_document`. The uploaded file needs to be a color image (smaller than 8,000px by 8,000px), in JPG, PNG, or PDF format, and less than 10 MB in size. Max length: 500.
      * `front` - The front of an ID returned by a [file upload](https://api.stripe.com#create_file) with a `purpose` value of `identity_document`. The uploaded file needs to be a color image (smaller than 8,000px by 8,000px), in JPG, PNG, or PDF format, and less than 10 MB in size. Max length: 500.
      """
      @type t :: %__MODULE__{
              back: String.t() | nil,
              front: String.t() | nil
            }
      defstruct [:back, :front]
    end

    defmodule Document do
      @moduledoc "Nested parameters."

      @typedoc """
      * `back` - The back of an ID returned by a [file upload](https://api.stripe.com#create_file) with a `purpose` value of `identity_document`. The uploaded file needs to be a color image (smaller than 8,000px by 8,000px), in JPG, PNG, or PDF format, and less than 10 MB in size. Max length: 500.
      * `front` - The front of an ID returned by a [file upload](https://api.stripe.com#create_file) with a `purpose` value of `identity_document`. The uploaded file needs to be a color image (smaller than 8,000px by 8,000px), in JPG, PNG, or PDF format, and less than 10 MB in size. Max length: 500.
      """
      @type t :: %__MODULE__{
              back: String.t() | nil,
              front: String.t() | nil
            }
      defstruct [:back, :front]
    end
  end
end
