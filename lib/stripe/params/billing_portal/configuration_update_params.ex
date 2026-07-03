# File generated from our OpenAPI spec
defmodule Stripe.Params.BillingPortal.ConfigurationUpdateParams do
  @moduledoc "Parameters for configuration update."

  @typedoc """
  * `active` - Whether the configuration is active and can be used to create portal sessions.
  * `business_profile` - The business information shown to customers in the portal.
  * `default_return_url` - The default URL to redirect customers to when they click on the portal's link to return to your website. This can be [overriden](https://docs.stripe.com/api/customer_portal/sessions/create#create_portal_session-return_url) when creating the session.
  * `expand` - Specifies which fields in the response should be expanded.
  * `features` - Information about the features available in the portal.
  * `login_page` - The hosted login page for this configuration. Learn more about the portal login page in our [integration docs](https://stripe.com/docs/billing/subscriptions/integrating-customer-portal#share).
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `name` - The name of the configuration.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :active,
    :business_profile,
    :default_return_url,
    :expand,
    :features,
    :login_page,
    :metadata,
    :name
  ]
end
