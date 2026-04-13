# File generated from our OpenAPI spec
defmodule Stripe.Resources.Identity.VerificationReport do
  @moduledoc """
  GelatoVerificationReport

  A VerificationReport is the result of an attempt to collect and verify data from a user.
  The collection of verification checks performed is determined from the `type` and `options`
  parameters used. You can find the result of each verification check performed in the
  appropriate sub-resource: `document`, `id_number`, `selfie`.

  Each VerificationReport contains a copy of any data collected by the user as well as
  reference IDs which can be used to access collected images through the [FileUpload](https://docs.stripe.com/api/files)
  API. To configure and create VerificationReports, use the
  [VerificationSession](https://docs.stripe.com/api/identity/verification_sessions) API.

  Related guide: [Accessing verification results](https://docs.stripe.com/identity/verification-sessions#results).
  """

  @typedoc """
  * `client_reference_id` - A string to reference this user. This can be a customer ID, a session ID, or similar, and can be used to reconcile this verification with your internal systems. Max length: 5000. Nullable.
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `document` - Expandable.
  * `email` - Expandable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `id_number` - Expandable.
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `identity.verification_report`.
  * `options` - Expandable.
  * `phone` - Expandable.
  * `selfie` - Expandable.
  * `type` - Type of report. Possible values: `document`, `id_number`, `verification_flow`.
  * `verification_flow` - The configuration token of a verification flow from the dashboard. Max length: 5000.
  * `verification_session` - ID of the VerificationSession that created this report. Max length: 5000. Nullable.
  """
  @type t :: %__MODULE__{
          client_reference_id: String.t(),
          created: integer(),
          document: __MODULE__.Document.t() | nil,
          email: __MODULE__.Email.t() | nil,
          id: String.t(),
          id_number: __MODULE__.IdNumber.t() | nil,
          livemode: boolean(),
          object: String.t(),
          options: __MODULE__.Options.t() | nil,
          phone: __MODULE__.Phone.t() | nil,
          selfie: __MODULE__.Selfie.t() | nil,
          type: String.t(),
          verification_flow: String.t() | nil,
          verification_session: String.t()
        }

  defstruct [
    :client_reference_id,
    :created,
    :document,
    :email,
    :id,
    :id_number,
    :livemode,
    :object,
    :options,
    :phone,
    :selfie,
    :type,
    :verification_flow,
    :verification_session
  ]

  @object_name "identity.verification_report"
  def object_name, do: @object_name

  def expandable_fields, do: ["document", "email", "id_number", "options", "phone", "selfie"]

  defmodule Document do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `address` - Address as it appears in the document. Nullable.
    * `dob` - Date of birth as it appears in the document. Nullable.
    * `error` - Details on the verification error. Present when status is `unverified`. Nullable.
    * `expiration_date` - Expiration date of the document. Nullable.
    * `files` - Array of [File](https://docs.stripe.com/api/files) ids containing images for this document. Nullable.
    * `first_name` - First name as it appears in the document. Max length: 5000. Nullable.
    * `issued_date` - Issued date of the document. Nullable.
    * `issuing_country` - Issuing country of the document. Max length: 5000. Nullable.
    * `last_name` - Last name as it appears in the document. Max length: 5000. Nullable.
    * `number` - Document ID number. Max length: 5000. Nullable.
    * `sex` - Sex of the person in the document. Possible values: `[redacted]`, `female`, `male`, `unknown`. Nullable.
    * `status` - Status of this `document` check. Possible values: `unverified`, `verified`.
    * `type` - Type of the document. Possible values: `driving_license`, `id_card`, `passport`. Nullable.
    * `unparsed_place_of_birth` - Place of birth as it appears in the document. Max length: 5000. Nullable.
    * `unparsed_sex` - Sex as it appears in the document. Max length: 5000. Nullable.
    """
    @type t :: %__MODULE__{
            address: Stripe.Resources.Address.t() | nil,
            dob: __MODULE__.Dob.t() | nil,
            error: __MODULE__.Error.t() | nil,
            expiration_date: __MODULE__.ExpirationDate.t() | nil,
            files: [String.t()] | nil,
            first_name: String.t() | nil,
            issued_date: __MODULE__.IssuedDate.t() | nil,
            issuing_country: String.t() | nil,
            last_name: String.t() | nil,
            number: String.t() | nil,
            sex: String.t() | nil,
            status: String.t() | nil,
            type: String.t() | nil,
            unparsed_place_of_birth: String.t() | nil,
            unparsed_sex: String.t() | nil
          }
    defstruct [
      :address,
      :dob,
      :error,
      :expiration_date,
      :files,
      :first_name,
      :issued_date,
      :issuing_country,
      :last_name,
      :number,
      :sex,
      :status,
      :type,
      :unparsed_place_of_birth,
      :unparsed_sex
    ]

    defmodule Dob do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `day` - Numerical day between 1 and 31. Nullable.
      * `month` - Numerical month between 1 and 12. Nullable.
      * `year` - The four-digit year. Nullable.
      """
      @type t :: %__MODULE__{
              day: integer() | nil,
              month: integer() | nil,
              year: integer() | nil
            }
      defstruct [:day, :month, :year]
    end

    defmodule Error do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `code` - A short machine-readable string giving the reason for the verification failure. Possible values: `document_expired`, `document_type_not_supported`, `document_unverified_other`. Nullable.
      * `reason` - A human-readable message giving the reason for the failure. These messages can be shown to your users. Max length: 5000. Nullable.
      """
      @type t :: %__MODULE__{
              code: String.t() | nil,
              reason: String.t() | nil
            }
      defstruct [:code, :reason]
    end

    defmodule ExpirationDate do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `day` - Numerical day between 1 and 31. Nullable.
      * `month` - Numerical month between 1 and 12. Nullable.
      * `year` - The four-digit year. Nullable.
      """
      @type t :: %__MODULE__{
              day: integer() | nil,
              month: integer() | nil,
              year: integer() | nil
            }
      defstruct [:day, :month, :year]
    end

    defmodule IssuedDate do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `day` - Numerical day between 1 and 31. Nullable.
      * `month` - Numerical month between 1 and 12. Nullable.
      * `year` - The four-digit year. Nullable.
      """
      @type t :: %__MODULE__{
              day: integer() | nil,
              month: integer() | nil,
              year: integer() | nil
            }
      defstruct [:day, :month, :year]
    end

    def __inner_types__ do
      %{
        "dob" => __MODULE__.Dob,
        "error" => __MODULE__.Error,
        "expiration_date" => __MODULE__.ExpirationDate,
        "issued_date" => __MODULE__.IssuedDate
      }
    end
  end

  defmodule Email do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `email` - Email to be verified. Max length: 5000. Nullable.
    * `error` - Details on the verification error. Present when status is `unverified`. Nullable.
    * `status` - Status of this `email` check. Possible values: `unverified`, `verified`.
    """
    @type t :: %__MODULE__{
            email: String.t() | nil,
            error: __MODULE__.Error.t() | nil,
            status: String.t() | nil
          }
    defstruct [:email, :error, :status]

    defmodule Error do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `code` - A short machine-readable string giving the reason for the verification failure. Possible values: `email_unverified_other`, `email_verification_declined`. Nullable.
      * `reason` - A human-readable message giving the reason for the failure. These messages can be shown to your users. Max length: 5000. Nullable.
      """
      @type t :: %__MODULE__{
              code: String.t() | nil,
              reason: String.t() | nil
            }
      defstruct [:code, :reason]
    end

    def __inner_types__ do
      %{
        "error" => __MODULE__.Error
      }
    end
  end

  defmodule IdNumber do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `dob` - Date of birth. Nullable.
    * `error` - Details on the verification error. Present when status is `unverified`. Nullable.
    * `first_name` - First name. Max length: 5000. Nullable.
    * `id_number` - ID number. When `id_number_type` is `us_ssn`, only the last 4 digits are present. Max length: 5000. Nullable.
    * `id_number_type` - Type of ID number. Possible values: `br_cpf`, `sg_nric`, `us_ssn`. Nullable.
    * `last_name` - Last name. Max length: 5000. Nullable.
    * `status` - Status of this `id_number` check. Possible values: `unverified`, `verified`.
    """
    @type t :: %__MODULE__{
            dob: __MODULE__.Dob.t() | nil,
            error: __MODULE__.Error.t() | nil,
            first_name: String.t() | nil,
            id_number: String.t() | nil,
            id_number_type: String.t() | nil,
            last_name: String.t() | nil,
            status: String.t() | nil
          }
    defstruct [:dob, :error, :first_name, :id_number, :id_number_type, :last_name, :status]

    defmodule Dob do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `day` - Numerical day between 1 and 31. Nullable.
      * `month` - Numerical month between 1 and 12. Nullable.
      * `year` - The four-digit year. Nullable.
      """
      @type t :: %__MODULE__{
              day: integer() | nil,
              month: integer() | nil,
              year: integer() | nil
            }
      defstruct [:day, :month, :year]
    end

    defmodule Error do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `code` - A short machine-readable string giving the reason for the verification failure. Possible values: `id_number_insufficient_document_data`, `id_number_mismatch`, `id_number_unverified_other`. Nullable.
      * `reason` - A human-readable message giving the reason for the failure. These messages can be shown to your users. Max length: 5000. Nullable.
      """
      @type t :: %__MODULE__{
              code: String.t() | nil,
              reason: String.t() | nil
            }
      defstruct [:code, :reason]
    end

    def __inner_types__ do
      %{
        "dob" => __MODULE__.Dob,
        "error" => __MODULE__.Error
      }
    end
  end

  defmodule Options do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `document`
    * `id_number`
    """
    @type t :: %__MODULE__{
            document: __MODULE__.Document.t() | nil,
            id_number: map() | nil
          }
    defstruct [:document, :id_number]

    defmodule Document do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `allowed_types` - Array of strings of allowed identity document types. If the provided identity document isn’t one of the allowed types, the verification check will fail with a document_type_not_allowed error code.
      * `require_id_number` - Collect an ID number and perform an [ID number check](https://docs.stripe.com/identity/verification-checks?type=id-number) with the document’s extracted name and date of birth.
      * `require_live_capture` - Disable image uploads, identity document images have to be captured using the device’s camera.
      * `require_matching_selfie` - Capture a face image and perform a [selfie check](https://docs.stripe.com/identity/verification-checks?type=selfie) comparing a photo ID and a picture of your user’s face. [Learn more](https://docs.stripe.com/identity/selfie).
      """
      @type t :: %__MODULE__{
              allowed_types: [String.t()] | nil,
              require_id_number: boolean() | nil,
              require_live_capture: boolean() | nil,
              require_matching_selfie: boolean() | nil
            }
      defstruct [
        :allowed_types,
        :require_id_number,
        :require_live_capture,
        :require_matching_selfie
      ]
    end

    def __inner_types__ do
      %{
        "document" => __MODULE__.Document
      }
    end
  end

  defmodule Phone do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `error` - Details on the verification error. Present when status is `unverified`. Nullable.
    * `phone` - Phone to be verified. Max length: 5000. Nullable.
    * `status` - Status of this `phone` check. Possible values: `unverified`, `verified`.
    """
    @type t :: %__MODULE__{
            error: __MODULE__.Error.t() | nil,
            phone: String.t() | nil,
            status: String.t() | nil
          }
    defstruct [:error, :phone, :status]

    defmodule Error do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `code` - A short machine-readable string giving the reason for the verification failure. Possible values: `phone_unverified_other`, `phone_verification_declined`. Nullable.
      * `reason` - A human-readable message giving the reason for the failure. These messages can be shown to your users. Max length: 5000. Nullable.
      """
      @type t :: %__MODULE__{
              code: String.t() | nil,
              reason: String.t() | nil
            }
      defstruct [:code, :reason]
    end

    def __inner_types__ do
      %{
        "error" => __MODULE__.Error
      }
    end
  end

  defmodule Selfie do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `document` - ID of the [File](https://docs.stripe.com/api/files) holding the image of the identity document used in this check. Max length: 5000. Nullable.
    * `error` - Details on the verification error. Present when status is `unverified`. Nullable.
    * `selfie` - ID of the [File](https://docs.stripe.com/api/files) holding the image of the selfie used in this check. Max length: 5000. Nullable.
    * `status` - Status of this `selfie` check. Possible values: `unverified`, `verified`.
    """
    @type t :: %__MODULE__{
            document: String.t() | nil,
            error: __MODULE__.Error.t() | nil,
            selfie: String.t() | nil,
            status: String.t() | nil
          }
    defstruct [:document, :error, :selfie, :status]

    defmodule Error do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `code` - A short machine-readable string giving the reason for the verification failure. Possible values: `selfie_document_missing_photo`, `selfie_face_mismatch`, `selfie_manipulated`, `selfie_unverified_other`. Nullable.
      * `reason` - A human-readable message giving the reason for the failure. These messages can be shown to your users. Max length: 5000. Nullable.
      """
      @type t :: %__MODULE__{
              code: String.t() | nil,
              reason: String.t() | nil
            }
      defstruct [:code, :reason]
    end

    def __inner_types__ do
      %{
        "error" => __MODULE__.Error
      }
    end
  end

  def __inner_types__ do
    %{
      "document" => __MODULE__.Document,
      "email" => __MODULE__.Email,
      "id_number" => __MODULE__.IdNumber,
      "options" => __MODULE__.Options,
      "phone" => __MODULE__.Phone,
      "selfie" => __MODULE__.Selfie
    }
  end
end
