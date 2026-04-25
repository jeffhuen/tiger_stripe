# File generated from our OpenAPI spec
defmodule Stripe.Resources.SubscriptionItem do
  @moduledoc """
  SubscriptionItem

  Subscription items allow you to create customer subscriptions with more than
  one plan, making it easy to represent complex billing relationships.
  """

  @typedoc """
  * `billing_thresholds` - Define thresholds at which an invoice will be sent, and the related subscription advanced to a new billing period Nullable. Expandable.
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch.
  * `current_period_end` - The end time of this subscription item's current billing period. Format: Unix timestamp.
  * `current_period_start` - The start time of this subscription item's current billing period. Format: Unix timestamp.
  * `discounts` - The discounts applied to the subscription item. Subscription item discounts are applied before subscription discounts. Use `expand[]=discounts` to expand each discount. Expandable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `subscription_item`.
  * `plan` - Expandable.
  * `price` - Expandable.
  * `quantity` - The [quantity](https://docs.stripe.com/subscriptions/quantities) of the plan to which the customer should be subscribed.
  * `subscription` - The `subscription` this `subscription_item` belongs to. Max length: 5000.
  * `tax_rates` - The tax rates which apply to this `subscription_item`. When set, the `default_tax_rates` on the subscription do not apply to this `subscription_item`. Nullable. Expandable.
  """
  @type t :: %__MODULE__{
          billing_thresholds: billing_thresholds(),
          created: integer(),
          current_period_end: integer(),
          current_period_start: integer(),
          discounts: [String.t() | Stripe.Resources.Discount.t()],
          id: String.t(),
          metadata: %{String.t() => String.t()},
          object: String.t(),
          plan: Stripe.Resources.Plan.t(),
          price: Stripe.Resources.Price.t(),
          quantity: integer() | nil,
          subscription: String.t(),
          tax_rates: [Stripe.Resources.TaxRate.t()]
        }

  defstruct [
    :billing_thresholds,
    :created,
    :current_period_end,
    :current_period_start,
    :discounts,
    :id,
    :metadata,
    :object,
    :plan,
    :price,
    :quantity,
    :subscription,
    :tax_rates
  ]

  @object_name "subscription_item"
  def object_name, do: @object_name

  def expandable_fields, do: ["billing_thresholds", "discounts", "plan", "price", "tax_rates"]

  @typedoc """
  * `usage_gte` - Usage threshold that triggers the subscription to create an invoice Nullable.
  """
  @type billing_thresholds :: %{
          optional(:usage_gte) => integer() | nil,
          optional(String.t()) => term()
        }

  def __nested_fields__ do
    %{
      "billing_thresholds" => %{
        fields: %{
          "usage_gte" => :scalar
        }
      },
      "plan" => {:resource, Stripe.Resources.Plan},
      "price" => {:resource, Stripe.Resources.Price}
    }
  end
end
