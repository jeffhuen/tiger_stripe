# File generated from our OpenAPI spec
defmodule Stripe.Events.V1EntitlementsActiveEntitlementSummaryEntitlementAddedEvent do
  @moduledoc """
  Occurs when an entitlement is added to a customer's active entitlement summary.
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

  def lookup_type, do: "v1.entitlements.active_entitlement_summary.entitlement_added"
end
