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
  @type t :: %__MODULE__{}

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
