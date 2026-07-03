# File generated from our OpenAPI spec
defmodule Stripe.Resources.Terminal.DeletedReader do
  @moduledoc """
  TerminalReaderDeletedReader
  """

  @typedoc """
  * `deleted` - Always true for a deleted object Possible values: `true`.
  * `device_type` - Device type of the reader. Possible values: `bbpos_chipper2x`, `bbpos_wisepad3`, `bbpos_wisepos_e`, `mobile_phone_reader`, `simulated_stripe_s700`, `simulated_stripe_s710`, `simulated_verifone_m425`, `simulated_verifone_p630`, `simulated_verifone_ux700`, `simulated_verifone_v660p`, `simulated_wisepos_e`, `stripe_m2`, `stripe_s700`, `stripe_s710`, `verifone_P400`, `verifone_m425`, `verifone_p630`, `verifone_ux700`, `verifone_v660p`.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `terminal.reader`.
  * `serial_number` - Serial number of the reader. Max length: 5000.
  """
  @type t :: %__MODULE__{}

  defstruct [:deleted, :device_type, :id, :object, :serial_number]

  @object_name "deleted_terminal.reader"
  def object_name, do: @object_name
end
