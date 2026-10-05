# File generated from our OpenAPI spec
defmodule Stripe.Resources.Reserve.Plan do
  @moduledoc """
  ReservePlan

  ReservePlans are used to automatically place holds on a merchant's funds until the plan expires. It takes a portion of each incoming Charge (including those resulting from a Transfer from a platform account).
  """

  @typedoc """
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `created_by` - Indicates which party created this ReservePlan. Possible values: `application`, `stripe`.
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). An unset currency indicates that the plan applies to all currencies. Format: ISO 4217 currency code. Nullable.
  * `destination` - The balance destination to which the reserved funds are sent. Possible values: `other`, `risk_reserved`, `settlement_reserved`.
  * `disabled_at` - Time at which the ReservePlan was disabled. Format: Unix timestamp. Nullable.
  * `fixed_release` - Expandable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `manual_release` - Expandable.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `reserve.plan`.
  * `percent` - The percent of each Charge to reserve.
  * `rolling_release` - Expandable.
  * `status` - The current status of the ReservePlan. The ReservePlan only affects charges if it is `active`. Possible values: `active`, `disabled`, `expired`, `other`.
  * `type` - The type of the ReservePlan. Possible values: `fixed_release`, `manual_release`, `other`, `rolling_release`.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :created,
    :created_by,
    :currency,
    :destination,
    :disabled_at,
    :fixed_release,
    :id,
    :livemode,
    :manual_release,
    :metadata,
    :object,
    :percent,
    :rolling_release,
    :status,
    :type
  ]

  @object_name "reserve.plan"
  def object_name, do: @object_name

  def expandable_fields, do: ["fixed_release", "manual_release", "rolling_release"]

  def __nested_fields__ do
    %{
      "fixed_release" => %{
        fields: %{
          "release_after" => :scalar,
          "scheduled_release" => :scalar
        }
      },
      "rolling_release" => %{
        fields: %{
          "days_after_charge" => :scalar,
          "expires_on" => :scalar
        }
      }
    }
  end
end
