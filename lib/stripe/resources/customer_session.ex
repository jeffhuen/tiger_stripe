# File generated from our OpenAPI spec
defmodule Stripe.Resources.CustomerSession do
  @moduledoc """
  CustomerSessionResourceCustomerSession

  A Customer Session allows you to grant Stripe's frontend SDKs (like Stripe.js) client-side access
  control over a Customer.

  Related guides: [Customer Session with the Payment Element](https://stripe.com/payments/accept-a-payment-deferred?platform=web&type=payment#save-payment-methods),
  [Customer Session with the Pricing Table](https://stripe.com/payments/checkout/pricing-table#customer-session),
  [Customer Session with the Buy Button](https://stripe.com/payment-links/buy-button#pass-an-existing-customer).
  """

  @typedoc """
  * `client_secret` - The client secret of this Customer Session. Used on the client to set up secure access to the given `customer`.

  The client secret can be used to provide access to `customer` from your frontend. It should not be stored, logged, or exposed to anyone other than the relevant customer. Make sure that you have TLS enabled on any page that includes the client secret. Max length: 5000.
  * `components` - Expandable.
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `customer` - The Customer the Customer Session was created for. Expandable.
  * `customer_account` - The Account that the Customer Session was created for. Max length: 5000. Nullable.
  * `expires_at` - The timestamp at which this Customer Session will expire. Format: Unix timestamp.
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `customer_session`.
  """
  @type t :: %__MODULE__{
          client_secret: String.t(),
          components: components() | nil,
          created: integer(),
          customer: String.t() | Stripe.Resources.Customer.t(),
          customer_account: String.t(),
          expires_at: integer(),
          livemode: boolean(),
          object: String.t()
        }

  defstruct [
    :client_secret,
    :components,
    :created,
    :customer,
    :customer_account,
    :expires_at,
    :livemode,
    :object
  ]

  @object_name "customer_session"
  def object_name, do: @object_name

  def expandable_fields, do: ["components", "customer"]

  @typedoc """
  * `buy_button`
  * `customer_sheet`
  * `mobile_payment_element`
  * `payment_element`
  * `pricing_table`
  """
  @type components :: %{
          optional(:buy_button) => components_buy_button() | nil,
          optional(:customer_sheet) => components_customer_sheet() | nil,
          optional(:mobile_payment_element) => components_mobile_payment_element() | nil,
          optional(:payment_element) => components_payment_element() | nil,
          optional(:pricing_table) => components_pricing_table() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `enabled` - Whether the buy button is enabled.
  """
  @type components_buy_button :: %{
          optional(:enabled) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `enabled` - Whether the customer sheet is enabled.
  * `features` - This hash defines whether the customer sheet supports certain features. Nullable.
  """
  @type components_customer_sheet :: %{
          optional(:enabled) => boolean() | nil,
          optional(:features) => components_customer_sheet_features() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `payment_method_allow_redisplay_filters` - A list of [`allow_redisplay`](https://docs.stripe.com/api/payment_methods/object#payment_method_object-allow_redisplay) values that controls which saved payment methods the customer sheet displays by filtering to only show payment methods with an `allow_redisplay` value that is present in this list.

  If not specified, defaults to ["always"]. In order to display all saved payment methods, specify ["always", "limited", "unspecified"]. Nullable.
  * `payment_method_remove` - Controls whether the customer sheet displays the option to remove a saved payment method."

  Allowing buyers to remove their saved payment methods impacts subscriptions that depend on that payment method. Removing the payment method detaches the [`customer` object](https://docs.stripe.com/api/payment_methods/object#payment_method_object-customer) from that [PaymentMethod](https://docs.stripe.com/api/payment_methods). Possible values: `disabled`, `enabled`. Nullable.
  """
  @type components_customer_sheet_features :: %{
          optional(:payment_method_allow_redisplay_filters) => [String.t()] | nil,
          optional(:payment_method_remove) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `enabled` - Whether the mobile payment element is enabled.
  * `features` - This hash defines whether the mobile payment element supports certain features. Nullable.
  """
  @type components_mobile_payment_element :: %{
          optional(:enabled) => boolean() | nil,
          optional(:features) => components_mobile_payment_element_features() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `payment_method_allow_redisplay_filters` - A list of [`allow_redisplay`](https://docs.stripe.com/api/payment_methods/object#payment_method_object-allow_redisplay) values that controls which saved payment methods the mobile payment element displays by filtering to only show payment methods with an `allow_redisplay` value that is present in this list.

  If not specified, defaults to ["always"]. In order to display all saved payment methods, specify ["always", "limited", "unspecified"]. Nullable.
  * `payment_method_redisplay` - Controls whether or not the mobile payment element shows saved payment methods. Possible values: `disabled`, `enabled`. Nullable.
  * `payment_method_remove` - Controls whether the mobile payment element displays the option to remove a saved payment method."

  Allowing buyers to remove their saved payment methods impacts subscriptions that depend on that payment method. Removing the payment method detaches the [`customer` object](https://docs.stripe.com/api/payment_methods/object#payment_method_object-customer) from that [PaymentMethod](https://docs.stripe.com/api/payment_methods). Possible values: `disabled`, `enabled`. Nullable.
  * `payment_method_save` - Controls whether the mobile payment element displays a checkbox offering to save a new payment method.

  If a customer checks the box, the [`allow_redisplay`](https://docs.stripe.com/api/payment_methods/object#payment_method_object-allow_redisplay) value on the PaymentMethod is set to `'always'` at confirmation time. For PaymentIntents, the [`setup_future_usage`](https://docs.stripe.com/api/payment_intents/object#payment_intent_object-setup_future_usage) value is also set to the value defined in `payment_method_save_usage`. Possible values: `disabled`, `enabled`. Nullable.
  * `payment_method_save_allow_redisplay_override` - Allows overriding the value of allow_override when saving a new payment method when payment_method_save is set to disabled. Use values: "always", "limited", or "unspecified".

  If not specified, defaults to `nil` (no override value). Possible values: `always`, `limited`, `unspecified`. Nullable.
  """
  @type components_mobile_payment_element_features :: %{
          optional(:payment_method_allow_redisplay_filters) => [String.t()] | nil,
          optional(:payment_method_redisplay) => String.t() | nil,
          optional(:payment_method_remove) => String.t() | nil,
          optional(:payment_method_save) => String.t() | nil,
          optional(:payment_method_save_allow_redisplay_override) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `enabled` - Whether the Payment Element is enabled.
  * `features` - This hash defines whether the Payment Element supports certain features. Nullable.
  """
  @type components_payment_element :: %{
          optional(:enabled) => boolean() | nil,
          optional(:features) => components_payment_element_features() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `payment_method_allow_redisplay_filters` - A list of [`allow_redisplay`](https://docs.stripe.com/api/payment_methods/object#payment_method_object-allow_redisplay) values that controls which saved payment methods the Payment Element displays by filtering to only show payment methods with an `allow_redisplay` value that is present in this list.

  If not specified, defaults to ["always"]. In order to display all saved payment methods, specify ["always", "limited", "unspecified"].
  * `payment_method_redisplay` - Controls whether or not the Payment Element shows saved payment methods. This parameter defaults to `disabled`. Possible values: `disabled`, `enabled`.
  * `payment_method_redisplay_limit` - Determines the max number of saved payment methods for the Payment Element to display. This parameter defaults to `3`. The maximum redisplay limit is `10`. Nullable.
  * `payment_method_remove` - Controls whether the Payment Element displays the option to remove a saved payment method. This parameter defaults to `disabled`.

  Allowing buyers to remove their saved payment methods impacts subscriptions that depend on that payment method. Removing the payment method detaches the [`customer` object](https://docs.stripe.com/api/payment_methods/object#payment_method_object-customer) from that [PaymentMethod](https://docs.stripe.com/api/payment_methods). Possible values: `disabled`, `enabled`.
  * `payment_method_save` - Controls whether the Payment Element displays a checkbox offering to save a new payment method. This parameter defaults to `disabled`.

  If a customer checks the box, the [`allow_redisplay`](https://docs.stripe.com/api/payment_methods/object#payment_method_object-allow_redisplay) value on the PaymentMethod is set to `'always'` at confirmation time. For PaymentIntents, the [`setup_future_usage`](https://docs.stripe.com/api/payment_intents/object#payment_intent_object-setup_future_usage) value is also set to the value defined in `payment_method_save_usage`. Possible values: `disabled`, `enabled`.
  * `payment_method_save_usage` - When using PaymentIntents and the customer checks the save checkbox, this field determines the [`setup_future_usage`](https://docs.stripe.com/api/payment_intents/object#payment_intent_object-setup_future_usage) value used to confirm the PaymentIntent.

  When using SetupIntents, directly configure the [`usage`](https://docs.stripe.com/api/setup_intents/object#setup_intent_object-usage) value on SetupIntent creation. Possible values: `off_session`, `on_session`. Nullable.
  """
  @type components_payment_element_features :: %{
          optional(:payment_method_allow_redisplay_filters) => [String.t()] | nil,
          optional(:payment_method_redisplay) => String.t() | nil,
          optional(:payment_method_redisplay_limit) => integer() | nil,
          optional(:payment_method_remove) => String.t() | nil,
          optional(:payment_method_save) => String.t() | nil,
          optional(:payment_method_save_usage) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `enabled` - Whether the pricing table is enabled.
  """
  @type components_pricing_table :: %{
          optional(:enabled) => boolean() | nil,
          optional(String.t()) => term()
        }

  def __nested_fields__ do
    %{
      "components" => %{
        fields: %{
          "buy_button" => %{
            fields: %{
              "enabled" => :scalar
            }
          },
          "customer_sheet" => %{
            fields: %{
              "enabled" => :scalar,
              "features" => %{
                fields: %{
                  "payment_method_allow_redisplay_filters" => {:list, :scalar},
                  "payment_method_remove" => :scalar
                }
              }
            }
          },
          "mobile_payment_element" => %{
            fields: %{
              "enabled" => :scalar,
              "features" => %{
                fields: %{
                  "payment_method_allow_redisplay_filters" => {:list, :scalar},
                  "payment_method_redisplay" => :scalar,
                  "payment_method_remove" => :scalar,
                  "payment_method_save" => :scalar,
                  "payment_method_save_allow_redisplay_override" => :scalar
                }
              }
            }
          },
          "payment_element" => %{
            fields: %{
              "enabled" => :scalar,
              "features" => %{
                fields: %{
                  "payment_method_allow_redisplay_filters" => {:list, :scalar},
                  "payment_method_redisplay" => :scalar,
                  "payment_method_redisplay_limit" => :scalar,
                  "payment_method_remove" => :scalar,
                  "payment_method_save" => :scalar,
                  "payment_method_save_usage" => :scalar
                }
              }
            }
          },
          "pricing_table" => %{
            fields: %{
              "enabled" => :scalar
            }
          }
        }
      }
    }
  end
end
