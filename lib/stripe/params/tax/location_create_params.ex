# File generated from our OpenAPI spec
defmodule Stripe.Params.Tax.LocationCreateParams do
  @moduledoc "Parameters for location create."

  @typedoc """
  * `address` - The physical address of the tax location.
  * `description` - Details to identify the tax location by its venue, types of events held, or available services, such as "A spacious auditorium suitable for large concerts and events.". Max length: 5000.
  * `expand` - Specifies which fields in the response should be expanded.
  * `type` - The type of tax location. The only supported value is "performance". Possible values: `performance`.
  """
  @type t :: %__MODULE__{}

  defstruct [:address, :description, :expand, :type]
end
