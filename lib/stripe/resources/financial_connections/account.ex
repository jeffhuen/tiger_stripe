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
          account_holder: __MODULE__.AccountHolder.t(),
          account_numbers: [__MODULE__.AccountNumbers.t()],
          balance: __MODULE__.Balance.t(),
          balance_refresh: __MODULE__.BalanceRefresh.t(),
          category: String.t(),
          created: integer(),
          display_name: String.t(),
          id: String.t(),
          institution_name: String.t(),
          last4: String.t(),
          livemode: boolean(),
          object: String.t(),
          ownership: String.t() | Stripe.Resources.FinancialConnections.AccountOwnership.t(),
          ownership_refresh: __MODULE__.OwnershipRefresh.t(),
          permissions: [String.t()],
          status: String.t(),
          subcategory: String.t(),
          subscriptions: [String.t()],
          supported_payment_method_types: [String.t()],
          transaction_refresh: __MODULE__.TransactionRefresh.t()
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

  defmodule AccountNumbers do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `expected_expiry_date` - When the account number is expected to expire, if applicable. Format: Unix timestamp. Nullable.
    * `identifier_type` - The type of account number associated with the account. Possible values: `account_number`, `tokenized_account_number`.
    * `status` - Whether the account number is currently active and usable for transactions. Possible values: `deactivated`, `transactable`.
    * `supported_networks` - The payment networks that the account number can be used for.
    """
    @type t :: %__MODULE__{
            expected_expiry_date: integer() | nil,
            identifier_type: String.t() | nil,
            status: String.t() | nil,
            supported_networks: [String.t()] | nil
          }
    defstruct [:expected_expiry_date, :identifier_type, :status, :supported_networks]
  end

  defmodule Balance do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `as_of` - The time that the external institution calculated this balance. Measured in seconds since the Unix epoch. Format: Unix timestamp.
    * `cash`
    * `credit`
    * `current` - The balances owed to (or by) the account holder, before subtracting any outbound pending transactions or adding any inbound pending transactions.

    Each key is a three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase.

    Each value is a integer amount. A positive amount indicates money owed to the account holder. A negative amount indicates money owed by the account holder.
    * `type` - The `type` of the balance. An additional hash is included on the balance with a name matching this value. Possible values: `cash`, `credit`.
    """
    @type t :: %__MODULE__{
            as_of: integer() | nil,
            cash: __MODULE__.Cash.t() | nil,
            credit: __MODULE__.Credit.t() | nil,
            current: %{String.t() => integer()} | nil,
            type: String.t() | nil
          }
    defstruct [:as_of, :cash, :credit, :current, :type]

    defmodule Cash do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `available` - The funds available to the account holder. Typically this is the current balance after subtracting any outbound pending transactions and adding any inbound pending transactions.

      Each key is a three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase.

      Each value is a integer amount. A positive amount indicates money owed to the account holder. A negative amount indicates money owed by the account holder. Nullable.
      """
      @type t :: %__MODULE__{
              available: %{String.t() => integer()} | nil
            }
      defstruct [:available]
    end

    defmodule Credit do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `used` - The credit that has been used by the account holder.

      Each key is a three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase.

      Each value is a integer amount. A positive amount indicates money owed to the account holder. A negative amount indicates money owed by the account holder. Nullable.
      """
      @type t :: %__MODULE__{
              used: %{String.t() => integer()} | nil
            }
      defstruct [:used]
    end

    def __inner_types__ do
      %{
        "cash" => __MODULE__.Cash,
        "credit" => __MODULE__.Credit
      }
    end
  end

  defmodule BalanceRefresh do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `last_attempted_at` - The time at which the last refresh attempt was initiated. Measured in seconds since the Unix epoch. Format: Unix timestamp.
    * `next_refresh_available_at` - Time at which the next balance refresh can be initiated. This value will be `null` when `status` is `pending`. Measured in seconds since the Unix epoch. Format: Unix timestamp. Nullable.
    * `status` - The status of the last refresh attempt. Possible values: `failed`, `pending`, `succeeded`.
    """
    @type t :: %__MODULE__{
            last_attempted_at: integer() | nil,
            next_refresh_available_at: integer() | nil,
            status: String.t() | nil
          }
    defstruct [:last_attempted_at, :next_refresh_available_at, :status]
  end

  defmodule OwnershipRefresh do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `last_attempted_at` - The time at which the last refresh attempt was initiated. Measured in seconds since the Unix epoch. Format: Unix timestamp.
    * `next_refresh_available_at` - Time at which the next ownership refresh can be initiated. This value will be `null` when `status` is `pending`. Measured in seconds since the Unix epoch. Format: Unix timestamp. Nullable.
    * `status` - The status of the last refresh attempt. Possible values: `failed`, `pending`, `succeeded`.
    """
    @type t :: %__MODULE__{
            last_attempted_at: integer() | nil,
            next_refresh_available_at: integer() | nil,
            status: String.t() | nil
          }
    defstruct [:last_attempted_at, :next_refresh_available_at, :status]
  end

  defmodule TransactionRefresh do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `id` - Unique identifier for the object. Max length: 5000.
    * `last_attempted_at` - The time at which the last refresh attempt was initiated. Measured in seconds since the Unix epoch. Format: Unix timestamp.
    * `next_refresh_available_at` - Time at which the next transaction refresh can be initiated. This value will be `null` when `status` is `pending`. Measured in seconds since the Unix epoch. Format: Unix timestamp. Nullable.
    * `status` - The status of the last refresh attempt. Possible values: `failed`, `pending`, `succeeded`.
    """
    @type t :: %__MODULE__{
            id: String.t() | nil,
            last_attempted_at: integer() | nil,
            next_refresh_available_at: integer() | nil,
            status: String.t() | nil
          }
    defstruct [:id, :last_attempted_at, :next_refresh_available_at, :status]
  end

  def __inner_types__ do
    %{
      "account_holder" => __MODULE__.AccountHolder,
      "account_numbers" => __MODULE__.AccountNumbers,
      "balance" => __MODULE__.Balance,
      "balance_refresh" => __MODULE__.BalanceRefresh,
      "ownership_refresh" => __MODULE__.OwnershipRefresh,
      "transaction_refresh" => __MODULE__.TransactionRefresh
    }
  end
end
