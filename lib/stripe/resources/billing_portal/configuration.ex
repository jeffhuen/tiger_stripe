# File generated from our OpenAPI spec
defmodule Stripe.Resources.BillingPortal.Configuration do
  @moduledoc """
  PortalConfiguration

  A portal configuration describes the functionality and behavior you embed in a portal session. Related guide: [Configure the customer portal](https://stripe.com/customer-management/configure-portal).
  """

  @typedoc """
  * `active` - Whether the configuration is active and can be used to create portal sessions.
  * `application` - ID of the Connect Application that created the configuration. Nullable. Expandable.
  * `business_profile` - Expandable.
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `default_return_url` - The default URL to redirect customers to when they click on the portal's link to return to your website. This can be [overriden](https://docs.stripe.com/api/customer_portal/sessions/create#create_portal_session-return_url) when creating the session. Max length: 5000. Nullable.
  * `features` - Expandable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `is_default` - Whether the configuration is the default. If `true`, this configuration can be managed in the Dashboard and portal sessions will use this configuration unless it is overriden when creating the session.
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `login_page` - Expandable.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Nullable.
  * `name` - The name of the configuration. Max length: 5000. Nullable.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `billing_portal.configuration`.
  * `updated` - Time at which the object was last updated. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  """
  @type t :: %__MODULE__{
          active: boolean(),
          application: String.t() | Stripe.Resources.Application.t(),
          business_profile: business_profile(),
          created: integer(),
          default_return_url: String.t(),
          features: features(),
          id: String.t(),
          is_default: boolean(),
          livemode: boolean(),
          login_page: login_page(),
          metadata: %{String.t() => String.t()},
          name: String.t(),
          object: String.t(),
          updated: integer()
        }

  defstruct [
    :active,
    :application,
    :business_profile,
    :created,
    :default_return_url,
    :features,
    :id,
    :is_default,
    :livemode,
    :login_page,
    :metadata,
    :name,
    :object,
    :updated
  ]

  @object_name "billing_portal.configuration"
  def object_name, do: @object_name

  def expandable_fields, do: ["application", "business_profile", "features", "login_page"]

  @typedoc """
  * `headline` - The messaging shown to customers in the portal. Max length: 5000. Nullable.
  * `privacy_policy_url` - A link to the business’s publicly available privacy policy. Max length: 5000. Nullable.
  * `terms_of_service_url` - A link to the business’s publicly available terms of service. Max length: 5000. Nullable.
  """
  @type business_profile :: %{
          optional(:headline) => String.t() | nil,
          optional(:privacy_policy_url) => String.t() | nil,
          optional(:terms_of_service_url) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `customer_update`
  * `invoice_history`
  * `payment_method_update`
  * `subscription_cancel`
  * `subscription_update`
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
          optional(:allowed_updates) => [String.t()] | nil,
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
  * `payment_method_configuration` - The [Payment Method Configuration](https://docs.stripe.com/api/payment_method_configurations) to use for this portal session. When specified, customers will be able to update their payment method to one of the options specified by the payment method configuration. If not set, the default payment method configuration is used. Max length: 5000. Nullable.
  """
  @type features_payment_method_update :: %{
          optional(:enabled) => boolean() | nil,
          optional(:payment_method_configuration) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `cancellation_reason`
  * `enabled` - Whether the feature is enabled.
  * `mode` - Whether to cancel subscriptions immediately or at the end of the billing period. Possible values: `at_period_end`, `immediately`.
  * `proration_behavior` - Whether to create prorations when canceling subscriptions. Possible values are `none` and `create_prorations`. Possible values: `always_invoice`, `create_prorations`, `none`.
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
          optional(:options) => [String.t()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `billing_cycle_anchor` - Determines the value to use for the billing cycle anchor on subscription updates. Valid values are `now` or `unchanged`, and the default value is `unchanged`. Setting the value to `now` resets the subscription's billing cycle anchor to the current time (in UTC). For more information, see the billing cycle [documentation](https://docs.stripe.com/billing/subscriptions/billing-cycle). Possible values: `now`, `unchanged`. Nullable.
  * `default_allowed_updates` - The types of subscription updates that are supported for items listed in the `products` attribute. When empty, subscriptions are not updateable.
  * `enabled` - Whether the feature is enabled.
  * `products` - The list of up to 10 products that support subscription updates. Nullable.
  * `proration_behavior` - Determines how to handle prorations resulting from subscription updates. Valid values are `none`, `create_prorations`, and `always_invoice`. Defaults to a value of `none` if you don't set it during creation. Possible values: `always_invoice`, `create_prorations`, `none`.
  * `schedule_at_period_end`
  * `trial_update_behavior` - Determines how handle updates to trialing subscriptions. Valid values are `end_trial` and `continue_trial`. Defaults to a value of `end_trial` if you don't set it during creation. Possible values: `continue_trial`, `end_trial`.
  """
  @type features_subscription_update :: %{
          optional(:billing_cycle_anchor) => String.t() | nil,
          optional(:default_allowed_updates) => [String.t()] | nil,
          optional(:enabled) => boolean() | nil,
          optional(:products) => [features_subscription_update_products()] | nil,
          optional(:proration_behavior) => String.t() | nil,
          optional(:schedule_at_period_end) =>
            features_subscription_update_schedule_at_period_end() | nil,
          optional(:trial_update_behavior) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `adjustable_quantity`
  * `prices` - The list of price IDs which, when subscribed to, a subscription can be updated.
  * `product` - The product ID. Max length: 5000.
  """
  @type features_subscription_update_products :: %{
          optional(:adjustable_quantity) =>
            features_subscription_update_products_adjustable_quantity() | nil,
          optional(:prices) => [String.t()] | nil,
          optional(:product) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `enabled` - If true, the quantity can be adjusted to any non-negative integer.
  * `maximum` - The maximum quantity that can be set for the product. Nullable.
  * `minimum` - The minimum quantity that can be set for the product.
  """
  @type features_subscription_update_products_adjustable_quantity :: %{
          optional(:enabled) => boolean() | nil,
          optional(:maximum) => integer() | nil,
          optional(:minimum) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `conditions` - List of conditions. When any condition is true, an update will be scheduled at the end of the current period.
  """
  @type features_subscription_update_schedule_at_period_end :: %{
          optional(:conditions) =>
            [features_subscription_update_schedule_at_period_end_conditions()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - The type of condition. Possible values: `decreasing_item_amount`, `shortening_interval`.
  """
  @type features_subscription_update_schedule_at_period_end_conditions :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `enabled` - If `true`, a shareable `url` will be generated that will take your customers to a hosted login page for the customer portal.

  If `false`, the previously generated `url`, if any, will be deactivated.
  * `url` - A shareable URL to the hosted portal login page. Your customers will be able to log in with their [email](https://docs.stripe.com/api/customers/object#customer_object-email) and receive a link to their customer portal. Max length: 5000. Nullable.
  """
  @type login_page :: %{
          optional(:enabled) => boolean() | nil,
          optional(:url) => String.t() | nil,
          optional(String.t()) => term()
        }

  def __nested_fields__ do
    %{
      "business_profile" => %{
        fields: %{
          "headline" => :scalar,
          "privacy_policy_url" => :scalar,
          "terms_of_service_url" => :scalar
        }
      },
      "features" => %{
        fields: %{
          "customer_update" => %{
            fields: %{
              "allowed_updates" => {:list, :scalar},
              "enabled" => :scalar
            }
          },
          "invoice_history" => %{
            fields: %{
              "enabled" => :scalar
            }
          },
          "payment_method_update" => %{
            fields: %{
              "enabled" => :scalar,
              "payment_method_configuration" => :scalar
            }
          },
          "subscription_cancel" => %{
            fields: %{
              "cancellation_reason" => %{
                fields: %{
                  "enabled" => :scalar,
                  "options" => {:list, :scalar}
                }
              },
              "enabled" => :scalar,
              "mode" => :scalar,
              "proration_behavior" => :scalar
            }
          },
          "subscription_update" => %{
            fields: %{
              "billing_cycle_anchor" => :scalar,
              "default_allowed_updates" => {:list, :scalar},
              "enabled" => :scalar,
              "products" =>
                {:list,
                 %{
                   fields: %{
                     "adjustable_quantity" => %{
                       fields: %{
                         "enabled" => :scalar,
                         "maximum" => :scalar,
                         "minimum" => :scalar
                       }
                     },
                     "prices" => {:list, :scalar},
                     "product" => :scalar
                   }
                 }},
              "proration_behavior" => :scalar,
              "schedule_at_period_end" => %{
                fields: %{
                  "conditions" =>
                    {:list,
                     %{
                       fields: %{
                         "type" => :scalar
                       }
                     }}
                }
              },
              "trial_update_behavior" => :scalar
            }
          }
        }
      },
      "login_page" => %{
        fields: %{
          "enabled" => :scalar,
          "url" => :scalar
        }
      }
    }
  end
end
