# File generated from our OpenAPI spec
defmodule Stripe.Params.Issuing.CardCreateParams do
  @moduledoc "Parameters for card create."

  @typedoc """
  * `cardholder` - The [Cardholder](https://docs.stripe.com/api#issuing_cardholder_object) object with which the card will be associated. Max length: 5000.
  * `currency` - The currency for the card.
  * `exp_month` - The desired expiration month (1-12) for this card if [specifying a custom expiration date](https://stripe.com/issuing/cards/virtual/issue-cards?testing-method=with-code#exp-dates).
  * `exp_year` - The desired 4-digit expiration year for this card if [specifying a custom expiration date](https://stripe.com/issuing/cards/virtual/issue-cards?testing-method=with-code#exp-dates).
  * `expand` - Specifies which fields in the response should be expanded.
  * `financial_account` - The new financial account ID the card will be associated with. This field allows a card to be reassigned to a different financial account.
  * `lifecycle_controls` - Rules that control the lifecycle of this card, such as automatic cancellation. Refer to our [documentation](https://stripe.com/issuing/controls/lifecycle-controls) for more details.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `personalization_design` - The personalization design object belonging to this card. Max length: 5000.
  * `pin` - The desired PIN for this card.
  * `replacement_for` - The card this is meant to be a replacement for (if any). Max length: 5000.
  * `replacement_reason` - If `replacement_for` is specified, this should indicate why that card is being replaced. Possible values: `damaged`, `expired`, `lost`, `stolen`.
  * `second_line` - The second line to print on the card. Max length: 24 characters.
  * `shipping` - The address where the card will be shipped.
  * `spending_controls` - Rules that control spending for this card. Refer to our [documentation](https://docs.stripe.com/issuing/controls/spending-controls) for more details.
  * `status` - Whether authorizations can be approved on this card. May be blocked from activating cards depending on past-due Cardholder requirements. Defaults to `inactive`. Possible values: `active`, `inactive`.
  * `type` - The type of card to issue. Possible values are `physical` or `virtual`. Possible values: `physical`, `virtual`.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :cardholder,
    :currency,
    :exp_month,
    :exp_year,
    :expand,
    :financial_account,
    :lifecycle_controls,
    :metadata,
    :personalization_design,
    :pin,
    :replacement_for,
    :replacement_reason,
    :second_line,
    :shipping,
    :spending_controls,
    :status,
    :type
  ]
end
