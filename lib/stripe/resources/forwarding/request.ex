# File generated from our OpenAPI spec
defmodule Stripe.Resources.Forwarding.Request do
  @moduledoc """
  ForwardingRequest

  Instructs Stripe to make a request on your behalf using the destination URL. The destination URL
  is activated by Stripe at the time of onboarding. Stripe verifies requests with your credentials
  provided during onboarding, and injects card details from the payment_method into the request.

  Stripe redacts all sensitive fields and headers, including authentication credentials and card numbers,
  before storing the request and response data in the forwarding Request object, which are subject to a
  30-day retention period.

  You can provide a Stripe idempotency key to make sure that requests with the same key result in only one
  outbound request. The Stripe idempotency key provided should be unique and different from any idempotency
  keys provided on the underlying third-party request.

  Forwarding Requests are synchronous requests that return a response or time out according to
  Stripe’s limits.

  Related guide: [Forward card details to third-party API endpoints](https://docs.stripe.com/payments/forwarding).
  """

  @typedoc """
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Nullable.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `forwarding.request`.
  * `payment_method` - The PaymentMethod to insert into the forwarded request. Forwarding previously consumed PaymentMethods is allowed. Max length: 5000.
  * `replacements` - The field kinds to be replaced in the forwarded request.
  * `request_context` - Context about the request from Stripe's servers to the destination endpoint. Nullable. Expandable.
  * `request_details` - The request that was sent to the destination endpoint. We redact any sensitive fields. Nullable. Expandable.
  * `response_details` - The response that the destination endpoint returned to us. We redact any sensitive fields. Nullable. Expandable.
  * `url` - The destination URL for the forwarded request. Must be supported by the config. Max length: 5000. Nullable.
  """
  @type t :: %__MODULE__{
          created: integer(),
          id: String.t(),
          livemode: boolean(),
          metadata: %{String.t() => String.t()} | nil,
          object: String.t(),
          payment_method: String.t(),
          replacements: [String.t()],
          request_context: request_context(),
          request_details: request_details(),
          response_details: response_details(),
          url: String.t()
        }

  defstruct [
    :created,
    :id,
    :livemode,
    :metadata,
    :object,
    :payment_method,
    :replacements,
    :request_context,
    :request_details,
    :response_details,
    :url
  ]

  @object_name "forwarding.request"
  def object_name, do: @object_name

  def expandable_fields, do: ["request_context", "request_details", "response_details"]

  @typedoc """
  * `destination_duration` - The time it took in milliseconds for the destination endpoint to respond.
  * `destination_ip_address` - The IP address of the destination. Max length: 5000.
  """
  @type request_context :: %{
          optional(:destination_duration) => integer() | nil,
          optional(:destination_ip_address) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `body` - The body payload to send to the destination endpoint. Max length: 5000.
  * `headers` - The headers to include in the forwarded request. Can be omitted if no additional headers (excluding Stripe-generated ones such as the Content-Type header) should be included.
  * `http_method` - The HTTP method used to call the destination endpoint. Possible values: `POST`.
  """
  @type request_details :: %{
          optional(:body) => String.t() | nil,
          optional(:headers) => [request_details_headers()] | nil,
          optional(:http_method) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `name` - The header name. Max length: 5000.
  * `value` - The header value. Max length: 5000.
  """
  @type request_details_headers :: %{
          optional(:name) => String.t() | nil,
          optional(:value) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `body` - The response body from the destination endpoint to Stripe. Max length: 5000.
  * `headers` - HTTP headers that the destination endpoint returned.
  * `status` - The HTTP status code that the destination endpoint returned.
  """
  @type response_details :: %{
          optional(:body) => String.t() | nil,
          optional(:headers) => [response_details_headers()] | nil,
          optional(:status) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `name` - The header name. Max length: 5000.
  * `value` - The header value. Max length: 5000.
  """
  @type response_details_headers :: %{
          optional(:name) => String.t() | nil,
          optional(:value) => String.t() | nil,
          optional(String.t()) => term()
        }

  def __nested_fields__ do
    %{
      "request_context" => %{
        fields: %{
          "destination_duration" => :scalar,
          "destination_ip_address" => :scalar
        }
      },
      "request_details" => %{
        fields: %{
          "body" => :scalar,
          "headers" =>
            {:list,
             %{
               fields: %{
                 "name" => :scalar,
                 "value" => :scalar
               }
             }},
          "http_method" => :scalar
        }
      },
      "response_details" => %{
        fields: %{
          "body" => :scalar,
          "headers" =>
            {:list,
             %{
               fields: %{
                 "name" => :scalar,
                 "value" => :scalar
               }
             }},
          "status" => :scalar
        }
      }
    }
  end
end
