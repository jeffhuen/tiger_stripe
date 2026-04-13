# File generated from our OpenAPI spec
defmodule Stripe.Resources.FinancialConnections.Session do
  @moduledoc """
  BankConnectionsResourceLinkAccountSession

  A Financial Connections Session is the secure way to programmatically launch the client-side Stripe.js modal that lets your users link their accounts.
  """

  @typedoc """
  * `account_holder` - The account holder for whom accounts are collected in this session. Nullable. Expandable.
  * `accounts` - The accounts that were collected as part of this Session. Expandable.
  * `client_secret` - A value that will be passed to the client to launch the authentication flow. Max length: 5000. Nullable.
  * `filters` - Expandable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `financial_connections.session`.
  * `permissions` - Permissions requested for accounts collected during this session.
  * `prefetch` - Data features requested to be retrieved upon account creation. Nullable.
  * `return_url` - For webview integrations only. Upon completing OAuth login in the native browser, the user will be redirected to this URL to return to your app. Max length: 5000.
  """
  @type t :: %__MODULE__{
          account_holder: __MODULE__.AccountHolder.t(),
          accounts: __MODULE__.Accounts.t(),
          client_secret: String.t(),
          filters: __MODULE__.Filters.t() | nil,
          id: String.t(),
          livemode: boolean(),
          object: String.t(),
          permissions: [String.t()],
          prefetch: [String.t()],
          return_url: String.t() | nil
        }

  defstruct [
    :account_holder,
    :accounts,
    :client_secret,
    :filters,
    :id,
    :livemode,
    :object,
    :permissions,
    :prefetch,
    :return_url
  ]

  @object_name "financial_connections.session"
  def object_name, do: @object_name

  def expandable_fields, do: ["account_holder", "accounts", "filters"]

  defmodule AccountHolder do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `account` - The ID of the Stripe account that this account belongs to. Only available when `account_holder.type` is `account`.
    * `customer` - The ID for an Account representing a customer that this account belongs to. Only available when `account_holder.type` is `customer`.
    * `customer_account` - Max length: 5000.
    * `type` - Type of account holder that this account belongs to. Possible values: `account`, `customer`.
    """
    @type t :: %__MODULE__{
            account: String.t() | Stripe.Resources.Account.t() | nil,
            customer: String.t() | Stripe.Resources.Customer.t() | nil,
            customer_account: String.t() | nil,
            type: String.t() | nil
          }
    defstruct [:account, :customer, :customer_account, :type]
  end

  defmodule Accounts do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `data` - Details about each object.
    * `has_more` - True if this list has another page of items after this one that can be fetched.
    * `object` - String representing the object's type. Objects of the same type share the same value. Always has the value `list`. Possible values: `list`.
    * `url` - The URL where this list can be accessed. Max length: 5000.
    """
    @type t :: %__MODULE__{
            data: [Stripe.Resources.FinancialConnections.Account.t()] | nil,
            has_more: boolean() | nil,
            object: String.t() | nil,
            url: String.t() | nil
          }
    defstruct [:data, :has_more, :object, :url]
  end

  defmodule Filters do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `account_subcategories` - Restricts the Session to subcategories of accounts that can be linked. Valid subcategories are: `checking`, `savings`, `mortgage`, `line_of_credit`, `credit_card`. Nullable.
    * `countries` - List of countries from which to filter accounts. Nullable.
    """
    @type t :: %__MODULE__{
            account_subcategories: [String.t()] | nil,
            countries: [String.t()] | nil
          }
    defstruct [:account_subcategories, :countries]
  end

  def __inner_types__ do
    %{
      "account_holder" => __MODULE__.AccountHolder,
      "accounts" => __MODULE__.Accounts,
      "filters" => __MODULE__.Filters
    }
  end
end
