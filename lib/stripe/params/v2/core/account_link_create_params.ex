# File generated from our OpenAPI spec
defmodule Stripe.Params.V2.Core.AccountLinkCreateParams do
  @moduledoc "Parameters for account link create."

  @typedoc """
  * `account` - The ID of the Account to create link for.
  * `use_case` - The use case of the AccountLink.
  """
  @type t :: %__MODULE__{}

  defstruct [:account, :use_case]
end
