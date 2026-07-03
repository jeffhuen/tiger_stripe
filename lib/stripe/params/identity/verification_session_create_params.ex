# File generated from our OpenAPI spec
defmodule Stripe.Params.Identity.VerificationSessionCreateParams do
  @moduledoc "Parameters for verification session create."

  @typedoc """
  * `client_reference_id` - A string to reference this user. This can be a customer ID, a session ID, or similar, and can be used to reconcile this verification with your internal systems. Max length: 5000.
  * `expand` - Specifies which fields in the response should be expanded.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `options` - A set of options for the session’s verification checks.
  * `provided_details` - Details provided about the user being verified. These details might be shown to the user.
  * `related_customer` - Customer ID Max length: 5000.
  * `related_customer_account` - The ID of the Account representing a customer. Max length: 5000.
  * `related_person` - Tokens referencing a Person resource and its associated account.
  * `return_url` - The URL that the user will be redirected to upon completing the verification flow.
  * `type` - The type of [verification check](https://docs.stripe.com/identity/verification-checks) to be performed. You must provide a `type` if not passing `verification_flow`. Possible values: `document`, `id_number`.
  * `verification_flow` - The ID of a verification flow from the Dashboard. See https://docs.stripe.com/identity/verification-flows. Max length: 5000.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :client_reference_id,
    :expand,
    :metadata,
    :options,
    :provided_details,
    :related_customer,
    :related_customer_account,
    :related_person,
    :return_url,
    :type,
    :verification_flow
  ]
end
