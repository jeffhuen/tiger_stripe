# File generated from our OpenAPI spec
defmodule Stripe.Params.InvoicePaymentListParams do
  @moduledoc "Parameters for invoice payment list."

  @typedoc """
  * `created` - Only return invoice payments that were created during the given date interval.
  * `ending_before` - A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. Max length: 5000.
  * `expand` - Specifies which fields in the response should be expanded.
  * `invoice` - The identifier of the invoice whose payments to return. Max length: 5000.
  * `limit` - A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
  * `payment` - The payment details of the invoice payments to return.
  * `starting_after` - A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. Max length: 5000.
  * `status` - The status of the invoice payments to return. Possible values: `canceled`, `open`, `paid`.
  """
  @type t :: %__MODULE__{
          created: map() | nil,
          ending_before: String.t() | nil,
          expand: [String.t()] | nil,
          invoice: String.t() | nil,
          limit: integer() | nil,
          payment: payment() | nil,
          starting_after: String.t() | nil,
          status: String.t() | nil
        }

  defstruct [
    :created,
    :ending_before,
    :expand,
    :invoice,
    :limit,
    :payment,
    :starting_after,
    :status
  ]

  @typedoc """
  * `payment_intent` - Only return invoice payments associated by this payment intent ID. Max length: 5000.
  * `payment_record` - Only return invoice payments associated by this payment record ID. Max length: 5000.
  * `type` - Only return invoice payments associated by this payment type. Possible values: `payment_intent`, `payment_record`.
  """
  @type payment :: %{
          optional(:payment_intent) => String.t() | nil,
          optional(:payment_record) => String.t() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }
end
