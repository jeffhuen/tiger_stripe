# File generated from our OpenAPI spec
defmodule Stripe.Events.V1AccountApplicationDeauthorizedEvent do
  @moduledoc """
  Occurs whenever a user deauthorizes an application. Sent to the related application only.
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

  def lookup_type, do: "v1.account.application.deauthorized"
end
