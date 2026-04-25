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
  @type t :: %__MODULE__{
          active: boolean() | nil,
          business_profile: business_profile() | nil,
          default_return_url: map() | nil,
          expand: [String.t()] | nil,
          features: features() | nil,
          login_page: login_page() | nil,
          metadata: map() | nil,
          name: map() | nil
        }

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

  @typedoc """
  * `headline` - The messaging shown to customers in the portal.
  * `privacy_policy_url` - A link to the business’s publicly available privacy policy.
  * `terms_of_service_url` - A link to the business’s publicly available terms of service.
  """
  @type business_profile :: %{
          optional(:headline) => map() | nil,
          optional(:privacy_policy_url) => map() | nil,
          optional(:terms_of_service_url) => map() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `customer_update` - Information about updating the customer details in the portal.
  * `invoice_history` - Information about showing the billing history in the portal.
  * `payment_method_update` - Information about updating payment methods in the portal.
  * `subscription_cancel` - Information about canceling subscriptions in the portal.
  * `subscription_update` - Information about updating subscriptions in the portal.
  """
  @type features :: %{
          optional(:customer_update) => features_customer_update() | nil,
          optional(:invoice_history) => features_invoice_history() | nil,
          optional(:payment_method_update) => features_payment_method_update() | nil,
          optional(:subscription_cancel) => features_subscription_cancel() | nil,
          optional(:subscription_update) => features_subscription_update() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `allowed_updates` - The types of customer updates that are supported. When empty, customers are not updateable.
  * `enabled` - Whether the feature is enabled.
  """
  @type features_customer_update :: %{
          optional(:allowed_updates) => map() | nil,
          optional(:enabled) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `enabled` - Whether the feature is enabled.
  """
  @type features_invoice_history :: %{
          optional(:enabled) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `enabled` - Whether the feature is enabled.
  * `payment_method_configuration` - The [Payment Method Configuration](https://docs.stripe.com/api/payment_method_configurations) to use for this portal session. When specified, customers will be able to update their payment method to one of the options specified by the payment method configuration. If not set or set to an empty string, the default payment method configuration is used.
  """
  @type features_payment_method_update :: %{
          optional(:enabled) => boolean() | nil,
          optional(:payment_method_configuration) => map() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `cancellation_reason` - Whether the cancellation reasons will be collected in the portal and which options are exposed to the customer
  * `enabled` - Whether the feature is enabled.
  * `mode` - Whether to cancel subscriptions immediately or at the end of the billing period. Possible values: `at_period_end`, `immediately`.
  * `proration_behavior` - Whether to create prorations when canceling subscriptions. Possible values are `none` and `create_prorations`, which is only compatible with `mode=immediately`. Passing `always_invoice` will result in an error. No prorations are generated when canceling a subscription at the end of its natural billing period. Possible values: `always_invoice`, `create_prorations`, `none`.
  """
  @type features_subscription_cancel :: %{
          optional(:cancellation_reason) =>
            features_subscription_cancel_cancellation_reason() | nil,
          optional(:enabled) => boolean() | nil,
          optional(:mode) => String.t() | nil,
          optional(:proration_behavior) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `enabled` - Whether the feature is enabled.
  * `options` - Which cancellation reasons will be given as options to the customer.
  """
  @type features_subscription_cancel_cancellation_reason :: %{
          optional(:enabled) => boolean() | nil,
          optional(:options) => map() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `billing_cycle_anchor` - Determines the value to use for the billing cycle anchor on subscription updates. Valid values are `now` or `unchanged`, and the default value is `unchanged`. Setting the value to `now` resets the subscription's billing cycle anchor to the current time (in UTC). For more information, see the billing cycle [documentation](https://docs.stripe.com/billing/subscriptions/billing-cycle). Possible values: `now`, `unchanged`.
  * `default_allowed_updates` - The types of subscription updates that are supported. When empty, subscriptions are not updateable.
  * `enabled` - Whether the feature is enabled.
  * `products` - The list of up to 10 products that support subscription updates.
  * `proration_behavior` - Determines how to handle prorations resulting from subscription updates. Valid values are `none`, `create_prorations`, and `always_invoice`. Possible values: `always_invoice`, `create_prorations`, `none`.
  * `schedule_at_period_end` - Setting to control when an update should be scheduled at the end of the period instead of applying immediately.
  * `trial_update_behavior` - The behavior when updating a subscription that is trialing. Possible values: `continue_trial`, `end_trial`.
  """
  @type features_subscription_update :: %{
          optional(:billing_cycle_anchor) => String.t() | nil,
          optional(:default_allowed_updates) => map() | nil,
          optional(:enabled) => boolean() | nil,
          optional(:products) => map() | nil,
          optional(:proration_behavior) => String.t() | nil,
          optional(:schedule_at_period_end) =>
            features_subscription_update_schedule_at_period_end() | nil,
          optional(:trial_update_behavior) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `conditions` - List of conditions. When any condition is true, the update will be scheduled at the end of the current period.
  """
  @type features_subscription_update_schedule_at_period_end :: %{
          optional(:conditions) => map() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `enabled` - Set to `true` to generate a shareable URL [`login_page.url`](https://docs.stripe.com/api/customer_portal/configuration#portal_configuration_object-login_page-url) that will take your customers to a hosted login page for the customer portal.

  Set to `false` to deactivate the `login_page.url`.
  """
  @type login_page :: %{
          optional(:enabled) => boolean() | nil,
          optional(String.t()) => term()
        }
end
