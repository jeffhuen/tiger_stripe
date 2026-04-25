# File generated from our OpenAPI spec
defmodule Stripe.Resources.InvoiceRenderingTemplate do
  @moduledoc """
  InvoiceRenderingTemplate

  Invoice Rendering Templates are used to configure how invoices are rendered on surfaces like the PDF. Invoice Rendering Templates
  can be created from within the Dashboard, and they can be used over the API when creating invoices.
  """

  @typedoc """
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Nullable.
  * `nickname` - A brief description of the template, hidden from customers Max length: 5000. Nullable.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `invoice_rendering_template`.
  * `status` - The status of the template, one of `active` or `archived`. Possible values: `active`, `archived`.
  * `version` - Version of this template; version increases by one when an update on the template changes any field that controls invoice rendering
  """
  @type t :: %__MODULE__{
          created: integer(),
          id: String.t(),
          livemode: boolean(),
          metadata: %{String.t() => String.t()},
          nickname: String.t(),
          object: String.t(),
          status: String.t(),
          version: integer()
        }

  defstruct [:created, :id, :livemode, :metadata, :nickname, :object, :status, :version]

  @object_name "invoice_rendering_template"
  def object_name, do: @object_name
end
