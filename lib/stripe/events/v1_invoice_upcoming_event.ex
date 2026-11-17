# File generated from our OpenAPI spec
defmodule Stripe.Events.V1InvoiceUpcomingEvent do
  @moduledoc """
  Occurs X number of days before a subscription is scheduled to create an invoice that is automatically charged&mdash;where X is determined by your [subscriptions settings](https://dashboard.stripe.com/account/billing/automatic). Note: The received `Invoice` object will not have an invoice ID.
  """

  @typedoc """
  * `customer` - The ID of the customer this upcoming invoice is associated with.
  * `subscription` - The ID of the subscription, if any.
  """
  @type data :: %{
          optional(:customer) => term() | nil,
          optional(:subscription) => term() | nil,
          optional(String.t()) => term()
        }

  defstruct [
    :changes,
    :context,
    :created,
    :data,
    :id,
    :livemode,
    :object,
    :reason,
    :snapshot_event,
    :type
  ]

  def lookup_type, do: "v1.invoice.upcoming"

  def __nested_fields__ do
    %{
      "data" => %{
        fields: %{
          "customer" => :scalar,
          "subscription" => :scalar
        }
      }
    }
  end
end
