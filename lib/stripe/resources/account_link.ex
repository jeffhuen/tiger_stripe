# File generated from our OpenAPI spec
defmodule Stripe.Resources.AccountLink do
  @moduledoc """
  AccountLink

  Account Links are the means by which a Connect platform grants a connected account permission to access
  Stripe-hosted applications, such as Connect Onboarding.

  Related guide: [Connect Onboarding](https://docs.stripe.com/connect/custom/hosted-onboarding)
  """

  @typedoc """
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `expires_at` - The timestamp at which this account link will expire. Format: Unix timestamp.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `account_link`.
  * `url` - The URL for the account link. Max length: 5000.
  """
  @type t :: %__MODULE__{}

  defstruct [:created, :expires_at, :object, :url]

  @object_name "account_link"
  def object_name, do: @object_name
end
