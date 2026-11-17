# File generated from our OpenAPI spec
defmodule Stripe.ApiVersion do
  @moduledoc """
  The Stripe API version this SDK was generated against.

  `Stripe.Client` sends it as the `Stripe-Version` header unless the client or
  request sets `:api_version`.
  """

  @current "2026-09-30.endive"

  @doc "Returns the API version the generated resources and params describe."
  @spec current() :: String.t()
  def current, do: @current
end
