# File generated from our OpenAPI spec
defmodule Stripe.Params.AccountExternalAccountUpdateParams do
  @moduledoc "Parameters for account external account update."

  @typedoc """
  * `account_holder_name` - The name of the person or business that owns the bank account. Max length: 5000.
  * `account_holder_type` - The type of entity that holds the account. This can be either `individual` or `company`. Possible values: `company`, `individual`. Max length: 5000.
  * `account_type` - The bank account type. This can only be `checking` or `savings` in most countries. In Japan, this can only be `futsu` or `toza`. Possible values: `checking`, `futsu`, `savings`, `toza`. Max length: 5000.
  * `address_city` - City/District/Suburb/Town/Village. Max length: 5000.
  * `address_country` - Billing address country, if provided when creating card. Max length: 5000.
  * `address_line1` - Address line 1 (Street address/PO Box/Company name). Max length: 5000.
  * `address_line2` - Address line 2 (Apartment/Suite/Unit/Building). Max length: 5000.
  * `address_state` - State/County/Province/Region. Max length: 5000.
  * `address_zip` - ZIP or postal code. Max length: 5000.
  * `default_for_currency` - When set to true, this becomes the default external account for its currency.
  * `documents` - Documents that may be submitted to satisfy various informational requests.
  * `exp_month` - Two digit number representing the card’s expiration month. Max length: 5000.
  * `exp_year` - Four digit number representing the card’s expiration year. Max length: 5000.
  * `expand` - Specifies which fields in the response should be expanded.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `name` - Cardholder name. Max length: 5000.
  """
  @type t :: %__MODULE__{
          account_holder_name: String.t() | nil,
          account_holder_type: String.t() | nil,
          account_type: String.t() | nil,
          address_city: String.t() | nil,
          address_country: String.t() | nil,
          address_line1: String.t() | nil,
          address_line2: String.t() | nil,
          address_state: String.t() | nil,
          address_zip: String.t() | nil,
          default_for_currency: boolean() | nil,
          documents: __MODULE__.Documents.t() | nil,
          exp_month: String.t() | nil,
          exp_year: String.t() | nil,
          expand: [String.t()] | nil,
          metadata: map() | nil,
          name: String.t() | nil
        }

  defstruct [
    :account_holder_name,
    :account_holder_type,
    :account_type,
    :address_city,
    :address_country,
    :address_line1,
    :address_line2,
    :address_state,
    :address_zip,
    :default_for_currency,
    :documents,
    :exp_month,
    :exp_year,
    :expand,
    :metadata,
    :name
  ]

  defmodule Documents do
    @moduledoc "Nested parameters."

    @typedoc """
    * `bank_account_ownership_verification` - One or more documents that support the [Bank account ownership verification](https://support.stripe.com/questions/bank-account-ownership-verification) requirement. Must be a document associated with the bank account that displays the last 4 digits of the account number, either a statement or a check.
    """
    @type t :: %__MODULE__{
            bank_account_ownership_verification:
              __MODULE__.BankAccountOwnershipVerification.t() | nil
          }
    defstruct [:bank_account_ownership_verification]

    defmodule BankAccountOwnershipVerification do
      @moduledoc "Nested parameters."

      @typedoc """
      * `files` - One or more document ids returned by a [file upload](https://api.stripe.com#create_file) with a `purpose` value of `account_requirement`.
      """
      @type t :: %__MODULE__{
              files: [String.t()] | nil
            }
      defstruct [:files]
    end
  end
end
