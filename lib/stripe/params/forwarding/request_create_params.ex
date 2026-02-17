# File generated from our OpenAPI spec
defmodule Stripe.Params.Forwarding.RequestCreateParams do
  @moduledoc "Parameters for request create."

  @typedoc """
  * `expand` - Specifies which fields in the response should be expanded.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `payment_method` - The PaymentMethod to insert into the forwarded request. Forwarding previously consumed PaymentMethods is allowed. Max length: 5000.
  * `replacements` - The field kinds to be replaced in the forwarded request.
  * `request` - The request body and headers to be sent to the destination endpoint.
  * `url` - The destination URL for the forwarded request. Must be supported by the config. Max length: 5000.
  """
  @type t :: %__MODULE__{
          expand: [String.t()] | nil,
          metadata: %{String.t() => String.t()} | nil,
          payment_method: String.t(),
          replacements: [String.t()],
          request: __MODULE__.Request.t() | nil,
          url: String.t()
        }

  defstruct [:expand, :metadata, :payment_method, :replacements, :request, :url]

  defmodule Request do
    @moduledoc "Nested parameters."

    @typedoc """
    * `body` - The body payload to send to the destination endpoint. Max length: 5000.
    * `headers` - The headers to include in the forwarded request. Can be omitted if no additional headers (excluding Stripe-generated ones such as the Content-Type header) should be included.
    """
    @type t :: %__MODULE__{
            body: String.t() | nil,
            headers: [__MODULE__.Headers.t()] | nil
          }
    defstruct [:body, :headers]

    defmodule Headers do
      @moduledoc "Nested parameters."

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
  end
end
