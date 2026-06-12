# File generated from our OpenAPI spec
defmodule Stripe.Params.BillingPortal.SessionCreateParams do
  @moduledoc "Parameters for session create."

  @typedoc """
  * `configuration` - The ID of an existing [configuration](https://docs.stripe.com/api/customer_portal/configurations) to use for this session, describing its functionality and features. If not specified, the session uses the default configuration. Max length: 5000.
  * `customer` - The ID of an existing customer. Max length: 5000.
  * `customer_account` - The ID of an existing account. Max length: 5000.
  * `expand` - Specifies which fields in the response should be expanded.
  * `flow_data` - Information about a specific flow for the customer to go through. See the [docs](https://docs.stripe.com/customer-management/portal-deep-links) to learn more about using customer portal deep links and flows.
  * `locale` - The IETF language tag of the locale customer portal is displayed in. If blank or auto, the customer’s `preferred_locales` or browser’s locale is used. Possible values: `auto`, `bg`, `cs`, `da`, `de`, `el`, `en`, `en-AU`, `en-CA`, `en-GB`, `en-IE`, `en-IN`, `en-NZ`, `en-SG`, `es`, `es-419`, `et`, `fi`, `fil`, `fr`, `fr-CA`, `hr`, `hu`, `id`, `it`, `ja`, `ko`, `lt`, `lv`, `ms`, `mt`, `nb`, `nl`, `pl`, `pt`, `pt-BR`, `ro`, `ru`, `sk`, `sl`, `sv`, `th`, `tr`, `vi`, `zh`, `zh-HK`, `zh-TW`.
  * `on_behalf_of` - The `on_behalf_of` account to use for this session. When specified, only subscriptions and invoices with this `on_behalf_of` account appear in the portal. For more information, see the [docs](https://docs.stripe.com/connect/separate-charges-and-transfers#settlement-merchant). Use the [Accounts API](https://docs.stripe.com/api/accounts/object#account_object-settings-branding) to modify the `on_behalf_of` account's branding settings, which the portal displays.
  * `return_url` - The default URL to redirect customers to when they click on the portal's link to return to your website.
  """
  @type t :: %__MODULE__{
          configuration: String.t() | nil,
          customer: String.t() | nil,
          customer_account: String.t() | nil,
          expand: [String.t()] | nil,
          flow_data: flow_data() | nil,
          locale: String.t() | nil,
          on_behalf_of: String.t() | nil,
          return_url: String.t() | nil
        }

  defstruct [
    :configuration,
    :customer,
    :customer_account,
    :expand,
    :flow_data,
    :locale,
    :on_behalf_of,
    :return_url
  ]

  @typedoc """
  * `after_completion` - Behavior after the flow is completed.
  * `subscription_cancel` - Configuration when `flow_data.type=subscription_cancel`.
  * `subscription_update` - Configuration when `flow_data.type=subscription_update`.
  * `subscription_update_confirm` - Configuration when `flow_data.type=subscription_update_confirm`.
  * `type` - Type of flow that the customer will go through. Possible values: `payment_method_update`, `subscription_cancel`, `subscription_update`, `subscription_update_confirm`.
  """
  @type flow_data :: %{
          optional(:after_completion) => flow_data_after_completion() | nil,
          optional(:subscription_cancel) => flow_data_subscription_cancel() | nil,
          optional(:subscription_update) => flow_data_subscription_update() | nil,
          optional(:subscription_update_confirm) => flow_data_subscription_update_confirm() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `hosted_confirmation` - Configuration when `after_completion.type=hosted_confirmation`.
  * `redirect` - Configuration when `after_completion.type=redirect`.
  * `type` - The specified behavior after the flow is completed. Possible values: `hosted_confirmation`, `portal_homepage`, `redirect`.
  """
  @type flow_data_after_completion :: %{
          optional(:hosted_confirmation) =>
            flow_data_after_completion_hosted_confirmation() | nil,
          optional(:redirect) => flow_data_after_completion_redirect() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `custom_message` - A custom message to display to the customer after the flow is completed. Max length: 500.
  """
  @type flow_data_after_completion_hosted_confirmation :: %{
          optional(:custom_message) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `return_url` - The URL the customer will be redirected to after the flow is completed.
  """
  @type flow_data_after_completion_redirect :: %{
          optional(:return_url) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `retention` - Specify a retention strategy to be used in the cancellation flow.
  * `subscription` - The ID of the subscription to be canceled. Max length: 5000.
  """
  @type flow_data_subscription_cancel :: %{
          optional(:retention) => flow_data_subscription_cancel_retention() | nil,
          optional(:subscription) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `coupon_offer` - Configuration when `retention.type=coupon_offer`.
  * `type` - Type of retention strategy to use with the customer. Possible values: `coupon_offer`.
  """
  @type flow_data_subscription_cancel_retention :: %{
          optional(:coupon_offer) => flow_data_subscription_cancel_retention_coupon_offer() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `coupon` - The ID of the coupon to be offered. Max length: 5000.
  """
  @type flow_data_subscription_cancel_retention_coupon_offer :: %{
          optional(:coupon) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `subscription` - The ID of the subscription to be updated. Max length: 5000.
  """
  @type flow_data_subscription_update :: %{
          optional(:subscription) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `discounts` - The coupon or promotion code to apply to this subscription update.
  * `items` - The [subscription item](https://docs.stripe.com/api/subscription_items) to be updated through this flow. Currently, only up to one may be specified and subscriptions with multiple items are not updatable.
  * `subscription` - The ID of the subscription to be updated. Max length: 5000.
  """
  @type flow_data_subscription_update_confirm :: %{
          optional(:discounts) => [flow_data_subscription_update_confirm_discounts()] | nil,
          optional(:items) => [flow_data_subscription_update_confirm_items()] | nil,
          optional(:subscription) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `coupon` - The ID of the coupon to apply to this subscription update. Max length: 5000.
  * `promotion_code` - The ID of a promotion code to apply to this subscription update. Max length: 5000.
  """
  @type flow_data_subscription_update_confirm_discounts :: %{
          optional(:coupon) => String.t() | nil,
          optional(:promotion_code) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `id` - The ID of the [subscription item](https://docs.stripe.com/api/subscriptions/object#subscription_object-items-data-id) to be updated. Max length: 5000.
  * `price` - The price the customer should subscribe to through this flow. The price must also be included in the configuration's [`features.subscription_update.products`](https://docs.stripe.com/api/customer_portal/configuration#portal_configuration_object-features-subscription_update-products). Max length: 5000.
  * `quantity` - [Quantity](https://docs.stripe.com/subscriptions/quantities) for this item that the customer should subscribe to through this flow.
  """
  @type flow_data_subscription_update_confirm_items :: %{
          optional(:id) => String.t() | nil,
          optional(:price) => String.t() | nil,
          optional(:quantity) => integer() | nil,
          optional(String.t()) => term()
        }
end
