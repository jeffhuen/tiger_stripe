# File generated from our OpenAPI spec
defmodule Stripe.Events.V2CoreAccountLinkReturnedEvent do
  @moduledoc """
  Occurs when the generated AccountLink is completed.
  """

  defmodule Data do
    @moduledoc false

    @typedoc """
    * `account_id` - The ID of the v2 account.
    * `configurations` - Configurations on the Account that was onboarded via the account link.
    * `use_case` - Open Enum. The use case type of the account link that has been completed.
    """
    @type t :: %__MODULE__{
            account_id: term(),
            configurations: term(),
            use_case: term()
          }

    defstruct [:account_id, :configurations, :use_case]
  end

  defstruct [:changes, :context, :created, :data, :id, :livemode, :object, :reason, :type]

  def lookup_type, do: "v2.core.account_link.returned"

  def __inner_types__, do: %{"data" => Data}
end
