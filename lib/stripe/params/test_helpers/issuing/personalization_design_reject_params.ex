# File generated from our OpenAPI spec
defmodule Stripe.Params.TestHelpers.Issuing.PersonalizationDesignRejectParams do
  @moduledoc "Parameters for personalization design reject."

  @typedoc """
  * `expand` - Specifies which fields in the response should be expanded.
  * `rejection_reasons` - The reason(s) the personalization design was rejected.
  """
  @type t :: %__MODULE__{
          expand: [String.t()] | nil,
          rejection_reasons: rejection_reasons()
        }

  defstruct [:expand, :rejection_reasons]

  @typedoc """
  * `card_logo` - The reason(s) the card logo was rejected.
  * `carrier_text` - The reason(s) the carrier text was rejected.
  """
  @type rejection_reasons :: %{
          optional(:card_logo) => [String.t()] | nil,
          optional(:carrier_text) => [String.t()] | nil,
          optional(String.t()) => term()
        }
end
