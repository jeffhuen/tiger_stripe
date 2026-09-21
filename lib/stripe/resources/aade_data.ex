# File generated from our OpenAPI spec
defmodule Stripe.Resources.AadeData do
  @moduledoc """
  payment_method_options_card_present_aade_data
  """

  @typedoc """
  * `mark_data` - The canonical string that was signed by the e-invoicing provider to produce `signed_mark`, formatted per Appendix A of A.1155/2023. Required when `mode` is `standard`. Max length: 5000.
  * `mode` - The e-invoicing mode under which the mark was generated. Possible values: `autonomous`, `standard`.
  * `provider_id` - The AADE-assigned approval number of the e-invoicing provider that generated the mark. Required when `mode` is `standard`.
  * `signed_mark` - The cryptographic signature returned by the e-invoicing provider for this transaction, hex-encoded. Required when `mode` is `standard`. Max length: 5000.
  * `unbound_pos` - The reason for entering autonomous mode. Required when `mode` is `autonomous`. Possible values: `interconnection_loss`, `lock`, `replacement_cash_system`.
  """
  @type t :: %__MODULE__{}

  defstruct [:mark_data, :mode, :provider_id, :signed_mark, :unbound_pos]

  @object_name "payment_method_options_card_present_aade_data"
  def object_name, do: @object_name
end
