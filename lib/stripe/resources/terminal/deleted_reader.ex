# File generated from our OpenAPI spec
defmodule Stripe.Resources.Terminal.DeletedReader do
  @moduledoc """
  TerminalReaderDeletedReader
  """

  @typedoc """
  * `deleted` - Always true for a deleted object Possible values: `true`.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `terminal.reader`.
  """
  @type t :: %__MODULE__{
          deleted: boolean(),
          id: String.t(),
          object: String.t()
        }

  defstruct [:deleted, :id, :object]

  @object_name "deleted_terminal.reader"
  def object_name, do: @object_name
end
