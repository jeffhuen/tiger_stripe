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
          flow: __MODULE__.Flow.t(),
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

  defmodule Flow do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `after_completion`
    * `subscription_cancel` - Configuration when `flow.type=subscription_cancel`. Nullable.
    * `subscription_update` - Configuration when `flow.type=subscription_update`. Nullable.
    * `subscription_update_confirm` - Configuration when `flow.type=subscription_update_confirm`. Nullable.
    * `type` - Type of flow that the customer will go through. Possible values: `payment_method_update`, `subscription_cancel`, `subscription_update`, `subscription_update_confirm`.
    """
    @type t :: %__MODULE__{
            after_completion: __MODULE__.AfterCompletion.t() | nil,
            subscription_cancel: __MODULE__.SubscriptionCancel.t() | nil,
            subscription_update: __MODULE__.SubscriptionUpdate.t() | nil,
            subscription_update_confirm: __MODULE__.SubscriptionUpdateConfirm.t() | nil,
            type: String.t() | nil
          }
    defstruct [
      :after_completion,
      :subscription_cancel,
      :subscription_update,
      :subscription_update_confirm,
      :type
    ]

    defmodule AfterCompletion do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `hosted_confirmation` - Configuration when `after_completion.type=hosted_confirmation`. Nullable.
      * `redirect` - Configuration when `after_completion.type=redirect`. Nullable.
      * `type` - The specified type of behavior after the flow is completed. Possible values: `hosted_confirmation`, `portal_homepage`, `redirect`.
      """
      @type t :: %__MODULE__{
              hosted_confirmation: __MODULE__.HostedConfirmation.t() | nil,
              redirect: __MODULE__.Redirect.t() | nil,
              type: String.t() | nil
            }
      defstruct [:hosted_confirmation, :redirect, :type]

      defmodule HostedConfirmation do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `custom_message` - A custom message to display to the customer after the flow is completed. Max length: 5000. Nullable.
        """
        @type t :: %__MODULE__{
                custom_message: String.t() | nil
              }
        defstruct [:custom_message]
      end

      defmodule Redirect do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `return_url` - The URL the customer will be redirected to after the flow is completed. Max length: 5000.
        """
        @type t :: %__MODULE__{
                return_url: String.t() | nil
              }
        defstruct [:return_url]
      end

      def __inner_types__ do
        %{
          "hosted_confirmation" => __MODULE__.HostedConfirmation,
          "redirect" => __MODULE__.Redirect
        }
      end
    end

    defmodule SubscriptionCancel do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `retention` - Specify a retention strategy to be used in the cancellation flow. Nullable.
      * `subscription` - The ID of the subscription to be canceled. Max length: 5000.
      """
      @type t :: %__MODULE__{
              retention: __MODULE__.Retention.t() | nil,
              subscription: String.t() | nil
            }
      defstruct [:retention, :subscription]

      defmodule Retention do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `coupon_offer` - Configuration when `retention.type=coupon_offer`. Nullable.
        * `type` - Type of retention strategy that will be used. Possible values: `coupon_offer`.
        """
        @type t :: %__MODULE__{
                coupon_offer: __MODULE__.CouponOffer.t() | nil,
                type: String.t() | nil
              }
        defstruct [:coupon_offer, :type]

        defmodule CouponOffer do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `coupon` - The ID of the coupon to be offered. Max length: 5000.
          """
          @type t :: %__MODULE__{
                  coupon: String.t() | nil
                }
          defstruct [:coupon]
        end

        def __inner_types__ do
          %{
            "coupon_offer" => __MODULE__.CouponOffer
          }
        end
      end

      def __inner_types__ do
        %{
          "retention" => __MODULE__.Retention
        }
      end
    end

    defmodule SubscriptionUpdate do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `subscription` - The ID of the subscription to be updated. Max length: 5000.
      """
      @type t :: %__MODULE__{
              subscription: String.t() | nil
            }
      defstruct [:subscription]
    end

    defmodule SubscriptionUpdateConfirm do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `discounts` - The coupon or promotion code to apply to this subscription update. Nullable.
      * `items` - The [subscription item](https://docs.stripe.com/api/subscription_items) to be updated through this flow. Currently, only up to one may be specified and subscriptions with multiple items are not updatable.
      * `subscription` - The ID of the subscription to be updated. Max length: 5000.
      """
      @type t :: %__MODULE__{
              discounts: [__MODULE__.Discounts.t()] | nil,
              items: [__MODULE__.Items.t()] | nil,
              subscription: String.t() | nil
            }
      defstruct [:discounts, :items, :subscription]

      defmodule Discounts do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `coupon` - The ID of the coupon to apply to this subscription update. Max length: 5000. Nullable.
        * `promotion_code` - The ID of a promotion code to apply to this subscription update. Max length: 5000. Nullable.
        """
        @type t :: %__MODULE__{
                coupon: String.t() | nil,
                promotion_code: String.t() | nil
              }
        defstruct [:coupon, :promotion_code]
      end

      defmodule Items do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `id` - The ID of the [subscription item](https://docs.stripe.com/api/subscriptions/object#subscription_object-items-data-id) to be updated. Max length: 5000. Nullable.
        * `price` - The price the customer should subscribe to through this flow. The price must also be included in the configuration's [`features.subscription_update.products`](https://docs.stripe.com/api/customer_portal/configuration#portal_configuration_object-features-subscription_update-products). Max length: 5000. Nullable.
        * `quantity` - [Quantity](https://docs.stripe.com/subscriptions/quantities) for this item that the customer should subscribe to through this flow.
        """
        @type t :: %__MODULE__{
                id: String.t() | nil,
                price: String.t() | nil,
                quantity: integer() | nil
              }
        defstruct [:id, :price, :quantity]
      end

      def __inner_types__ do
        %{
          "discounts" => __MODULE__.Discounts,
          "items" => __MODULE__.Items
        }
      end
    end

    def __inner_types__ do
      %{
        "after_completion" => __MODULE__.AfterCompletion,
        "subscription_cancel" => __MODULE__.SubscriptionCancel,
        "subscription_update" => __MODULE__.SubscriptionUpdate,
        "subscription_update_confirm" => __MODULE__.SubscriptionUpdateConfirm
      }
    end
  end

  def __inner_types__ do
    %{
      "flow" => __MODULE__.Flow
    }
  end
end
