# File generated from our OpenAPI spec
defmodule Stripe.Params.SourceCreateParams do
  @moduledoc "Parameters for source create."

  @typedoc """
  * `amount` - Amount associated with the source. This is the amount for which the source will be chargeable once ready. Required for `single_use` sources. Not supported for `receiver` type sources, where charge amount may not be specified until funds land.
  * `currency` - Three-letter [ISO code for the currency](https://stripe.com/docs/currencies) associated with the source. This is the currency for which the source will be chargeable once ready. Format: ISO 4217 currency code.
  * `customer` - The `Customer` to whom the original source is attached to. Must be set when the original source is not a `Source` (e.g., `Card`). Max length: 500.
  * `expand` - Specifies which fields in the response should be expanded.
  * `flow` - The authentication `flow` of the source to create. `flow` is one of `redirect`, `receiver`, `code_verification`, `none`. It is generally inferred unless a type supports multiple flows. Possible values: `code_verification`, `none`, `receiver`, `redirect`. Max length: 5000.
  * `mandate` - Information about a mandate possibility attached to a source object (generally for bank debits) as well as its acceptance status.
  * `metadata`
  * `original_source` - The source to share. Max length: 5000.
  * `owner` - Information about the owner of the payment instrument that may be used or required by particular source types.
  * `receiver` - Optional parameters for the receiver flow. Can be set only if the source is a receiver (`flow` is `receiver`).
  * `redirect` - Parameters required for the redirect flow. Required if the source is authenticated by a redirect (`flow` is `redirect`).
  * `source_order` - Information about the items and shipping associated with the source. Required for transactional credit (for example Klarna) sources before you can charge it.
  * `statement_descriptor` - An arbitrary string to be displayed on your customer's statement. As an example, if your website is `RunClub` and the item you're charging for is a race ticket, you may want to specify a `statement_descriptor` of `RunClub 5K race ticket.` While many payment types will display this information, some may not display it at all. Max length: 5000.
  * `token` - An optional token used to create the source. When passed, token properties will override source parameters. Max length: 5000.
  * `type` - The `type` of the source to create. Required unless `customer` and `original_source` are specified (see the [Cloning card Sources](https://docs.stripe.com/sources/connect#cloning-card-sources) guide) Max length: 5000.
  * `usage` - Possible values: `reusable`, `single_use`. Max length: 5000.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :amount,
    :currency,
    :customer,
    :expand,
    :flow,
    :mandate,
    :metadata,
    :original_source,
    :owner,
    :receiver,
    :redirect,
    :source_order,
    :statement_descriptor,
    :token,
    :type,
    :usage
  ]
end
