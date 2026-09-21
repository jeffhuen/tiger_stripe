# File generated from our OpenAPI spec
defmodule Stripe.Resources.Billing.FeedbackOption do
  @moduledoc """
  FeedbackOptionsFeedbackOptions

  A resource for the feedback options model (for custom cancellation reasons)
  """

  @typedoc """
  * `description` - An arbitrary string attached to the object. Often useful for displaying to users. Max length: 5000.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `billing.feedback_option`.
  * `status` - The feedback option's status. Possible values: `active`, `inactive`.
  * `status_transitions` - Expandable.
  """
  @type t :: %__MODULE__{}

  defstruct [:description, :id, :livemode, :object, :status, :status_transitions]

  @object_name "billing.feedback_option"
  def object_name, do: @object_name

  def expandable_fields, do: ["status_transitions"]

  def __nested_fields__ do
    %{
      "status_transitions" => %{
        fields: %{
          "deactivated_at" => :scalar
        }
      }
    }
  end
end
