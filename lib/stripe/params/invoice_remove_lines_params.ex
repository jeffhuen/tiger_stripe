# File generated from our OpenAPI spec
defmodule Stripe.Params.InvoiceRemoveLinesParams do
  @moduledoc "Parameters for invoice remove lines."

  @typedoc """
  * `expand` - Specifies which fields in the response should be expanded.
  * `invoice_metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `lines` - The line items to remove.
  """
  @type t :: %__MODULE__{
          expand: [String.t()] | nil,
          invoice_metadata: map() | nil,
          lines: [lines()]
        }

  defstruct [:expand, :invoice_metadata, :lines]

  @typedoc """
  * `behavior` - Either `delete` or `unassign`. Deleted line items are permanently deleted. Unassigned line items can be reassigned to an invoice. Possible values: `delete`, `unassign`.
  * `id` - ID of an existing line item to remove from this invoice. Max length: 5000.
  """
  @type lines :: %{
          optional(:behavior) => String.t() | nil,
          optional(:id) => String.t() | nil,
          optional(String.t()) => term()
        }
end
