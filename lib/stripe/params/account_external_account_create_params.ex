# File generated from our OpenAPI spec
defmodule Stripe.Params.AccountExternalAccountCreateParams do
  @moduledoc "Parameters for account external account create."

  @typedoc """
  * `default_for_currency` - When set to true, or if this is the first external account added in this currency, this account becomes the default external account for its currency.
  * `expand` - Specifies which fields in the response should be expanded.
  * `external_account` - A token, like the ones returned by [Stripe.js](https://docs.stripe.com/js) or a dictionary containing a user's external account details (with the options shown below). Please refer to full [documentation](https://stripe.com/docs/api/external_accounts) instead. Max length: 5000.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  """
  @type t :: %__MODULE__{}

  defstruct [:default_for_currency, :expand, :external_account, :metadata]
end
