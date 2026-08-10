# File generated from our OpenAPI spec
defmodule Stripe.Resources.FinancialConnections.Session do
  @moduledoc """
  BankConnectionsResourceLinkAccountSession

  A Financial Connections Session is the secure way to programmatically launch the client-side Stripe.js modal that lets your users link their accounts.
  """

  @typedoc """
  * `account_holder` - The account holder for whom accounts are collected in this session. Nullable. Expandable.
  * `accounts` - The accounts that were collected as part of this Session. Expandable.
  * `bank_account_token` - Expandable.
  * `client_secret` - A value that will be passed to the client to launch the authentication flow. Max length: 5000. Nullable.
  * `filters` - Expandable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `limits` - Expandable.
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `manual_entry` - Expandable.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `financial_connections.session`.
  * `permissions` - Permissions requested for accounts collected during this session.
  * `prefetch` - Data features requested to be retrieved upon account creation. Nullable.
  * `return_url` - For webview integrations only. Upon completing OAuth login in the native browser, the user will be redirected to this URL to return to your app. Max length: 5000.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :account_holder,
    :accounts,
    :bank_account_token,
    :client_secret,
    :filters,
    :id,
    :limits,
    :livemode,
    :manual_entry,
    :object,
    :permissions,
    :prefetch,
    :return_url
  ]

  @object_name "financial_connections.session"
  def object_name, do: @object_name

  def expandable_fields,
    do: ["account_holder", "accounts", "bank_account_token", "filters", "limits", "manual_entry"]

  def __nested_fields__ do
    %{
      "account_holder" => %{
        fields: %{
          "account" => {:resource, Stripe.Resources.Account},
          "customer" => {:resource, Stripe.Resources.Customer},
          "customer_account" => :scalar,
          "type" => :scalar
        }
      },
      "accounts" => %{
        fields: %{
          "data" => {:list, {:resource, Stripe.Resources.FinancialConnections.Account}},
          "has_more" => :scalar,
          "object" => :scalar,
          "url" => :scalar
        }
      },
      "filters" => %{
        fields: %{
          "account_subcategories" => {:list, :scalar},
          "countries" => {:list, :scalar},
          "require_payment_method_support" => :scalar
        }
      },
      "limits" => %{
        fields: %{
          "accounts" => :scalar
        }
      },
      "manual_entry" => %{
        fields: %{
          "mode" => :scalar
        }
      },
      "bank_account_token" => {:resource, Stripe.Resources.Token}
    }
  end
end
