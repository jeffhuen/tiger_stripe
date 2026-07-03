# File generated from our OpenAPI spec
defmodule Stripe.Params.Radar.PaymentEvaluationCreateParams do
  @moduledoc "Parameters for payment evaluation create."

  @typedoc """
  * `client_device_metadata_details` - Details about the Client Device Metadata to associate with the payment evaluation.
  * `customer_details` - Details about the customer associated with the payment evaluation.
  * `expand` - Specifies which fields in the response should be expanded.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `payment_details` - Details about the payment.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :client_device_metadata_details,
    :customer_details,
    :expand,
    :metadata,
    :payment_details
  ]
end
