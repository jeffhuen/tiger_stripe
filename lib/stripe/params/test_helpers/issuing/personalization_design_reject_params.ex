# File generated from our OpenAPI spec
defmodule Stripe.Params.TestHelpers.Issuing.PersonalizationDesignRejectParams do
  @moduledoc "Parameters for personalization design reject."

  @typedoc """
  * `expand` - Specifies which fields in the response should be expanded.
  * `rejection_reasons` - The reason(s) the personalization design was rejected.
  """
  @type t :: %__MODULE__{}

  defstruct [:expand, :rejection_reasons]
end
