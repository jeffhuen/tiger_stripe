# File generated from our OpenAPI spec
defmodule Stripe.Resources.Reserve.Release do
  @moduledoc """
  ReservesReserveReleasesResourcesReserveRelease

  ReserveReleases represent the release of funds from a ReserveHold.
  """

  @typedoc """
  * `amount` - Amount released. A positive integer representing how much is released in the [smallest currency unit](https://docs.stripe.com/currencies#zero-decimal).
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `created_by` - Indicates which party created this ReserveRelease. Possible values: `application`, `stripe`.
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `reserve.release`.
  * `reason` - The reason for the ReserveRelease, indicating why the funds were released. Possible values: `bulk_hold_expiry`, `hold_released_early`, `hold_reversed`, `plan_disabled`.
  * `released_at` - The release timestamp of the funds. Format: Unix timestamp.
  * `reserve_hold` - The ReserveHold this ReserveRelease is associated with. Nullable. Expandable.
  * `reserve_plan` - The ReservePlan ID this ReserveRelease is associated with. This field is only populated if a ReserveRelease is created by a ReservePlan disable operation, or from a scheduled ReservedHold expiry. Nullable. Expandable.
  * `source_transaction` - Expandable.
  """
  @type t :: %__MODULE__{
          amount: integer(),
          created: integer(),
          created_by: String.t(),
          currency: String.t(),
          id: String.t(),
          livemode: boolean(),
          metadata: %{String.t() => String.t()} | nil,
          object: String.t(),
          reason: String.t(),
          released_at: integer(),
          reserve_hold: String.t() | Stripe.Resources.Reserve.Hold.t(),
          reserve_plan: String.t() | Stripe.Resources.Reserve.Plan.t(),
          source_transaction: source_transaction() | nil
        }

  defstruct [
    :amount,
    :created,
    :created_by,
    :currency,
    :id,
    :livemode,
    :metadata,
    :object,
    :reason,
    :released_at,
    :reserve_hold,
    :reserve_plan,
    :source_transaction
  ]

  @object_name "reserve.release"
  def object_name, do: @object_name

  def expandable_fields, do: ["reserve_hold", "reserve_plan", "source_transaction"]

  @typedoc """
  * `dispute` - The ID of the dispute.
  * `refund` - The ID of the refund.
  * `type` - The type of source transaction. Possible values: `dispute`, `refund`.
  """
  @type source_transaction :: %{
          optional(:dispute) => String.t() | Stripe.Resources.Dispute.t() | nil,
          optional(:refund) => String.t() | Stripe.Resources.Refund.t() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  def __nested_fields__ do
    %{
      "source_transaction" => %{
        fields: %{
          "dispute" => {:resource, Stripe.Resources.Dispute},
          "refund" => {:resource, Stripe.Resources.Refund},
          "type" => :scalar
        }
      }
    }
  end
end
