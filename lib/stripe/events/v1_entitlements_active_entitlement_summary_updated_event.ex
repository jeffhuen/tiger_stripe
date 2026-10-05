# File generated from our OpenAPI spec
defmodule Stripe.Events.V1EntitlementsActiveEntitlementSummaryUpdatedEvent do
  @moduledoc """
  Occurs whenever a customer's entitlements change.
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

  def lookup_type, do: "v1.entitlements.active_entitlement_summary.updated"
end
