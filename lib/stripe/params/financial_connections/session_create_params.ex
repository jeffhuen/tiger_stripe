# File generated from our OpenAPI spec
defmodule Stripe.Params.FinancialConnections.SessionCreateParams do
  @moduledoc "Parameters for session create."

  @typedoc """
  * `account_holder` - The account holder to link accounts for.
  * `expand` - Specifies which fields in the response should be expanded.
  * `filters` - Filters to restrict the kinds of accounts to collect.
  * `permissions` - List of data features that you would like to request access to.

  Possible values are `balances`, `transactions`, `ownership`, and `payment_method`.
  * `prefetch` - List of data features that you would like to retrieve upon account creation.
  * `return_url` - For webview integrations only. Upon completing OAuth login in the native browser, the user will be redirected to this URL to return to your app. Max length: 5000.
  """
  @type t :: %__MODULE__{}

  defstruct [:account_holder, :expand, :filters, :permissions, :prefetch, :return_url]
end
