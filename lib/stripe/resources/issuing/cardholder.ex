# File generated from our OpenAPI spec
defmodule Stripe.Resources.Issuing.Cardholder do
  @moduledoc """
  IssuingCardholder

  An Issuing `Cardholder` object represents an individual or business entity who is [issued](https://docs.stripe.com/issuing) cards.

  Related guide: [How to create a cardholder](https://docs.stripe.com/issuing/cards/virtual/issue-cards#create-cardholder)
  """

  @typedoc """
  * `billing` - Expandable.
  * `company` - Additional information about a `company` cardholder. Nullable. Expandable.
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `email` - The cardholder's email address. Max length: 5000. Nullable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `individual` - Additional information about an `individual` cardholder. Nullable. Expandable.
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
  * `name` - The cardholder's name. This will be printed on cards issued to them. Max length: 5000.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `issuing.cardholder`.
  * `phone_number` - The cardholder's phone number. This is required for all cardholders who will be creating EU cards. See the [3D Secure documentation](https://docs.stripe.com/issuing/3d-secure#when-is-3d-secure-applied) for more details. Max length: 5000. Nullable.
  * `preferred_locales` - The cardholder’s preferred locales (languages), ordered by preference. Locales can be `da`, `de`, `en`, `es`, `fr`, `it`, `pl`, or `sv`.
  This changes the language of the [3D Secure flow](https://docs.stripe.com/issuing/3d-secure) and one-time password messages sent to the cardholder. Nullable.
  * `requirements` - Expandable.
  * `spending_controls` - Rules that control spending across this cardholder's cards. Refer to our [documentation](https://docs.stripe.com/issuing/controls/spending-controls) for more details. Nullable. Expandable.
  * `status` - Specifies whether to permit authorizations on this cardholder's cards. Possible values: `active`, `blocked`, `inactive`.
  * `type` - One of `individual` or `company`. See [Choose a cardholder type](https://docs.stripe.com/issuing/other/choose-cardholder) for more details. Possible values: `company`, `individual`.
  """
  @type t :: %__MODULE__{
          billing: billing(),
          company: company(),
          created: integer(),
          email: String.t(),
          id: String.t(),
          individual: individual(),
          livemode: boolean(),
          metadata: %{String.t() => String.t()},
          name: String.t(),
          object: String.t(),
          phone_number: String.t(),
          preferred_locales: [String.t()],
          requirements: requirements(),
          spending_controls: spending_controls(),
          status: String.t(),
          type: String.t()
        }

  defstruct [
    :billing,
    :company,
    :created,
    :email,
    :id,
    :individual,
    :livemode,
    :metadata,
    :name,
    :object,
    :phone_number,
    :preferred_locales,
    :requirements,
    :spending_controls,
    :status,
    :type
  ]

  @object_name "issuing.cardholder"
  def object_name, do: @object_name

  def expandable_fields,
    do: ["billing", "company", "individual", "requirements", "spending_controls"]

  @typedoc """
  * `address`
  """
  @type billing :: %{
          optional(:address) => Stripe.Resources.Address.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `tax_id_provided` - Whether the company's business ID number was provided.
  """
  @type company :: %{
          optional(:tax_id_provided) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `card_issuing` - Information related to the card_issuing program for this cardholder. Nullable.
  * `dob` - The date of birth of this cardholder. Nullable.
  * `first_name` - The first name of this cardholder. Required before activating Cards. This field cannot contain any numbers, special characters (except periods, commas, hyphens, spaces and apostrophes) or non-latin letters. Max length: 5000. Nullable.
  * `last_name` - The last name of this cardholder. Required before activating Cards. This field cannot contain any numbers, special characters (except periods, commas, hyphens, spaces and apostrophes) or non-latin letters. Max length: 5000. Nullable.
  * `verification` - Government-issued ID document for this cardholder. Nullable.
  """
  @type individual :: %{
          optional(:card_issuing) => individual_card_issuing() | nil,
          optional(:dob) => individual_dob() | nil,
          optional(:first_name) => String.t() | nil,
          optional(:last_name) => String.t() | nil,
          optional(:verification) => individual_verification() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `user_terms_acceptance` - Information about cardholder acceptance of Celtic [Authorized User Terms](https://stripe.com/docs/issuing/cards#accept-authorized-user-terms). Required for cards backed by a Celtic program. Nullable.
  """
  @type individual_card_issuing :: %{
          optional(:user_terms_acceptance) =>
            individual_card_issuing_user_terms_acceptance() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `date` - The Unix timestamp marking when the cardholder accepted the Authorized User Terms. Format: Unix timestamp. Nullable.
  * `ip` - The IP address from which the cardholder accepted the Authorized User Terms. Max length: 5000. Nullable.
  * `user_agent` - The user agent of the browser from which the cardholder accepted the Authorized User Terms. Max length: 5000. Nullable.
  """
  @type individual_card_issuing_user_terms_acceptance :: %{
          optional(:date) => integer() | nil,
          optional(:ip) => String.t() | nil,
          optional(:user_agent) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `day` - The day of birth, between 1 and 31. Nullable.
  * `month` - The month of birth, between 1 and 12. Nullable.
  * `year` - The four-digit year of birth. Nullable.
  """
  @type individual_dob :: %{
          optional(:day) => integer() | nil,
          optional(:month) => integer() | nil,
          optional(:year) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `document` - An identifying document, either a passport or local ID card. Nullable.
  """
  @type individual_verification :: %{
          optional(:document) => individual_verification_document() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `back` - The back of a document returned by a [file upload](https://api.stripe.com#create_file) with a `purpose` value of `identity_document`. Nullable.
  * `front` - The front of a document returned by a [file upload](https://api.stripe.com#create_file) with a `purpose` value of `identity_document`. Nullable.
  """
  @type individual_verification_document :: %{
          optional(:back) => String.t() | Stripe.Resources.File.t() | nil,
          optional(:front) => String.t() | Stripe.Resources.File.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `disabled_reason` - If `disabled_reason` is present, all cards will decline authorizations with `cardholder_verification_required` reason. Possible values: `listed`, `rejected.listed`, `requirements.past_due`, `under_review`. Nullable.
  * `past_due` - Array of fields that need to be collected in order to verify and re-enable the cardholder. Nullable.
  """
  @type requirements :: %{
          optional(:disabled_reason) => String.t() | nil,
          optional(:past_due) => [String.t()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `allowed_categories` - Array of strings containing [categories](https://docs.stripe.com/api#issuing_authorization_object-merchant_data-category) of authorizations to allow. All other categories will be blocked. Cannot be set with `blocked_categories`. Nullable.
  * `allowed_merchant_countries` - Array of strings containing representing countries from which authorizations will be allowed. Authorizations from merchants in all other countries will be declined. Country codes should be ISO 3166 alpha-2 country codes (e.g. `US`). Cannot be set with `blocked_merchant_countries`. Provide an empty value to unset this control. Nullable.
  * `blocked_categories` - Array of strings containing [categories](https://docs.stripe.com/api#issuing_authorization_object-merchant_data-category) of authorizations to decline. All other categories will be allowed. Cannot be set with `allowed_categories`. Nullable.
  * `blocked_merchant_countries` - Array of strings containing representing countries from which authorizations will be declined. Country codes should be ISO 3166 alpha-2 country codes (e.g. `US`). Cannot be set with `allowed_merchant_countries`. Provide an empty value to unset this control. Nullable.
  * `spending_limits` - Limit spending with amount-based rules that apply across this cardholder's cards. Nullable.
  * `spending_limits_currency` - Currency of the amounts within `spending_limits`. Format: ISO 4217 currency code. Nullable.
  """
  @type spending_controls :: %{
          optional(:allowed_categories) => [String.t()] | nil,
          optional(:allowed_merchant_countries) => [String.t()] | nil,
          optional(:blocked_categories) => [String.t()] | nil,
          optional(:blocked_merchant_countries) => [String.t()] | nil,
          optional(:spending_limits) => [spending_controls_spending_limits()] | nil,
          optional(:spending_limits_currency) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `amount` - Maximum amount allowed to spend per interval. This amount is in the card's currency and in the [smallest currency unit](https://docs.stripe.com/currencies#zero-decimal).
  * `categories` - Array of strings containing [categories](https://docs.stripe.com/api#issuing_authorization_object-merchant_data-category) this limit applies to. Omitting this field will apply the limit to all categories. Nullable.
  * `interval` - Interval (or event) to which the amount applies. Possible values: `all_time`, `daily`, `monthly`, `per_authorization`, `weekly`, `yearly`.
  """
  @type spending_controls_spending_limits :: %{
          optional(:amount) => integer() | nil,
          optional(:categories) => [String.t()] | nil,
          optional(:interval) => String.t() | nil,
          optional(String.t()) => term()
        }

  def __nested_fields__ do
    %{
      "billing" => %{
        fields: %{
          "address" => {:resource, Stripe.Resources.Address}
        }
      },
      "company" => %{
        fields: %{
          "tax_id_provided" => :scalar
        }
      },
      "individual" => %{
        fields: %{
          "card_issuing" => %{
            fields: %{
              "user_terms_acceptance" => %{
                fields: %{
                  "date" => :scalar,
                  "ip" => :scalar,
                  "user_agent" => :scalar
                }
              }
            }
          },
          "dob" => %{
            fields: %{
              "day" => :scalar,
              "month" => :scalar,
              "year" => :scalar
            }
          },
          "first_name" => :scalar,
          "last_name" => :scalar,
          "verification" => %{
            fields: %{
              "document" => %{
                fields: %{
                  "back" => {:resource, Stripe.Resources.File},
                  "front" => {:resource, Stripe.Resources.File}
                }
              }
            }
          }
        }
      },
      "requirements" => %{
        fields: %{
          "disabled_reason" => :scalar,
          "past_due" => {:list, :scalar}
        }
      },
      "spending_controls" => %{
        fields: %{
          "allowed_categories" => {:list, :scalar},
          "allowed_merchant_countries" => {:list, :scalar},
          "blocked_categories" => {:list, :scalar},
          "blocked_merchant_countries" => {:list, :scalar},
          "spending_limits" =>
            {:list,
             %{
               fields: %{
                 "amount" => :scalar,
                 "categories" => {:list, :scalar},
                 "interval" => :scalar
               }
             }},
          "spending_limits_currency" => :scalar
        }
      }
    }
  end
end
