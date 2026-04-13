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
          business_profile: __MODULE__.BusinessProfile.t(),
          created: integer(),
          default_return_url: String.t(),
          features: __MODULE__.Features.t(),
          id: String.t(),
          is_default: boolean(),
          livemode: boolean(),
          login_page: __MODULE__.LoginPage.t(),
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

  defmodule BusinessProfile do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `headline` - The messaging shown to customers in the portal. Max length: 5000. Nullable.
    * `privacy_policy_url` - A link to the business’s publicly available privacy policy. Max length: 5000. Nullable.
    * `terms_of_service_url` - A link to the business’s publicly available terms of service. Max length: 5000. Nullable.
    """
    @type t :: %__MODULE__{
            headline: String.t() | nil,
            privacy_policy_url: String.t() | nil,
            terms_of_service_url: String.t() | nil
          }
    defstruct [:headline, :privacy_policy_url, :terms_of_service_url]
  end

  defmodule Features do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `customer_update`
    * `invoice_history`
    * `payment_method_update`
    * `subscription_cancel`
    * `subscription_update`
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
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `allowed_updates` - The types of customer updates that are supported. When empty, customers are not updateable.
      * `enabled` - Whether the feature is enabled.
      """
      @type t :: %__MODULE__{
              allowed_updates: [String.t()] | nil,
              enabled: boolean() | nil
            }
      defstruct [:allowed_updates, :enabled]
    end

    defmodule InvoiceHistory do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `enabled` - Whether the feature is enabled.
      """
      @type t :: %__MODULE__{
              enabled: boolean() | nil
            }
      defstruct [:enabled]
    end

    defmodule PaymentMethodUpdate do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `enabled` - Whether the feature is enabled.
      * `payment_method_configuration` - The [Payment Method Configuration](https://docs.stripe.com/api/payment_method_configurations) to use for this portal session. When specified, customers will be able to update their payment method to one of the options specified by the payment method configuration. If not set, the default payment method configuration is used. Max length: 5000. Nullable.
      """
      @type t :: %__MODULE__{
              enabled: boolean() | nil,
              payment_method_configuration: String.t() | nil
            }
      defstruct [:enabled, :payment_method_configuration]
    end

    defmodule SubscriptionCancel do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `cancellation_reason`
      * `enabled` - Whether the feature is enabled.
      * `mode` - Whether to cancel subscriptions immediately or at the end of the billing period. Possible values: `at_period_end`, `immediately`.
      * `proration_behavior` - Whether to create prorations when canceling subscriptions. Possible values are `none` and `create_prorations`. Possible values: `always_invoice`, `create_prorations`, `none`.
      """
      @type t :: %__MODULE__{
              cancellation_reason: __MODULE__.CancellationReason.t() | nil,
              enabled: boolean() | nil,
              mode: String.t() | nil,
              proration_behavior: String.t() | nil
            }
      defstruct [:cancellation_reason, :enabled, :mode, :proration_behavior]

      defmodule CancellationReason do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `enabled` - Whether the feature is enabled.
        * `options` - Which cancellation reasons will be given as options to the customer.
        """
        @type t :: %__MODULE__{
                enabled: boolean() | nil,
                options: [String.t()] | nil
              }
        defstruct [:enabled, :options]
      end

      def __inner_types__ do
        %{
          "cancellation_reason" => __MODULE__.CancellationReason
        }
      end
    end

    defmodule SubscriptionUpdate do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `billing_cycle_anchor` - Determines the value to use for the billing cycle anchor on subscription updates. Valid values are `now` or `unchanged`, and the default value is `unchanged`. Setting the value to `now` resets the subscription's billing cycle anchor to the current time (in UTC). For more information, see the billing cycle [documentation](https://docs.stripe.com/billing/subscriptions/billing-cycle). Possible values: `now`, `unchanged`. Nullable.
      * `default_allowed_updates` - The types of subscription updates that are supported for items listed in the `products` attribute. When empty, subscriptions are not updateable.
      * `enabled` - Whether the feature is enabled.
      * `products` - The list of up to 10 products that support subscription updates. Nullable.
      * `proration_behavior` - Determines how to handle prorations resulting from subscription updates. Valid values are `none`, `create_prorations`, and `always_invoice`. Defaults to a value of `none` if you don't set it during creation. Possible values: `always_invoice`, `create_prorations`, `none`.
      * `schedule_at_period_end`
      * `trial_update_behavior` - Determines how handle updates to trialing subscriptions. Valid values are `end_trial` and `continue_trial`. Defaults to a value of `end_trial` if you don't set it during creation. Possible values: `continue_trial`, `end_trial`.
      """
      @type t :: %__MODULE__{
              billing_cycle_anchor: String.t() | nil,
              default_allowed_updates: [String.t()] | nil,
              enabled: boolean() | nil,
              products: [__MODULE__.Products.t()] | nil,
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

      defmodule Products do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `adjustable_quantity`
        * `prices` - The list of price IDs which, when subscribed to, a subscription can be updated.
        * `product` - The product ID. Max length: 5000.
        """
        @type t :: %__MODULE__{
                adjustable_quantity: __MODULE__.AdjustableQuantity.t() | nil,
                prices: [String.t()] | nil,
                product: String.t() | nil
              }
        defstruct [:adjustable_quantity, :prices, :product]

        defmodule AdjustableQuantity do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `enabled` - If true, the quantity can be adjusted to any non-negative integer.
          * `maximum` - The maximum quantity that can be set for the product. Nullable.
          * `minimum` - The minimum quantity that can be set for the product.
          """
          @type t :: %__MODULE__{
                  enabled: boolean() | nil,
                  maximum: integer() | nil,
                  minimum: integer() | nil
                }
          defstruct [:enabled, :maximum, :minimum]
        end

        def __inner_types__ do
          %{
            "adjustable_quantity" => __MODULE__.AdjustableQuantity
          }
        end
      end

      defmodule ScheduleAtPeriodEnd do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `conditions` - List of conditions. When any condition is true, an update will be scheduled at the end of the current period.
        """
        @type t :: %__MODULE__{
                conditions: [__MODULE__.Conditions.t()] | nil
              }
        defstruct [:conditions]

        defmodule Conditions do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `type` - The type of condition. Possible values: `decreasing_item_amount`, `shortening_interval`.
          """
          @type t :: %__MODULE__{
                  type: String.t() | nil
                }
          defstruct [:type]
        end

        def __inner_types__ do
          %{
            "conditions" => __MODULE__.Conditions
          }
        end
      end

      def __inner_types__ do
        %{
          "products" => __MODULE__.Products,
          "schedule_at_period_end" => __MODULE__.ScheduleAtPeriodEnd
        }
      end
    end

    def __inner_types__ do
      %{
        "customer_update" => __MODULE__.CustomerUpdate,
        "invoice_history" => __MODULE__.InvoiceHistory,
        "payment_method_update" => __MODULE__.PaymentMethodUpdate,
        "subscription_cancel" => __MODULE__.SubscriptionCancel,
        "subscription_update" => __MODULE__.SubscriptionUpdate
      }
    end
  end

  defmodule LoginPage do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `enabled` - If `true`, a shareable `url` will be generated that will take your customers to a hosted login page for the customer portal.

    If `false`, the previously generated `url`, if any, will be deactivated.
    * `url` - A shareable URL to the hosted portal login page. Your customers will be able to log in with their [email](https://docs.stripe.com/api/customers/object#customer_object-email) and receive a link to their customer portal. Max length: 5000. Nullable.
    """
    @type t :: %__MODULE__{
            enabled: boolean() | nil,
            url: String.t() | nil
          }
    defstruct [:enabled, :url]
  end

  def __inner_types__ do
    %{
      "business_profile" => __MODULE__.BusinessProfile,
      "features" => __MODULE__.Features,
      "login_page" => __MODULE__.LoginPage
    }
  end
end
