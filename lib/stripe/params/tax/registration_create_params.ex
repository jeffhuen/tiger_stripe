# File generated from our OpenAPI spec
defmodule Stripe.Params.Tax.RegistrationCreateParams do
  @moduledoc "Parameters for registration create."

  @typedoc """
  * `active_from` - Time at which the Tax Registration becomes active. It can be either `now` to indicate the current time, or a future timestamp measured in seconds since the Unix epoch.
  * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)). Max length: 5000.
  * `country_options` - Specific options for a registration in the specified `country`.
  * `expand` - Specifies which fields in the response should be expanded.
  * `expires_at` - If set, the Tax Registration stops being active at this time. If not set, the Tax Registration will be active indefinitely. Timestamp measured in seconds since the Unix epoch. Format: Unix timestamp.
  """
  @type t :: %__MODULE__{}

  defstruct [:active_from, :country, :country_options, :expand, :expires_at]
end
