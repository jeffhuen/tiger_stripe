# File generated from our OpenAPI spec
defmodule Stripe.Params.InvoiceUpdateLinesParams do
  @moduledoc "Parameters for invoice update lines."

  @typedoc """
  * `expand` - Specifies which fields in the response should be expanded.
  * `invoice_metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`. For [type=subscription](https://docs.stripe.com/api/invoices/line_item#invoice_line_item_object-type) line items, the incoming metadata specified on the request is directly used to set this value, in contrast to [type=invoiceitem](https://docs.stripe.com/api/invoices/line_item#invoice_line_item_object-type) line items, where any existing metadata on the invoice line is merged with the incoming data.
  * `lines` - The line items to update.
  """
  @type t :: %__MODULE__{}

  defstruct [:expand, :invoice_metadata, :lines]
end
