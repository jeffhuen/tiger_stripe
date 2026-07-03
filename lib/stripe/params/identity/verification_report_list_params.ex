# File generated from our OpenAPI spec
defmodule Stripe.Params.Identity.VerificationReportListParams do
  @moduledoc "Parameters for verification report list."

  @typedoc """
  * `client_reference_id` - A string to reference this user. This can be a customer ID, a session ID, or similar, and can be used to reconcile this verification with your internal systems. Max length: 5000.
  * `created` - Only return VerificationReports that were created during the given date interval.
  * `ending_before` - A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. Max length: 5000.
  * `expand` - Specifies which fields in the response should be expanded.
  * `limit` - A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
  * `starting_after` - A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. Max length: 5000.
  * `type` - Only return VerificationReports of this type Possible values: `document`, `id_number`.
  * `verification_session` - Only return VerificationReports created by this VerificationSession ID. It is allowed to provide a VerificationIntent ID. Max length: 5000.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :client_reference_id,
    :created,
    :ending_before,
    :expand,
    :limit,
    :starting_after,
    :type,
    :verification_session
  ]
end
