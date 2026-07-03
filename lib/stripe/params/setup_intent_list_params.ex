# File generated from our OpenAPI spec
defmodule Stripe.Params.SetupIntentListParams do
  @moduledoc "Parameters for setup intent list."

  @typedoc """
  * `attach_to_self` - If present, the SetupIntent's payment method will be attached to the in-context Stripe Account.

  It can only be used for this Stripe Account’s own money movement flows like InboundTransfer and OutboundTransfers. It cannot be set to true when setting up a PaymentMethod for a Customer, and defaults to false when attaching a PaymentMethod to a Customer.
  * `created` - A filter on the list, based on the object `created` field. The value can be a string with an integer Unix timestamp, or it can be a dictionary with a number of different query options.
  * `customer` - Only return SetupIntents for the customer specified by this customer ID. Max length: 5000.
  * `customer_account` - Only return SetupIntents for the account specified by this customer ID. Max length: 5000.
  * `ending_before` - A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. Max length: 5000.
  * `expand` - Specifies which fields in the response should be expanded.
  * `limit` - A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
  * `payment_method` - Only return SetupIntents that associate with the specified payment method. Max length: 5000.
  * `starting_after` - A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. Max length: 5000.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :attach_to_self,
    :created,
    :customer,
    :customer_account,
    :ending_before,
    :expand,
    :limit,
    :payment_method,
    :starting_after
  ]
end
