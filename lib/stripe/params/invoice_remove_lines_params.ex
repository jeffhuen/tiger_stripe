# File generated from our OpenAPI spec
defmodule Stripe.Params.InvoiceRemoveLinesParams do
  @moduledoc "Parameters for invoice remove lines."

  @typedoc """
  * `expand` - Specifies which fields in the response should be expanded.
  * `invoice_metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `lines` - The line items to remove.
  """
  @type t :: %__MODULE__{}

  defstruct [:expand, :invoice_metadata, :lines]
end
