# File generated from our OpenAPI spec
defmodule Stripe.Resources.ProductCatalog.TrialOffer do
  @moduledoc """
  Trial Offer

  Trial offers let you define free or paid introductory pricing for a subscription item.
  A TrialOffer specifies the price to charge during the trial, how many billing intervals
  the trial lasts, and what price the subscription item transitions to when the trial ends.
  You attach a TrialOffer to a subscription item
  using `items[current_trial][trial_offer]` when creating or updating a subscription.
  """

  @typedoc """
  * `active` - Whether the trial offer is active. Set to false to archive the trial offer.
  * `duration` - Expandable.
  * `end_behavior` - Expandable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `nickname` - A brief description of the trial offer, hidden from customers. Max length: 255. Nullable.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `product_catalog.trial_offer`.
  * `price` - The price during the trial offer. Expandable.
  """
  @type t :: %__MODULE__{}

  defstruct [:active, :duration, :end_behavior, :id, :livemode, :nickname, :object, :price]

  @object_name "product_catalog.trial_offer"
  def object_name, do: @object_name

  def expandable_fields, do: ["duration", "end_behavior", "price"]

  def __nested_fields__ do
    %{
      "duration" => %{
        fields: %{
          "relative" => %{
            fields: %{
              "iterations" => :scalar
            }
          },
          "type" => :scalar
        }
      },
      "end_behavior" => %{
        fields: %{
          "transition" => %{
            fields: %{
              "price" => {:resource, Stripe.Resources.Price}
            }
          },
          "type" => :scalar
        }
      }
    }
  end
end
