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
  @type t :: %__MODULE__{
          account_holder: account_holder(),
          expand: [String.t()] | nil,
          filters: filters() | nil,
          permissions: [String.t()],
          prefetch: [String.t()] | nil,
          return_url: String.t() | nil
        }

  defstruct [:account_holder, :expand, :filters, :permissions, :prefetch, :return_url]

  @typedoc """
  * `account` - The ID of the Stripe account whose accounts you will retrieve. Only available when `type` is `account`. Max length: 5000.
  * `customer` - The ID of the Stripe customer whose accounts you will retrieve. Only available when `type` is `customer`. Max length: 5000.
  * `customer_account` - The ID of Account representing a customer whose accounts you will retrieve. Only available when `type` is `customer`. Max length: 5000.
  * `type` - Type of account holder to collect accounts for. Possible values: `account`, `customer`.
  """
  @type account_holder :: %{
          optional(:account) => String.t() | nil,
          optional(:customer) => String.t() | nil,
          optional(:customer_account) => String.t() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `account_subcategories` - Restricts the Session to subcategories of accounts that can be linked. Valid subcategories are: `checking`, `savings`, `mortgage`, `line_of_credit`, `credit_card`.
  * `countries` - List of countries from which to collect accounts.
  """
  @type filters :: %{
          optional(:account_subcategories) => [String.t()] | nil,
          optional(:countries) => [String.t()] | nil,
          optional(String.t()) => term()
        }
end
