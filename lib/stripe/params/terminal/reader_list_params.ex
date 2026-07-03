# File generated from our OpenAPI spec
defmodule Stripe.Params.Terminal.ReaderListParams do
  @moduledoc "Parameters for reader list."

  @typedoc """
  * `device_type` - Filters readers by device type Possible values: `bbpos_chipper2x`, `bbpos_wisepad3`, `bbpos_wisepos_e`, `mobile_phone_reader`, `simulated_stripe_s700`, `simulated_stripe_s710`, `simulated_verifone_m425`, `simulated_verifone_p630`, `simulated_verifone_ux700`, `simulated_verifone_v660p`, `simulated_wisepos_e`, `stripe_m2`, `stripe_s700`, `stripe_s710`, `verifone_P400`, `verifone_m425`, `verifone_p630`, `verifone_ux700`, `verifone_v660p`.
  * `ending_before` - A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. Max length: 5000.
  * `expand` - Specifies which fields in the response should be expanded.
  * `limit` - A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
  * `location` - A location ID to filter the response list to only readers at the specific location Max length: 5000.
  * `serial_number` - Filters readers by serial number Max length: 5000.
  * `starting_after` - A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. Max length: 5000.
  * `status` - A status filter to filter readers to only offline or online readers Possible values: `offline`, `online`.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :device_type,
    :ending_before,
    :expand,
    :limit,
    :location,
    :serial_number,
    :starting_after,
    :status
  ]
end
