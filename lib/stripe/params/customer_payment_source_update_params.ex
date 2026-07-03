# File generated from our OpenAPI spec
defmodule Stripe.Params.CustomerPaymentSourceUpdateParams do
  @moduledoc "Parameters for customer payment source update."

  @typedoc """
  * `account_holder_name` - The name of the person or business that owns the bank account. Max length: 5000.
  * `account_holder_type` - The type of entity that holds the account. This can be either `individual` or `company`. Possible values: `company`, `individual`. Max length: 5000.
  * `address_city` - City/District/Suburb/Town/Village. Max length: 5000.
  * `address_country` - Billing address country, if provided when creating card. Max length: 5000.
  * `address_line1` - Address line 1 (Street address/PO Box/Company name). Max length: 5000.
  * `address_line2` - Address line 2 (Apartment/Suite/Unit/Building). Max length: 5000.
  * `address_state` - State/County/Province/Region. Max length: 5000.
  * `address_zip` - ZIP or postal code. Max length: 5000.
  * `exp_month` - Two digit number representing the card’s expiration month. Max length: 5000.
  * `exp_year` - Four digit number representing the card’s expiration year. Max length: 5000.
  * `expand` - Specifies which fields in the response should be expanded.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `name` - Cardholder name. Max length: 5000.
  * `owner`
  """
  @type t :: %__MODULE__{}

  defstruct [
    :account_holder_name,
    :account_holder_type,
    :address_city,
    :address_country,
    :address_line1,
    :address_line2,
    :address_state,
    :address_zip,
    :exp_month,
    :exp_year,
    :expand,
    :metadata,
    :name,
    :owner
  ]
end
