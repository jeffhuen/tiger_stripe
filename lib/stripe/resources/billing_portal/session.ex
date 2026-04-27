# File generated from our OpenAPI spec
defmodule Stripe.Resources.BillingPortal.Session do
  @moduledoc """
  PortalSession

  The Billing customer portal is a Stripe-hosted UI for subscription and
  billing management.

  A portal configuration describes the functionality and features that you
  want to provide to your customers through the portal.

  A portal session describes the instantiation of the customer portal for
  a particular customer. By visiting the session's URL, the customer
  can manage their subscriptions and billing details. For security reasons,
  sessions are short-lived and will expire if the customer does not visit the URL.
  Create sessions on-demand when customers intend to manage their subscriptions
  and billing details.

  Related guide: [Customer management](https://stripe.com/customer-management)
  """

  @typedoc """
  * `configuration` - The configuration used by this session, describing the features available. Expandable.
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `customer` - The ID of the customer for this session. Max length: 5000.
  * `customer_account` - The ID of the account for this session. Max length: 5000. Nullable.
  * `flow` - Information about a specific flow for the customer to go through. See the [docs](https://docs.stripe.com/customer-management/portal-deep-links) to learn more about using customer portal deep links and flows. Nullable. Expandable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `locale` - The IETF language tag of the locale Customer Portal is displayed in. If blank or auto, the customer’s `preferred_locales` or browser’s locale is used. Possible values: `auto`, `bg`, `cs`, `da`, `de`, `el`, `en`, `en-AU`, `en-CA`, `en-GB`, `en-IE`, `en-IN`, `en-NZ`, `en-SG`, `es`, `es-419`, `et`, `fi`, `fil`, `fr`, `fr-CA`, `hr`, `hu`, `id`, `it`, `ja`, `ko`, `lt`, `lv`, `ms`, `mt`, `nb`, `nl`, `pl`, `pt`, `pt-BR`, `ro`, `ru`, `sk`, `sl`, `sv`, `th`, `tr`, `vi`, `zh`, `zh-HK`, `zh-TW`. Nullable.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `billing_portal.session`.
  * `on_behalf_of` - The account for which the session was created on behalf of. When specified, only subscriptions and invoices with this `on_behalf_of` account appear in the portal. For more information, see the [docs](https://docs.stripe.com/connect/separate-charges-and-transfers#settlement-merchant). Use the [Accounts API](https://docs.stripe.com/api/accounts/object#account_object-settings-branding) to modify the `on_behalf_of` account's branding settings, which the portal displays. Max length: 5000. Nullable.
  * `return_url` - The URL to redirect customers to when they click on the portal's link to return to your website. Max length: 5000. Nullable.
  * `url` - The short-lived URL of the session that gives customers access to the customer portal. Max length: 5000.
  """
  @type t :: %__MODULE__{
          configuration: String.t() | Stripe.Resources.BillingPortal.Configuration.t(),
          created: integer(),
          customer: String.t(),
          customer_account: String.t(),
          flow: flow(),
          id: String.t(),
          livemode: boolean(),
          locale: String.t(),
          object: String.t(),
          on_behalf_of: String.t(),
          return_url: String.t(),
          url: String.t()
        }

  defstruct [
    :configuration,
    :created,
    :customer,
    :customer_account,
    :flow,
    :id,
    :livemode,
    :locale,
    :object,
    :on_behalf_of,
    :return_url,
    :url
  ]

  @object_name "billing_portal.session"
  def object_name, do: @object_name

  def expandable_fields, do: ["configuration", "flow"]

  @typedoc """
  * `after_completion`
  * `subscription_cancel` - Configuration when `flow.type=subscription_cancel`. Nullable.
  * `subscription_update` - Configuration when `flow.type=subscription_update`. Nullable.
  * `subscription_update_confirm` - Configuration when `flow.type=subscription_update_confirm`. Nullable.
  * `type` - Type of flow that the customer will go through. Possible values: `payment_method_update`, `subscription_cancel`, `subscription_update`, `subscription_update_confirm`.
  """
  @type flow :: %{
          optional(:after_completion) => flow_after_completion() | nil,
          optional(:subscription_cancel) => flow_subscription_cancel() | nil,
          optional(:subscription_update) => flow_subscription_update() | nil,
          optional(:subscription_update_confirm) => flow_subscription_update_confirm() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `hosted_confirmation` - Configuration when `after_completion.type=hosted_confirmation`. Nullable.
  * `redirect` - Configuration when `after_completion.type=redirect`. Nullable.
  * `type` - The specified type of behavior after the flow is completed. Possible values: `hosted_confirmation`, `portal_homepage`, `redirect`.
  """
  @type flow_after_completion :: %{
          optional(:hosted_confirmation) => flow_after_completion_hosted_confirmation() | nil,
          optional(:redirect) => flow_after_completion_redirect() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `custom_message` - A custom message to display to the customer after the flow is completed. Max length: 5000. Nullable.
  """
  @type flow_after_completion_hosted_confirmation :: %{
          optional(:custom_message) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `return_url` - The URL the customer will be redirected to after the flow is completed. Max length: 5000.
  """
  @type flow_after_completion_redirect :: %{
          optional(:return_url) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `retention` - Specify a retention strategy to be used in the cancellation flow. Nullable.
  * `subscription` - The ID of the subscription to be canceled. Max length: 5000.
  """
  @type flow_subscription_cancel :: %{
          optional(:retention) => flow_subscription_cancel_retention() | nil,
          optional(:subscription) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `coupon_offer` - Configuration when `retention.type=coupon_offer`. Nullable.
  * `type` - Type of retention strategy that will be used. Possible values: `coupon_offer`.
  """
  @type flow_subscription_cancel_retention :: %{
          optional(:coupon_offer) => flow_subscription_cancel_retention_coupon_offer() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `coupon` - The ID of the coupon to be offered. Max length: 5000.
  """
  @type flow_subscription_cancel_retention_coupon_offer :: %{
          optional(:coupon) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `subscription` - The ID of the subscription to be updated. Max length: 5000.
  """
  @type flow_subscription_update :: %{
          optional(:subscription) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `discounts` - The coupon or promotion code to apply to this subscription update. Nullable.
  * `items` - The [subscription item](https://docs.stripe.com/api/subscription_items) to be updated through this flow. Currently, only up to one may be specified and subscriptions with multiple items are not updatable.
  * `subscription` - The ID of the subscription to be updated. Max length: 5000.
  """
  @type flow_subscription_update_confirm :: %{
          optional(:discounts) => [flow_subscription_update_confirm_discounts()] | nil,
          optional(:items) => [flow_subscription_update_confirm_items()] | nil,
          optional(:subscription) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `coupon` - The ID of the coupon to apply to this subscription update. Max length: 5000. Nullable.
  * `promotion_code` - The ID of a promotion code to apply to this subscription update. Max length: 5000. Nullable.
  """
  @type flow_subscription_update_confirm_discounts :: %{
          optional(:coupon) => String.t() | nil,
          optional(:promotion_code) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `id` - The ID of the [subscription item](https://docs.stripe.com/api/subscriptions/object#subscription_object-items-data-id) to be updated. Max length: 5000. Nullable.
  * `price` - The price the customer should subscribe to through this flow. The price must also be included in the configuration's [`features.subscription_update.products`](https://docs.stripe.com/api/customer_portal/configuration#portal_configuration_object-features-subscription_update-products). Max length: 5000. Nullable.
  * `quantity` - [Quantity](https://docs.stripe.com/subscriptions/quantities) for this item that the customer should subscribe to through this flow.
  """
  @type flow_subscription_update_confirm_items :: %{
          optional(:id) => String.t() | nil,
          optional(:price) => String.t() | nil,
          optional(:quantity) => integer() | nil,
          optional(String.t()) => term()
        }

  def __nested_fields__ do
    %{
      "flow" => %{
        fields: %{
          "after_completion" => %{
            fields: %{
              "hosted_confirmation" => %{
                fields: %{
                  "custom_message" => :scalar
                }
              },
              "redirect" => %{
                fields: %{
                  "return_url" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "subscription_cancel" => %{
            fields: %{
              "retention" => %{
                fields: %{
                  "coupon_offer" => %{
                    fields: %{
                      "coupon" => :scalar
                    }
                  },
                  "type" => :scalar
                }
              },
              "subscription" => :scalar
            }
          },
          "subscription_update" => %{
            fields: %{
              "subscription" => :scalar
            }
          },
          "subscription_update_confirm" => %{
            fields: %{
              "discounts" =>
                {:list,
                 %{
                   fields: %{
                     "coupon" => :scalar,
                     "promotion_code" => :scalar
                   }
                 }},
              "items" =>
                {:list,
                 %{
                   fields: %{
                     "id" => :scalar,
                     "price" => :scalar,
                     "quantity" => :scalar
                   }
                 }},
              "subscription" => :scalar
            }
          },
          "type" => :scalar
        }
      }
    }
  end
end
