# File generated from our OpenAPI spec
defmodule Stripe.Params.SourceUpdateParams do
  @moduledoc "Parameters for source update."

  @typedoc """
  * `amount` - Amount associated with the source.
  * `expand` - Specifies which fields in the response should be expanded.
  * `mandate` - Information about a mandate possibility attached to a source object (generally for bank debits) as well as its acceptance status.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `owner` - Information about the owner of the payment instrument that may be used or required by particular source types.
  * `source_order` - Information about the items and shipping associated with the source. Required for transactional credit (for example Klarna) sources before you can charge it.
  """
  @type t :: %__MODULE__{}

  defstruct [:amount, :expand, :mandate, :metadata, :owner, :source_order]
end
