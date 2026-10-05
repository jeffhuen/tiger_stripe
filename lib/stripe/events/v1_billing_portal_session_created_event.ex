# File generated from our OpenAPI spec
defmodule Stripe.Events.V1BillingPortalSessionCreatedEvent do
  @moduledoc """
  Occurs whenever a portal session is created.
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

  def lookup_type, do: "v1.billing_portal.session.created"
end
