# File generated from our OpenAPI spec
defmodule Stripe.Events.V1CustomerDiscountSourceChangedEvent do
  @moduledoc """
  Occurs whenever the source of a customer's discount changes.
  """

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

  def lookup_type, do: "v1.customer.discount.source_changed"
end
