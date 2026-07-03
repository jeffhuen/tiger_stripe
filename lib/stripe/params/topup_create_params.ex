# File generated from our OpenAPI spec
defmodule Stripe.Params.TopupCreateParams do
  @moduledoc "Parameters for topup create."

  @typedoc """
  * `amount` - A positive integer representing how much to transfer.
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
  * `description` - An arbitrary string attached to the object. Often useful for displaying to users. Max length: 5000.
  * `expand` - Specifies which fields in the response should be expanded.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `payment_method` - The ID of a PaymentMethod representing the payment method to be used for the top-up. A PaymentMethod of type `us_bank_account` can be used. Max length: 5000.
  * `payment_method_options` - Payment method-specific configuration for this top-up.
  * `source` - The ID of a source to transfer funds from. For most users, this should be left unspecified which will use the bank account that was set up in the dashboard for the specified currency. In test mode, this can be a test bank token (see [Testing Top-ups](https://docs.stripe.com/connect/testing#testing-top-ups)). Max length: 5000.
  * `statement_descriptor` - Extra information about a top-up for the source's bank statement. Limited to 15 ASCII characters. Max length: 15.
  * `transfer_group` - A string that identifies this top-up as part of a group.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :amount,
    :currency,
    :description,
    :expand,
    :metadata,
    :payment_method,
    :payment_method_options,
    :source,
    :statement_descriptor,
    :transfer_group
  ]
end
