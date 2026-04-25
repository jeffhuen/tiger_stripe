# File generated from our OpenAPI spec
defmodule Stripe.Params.Terminal.ReaderListParams do
  @moduledoc "Parameters for reader list."

  @typedoc """
  * `device_type` - Filters readers by device type Possible values: `bbpos_chipper2x`, `bbpos_wisepad3`, `bbpos_wisepos_e`, `mobile_phone_reader`, `simulated_stripe_s700`, `simulated_wisepos_e`, `stripe_m2`, `stripe_s700`, `verifone_P400`.
  * `ending_before` - A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. Max length: 5000.
  * `expand` - Specifies which fields in the response should be expanded.
  * `limit` - A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
  * `location` - A location ID to filter the response list to only readers at the specific location Max length: 5000.
  * `serial_number` - Filters readers by serial number Max length: 5000.
  * `starting_after` - A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. Max length: 5000.
  * `status` - A status filter to filter readers to only offline or online readers Possible values: `offline`, `online`.
  """
  @type t :: %__MODULE__{
          device_type: String.t() | nil,
          ending_before: String.t() | nil,
          expand: [String.t()] | nil,
          limit: integer() | nil,
          location: String.t() | nil,
          serial_number: String.t() | nil,
          starting_after: String.t() | nil,
          status: String.t() | nil
        }

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
