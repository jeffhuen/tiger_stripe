# File generated from our OpenAPI spec
defmodule Stripe.Events.V2CoreAccountLinkReturnedEvent do
  @moduledoc """
  Occurs when the generated AccountLink is completed.
  """

  @typedoc """
  * `account_id` - The ID of the v2 account.
  * `configurations` - Configurations on the Account that was onboarded via the account link.
  * `use_case` - Open Enum. The use case type of the account link that has been completed.
  """
  @type data :: %{
          optional(:account_id) => term() | nil,
          optional(:configurations) => term() | nil,
          optional(:use_case) => term() | nil,
          optional(String.t()) => term()
        }

  defstruct [:changes, :context, :created, :data, :id, :livemode, :object, :reason, :type]

  def lookup_type, do: "v2.core.account_link.returned"

  def __nested_fields__ do
    %{
      "data" => %{
        fields: %{
          "account_id" => :scalar,
          "configurations" => :scalar,
          "use_case" => :scalar
        }
      }
    }
  end
end
