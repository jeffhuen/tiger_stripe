# File generated from our OpenAPI spec
defmodule Stripe.Resources.Wechat do
  @moduledoc """
  Wechat resource.
  """

  @typedoc """
  * `prepay_id`
  * `qr_code_url` - Nullable.
  * `statement_descriptor`
  """
  @type t :: %__MODULE__{}

  defstruct [:prepay_id, :qr_code_url, :statement_descriptor]

  @object_name "source_type_wechat"
  def object_name, do: @object_name
end
