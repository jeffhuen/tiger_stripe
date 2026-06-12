# File generated from our OpenAPI spec
defmodule Stripe.Resources.FinancialConnections.Account do
  @moduledoc """
  BankConnectionsResourceLinkedAccount

  A Financial Connections Account represents an account that exists outside of Stripe, to which you have been granted some degree of access.
  """

  @typedoc """
  * `account_holder` - The account holder that this account belongs to. Nullable. Expandable.
  * `account_numbers` - Details about the account numbers. Nullable. Expandable.
  * `balance` - The most recent information about the account's balance. Nullable. Expandable.
  * `balance_refresh` - The state of the most recent attempt to refresh the account balance. Nullable. Expandable.
  * `category` - The type of the account. Account category is further divided in `subcategory`. Possible values: `cash`, `credit`, `investment`, `other`.
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `display_name` - A human-readable name that has been assigned to this account, either by the account holder or by the institution. Max length: 5000. Nullable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `institution_name` - The name of the institution that holds this account. Max length: 5000.
  * `last4` - The last 4 digits of the account number. If present, this will be 4 numeric characters. Max length: 5000. Nullable.
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `financial_connections.account`.
  * `ownership` - The most recent information about the account's owners. Nullable. Expandable.
  * `ownership_refresh` - The state of the most recent attempt to refresh the account owners. Nullable. Expandable.
  * `permissions` - The list of permissions granted by this account. Nullable.
  * `status` - The status of the link to the account. Possible values: `active`, `disconnected`, `inactive`.
  * `subcategory` - If `category` is `cash`, one of:

  - `checking`
  - `savings`
  - `other`

  If `category` is `credit`, one of:

  - `mortgage`
  - `line_of_credit`
  - `credit_card`
  - `other`

  If `category` is `investment` or `other`, this will be `other`. Possible values: `checking`, `credit_card`, `line_of_credit`, `mortgage`, `other`, `savings`.
  * `subscriptions` - The list of data refresh subscriptions requested on this account. Nullable.
  * `supported_payment_method_types` - The [PaymentMethod type](https://docs.stripe.com/api/payment_methods/object#payment_method_object-type)(s) that can be created from this account.
  * `transaction_refresh` - The state of the most recent attempt to refresh the account transactions. Nullable. Expandable.
  """
  @type t :: %__MODULE__{
          account_holder: account_holder(),
          account_numbers: [account_numbers()],
          balance: balance(),
          balance_refresh: balance_refresh(),
          category: String.t(),
          created: integer(),
          display_name: String.t(),
          id: String.t(),
          institution_name: String.t(),
          last4: String.t(),
          livemode: boolean(),
          object: String.t(),
          ownership: String.t() | Stripe.Resources.FinancialConnections.AccountOwnership.t(),
          ownership_refresh: ownership_refresh(),
          permissions: [String.t()],
          status: String.t(),
          subcategory: String.t(),
          subscriptions: [String.t()],
          supported_payment_method_types: [String.t()],
          transaction_refresh: transaction_refresh()
        }

  defstruct [
    :account_holder,
    :account_numbers,
    :balance,
    :balance_refresh,
    :category,
    :created,
    :display_name,
    :id,
    :institution_name,
    :last4,
    :livemode,
    :object,
    :ownership,
    :ownership_refresh,
    :permissions,
    :status,
    :subcategory,
    :subscriptions,
    :supported_payment_method_types,
    :transaction_refresh
  ]

  @object_name "financial_connections.account"
  def object_name, do: @object_name

  def expandable_fields,
    do: [
      "account_holder",
      "account_numbers",
      "balance",
      "balance_refresh",
      "ownership",
      "ownership_refresh",
      "transaction_refresh"
    ]

  @typedoc """
  * `account` - The ID of the Stripe account that this account belongs to. Only available when `account_holder.type` is `account`.
  * `customer` - The ID for an Account representing a customer that this account belongs to. Only available when `account_holder.type` is `customer`.
  * `customer_account` - Max length: 5000.
  * `type` - Type of account holder that this account belongs to. Possible values: `account`, `customer`.
  """
  @type account_holder :: %{
          optional(:account) => String.t() | Stripe.Resources.Account.t() | nil,
          optional(:customer) => String.t() | Stripe.Resources.Customer.t() | nil,
          optional(:customer_account) => String.t() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `expected_expiry_date` - When the account number is expected to expire, if applicable. Format: Unix timestamp. Nullable.
  * `identifier_type` - The type of account number associated with the account. Possible values: `account_number`, `tokenized_account_number`.
  * `status` - Whether the account number is currently active and usable for transactions. Possible values: `deactivated`, `transactable`.
  * `supported_networks` - The payment networks that the account number can be used for.
  """
  @type account_numbers :: %{
          optional(:expected_expiry_date) => integer() | nil,
          optional(:identifier_type) => String.t() | nil,
          optional(:status) => String.t() | nil,
          optional(:supported_networks) => [String.t()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `as_of` - The time that the external institution calculated this balance. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `cash`
  * `credit`
  * `current` - The balances owed to (or by) the account holder, before subtracting any outbound pending transactions or adding any inbound pending transactions.

  Each key is a three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase.

  Each value is a integer amount. A positive amount indicates money owed to the account holder. A negative amount indicates money owed by the account holder.
  * `type` - The `type` of the balance. An additional hash is included on the balance with a name matching this value. Possible values: `cash`, `credit`.
  """
  @type balance :: %{
          optional(:as_of) => integer() | nil,
          optional(:cash) => balance_cash() | nil,
          optional(:credit) => balance_credit() | nil,
          optional(:current) => %{String.t() => integer()} | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `available` - The funds available to the account holder. Typically this is the current balance after subtracting any outbound pending transactions and adding any inbound pending transactions.

  Each key is a three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase.

  Each value is a integer amount. A positive amount indicates money owed to the account holder. A negative amount indicates money owed by the account holder. Nullable.
  """
  @type balance_cash :: %{
          optional(:available) => %{String.t() => integer()} | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `used` - The credit that has been used by the account holder.

  Each key is a three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase.

  Each value is a integer amount. A positive amount indicates money owed to the account holder. A negative amount indicates money owed by the account holder. Nullable.
  """
  @type balance_credit :: %{
          optional(:used) => %{String.t() => integer()} | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `last_attempted_at` - The time at which the last refresh attempt was initiated. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `next_refresh_available_at` - Time at which the next balance refresh can be initiated. This value will be `null` when `status` is `pending`. Measured in seconds since the Unix epoch. Format: Unix timestamp. Nullable.
  * `status` - The status of the last refresh attempt. Possible values: `failed`, `pending`, `succeeded`.
  """
  @type balance_refresh :: %{
          optional(:last_attempted_at) => integer() | nil,
          optional(:next_refresh_available_at) => integer() | nil,
          optional(:status) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `last_attempted_at` - The time at which the last refresh attempt was initiated. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `next_refresh_available_at` - Time at which the next ownership refresh can be initiated. This value will be `null` when `status` is `pending`. Measured in seconds since the Unix epoch. Format: Unix timestamp. Nullable.
  * `status` - The status of the last refresh attempt. Possible values: `failed`, `pending`, `succeeded`.
  """
  @type ownership_refresh :: %{
          optional(:last_attempted_at) => integer() | nil,
          optional(:next_refresh_available_at) => integer() | nil,
          optional(:status) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `id` - Unique identifier for the object. Max length: 5000.
  * `last_attempted_at` - The time at which the last refresh attempt was initiated. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `next_refresh_available_at` - Time at which the next transaction refresh can be initiated. This value will be `null` when `status` is `pending`. Measured in seconds since the Unix epoch. Format: Unix timestamp. Nullable.
  * `status` - The status of the last refresh attempt. Possible values: `failed`, `pending`, `succeeded`.
  """
  @type transaction_refresh :: %{
          optional(:id) => String.t() | nil,
          optional(:last_attempted_at) => integer() | nil,
          optional(:next_refresh_available_at) => integer() | nil,
          optional(:status) => String.t() | nil,
          optional(String.t()) => term()
        }

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
      "account_numbers" => %{
        fields: %{
          "expected_expiry_date" => :scalar,
          "identifier_type" => :scalar,
          "status" => :scalar,
          "supported_networks" => {:list, :scalar}
        }
      },
      "balance" => %{
        fields: %{
          "as_of" => :scalar,
          "cash" => %{
            fields: %{
              "available" => {:map, :scalar}
            }
          },
          "credit" => %{
            fields: %{
              "used" => {:map, :scalar}
            }
          },
          "current" => {:map, :scalar},
          "type" => :scalar
        }
      },
      "balance_refresh" => %{
        fields: %{
          "last_attempted_at" => :scalar,
          "next_refresh_available_at" => :scalar,
          "status" => :scalar
        }
      },
      "ownership_refresh" => %{
        fields: %{
          "last_attempted_at" => :scalar,
          "next_refresh_available_at" => :scalar,
          "status" => :scalar
        }
      },
      "transaction_refresh" => %{
        fields: %{
          "id" => :scalar,
          "last_attempted_at" => :scalar,
          "next_refresh_available_at" => :scalar,
          "status" => :scalar
        }
      }
    }
  end
end
