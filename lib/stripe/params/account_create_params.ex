# File generated from our OpenAPI spec
defmodule Stripe.Params.AccountCreateParams do
  @moduledoc "Parameters for account create."

  @typedoc """
  * `account_token` - An [account token](https://api.stripe.com#create_account_token), used to securely provide details to the account. Max length: 5000.
  * `business_profile` - Business information about the account.
  * `business_type` - The business type. Once you create an [Account Link](https://docs.stripe.com/api/account_links) or [Account Session](https://docs.stripe.com/api/account_sessions), this property can only be updated for accounts where [controller.requirement_collection](https://docs.stripe.com/api/accounts/object#account_object-controller-requirement_collection) is `application`, which includes Custom accounts. Possible values: `company`, `government_entity`, `individual`, `non_profit`.
  * `capabilities` - Each key of the dictionary represents a capability, and each capability
  maps to its settings (for example, whether it has been requested or not). Each
  capability is inactive until you have provided its specific
  requirements and Stripe has verified them. An account might have some
  of its requested capabilities be active and some be inactive.

  Required when [account.controller.stripe_dashboard.type](https://docs.stripe.com/api/accounts/create#create_account-controller-dashboard-type)
  is `none`, which includes Custom accounts.
  * `company` - Information about the company or business. This field is available for any `business_type`. Once you create an [Account Link](https://docs.stripe.com/api/account_links) or [Account Session](https://docs.stripe.com/api/account_sessions), this property can only be updated for accounts where [controller.requirement_collection](https://docs.stripe.com/api/accounts/object#account_object-controller-requirement_collection) is `application`, which includes Custom accounts.
  * `controller` - A hash of configuration describing the account controller's attributes.
  * `country` - The country in which the account holder resides, or in which the business is legally established. This should be an ISO 3166-1 alpha-2 country code. For example, if you are in the United States and the business for which you're creating an account is legally represented in Canada, you would use `CA` as the country for the account being created. Available countries include [Stripe's global markets](https://stripe.com/global) as well as countries where [cross-border payouts](https://stripe.com/docs/connect/cross-border-payouts) are supported. Max length: 5000.
  * `default_currency` - Three-letter ISO currency code representing the default currency for the account. This must be a currency that [Stripe supports in the account's country](https://docs.stripe.com/payouts). Format: ISO 4217 currency code.
  * `documents` - Documents that may be submitted to satisfy various informational requests.
  * `email` - The email address of the account holder. This is only to make the account easier to identify to you. If [controller.requirement_collection](https://docs.stripe.com/api/accounts/object#account_object-controller-requirement_collection) is `application`, which includes Custom accounts, Stripe doesn't email the account without your consent.
  * `expand` - Specifies which fields in the response should be expanded.
  * `external_account` - A card or bank account to attach to the account for receiving [payouts](https://stripe.com/connect/bank-debit-card-payouts) (you won’t be able to use it for top-ups). You can provide either a token, like the ones returned by [Stripe.js](https://stripe.com/js), or a dictionary, as documented in the `external_account` parameter for [bank account](https://stripe.com/api#account_create_bank_account) creation. 

  By default, providing an external account sets it as the new default external account for its currency, and deletes the old default if one exists. To add additional external accounts without replacing the existing default for the currency, use the [bank account](https://stripe.com/api#account_create_bank_account) or [card creation](https://stripe.com/api#account_create_card) APIs. After you create an [Account Link](https://docs.stripe.com/api/account_links) or [Account Session](https://docs.stripe.com/api/account_sessions), this property can only be updated for accounts where [controller.requirement_collection](https://docs.stripe.com/api/accounts/object#account_object-controller-requirement_collection) is `application`, which includes Custom accounts. Max length: 5000.
  * `groups` - A hash of account group type to tokens. These are account groups this account should be added to.
  * `individual` - Information about the person represented by the account. This field is null unless `business_type` is set to `individual`. Once you create an [Account Link](https://docs.stripe.com/api/account_links) or [Account Session](https://docs.stripe.com/api/account_sessions), this property can only be updated for accounts where [controller.requirement_collection](https://docs.stripe.com/api/accounts/object#account_object-controller-requirement_collection) is `application`, which includes Custom accounts.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `settings` - Options for customizing how the account functions within Stripe.
  * `tos_acceptance` - Details on the account's acceptance of the [Stripe Services Agreement](https://stripe.com/connect/updating-accounts#tos-acceptance). This property can only be updated for accounts where [controller.requirement_collection](https://docs.stripe.com/api/accounts/object#account_object-controller-requirement_collection) is `application`, which includes Custom accounts. This property defaults to a `full` service agreement when empty.
  * `type` - The `type` parameter is deprecated. Use [`controller`](https://docs.stripe.com/api/accounts/create#create_account-controller) instead to configure dashboard access, fee payer, loss liability, and requirement collection. Possible values: `custom`, `express`, `standard`.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :account_token,
    :business_profile,
    :business_type,
    :capabilities,
    :company,
    :controller,
    :country,
    :default_currency,
    :documents,
    :email,
    :expand,
    :external_account,
    :groups,
    :individual,
    :metadata,
    :settings,
    :tos_acceptance,
    :type
  ]
end
