# File generated from our OpenAPI spec
defmodule Stripe.Resources.Reserve.Hold do
  @moduledoc """
  ReservesReserveHoldsResourcesReserveHold

  ReserveHolds are used to place a temporary ReserveHold on a merchant's funds.
  """

  @typedoc """
  * `amount` - Amount reserved. A positive integer representing how much is reserved in the [smallest currency unit](https://docs.stripe.com/currencies#zero-decimal).
  * `amount_releasable` - Amount in cents that can be released from this ReserveHold
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `created_by` - Indicates which party created this ReserveHold. Possible values: `application`, `stripe`.
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `is_releasable` - Whether there are any funds available to release on this ReserveHold. Note that if the ReserveHold is in the process of being released, this could be false, even though the funds haven't been fully released yet.
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `reserve.hold`.
  * `reason` - The reason for the ReserveHold. Possible values: `charge`, `standalone`.
  * `release_details` - List of ReserveReleases and the amounts released from this ReserveHold. Expandable.
  * `release_schedule` - Expandable.
  * `reserve_plan` - The ReservePlan which produced this ReserveHold (i.e., resplan_123) Nullable. Expandable.
  * `source_charge` - The Charge which funded this ReserveHold (e.g., ch_123) Nullable. Expandable.
  * `source_type` - Which source balance type this ReserveHold reserves funds from. One of `bank_account`, `card`, or `fpx`. Possible values: `bank_account`, `card`, `fpx`.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :amount,
    :amount_releasable,
    :created,
    :created_by,
    :currency,
    :id,
    :is_releasable,
    :livemode,
    :metadata,
    :object,
    :reason,
    :release_details,
    :release_schedule,
    :reserve_plan,
    :source_charge,
    :source_type
  ]

  @object_name "reserve.hold"
  def object_name, do: @object_name

  def expandable_fields,
    do: ["release_details", "release_schedule", "reserve_plan", "source_charge"]

  def __nested_fields__ do
    %{
      "release_details" => %{
        fields: %{
          "amount" => :scalar,
          "reserve_release" => :scalar
        }
      },
      "release_schedule" => %{
        fields: %{
          "release_after" => :scalar,
          "scheduled_release" => :scalar
        }
      }
    }
  end
end
