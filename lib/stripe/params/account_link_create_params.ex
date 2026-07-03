# File generated from our OpenAPI spec
defmodule Stripe.Params.AccountLinkCreateParams do
  @moduledoc "Parameters for account link create."

  @typedoc """
  * `account` - The identifier of the account to create an account link for. Max length: 5000.
  * `collect` - The collect parameter is deprecated. Use `collection_options` instead. Possible values: `currently_due`, `eventually_due`.
  * `collection_options` - Specifies the requirements that Stripe collects from connected accounts in the Connect Onboarding flow.
  * `expand` - Specifies which fields in the response should be expanded.
  * `refresh_url` - The URL the user will be redirected to if the account link is expired, has been previously-visited, or is otherwise invalid. The URL you specify should attempt to generate a new account link with the same parameters used to create the original account link, then redirect the user to the new account link's URL so they can continue with Connect Onboarding. If a new account link cannot be generated or the redirect fails you should display a useful error to the user.
  * `return_url` - The URL that the user will be redirected to upon leaving or completing the linked flow.
  * `type` - The type of account link the user is requesting.

  You can create Account Links of type `account_update` only for connected accounts where your platform is responsible for collecting requirements, including Custom accounts. You can't create them for accounts that have access to a Stripe-hosted Dashboard. If you use [Connect embedded components](https://stripe.com/connect/get-started-connect-embedded-components), you can include components that allow your connected accounts to update their own information. For an account without Stripe-hosted Dashboard access where Stripe is liable for negative balances, you must use embedded components. Possible values: `account_onboarding`, `account_update`.
  """
  @type t :: %__MODULE__{}

  defstruct [:account, :collect, :collection_options, :expand, :refresh_url, :return_url, :type]
end
