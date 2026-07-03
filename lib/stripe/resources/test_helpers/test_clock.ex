# File generated from our OpenAPI spec
defmodule Stripe.Resources.TestHelpers.TestClock do
  @moduledoc """
  TestClock

  A test clock enables deterministic control over objects in testmode. With a test clock, you can create
  objects at a frozen time in the past or future, and advance to a specific future time to observe webhooks and state changes. After the clock advances,
  you can either validate the current state of your scenario (and test your assumptions), change the current state of your scenario (and test more complex scenarios), or keep advancing forward in time.
  """

  @typedoc """
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `deletes_after` - Time at which this clock is scheduled to auto delete. Format: Unix timestamp.
  * `frozen_time` - Time at which all objects belonging to this clock are frozen. Format: Unix timestamp.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `name` - The custom name supplied at creation. Max length: 5000. Nullable.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `test_helpers.test_clock`.
  * `status` - The status of the Test Clock. Possible values: `advancing`, `internal_failure`, `ready`.
  * `status_details` - Expandable.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :created,
    :deletes_after,
    :frozen_time,
    :id,
    :livemode,
    :name,
    :object,
    :status,
    :status_details
  ]

  @object_name "test_helpers.test_clock"
  def object_name, do: @object_name

  def expandable_fields, do: ["status_details"]

  def __nested_fields__ do
    %{
      "status_details" => %{
        fields: %{
          "advancing" => %{
            fields: %{
              "target_frozen_time" => :scalar
            }
          }
        }
      }
    }
  end
end
