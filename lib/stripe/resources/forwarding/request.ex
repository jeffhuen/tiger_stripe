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
          request_context: __MODULE__.RequestContext.t(),
          request_details: __MODULE__.RequestDetails.t(),
          response_details: __MODULE__.ResponseDetails.t(),
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

  defmodule RequestContext do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `destination_duration` - The time it took in milliseconds for the destination endpoint to respond.
    * `destination_ip_address` - The IP address of the destination. Max length: 5000.
    """
    @type t :: %__MODULE__{
            destination_duration: integer() | nil,
            destination_ip_address: String.t() | nil
          }
    defstruct [:destination_duration, :destination_ip_address]
  end

  defmodule RequestDetails do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `body` - The body payload to send to the destination endpoint. Max length: 5000.
    * `headers` - The headers to include in the forwarded request. Can be omitted if no additional headers (excluding Stripe-generated ones such as the Content-Type header) should be included.
    * `http_method` - The HTTP method used to call the destination endpoint. Possible values: `POST`.
    """
    @type t :: %__MODULE__{
            body: String.t() | nil,
            headers: [__MODULE__.Headers.t()] | nil,
            http_method: String.t() | nil
          }
    defstruct [:body, :headers, :http_method]

    defmodule Headers do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `name` - The header name. Max length: 5000.
      * `value` - The header value. Max length: 5000.
      """
      @type t :: %__MODULE__{
              name: String.t() | nil,
              value: String.t() | nil
            }
      defstruct [:name, :value]
    end

    def __inner_types__ do
      %{
        "headers" => __MODULE__.Headers
      }
    end
  end

  defmodule ResponseDetails do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `body` - The response body from the destination endpoint to Stripe. Max length: 5000.
    * `headers` - HTTP headers that the destination endpoint returned.
    * `status` - The HTTP status code that the destination endpoint returned.
    """
    @type t :: %__MODULE__{
            body: String.t() | nil,
            headers: [__MODULE__.Headers.t()] | nil,
            status: integer() | nil
          }
    defstruct [:body, :headers, :status]

    defmodule Headers do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `name` - The header name. Max length: 5000.
      * `value` - The header value. Max length: 5000.
      """
      @type t :: %__MODULE__{
              name: String.t() | nil,
              value: String.t() | nil
            }
      defstruct [:name, :value]
    end

    def __inner_types__ do
      %{
        "headers" => __MODULE__.Headers
      }
    end
  end

  def __inner_types__ do
    %{
      "request_context" => __MODULE__.RequestContext,
      "request_details" => __MODULE__.RequestDetails,
      "response_details" => __MODULE__.ResponseDetails
    }
  end
end
