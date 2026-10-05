# File generated from our OpenAPI spec
defmodule Stripe.Events.V1AccountExternalAccountDeletedEvent do
  @moduledoc """
  Occurs whenever an external account is deleted.
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

  def lookup_type, do: "v1.account.external_account.deleted"
end
