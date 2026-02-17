# File generated from our OpenAPI spec
defmodule Stripe.Params.TokenCreateParams do
  @moduledoc "Parameters for token create."

  @typedoc """
  * `account` - Information for the account this token represents.
  * `bank_account` - The bank account this token will represent.
  * `card` - The card this token will represent. If you also pass in a customer, the card must be the ID of a card belonging to the customer. Otherwise, if you do not pass in a customer, this is a dictionary containing a user's credit card details, with the options described below.
  * `customer` - Create a token for the customer, which is owned by the application's account. You can only use this with an [OAuth access token](https://docs.stripe.com/connect/standard-accounts) or [Stripe-Account header](https://docs.stripe.com/connect/authentication). Learn more about [cloning saved payment methods](https://docs.stripe.com/connect/cloning-saved-payment-methods). Max length: 5000.
  * `cvc_update` - The updated CVC value this token represents.
  * `expand` - Specifies which fields in the response should be expanded.
  * `person` - Information for the person this token represents.
  * `pii` - The PII this token represents.
  """
  @type t :: %__MODULE__{
          account: __MODULE__.Account.t() | nil,
          bank_account: __MODULE__.BankAccount.t() | nil,
          card: map() | nil,
          customer: String.t() | nil,
          cvc_update: __MODULE__.CvcUpdate.t() | nil,
          expand: [String.t()] | nil,
          person: __MODULE__.Person.t() | nil,
          pii: __MODULE__.Pii.t() | nil
        }

  defstruct [:account, :bank_account, :card, :customer, :cvc_update, :expand, :person, :pii]

  defmodule Account do
    @moduledoc "Nested parameters."

    @typedoc """
    * `business_type` - The business type. Possible values: `company`, `government_entity`, `individual`, `non_profit`.
    * `company` - Information about the company or business.
    * `individual` - Information about the person represented by the account.
    * `tos_shown_and_accepted` - Whether the user described by the data in the token has been shown [the Stripe Connected Account Agreement](https://stripe.com/connect/account-tokens#stripe-connected-account-agreement). When creating an account token to create a new Connect account, this value must be `true`.
    """
    @type t :: %__MODULE__{
            business_type: String.t() | nil,
            company: __MODULE__.Company.t() | nil,
            individual: __MODULE__.Individual.t() | nil,
            tos_shown_and_accepted: boolean() | nil
          }
    defstruct [:business_type, :company, :individual, :tos_shown_and_accepted]

    defmodule Company do
      @moduledoc "Nested parameters."

      @typedoc """
      * `address` - The company's primary address.
      * `address_kana` - The Kana variation of the company's primary address (Japan only).
      * `address_kanji` - The Kanji variation of the company's primary address (Japan only).
      * `directors_provided` - Whether the company's directors have been provided. Set this Boolean to `true` after creating all the company's directors with [the Persons API](https://docs.stripe.com/api/persons) for accounts with a `relationship.director` requirement. This value is not automatically set to `true` after creating directors, so it needs to be updated to indicate all directors have been provided.
      * `directorship_declaration` - This hash is used to attest that the directors information provided to Stripe is both current and correct.
      * `executives_provided` - Whether the company's executives have been provided. Set this Boolean to `true` after creating all the company's executives with [the Persons API](https://docs.stripe.com/api/persons) for accounts with a `relationship.executive` requirement.
      * `export_license_id` - The export license ID number of the company, also referred as Import Export Code (India only). Max length: 5000.
      * `export_purpose_code` - The purpose code to use for export transactions (India only). Max length: 5000.
      * `name` - The company's legal name. Max length: 100.
      * `name_kana` - The Kana variation of the company's legal name (Japan only). Max length: 100.
      * `name_kanji` - The Kanji variation of the company's legal name (Japan only). Max length: 100.
      * `owners_provided` - Whether the company's owners have been provided. Set this Boolean to `true` after creating all the company's owners with [the Persons API](https://docs.stripe.com/api/persons) for accounts with a `relationship.owner` requirement.
      * `ownership_declaration` - This hash is used to attest that the beneficial owner information provided to Stripe is both current and correct.
      * `ownership_declaration_shown_and_signed` - Whether the user described by the data in the token has been shown the Ownership Declaration and indicated that it is correct.
      * `ownership_exemption_reason` - This value is used to determine if a business is exempt from providing ultimate beneficial owners. See [this support article](https://support.stripe.com/questions/exemption-from-providing-ownership-details) and [changelog](https://docs.stripe.com/changelog/acacia/2025-01-27/ownership-exemption-reason-accounts-api) for more details. Possible values: `qualified_entity_exceeds_ownership_threshold`, `qualifies_as_financial_institution`.
      * `phone` - The company's phone number (used for verification). Max length: 5000.
      * `registration_date` - When the business was incorporated or registered.
      * `registration_number` - The identification number given to a company when it is registered or incorporated, if distinct from the identification number used for filing taxes. (Examples are the CIN for companies and LLP IN for partnerships in India, and the Company Registration Number in Hong Kong). Max length: 5000.
      * `representative_declaration` - This hash is used to attest that the representative is authorized to act as the representative of their legal entity.
      * `structure` - The category identifying the legal structure of the company or legal entity. See [Business structure](https://stripe.com/connect/identity-verification#business-structure) for more details. Pass an empty string to unset this value. Possible values: `free_zone_establishment`, `free_zone_llc`, `government_instrumentality`, `governmental_unit`, `incorporated_non_profit`, `incorporated_partnership`, `limited_liability_partnership`, `llc`, `multi_member_llc`, `private_company`, `private_corporation`, `private_partnership`, `public_company`, `public_corporation`, `public_partnership`, `registered_charity`, `single_member_llc`, `sole_establishment`, `sole_proprietorship`, `tax_exempt_government_instrumentality`, `unincorporated_association`, `unincorporated_non_profit`, `unincorporated_partnership`.
      * `tax_id` - The business ID number of the company, as appropriate for the company’s country. (Examples are an Employer ID Number in the U.S., a Business Number in Canada, or a Company Number in the UK.) Max length: 5000.
      * `tax_id_registrar` - The jurisdiction in which the `tax_id` is registered (Germany-based companies only). Max length: 5000.
      * `vat_id` - The VAT number of the company. Max length: 5000.
      * `verification` - Information on the verification state of the company.
      """
      @type t :: %__MODULE__{
              address: __MODULE__.Address.t() | nil,
              address_kana: __MODULE__.AddressKana.t() | nil,
              address_kanji: __MODULE__.AddressKanji.t() | nil,
              directors_provided: boolean() | nil,
              directorship_declaration: __MODULE__.DirectorshipDeclaration.t() | nil,
              executives_provided: boolean() | nil,
              export_license_id: String.t() | nil,
              export_purpose_code: String.t() | nil,
              name: String.t() | nil,
              name_kana: String.t() | nil,
              name_kanji: String.t() | nil,
              owners_provided: boolean() | nil,
              ownership_declaration: __MODULE__.OwnershipDeclaration.t() | nil,
              ownership_declaration_shown_and_signed: boolean() | nil,
              ownership_exemption_reason: String.t() | nil,
              phone: String.t() | nil,
              registration_date: map() | nil,
              registration_number: String.t() | nil,
              representative_declaration: __MODULE__.RepresentativeDeclaration.t() | nil,
              structure: String.t() | nil,
              tax_id: String.t() | nil,
              tax_id_registrar: String.t() | nil,
              vat_id: String.t() | nil,
              verification: __MODULE__.Verification.t() | nil
            }
      defstruct [
        :address,
        :address_kana,
        :address_kanji,
        :directors_provided,
        :directorship_declaration,
        :executives_provided,
        :export_license_id,
        :export_purpose_code,
        :name,
        :name_kana,
        :name_kanji,
        :owners_provided,
        :ownership_declaration,
        :ownership_declaration_shown_and_signed,
        :ownership_exemption_reason,
        :phone,
        :registration_date,
        :registration_number,
        :representative_declaration,
        :structure,
        :tax_id,
        :tax_id_registrar,
        :vat_id,
        :verification
      ]

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

      defmodule DirectorshipDeclaration do
        @moduledoc "Nested parameters."

        @typedoc """
        * `date` - The Unix timestamp marking when the directorship declaration attestation was made. Format: Unix timestamp.
        * `ip` - The IP address from which the directorship declaration attestation was made.
        * `user_agent` - The user agent of the browser from which the directorship declaration attestation was made. Max length: 5000.
        """
        @type t :: %__MODULE__{
                date: integer() | nil,
                ip: String.t() | nil,
                user_agent: String.t() | nil
              }
        defstruct [:date, :ip, :user_agent]
      end

      defmodule OwnershipDeclaration do
        @moduledoc "Nested parameters."

        @typedoc """
        * `date` - The Unix timestamp marking when the beneficial owner attestation was made. Format: Unix timestamp.
        * `ip` - The IP address from which the beneficial owner attestation was made.
        * `user_agent` - The user agent of the browser from which the beneficial owner attestation was made. Max length: 5000.
        """
        @type t :: %__MODULE__{
                date: integer() | nil,
                ip: String.t() | nil,
                user_agent: String.t() | nil
              }
        defstruct [:date, :ip, :user_agent]
      end

      defmodule RepresentativeDeclaration do
        @moduledoc "Nested parameters."

        @typedoc """
        * `date` - The Unix timestamp marking when the representative declaration attestation was made. Format: Unix timestamp.
        * `ip` - The IP address from which the representative declaration attestation was made.
        * `user_agent` - The user agent of the browser from which the representative declaration attestation was made. Max length: 5000.
        """
        @type t :: %__MODULE__{
                date: integer() | nil,
                ip: String.t() | nil,
                user_agent: String.t() | nil
              }
        defstruct [:date, :ip, :user_agent]
      end

      defmodule Verification do
        @moduledoc "Nested parameters."

        @typedoc """
        * `document` - A document verifying the business.
        """
        @type t :: %__MODULE__{
                document: __MODULE__.Document.t() | nil
              }
        defstruct [:document]

        defmodule Document do
          @moduledoc "Nested parameters."

          @typedoc """
          * `back` - The back of a document returned by a [file upload](https://api.stripe.com#create_file) with a `purpose` value of `additional_verification`. The uploaded file needs to be a color image (smaller than 8,000px by 8,000px), in JPG, PNG, or PDF format, and less than 10 MB in size. Max length: 500.
          * `front` - The front of a document returned by a [file upload](https://api.stripe.com#create_file) with a `purpose` value of `additional_verification`. The uploaded file needs to be a color image (smaller than 8,000px by 8,000px), in JPG, PNG, or PDF format, and less than 10 MB in size. Max length: 500.
          """
          @type t :: %__MODULE__{
                  back: String.t() | nil,
                  front: String.t() | nil
                }
          defstruct [:back, :front]
        end
      end
    end

    defmodule Individual do
      @moduledoc "Nested parameters."

      @typedoc """
      * `address` - The individual's primary address.
      * `address_kana` - The Kana variation of the individual's primary address (Japan only).
      * `address_kanji` - The Kanji variation of the individual's primary address (Japan only).
      * `dob` - The individual's date of birth.
      * `email` - The individual's email address.
      * `first_name` - The individual's first name. Max length: 100.
      * `first_name_kana` - The Kana variation of the individual's first name (Japan only). Max length: 5000.
      * `first_name_kanji` - The Kanji variation of the individual's first name (Japan only). Max length: 5000.
      * `full_name_aliases` - A list of alternate names or aliases that the individual is known by.
      * `gender` - The individual's gender
      * `id_number` - The government-issued ID number of the individual, as appropriate for the representative's country. (Examples are a Social Security Number in the U.S., or a Social Insurance Number in Canada). Instead of the number itself, you can also provide a [PII token created with Stripe.js](https://stripe.com/js/tokens/create_token?type=pii). Max length: 5000.
      * `id_number_secondary` - The government-issued secondary ID number of the individual, as appropriate for the representative's country, will be used for enhanced verification checks. In Thailand, this would be the laser code found on the back of an ID card. Instead of the number itself, you can also provide a [PII token created with Stripe.js](https://stripe.com/js/tokens/create_token?type=pii). Max length: 5000.
      * `last_name` - The individual's last name. Max length: 100.
      * `last_name_kana` - The Kana variation of the individual's last name (Japan only). Max length: 5000.
      * `last_name_kanji` - The Kanji variation of the individual's last name (Japan only). Max length: 5000.
      * `maiden_name` - The individual's maiden name. Max length: 5000.
      * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
      * `phone` - The individual's phone number.
      * `political_exposure` - Indicates if the person or any of their representatives, family members, or other closely related persons, declares that they hold or have held an important public job or function, in any jurisdiction. Possible values: `existing`, `none`.
      * `registered_address` - The individual's registered address.
      * `relationship` - Describes the person’s relationship to the account.
      * `ssn_last_4` - The last four digits of the individual's Social Security Number (U.S. only). Max length: 5000.
      * `verification` - The individual's verification document information.
      """
      @type t :: %__MODULE__{
              address: __MODULE__.Address.t() | nil,
              address_kana: __MODULE__.AddressKana.t() | nil,
              address_kanji: __MODULE__.AddressKanji.t() | nil,
              dob: map() | nil,
              email: String.t() | nil,
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
              phone: String.t() | nil,
              political_exposure: String.t() | nil,
              registered_address: __MODULE__.RegisteredAddress.t() | nil,
              relationship: __MODULE__.Relationship.t() | nil,
              ssn_last_4: String.t() | nil,
              verification: __MODULE__.Verification.t() | nil
            }
      defstruct [
        :address,
        :address_kana,
        :address_kanji,
        :dob,
        :email,
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
        :phone,
        :political_exposure,
        :registered_address,
        :relationship,
        :ssn_last_4,
        :verification
      ]

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
        * `director` - Whether the person is a director of the account's legal entity. Directors are typically members of the governing board of the company, or responsible for ensuring the company meets its regulatory obligations.
        * `executive` - Whether the person has significant responsibility to control, manage, or direct the organization.
        * `owner` - Whether the person is an owner of the account’s legal entity.
        * `percent_ownership` - The percent owned by the person of the account's legal entity.
        * `title` - The person's title (e.g., CEO, Support Engineer). Max length: 5000.
        """
        @type t :: %__MODULE__{
                director: boolean() | nil,
                executive: boolean() | nil,
                owner: boolean() | nil,
                percent_ownership: map() | nil,
                title: String.t() | nil
              }
        defstruct [:director, :executive, :owner, :percent_ownership, :title]
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
  end

  defmodule BankAccount do
    @moduledoc "Nested parameters."

    @typedoc """
    * `account_holder_name` - The name of the person or business that owns the bank account. This field is required when attaching the bank account to a `Customer` object. Max length: 5000.
    * `account_holder_type` - The type of entity that holds the account. It can be `company` or `individual`. This field is required when attaching the bank account to a `Customer` object. Possible values: `company`, `individual`. Max length: 5000.
    * `account_number` - The account number for the bank account, in string form. Must be a checking account. Max length: 5000.
    * `account_type` - The bank account type. This can only be `checking` or `savings` in most countries. In Japan, this can only be `futsu` or `toza`. Possible values: `checking`, `futsu`, `savings`, `toza`. Max length: 5000.
    * `country` - The country in which the bank account is located. Max length: 5000.
    * `currency` - The currency the bank account is in. This must be a country/currency pairing that [Stripe supports.](https://docs.stripe.com/payouts) Format: ISO 4217 currency code.
    * `payment_method` - The ID of a Payment Method with a `type` of `us_bank_account`. The Payment Method's bank account information will be copied and returned as a Bank Account Token. This parameter is exclusive with respect to all other parameters in the `bank_account` hash. You must include the top-level `customer` parameter if the Payment Method is attached to a `Customer` object. If the Payment Method is not attached to a `Customer` object, it will be consumed and cannot be used again. You may not use Payment Methods which were created by a Setup Intent with `attach_to_self=true`. Max length: 5000.
    * `routing_number` - The routing number, sort code, or other country-appropriate institution number for the bank account. For US bank accounts, this is required and should be the ACH routing number, not the wire routing number. If you are providing an IBAN for `account_number`, this field is not required. Max length: 5000.
    """
    @type t :: %__MODULE__{
            account_holder_name: String.t() | nil,
            account_holder_type: String.t() | nil,
            account_number: String.t() | nil,
            account_type: String.t() | nil,
            country: String.t() | nil,
            currency: String.t() | nil,
            payment_method: String.t() | nil,
            routing_number: String.t() | nil
          }
    defstruct [
      :account_holder_name,
      :account_holder_type,
      :account_number,
      :account_type,
      :country,
      :currency,
      :payment_method,
      :routing_number
    ]
  end

  defmodule CvcUpdate do
    @moduledoc "Nested parameters."

    @typedoc """
    * `cvc` - The CVC value, in string form. Max length: 5000.
    """
    @type t :: %__MODULE__{
            cvc: String.t() | nil
          }
    defstruct [:cvc]
  end

  defmodule Person do
    @moduledoc "Nested parameters."

    @typedoc """
    * `additional_tos_acceptances` - Details on the legal guardian's or authorizer's acceptance of the required Stripe agreements.
    * `address` - The person's address.
    * `address_kana` - The Kana variation of the person's address (Japan only).
    * `address_kanji` - The Kanji variation of the person's address (Japan only).
    * `dob` - The person's date of birth.
    * `documents` - Documents that may be submitted to satisfy various informational requests.
    * `email` - The person's email address.
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

  defmodule Pii do
    @moduledoc "Nested parameters."

    @typedoc """
    * `id_number` - The `id_number` for the PII, in string form. Max length: 5000.
    """
    @type t :: %__MODULE__{
            id_number: String.t() | nil
          }
    defstruct [:id_number]
  end
end
