# File generated from our OpenAPI spec
defmodule Stripe.Params.Forwarding.RequestCreateParams do
  @moduledoc "Parameters for request create."

  @typedoc """
  * `expand` - Specifies which fields in the response should be expanded.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `payment_method` - The PaymentMethod to insert into the forwarded request. Forwarding previously consumed PaymentMethods is allowed. Max length: 5000.
  * `replacements` - The field kinds to be replaced in the forwarded request.
  * `request` - The request body and headers to be sent to the destination endpoint.
  * `url` - The destination URL for the forwarded request. Must be supported by the config. Max length: 5000.
  """
  @type t :: %__MODULE__{}

  defstruct [:expand, :metadata, :payment_method, :replacements, :request, :url]
end
