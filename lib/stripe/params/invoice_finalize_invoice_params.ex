# File generated from our OpenAPI spec
defmodule Stripe.Params.InvoiceFinalizeInvoiceParams do
  @moduledoc "Parameters for invoice finalize invoice."

  @typedoc """
  * `auto_advance` - Controls whether Stripe performs [automatic collection](https://docs.stripe.com/invoicing/integration/automatic-advancement-collection) of the invoice. If `false`, the invoice's state doesn't automatically advance without an explicit action.
  * `expand` - Specifies which fields in the response should be expanded.
  """
  @type t :: %__MODULE__{}

  defstruct [:auto_advance, :expand]
end
