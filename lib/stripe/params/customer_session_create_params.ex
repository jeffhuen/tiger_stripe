# File generated from our OpenAPI spec
defmodule Stripe.Params.CustomerSessionCreateParams do
  @moduledoc "Parameters for customer session create."

  @typedoc """
  * `components` - Configuration for each component. At least 1 component must be enabled.
  * `customer` - The ID of an existing customer for which to create the Customer Session. Max length: 5000.
  * `customer_account` - The ID of an existing Account for which to create the Customer Session. Max length: 5000.
  * `expand` - Specifies which fields in the response should be expanded.
  """
  @type t :: %__MODULE__{
          components: __MODULE__.Components.t(),
          customer: String.t() | nil,
          customer_account: String.t() | nil,
          expand: [String.t()] | nil
        }

  defstruct [:components, :customer, :customer_account, :expand]

  defmodule Components do
    @moduledoc "Nested parameters."

    @typedoc """
    * `buy_button` - Configuration for buy button.
    * `customer_sheet` - Configuration for the customer sheet.
    * `mobile_payment_element` - Configuration for the mobile payment element.
    * `payment_element` - Configuration for the Payment Element.
    * `pricing_table` - Configuration for the pricing table.
    """
    @type t :: %__MODULE__{
            buy_button: __MODULE__.BuyButton.t() | nil,
            customer_sheet: __MODULE__.CustomerSheet.t() | nil,
            mobile_payment_element: __MODULE__.MobilePaymentElement.t() | nil,
            payment_element: __MODULE__.PaymentElement.t() | nil,
            pricing_table: __MODULE__.PricingTable.t() | nil
          }
    defstruct [
      :buy_button,
      :customer_sheet,
      :mobile_payment_element,
      :payment_element,
      :pricing_table
    ]

    defmodule BuyButton do
      @moduledoc "Nested parameters."

      @typedoc """
      * `enabled` - Whether the buy button is enabled.
      """
      @type t :: %__MODULE__{
              enabled: boolean() | nil
            }
      defstruct [:enabled]
    end

    defmodule CustomerSheet do
      @moduledoc "Nested parameters."

      @typedoc """
      * `enabled` - Whether the customer sheet is enabled.
      * `features` - This hash defines whether the customer sheet supports certain features.
      """
      @type t :: %__MODULE__{
              enabled: boolean() | nil,
              features: __MODULE__.Features.t() | nil
            }
      defstruct [:enabled, :features]

      defmodule Features do
        @moduledoc "Nested parameters."

        @typedoc """
        * `payment_method_allow_redisplay_filters` - A list of [`allow_redisplay`](https://docs.stripe.com/api/payment_methods/object#payment_method_object-allow_redisplay) values that controls which saved payment methods the customer sheet displays by filtering to only show payment methods with an `allow_redisplay` value that is present in this list.

        If not specified, defaults to ["always"]. In order to display all saved payment methods, specify ["always", "limited", "unspecified"].
        * `payment_method_remove` - Controls whether the customer sheet displays the option to remove a saved payment method."

        Allowing buyers to remove their saved payment methods impacts subscriptions that depend on that payment method. Removing the payment method detaches the [`customer` object](https://docs.stripe.com/api/payment_methods/object#payment_method_object-customer) from that [PaymentMethod](https://docs.stripe.com/api/payment_methods). Possible values: `disabled`, `enabled`.
        """
        @type t :: %__MODULE__{
                payment_method_allow_redisplay_filters: [String.t()] | nil,
                payment_method_remove: String.t() | nil
              }
        defstruct [:payment_method_allow_redisplay_filters, :payment_method_remove]
      end
    end

    defmodule MobilePaymentElement do
      @moduledoc "Nested parameters."

      @typedoc """
      * `enabled` - Whether the mobile payment element is enabled.
      * `features` - This hash defines whether the mobile payment element supports certain features.
      """
      @type t :: %__MODULE__{
              enabled: boolean() | nil,
              features: __MODULE__.Features.t() | nil
            }
      defstruct [:enabled, :features]

      defmodule Features do
        @moduledoc "Nested parameters."

        @typedoc """
        * `payment_method_allow_redisplay_filters` - A list of [`allow_redisplay`](https://docs.stripe.com/api/payment_methods/object#payment_method_object-allow_redisplay) values that controls which saved payment methods the mobile payment element displays by filtering to only show payment methods with an `allow_redisplay` value that is present in this list.

        If not specified, defaults to ["always"]. In order to display all saved payment methods, specify ["always", "limited", "unspecified"].
        * `payment_method_redisplay` - Controls whether or not the mobile payment element shows saved payment methods. Possible values: `disabled`, `enabled`.
        * `payment_method_remove` - Controls whether the mobile payment element displays the option to remove a saved payment method."

        Allowing buyers to remove their saved payment methods impacts subscriptions that depend on that payment method. Removing the payment method detaches the [`customer` object](https://docs.stripe.com/api/payment_methods/object#payment_method_object-customer) from that [PaymentMethod](https://docs.stripe.com/api/payment_methods). Possible values: `disabled`, `enabled`.
        * `payment_method_save` - Controls whether the mobile payment element displays a checkbox offering to save a new payment method.

        If a customer checks the box, the [`allow_redisplay`](https://docs.stripe.com/api/payment_methods/object#payment_method_object-allow_redisplay) value on the PaymentMethod is set to `'always'` at confirmation time. For PaymentIntents, the [`setup_future_usage`](https://docs.stripe.com/api/payment_intents/object#payment_intent_object-setup_future_usage) value is also set to the value defined in `payment_method_save_usage`. Possible values: `disabled`, `enabled`.
        * `payment_method_save_allow_redisplay_override` - Allows overriding the value of allow_override when saving a new payment method when payment_method_save is set to disabled. Use values: "always", "limited", or "unspecified".

        If not specified, defaults to `nil` (no override value). Possible values: `always`, `limited`, `unspecified`.
        """
        @type t :: %__MODULE__{
                payment_method_allow_redisplay_filters: [String.t()] | nil,
                payment_method_redisplay: String.t() | nil,
                payment_method_remove: String.t() | nil,
                payment_method_save: String.t() | nil,
                payment_method_save_allow_redisplay_override: String.t() | nil
              }
        defstruct [
          :payment_method_allow_redisplay_filters,
          :payment_method_redisplay,
          :payment_method_remove,
          :payment_method_save,
          :payment_method_save_allow_redisplay_override
        ]
      end
    end

    defmodule PaymentElement do
      @moduledoc "Nested parameters."

      @typedoc """
      * `enabled` - Whether the Payment Element is enabled.
      * `features` - This hash defines whether the Payment Element supports certain features.
      """
      @type t :: %__MODULE__{
              enabled: boolean() | nil,
              features: __MODULE__.Features.t() | nil
            }
      defstruct [:enabled, :features]

      defmodule Features do
        @moduledoc "Nested parameters."

        @typedoc """
        * `payment_method_allow_redisplay_filters` - A list of [`allow_redisplay`](https://docs.stripe.com/api/payment_methods/object#payment_method_object-allow_redisplay) values that controls which saved payment methods the Payment Element displays by filtering to only show payment methods with an `allow_redisplay` value that is present in this list.

        If not specified, defaults to ["always"]. In order to display all saved payment methods, specify ["always", "limited", "unspecified"].
        * `payment_method_redisplay` - Controls whether or not the Payment Element shows saved payment methods. This parameter defaults to `disabled`. Possible values: `disabled`, `enabled`.
        * `payment_method_redisplay_limit` - Determines the max number of saved payment methods for the Payment Element to display. This parameter defaults to `3`. The maximum redisplay limit is `10`.
        * `payment_method_remove` - Controls whether the Payment Element displays the option to remove a saved payment method. This parameter defaults to `disabled`.

        Allowing buyers to remove their saved payment methods impacts subscriptions that depend on that payment method. Removing the payment method detaches the [`customer` object](https://docs.stripe.com/api/payment_methods/object#payment_method_object-customer) from that [PaymentMethod](https://docs.stripe.com/api/payment_methods). Possible values: `disabled`, `enabled`.
        * `payment_method_save` - Controls whether the Payment Element displays a checkbox offering to save a new payment method. This parameter defaults to `disabled`.

        If a customer checks the box, the [`allow_redisplay`](https://docs.stripe.com/api/payment_methods/object#payment_method_object-allow_redisplay) value on the PaymentMethod is set to `'always'` at confirmation time. For PaymentIntents, the [`setup_future_usage`](https://docs.stripe.com/api/payment_intents/object#payment_intent_object-setup_future_usage) value is also set to the value defined in `payment_method_save_usage`. Possible values: `disabled`, `enabled`.
        * `payment_method_save_usage` - When using PaymentIntents and the customer checks the save checkbox, this field determines the [`setup_future_usage`](https://docs.stripe.com/api/payment_intents/object#payment_intent_object-setup_future_usage) value used to confirm the PaymentIntent.

        When using SetupIntents, directly configure the [`usage`](https://docs.stripe.com/api/setup_intents/object#setup_intent_object-usage) value on SetupIntent creation. Possible values: `off_session`, `on_session`.
        """
        @type t :: %__MODULE__{
                payment_method_allow_redisplay_filters: [String.t()] | nil,
                payment_method_redisplay: String.t() | nil,
                payment_method_redisplay_limit: integer() | nil,
                payment_method_remove: String.t() | nil,
                payment_method_save: String.t() | nil,
                payment_method_save_usage: String.t() | nil
              }
        defstruct [
          :payment_method_allow_redisplay_filters,
          :payment_method_redisplay,
          :payment_method_redisplay_limit,
          :payment_method_remove,
          :payment_method_save,
          :payment_method_save_usage
        ]
      end
    end

    defmodule PricingTable do
      @moduledoc "Nested parameters."

      @typedoc """
      * `enabled` - Whether the pricing table is enabled.
      """
      @type t :: %__MODULE__{
              enabled: boolean() | nil
            }
      defstruct [:enabled]
    end
  end
end
