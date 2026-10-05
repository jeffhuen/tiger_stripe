# File generated from our OpenAPI spec
defmodule Stripe.Events.V1AccountExternalAccountUpdatedEvent do
  @moduledoc """
  Occurs whenever an external account is updated.
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

  def lookup_type, do: "v1.account.external_account.updated"
end
