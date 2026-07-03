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
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
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
  @type t :: %__MODULE__{}

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
