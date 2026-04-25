# File generated from our OpenAPI spec
defmodule Stripe.Resources.Identity.VerificationSession do
  @moduledoc """
  GelatoVerificationSession

  A VerificationSession guides you through the process of collecting and verifying the identities
  of your users. It contains details about the type of verification, such as what [verification
  check](https://docs.stripe.com/docs/identity/verification-checks) to perform. Only create one VerificationSession for
  each verification in your system.

  A VerificationSession transitions through [multiple
  statuses](https://docs.stripe.com/docs/identity/how-sessions-work) throughout its lifetime as it progresses through
  the verification flow. The VerificationSession contains the user's verified data after
  verification checks are complete.

  Related guide: [The Verification Sessions API](https://docs.stripe.com/identity/verification-sessions)
  """

  @typedoc """
  * `client_reference_id` - A string to reference this user. This can be a customer ID, a session ID, or similar, and can be used to reconcile this verification with your internal systems. Max length: 5000. Nullable.
  * `client_secret` - The short-lived client secret used by Stripe.js to [show a verification modal](https://docs.stripe.com/js/identity/modal) inside your app. This client secret expires after 24 hours and can only be used once. Don’t store it, log it, embed it in a URL, or expose it to anyone other than the user. Make sure that you have TLS enabled on any page that includes the client secret. Refer to our docs on [passing the client secret to the frontend](https://docs.stripe.com/identity/verification-sessions#client-secret) to learn more. Max length: 5000. Nullable.
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `last_error` - If present, this property tells you the last error encountered when processing the verification. Nullable. Expandable.
  * `last_verification_report` - ID of the most recent VerificationReport. [Learn more about accessing detailed verification results.](https://docs.stripe.com/identity/verification-sessions#results) Nullable. Expandable.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `identity.verification_session`.
  * `options` - A set of options for the session’s verification checks. Nullable. Expandable.
  * `provided_details` - Details provided about the user being verified. These details may be shown to the user. Nullable. Expandable.
  * `redaction` - Redaction status of this VerificationSession. If the VerificationSession is not redacted, this field will be null. Nullable. Expandable.
  * `related_customer` - Customer ID Max length: 5000. Nullable.
  * `related_customer_account` - The ID of the Account representing a customer. Max length: 5000. Nullable.
  * `related_person` - Expandable.
  * `status` - Status of this VerificationSession. [Learn more about the lifecycle of sessions](https://docs.stripe.com/identity/how-sessions-work). Possible values: `canceled`, `processing`, `requires_input`, `verified`.
  * `type` - The type of [verification check](https://docs.stripe.com/identity/verification-checks) to be performed. Possible values: `document`, `id_number`, `verification_flow`.
  * `url` - The short-lived URL that you use to redirect a user to Stripe to submit their identity information. This URL expires after 48 hours and can only be used once. Don’t store it, log it, send it in emails or expose it to anyone other than the user. Refer to our docs on [verifying identity documents](https://docs.stripe.com/identity/verify-identity-documents?platform=web&type=redirect) to learn how to redirect users to Stripe. Max length: 5000. Nullable.
  * `verification_flow` - The configuration token of a verification flow from the dashboard. Max length: 5000.
  * `verified_outputs` - The user’s verified data. Nullable. Expandable.
  """
  @type t :: %__MODULE__{
          client_reference_id: String.t(),
          client_secret: String.t(),
          created: integer(),
          id: String.t(),
          last_error: last_error(),
          last_verification_report: String.t() | Stripe.Resources.Identity.VerificationReport.t(),
          livemode: boolean(),
          metadata: %{String.t() => String.t()},
          object: String.t(),
          options: options(),
          provided_details: provided_details() | nil,
          redaction: redaction(),
          related_customer: String.t(),
          related_customer_account: String.t(),
          related_person: related_person() | nil,
          status: String.t(),
          type: String.t(),
          url: String.t(),
          verification_flow: String.t() | nil,
          verified_outputs: verified_outputs() | nil
        }

  defstruct [
    :client_reference_id,
    :client_secret,
    :created,
    :id,
    :last_error,
    :last_verification_report,
    :livemode,
    :metadata,
    :object,
    :options,
    :provided_details,
    :redaction,
    :related_customer,
    :related_customer_account,
    :related_person,
    :status,
    :type,
    :url,
    :verification_flow,
    :verified_outputs
  ]

  @object_name "identity.verification_session"
  def object_name, do: @object_name

  def expandable_fields,
    do: [
      "last_error",
      "last_verification_report",
      "options",
      "provided_details",
      "redaction",
      "related_person",
      "verified_outputs"
    ]

  @typedoc """
  * `code` - A short machine-readable string giving the reason for the verification or user-session failure. Possible values: `abandoned`, `consent_declined`, `country_not_supported`, `device_not_supported`, `document_expired`, `document_type_not_supported`, `document_unverified_other`, `email_unverified_other`, `email_verification_declined`, `id_number_insufficient_document_data`, `id_number_mismatch`, `id_number_unverified_other`, `phone_unverified_other`, `phone_verification_declined`, `selfie_document_missing_photo`, `selfie_face_mismatch`, `selfie_manipulated`, `selfie_unverified_other`, `under_supported_age`. Nullable.
  * `reason` - A message that explains the reason for verification or user-session failure. Max length: 5000. Nullable.
  """
  @type last_error :: %{
          optional(:code) => String.t() | nil,
          optional(:reason) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `document`
  * `email`
  * `id_number`
  * `matching`
  * `phone`
  """
  @type options :: %{
          optional(:document) => options_document() | nil,
          optional(:email) => options_email() | nil,
          optional(:id_number) => map() | nil,
          optional(:matching) => options_matching() | nil,
          optional(:phone) => options_phone() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `allowed_types` - Array of strings of allowed identity document types. If the provided identity document isn’t one of the allowed types, the verification check will fail with a document_type_not_allowed error code.
  * `require_id_number` - Collect an ID number and perform an [ID number check](https://docs.stripe.com/identity/verification-checks?type=id-number) with the document’s extracted name and date of birth.
  * `require_live_capture` - Disable image uploads, identity document images have to be captured using the device’s camera.
  * `require_matching_selfie` - Capture a face image and perform a [selfie check](https://docs.stripe.com/identity/verification-checks?type=selfie) comparing a photo ID and a picture of your user’s face. [Learn more](https://docs.stripe.com/identity/selfie).
  """
  @type options_document :: %{
          optional(:allowed_types) => [String.t()] | nil,
          optional(:require_id_number) => boolean() | nil,
          optional(:require_live_capture) => boolean() | nil,
          optional(:require_matching_selfie) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `require_verification` - Request one time password verification of `provided_details.email`.
  """
  @type options_email :: %{
          optional(:require_verification) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `dob` - Strictness of the DOB matching policy to apply. Possible values: `none`, `similar`.
  * `name` - Strictness of the name matching policy to apply. Possible values: `none`, `similar`.
  """
  @type options_matching :: %{
          optional(:dob) => String.t() | nil,
          optional(:name) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `require_verification` - Request one time password verification of `provided_details.phone`.
  """
  @type options_phone :: %{
          optional(:require_verification) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `email` - Email of user being verified Max length: 5000.
  * `phone` - Phone number of user being verified Max length: 5000.
  """
  @type provided_details :: %{
          optional(:email) => String.t() | nil,
          optional(:phone) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `status` - Indicates whether this object and its related objects have been redacted or not. Possible values: `processing`, `redacted`.
  """
  @type redaction :: %{
          optional(:status) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `account` - Token referencing the associated Account of the related Person resource. Max length: 5000.
  * `person` - Token referencing the related Person resource. Max length: 5000.
  """
  @type related_person :: %{
          optional(:account) => String.t() | nil,
          optional(:person) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `address` - The user's verified address. Nullable.
  * `dob` - The user’s verified date of birth. Nullable.
  * `email` - The user's verified email address Max length: 5000. Nullable.
  * `first_name` - The user's verified first name. Max length: 5000. Nullable.
  * `id_number` - The user's verified id number. Max length: 5000. Nullable.
  * `id_number_type` - The user's verified id number type. Possible values: `br_cpf`, `sg_nric`, `us_ssn`. Nullable.
  * `last_name` - The user's verified last name. Max length: 5000. Nullable.
  * `phone` - The user's verified phone number Max length: 5000. Nullable.
  * `sex` - The user's verified sex. Possible values: `[redacted]`, `female`, `male`, `unknown`. Nullable.
  * `unparsed_place_of_birth` - The user's verified place of birth as it appears in the document. Max length: 5000. Nullable.
  * `unparsed_sex` - The user's verified sex as it appears in the document. Max length: 5000. Nullable.
  """
  @type verified_outputs :: %{
          optional(:address) => Stripe.Resources.Address.t() | nil,
          optional(:dob) => verified_outputs_dob() | nil,
          optional(:email) => String.t() | nil,
          optional(:first_name) => String.t() | nil,
          optional(:id_number) => String.t() | nil,
          optional(:id_number_type) => String.t() | nil,
          optional(:last_name) => String.t() | nil,
          optional(:phone) => String.t() | nil,
          optional(:sex) => String.t() | nil,
          optional(:unparsed_place_of_birth) => String.t() | nil,
          optional(:unparsed_sex) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `day` - Numerical day between 1 and 31. Nullable.
  * `month` - Numerical month between 1 and 12. Nullable.
  * `year` - The four-digit year. Nullable.
  """
  @type verified_outputs_dob :: %{
          optional(:day) => integer() | nil,
          optional(:month) => integer() | nil,
          optional(:year) => integer() | nil,
          optional(String.t()) => term()
        }

  def __nested_fields__ do
    %{
      "last_error" => %{
        fields: %{
          "code" => :scalar,
          "reason" => :scalar
        }
      },
      "options" => %{
        fields: %{
          "document" => %{
            fields: %{
              "allowed_types" => {:list, :scalar},
              "require_id_number" => :scalar,
              "require_live_capture" => :scalar,
              "require_matching_selfie" => :scalar
            }
          },
          "email" => %{
            fields: %{
              "require_verification" => :scalar
            }
          },
          "id_number" => :scalar,
          "matching" => %{
            fields: %{
              "dob" => :scalar,
              "name" => :scalar
            }
          },
          "phone" => %{
            fields: %{
              "require_verification" => :scalar
            }
          }
        }
      },
      "provided_details" => %{
        fields: %{
          "email" => :scalar,
          "phone" => :scalar
        }
      },
      "redaction" => %{
        fields: %{
          "status" => :scalar
        }
      },
      "related_person" => %{
        fields: %{
          "account" => :scalar,
          "person" => :scalar
        }
      },
      "verified_outputs" => %{
        fields: %{
          "address" => {:resource, Stripe.Resources.Address},
          "dob" => %{
            fields: %{
              "day" => :scalar,
              "month" => :scalar,
              "year" => :scalar
            }
          },
          "email" => :scalar,
          "first_name" => :scalar,
          "id_number" => :scalar,
          "id_number_type" => :scalar,
          "last_name" => :scalar,
          "phone" => :scalar,
          "sex" => :scalar,
          "unparsed_place_of_birth" => :scalar,
          "unparsed_sex" => :scalar
        }
      }
    }
  end
end
