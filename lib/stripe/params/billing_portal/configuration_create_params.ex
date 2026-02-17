# File generated from our OpenAPI spec
defmodule Stripe.Params.BillingPortal.ConfigurationCreateParams do
  @moduledoc "Parameters for configuration create."

  @typedoc """
  * `business_profile` - The business information shown to customers in the portal.
  * `default_return_url` - The default URL to redirect customers to when they click on the portal's link to return to your website. This can be [overriden](https://docs.stripe.com/api/customer_portal/sessions/create#create_portal_session-return_url) when creating the session.
  * `expand` - Specifies which fields in the response should be expanded.
  * `features` - Information about the features available in the portal.
  * `login_page` - The hosted login page for this configuration. Learn more about the portal login page in our [integration docs](https://stripe.com/docs/billing/subscriptions/integrating-customer-portal#share).
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `name` - The name of the configuration.
  """
  @type t :: %__MODULE__{
          business_profile: __MODULE__.BusinessProfile.t() | nil,
          default_return_url: map() | nil,
          expand: [String.t()] | nil,
          features: __MODULE__.Features.t(),
          login_page: __MODULE__.LoginPage.t() | nil,
          metadata: %{String.t() => String.t()} | nil,
          name: map() | nil
        }

  defstruct [
    :business_profile,
    :default_return_url,
    :expand,
    :features,
    :login_page,
    :metadata,
    :name
  ]

  defmodule BusinessProfile do
    @moduledoc "Nested parameters."

    @typedoc """
    * `headline` - The messaging shown to customers in the portal.
    * `privacy_policy_url` - A link to the business’s publicly available privacy policy.
    * `terms_of_service_url` - A link to the business’s publicly available terms of service.
    """
    @type t :: %__MODULE__{
            headline: map() | nil,
            privacy_policy_url: String.t() | nil,
            terms_of_service_url: String.t() | nil
          }
    defstruct [:headline, :privacy_policy_url, :terms_of_service_url]
  end

  defmodule Features do
    @moduledoc "Nested parameters."

    @typedoc """
    * `customer_update` - Information about updating the customer details in the portal.
    * `invoice_history` - Information about showing the billing history in the portal.
    * `payment_method_update` - Information about updating payment methods in the portal.
    * `subscription_cancel` - Information about canceling subscriptions in the portal.
    * `subscription_update` - Information about updating subscriptions in the portal.
    """
    @type t :: %__MODULE__{
            customer_update: __MODULE__.CustomerUpdate.t() | nil,
            invoice_history: __MODULE__.InvoiceHistory.t() | nil,
            payment_method_update: __MODULE__.PaymentMethodUpdate.t() | nil,
            subscription_cancel: __MODULE__.SubscriptionCancel.t() | nil,
            subscription_update: __MODULE__.SubscriptionUpdate.t() | nil
          }
    defstruct [
      :customer_update,
      :invoice_history,
      :payment_method_update,
      :subscription_cancel,
      :subscription_update
    ]

    defmodule CustomerUpdate do
      @moduledoc "Nested parameters."

      @typedoc """
      * `allowed_updates` - The types of customer updates that are supported. When empty, customers are not updateable.
      * `enabled` - Whether the feature is enabled.
      """
      @type t :: %__MODULE__{
              allowed_updates: map() | nil,
              enabled: boolean() | nil
            }
      defstruct [:allowed_updates, :enabled]
    end

    defmodule InvoiceHistory do
      @moduledoc "Nested parameters."

      @typedoc """
      * `enabled` - Whether the feature is enabled.
      """
      @type t :: %__MODULE__{
              enabled: boolean() | nil
            }
      defstruct [:enabled]
    end

    defmodule PaymentMethodUpdate do
      @moduledoc "Nested parameters."

      @typedoc """
      * `enabled` - Whether the feature is enabled.
      * `payment_method_configuration` - The [Payment Method Configuration](https://docs.stripe.com/api/payment_method_configurations) to use for this portal session. When specified, customers will be able to update their payment method to one of the options specified by the payment method configuration. If not set or set to an empty string, the default payment method configuration is used.
      """
      @type t :: %__MODULE__{
              enabled: boolean() | nil,
              payment_method_configuration: map() | nil
            }
      defstruct [:enabled, :payment_method_configuration]
    end

    defmodule SubscriptionCancel do
      @moduledoc "Nested parameters."

      @typedoc """
      * `cancellation_reason` - Whether the cancellation reasons will be collected in the portal and which options are exposed to the customer
      * `enabled` - Whether the feature is enabled.
      * `mode` - Whether to cancel subscriptions immediately or at the end of the billing period. Possible values: `at_period_end`, `immediately`.
      * `proration_behavior` - Whether to create prorations when canceling subscriptions. Possible values are `none` and `create_prorations`, which is only compatible with `mode=immediately`. Passing `always_invoice` will result in an error. No prorations are generated when canceling a subscription at the end of its natural billing period. Possible values: `always_invoice`, `create_prorations`, `none`.
      """
      @type t :: %__MODULE__{
              cancellation_reason: __MODULE__.CancellationReason.t() | nil,
              enabled: boolean() | nil,
              mode: String.t() | nil,
              proration_behavior: String.t() | nil
            }
      defstruct [:cancellation_reason, :enabled, :mode, :proration_behavior]

      defmodule CancellationReason do
        @moduledoc "Nested parameters."

        @typedoc """
        * `enabled` - Whether the feature is enabled.
        * `options` - Which cancellation reasons will be given as options to the customer.
        """
        @type t :: %__MODULE__{
                enabled: boolean() | nil,
                options: map() | nil
              }
        defstruct [:enabled, :options]
      end
    end

    defmodule SubscriptionUpdate do
      @moduledoc "Nested parameters."

      @typedoc """
      * `billing_cycle_anchor` - Determines the value to use for the billing cycle anchor on subscription updates. Valid values are `now` or `unchanged`, and the default value is `unchanged`. Setting the value to `now` resets the subscription's billing cycle anchor to the current time (in UTC). For more information, see the billing cycle [documentation](https://docs.stripe.com/billing/subscriptions/billing-cycle). Possible values: `now`, `unchanged`.
      * `default_allowed_updates` - The types of subscription updates that are supported. When empty, subscriptions are not updateable.
      * `enabled` - Whether the feature is enabled.
      * `products` - The list of up to 10 products that support subscription updates.
      * `proration_behavior` - Determines how to handle prorations resulting from subscription updates. Valid values are `none`, `create_prorations`, and `always_invoice`. Possible values: `always_invoice`, `create_prorations`, `none`.
      * `schedule_at_period_end` - Setting to control when an update should be scheduled at the end of the period instead of applying immediately.
      * `trial_update_behavior` - The behavior when updating a subscription that is trialing. Possible values: `continue_trial`, `end_trial`.
      """
      @type t :: %__MODULE__{
              billing_cycle_anchor: String.t() | nil,
              default_allowed_updates: map() | nil,
              enabled: boolean() | nil,
              products: map() | nil,
              proration_behavior: String.t() | nil,
              schedule_at_period_end: __MODULE__.ScheduleAtPeriodEnd.t() | nil,
              trial_update_behavior: String.t() | nil
            }
      defstruct [
        :billing_cycle_anchor,
        :default_allowed_updates,
        :enabled,
        :products,
        :proration_behavior,
        :schedule_at_period_end,
        :trial_update_behavior
      ]

      defmodule ScheduleAtPeriodEnd do
        @moduledoc "Nested parameters."

        @typedoc """
        * `conditions` - List of conditions. When any condition is true, the update will be scheduled at the end of the current period.
        """
        @type t :: %__MODULE__{
                conditions: [__MODULE__.Conditions.t()] | nil
              }
        defstruct [:conditions]

        defmodule Conditions do
          @moduledoc "Nested parameters."

          @typedoc """
          * `type` - The type of condition. Possible values: `decreasing_item_amount`, `shortening_interval`.
          """
          @type t :: %__MODULE__{
                  type: String.t() | nil
                }
          defstruct [:type]
        end
      end
    end
  end

  defmodule LoginPage do
    @moduledoc "Nested parameters."

    @typedoc """
    * `enabled` - Set to `true` to generate a shareable URL [`login_page.url`](https://docs.stripe.com/api/customer_portal/configuration#portal_configuration_object-login_page-url) that will take your customers to a hosted login page for the customer portal.
    """
    @type t :: %__MODULE__{
            enabled: boolean() | nil
          }
    defstruct [:enabled]
  end
end
