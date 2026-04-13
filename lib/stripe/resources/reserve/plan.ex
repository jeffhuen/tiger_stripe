# File generated from our OpenAPI spec
defmodule Stripe.Resources.Reserve.Plan do
  @moduledoc """
  ReservesReservePlansResourcesReservePlan

  ReservePlans are used to automatically place holds on a merchant's funds until the plan expires. It takes a portion of each incoming Charge (including those resulting from a Transfer from a platform account).
  """

  @typedoc """
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `created_by` - Indicates which party created this ReservePlan. Possible values: `application`, `stripe`.
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). An unset currency indicates that the plan applies to all currencies. Format: ISO 4217 currency code. Nullable.
  * `disabled_at` - Time at which the ReservePlan was disabled. Format: Unix timestamp. Nullable.
  * `fixed_release` - Expandable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `reserve.plan`.
  * `percent` - The percent of each Charge to reserve.
  * `rolling_release` - Expandable.
  * `status` - The current status of the ReservePlan. The ReservePlan only affects charges if it is `active`. Possible values: `active`, `disabled`, `expired`.
  * `type` - The type of the ReservePlan. Possible values: `fixed_release`, `rolling_release`.
  """
  @type t :: %__MODULE__{
          created: integer(),
          created_by: String.t(),
          currency: String.t(),
          disabled_at: integer(),
          fixed_release: __MODULE__.FixedRelease.t() | nil,
          id: String.t(),
          livemode: boolean(),
          metadata: %{String.t() => String.t()} | nil,
          object: String.t(),
          percent: integer(),
          rolling_release: __MODULE__.RollingRelease.t() | nil,
          status: String.t(),
          type: String.t()
        }

  defstruct [
    :created,
    :created_by,
    :currency,
    :disabled_at,
    :fixed_release,
    :id,
    :livemode,
    :metadata,
    :object,
    :percent,
    :rolling_release,
    :status,
    :type
  ]

  @object_name "reserve.plan"
  def object_name, do: @object_name

  def expandable_fields, do: ["fixed_release", "rolling_release"]

  defmodule FixedRelease do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `release_after` - The time after which all reserved funds are requested for release.
    * `scheduled_release` - The time at which reserved funds are scheduled for release, automatically set to midnight UTC of the day after `release_after`. Format: Unix timestamp.
    """
    @type t :: %__MODULE__{
            release_after: integer() | nil,
            scheduled_release: integer() | nil
          }
    defstruct [:release_after, :scheduled_release]
  end

  defmodule RollingRelease do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `days_after_charge` - The number of days to reserve funds before releasing.
    * `expires_on` - The time at which the ReservePlan expires. Nullable.
    """
    @type t :: %__MODULE__{
            days_after_charge: integer() | nil,
            expires_on: integer() | nil
          }
    defstruct [:days_after_charge, :expires_on]
  end

  def __inner_types__ do
    %{
      "fixed_release" => __MODULE__.FixedRelease,
      "rolling_release" => __MODULE__.RollingRelease
    }
  end
end
