# File generated from our OpenAPI spec
defmodule Stripe.Params.Tax.RegistrationUpdateParams do
  @moduledoc "Parameters for registration update."

  @typedoc """
  * `active_from` - Time at which the registration becomes active. It can be either `now` to indicate the current time, or a timestamp measured in seconds since the Unix epoch.
  * `expand` - Specifies which fields in the response should be expanded.
  * `expires_at` - If set, the registration stops being active at this time. If not set, the registration will be active indefinitely. It can be either `now` to indicate the current time, or a timestamp measured in seconds since the Unix epoch.
  """
  @type t :: %__MODULE__{}

  defstruct [:active_from, :expand, :expires_at]
end
