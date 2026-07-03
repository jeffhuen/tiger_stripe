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
  @type t :: %__MODULE__{}

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
