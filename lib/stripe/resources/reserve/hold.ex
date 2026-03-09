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
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `reserve.hold`.
  * `reason` - The reason for the ReserveHold. Possible values: `charge`, `standalone`.
  * `release_schedule` - Expandable.
  * `reserve_plan` - The ReservePlan which produced this ReserveHold (i.e., resplan_123) Nullable. Expandable.
  * `source_charge` - The Charge which funded this ReserveHold (e.g., ch_123) Nullable. Expandable.
  * `source_type` - Which source balance type this ReserveHold reserves funds from. One of `bank_account`, `card`, or `fpx`. Possible values: `bank_account`, `card`, `fpx`.
  """
  @type t :: %__MODULE__{
          amount: integer(),
          amount_releasable: integer() | nil,
          created: integer(),
          created_by: String.t(),
          currency: String.t(),
          id: String.t(),
          is_releasable: boolean() | nil,
          livemode: boolean(),
          metadata: %{String.t() => String.t()} | nil,
          object: String.t(),
          reason: String.t(),
          release_schedule: __MODULE__.ReleaseSchedule.t(),
          reserve_plan: String.t() | Stripe.Resources.Reserve.Plan.t(),
          source_charge: String.t() | Stripe.Resources.Charge.t(),
          source_type: String.t()
        }

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
    :release_schedule,
    :reserve_plan,
    :source_charge,
    :source_type
  ]

  @object_name "reserve.hold"
  def object_name, do: @object_name

  def expandable_fields, do: ["release_schedule", "reserve_plan", "source_charge"]

  defmodule ReleaseSchedule do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `release_after` - The time after which the ReserveHold is requested to be released. Format: Unix timestamp. Nullable.
    * `scheduled_release` - The time at which the ReserveHold is scheduled to be released, automatically set to midnight UTC of the day after `release_after`. Format: Unix timestamp. Nullable.
    """
    @type t :: %__MODULE__{
            release_after: integer() | nil,
            scheduled_release: integer() | nil
          }
    defstruct [:release_after, :scheduled_release]
  end

  def __inner_types__ do
    %{
      "release_schedule" => __MODULE__.ReleaseSchedule
    }
  end
end
