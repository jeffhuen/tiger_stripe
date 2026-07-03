# File generated from our OpenAPI spec
defmodule Stripe.Params.TokenCreateParams do
  @moduledoc "Parameters for token create."

  @typedoc """
  * `account` - Information for the account this token represents.
  * `bank_account` - The bank account this token will represent.
  * `card` - The card this token will represent. If you also pass in a customer, the card must be the ID of a card belonging to the customer. Otherwise, if you do not pass in a customer, this is a dictionary containing a user's credit card details, with the options described below.
  * `customer` - Create a token for the customer, which is owned by the application's account. You can only use this with an [OAuth access token](https://docs.stripe.com/connect/standard-accounts) or [Stripe-Account header](https://docs.stripe.com/connect/authentication). Learn more about [cloning saved payment methods](https://docs.stripe.com/connect/cloning-saved-payment-methods). Max length: 5000.
  * `cvc_update` - The updated CVC value this token represents.
  * `expand` - Specifies which fields in the response should be expanded.
  * `person` - Information for the person this token represents.
  * `pii` - The PII this token represents.
  """
  @type t :: %__MODULE__{}

  defstruct [:account, :bank_account, :card, :customer, :cvc_update, :expand, :person, :pii]
end
