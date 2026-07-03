# File generated from our OpenAPI spec
defmodule Stripe.Params.Issuing.CardUpdateParams do
  @moduledoc "Parameters for card update."

  @typedoc """
  * `cancellation_reason` - Reason why the `status` of this card is `canceled`. Possible values: `lost`, `stolen`.
  * `expand` - Specifies which fields in the response should be expanded.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `personalization_design` - Max length: 5000.
  * `pin` - The desired new PIN for this card.
  * `shipping` - Updated shipping information for the card.
  * `spending_controls` - Rules that control spending for this card. Refer to our [documentation](https://docs.stripe.com/issuing/controls/spending-controls) for more details.
  * `status` - Dictates whether authorizations can be approved on this card. May be blocked from activating cards depending on past-due Cardholder requirements. Defaults to `inactive`. If this card is being canceled because it was lost or stolen, this information should be provided as `cancellation_reason`. Possible values: `active`, `canceled`, `inactive`.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :cancellation_reason,
    :expand,
    :metadata,
    :personalization_design,
    :pin,
    :shipping,
    :spending_controls,
    :status
  ]
end
