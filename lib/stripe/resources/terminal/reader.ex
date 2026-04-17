# File generated from our OpenAPI spec
defmodule Stripe.Resources.Terminal.Reader do
  @moduledoc """
  TerminalReaderReader

  A Reader represents a physical device for accepting payment details.

  Related guide: [Connecting to a reader](https://docs.stripe.com/terminal/payments/connect-reader)
  """

  @typedoc """
  * `action` - The most recent action performed by the reader. Nullable. Expandable.
  * `device_sw_version` - The current software version of the reader. Max length: 5000. Nullable.
  * `device_type` - Device type of the reader. Possible values: `bbpos_chipper2x`, `bbpos_wisepad3`, `bbpos_wisepos_e`, `mobile_phone_reader`, `simulated_stripe_s700`, `simulated_stripe_s710`, `simulated_wisepos_e`, `stripe_m2`, `stripe_s700`, `stripe_s710`, `verifone_P400`.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `ip_address` - The local IP address of the reader. Max length: 5000. Nullable.
  * `label` - Custom label given to the reader for easier identification. Max length: 5000.
  * `last_seen_at` - The last time this reader reported to Stripe backend. Timestamp is measured in milliseconds since the Unix epoch. Unlike most other Stripe timestamp fields which use seconds, this field uses milliseconds. Format: Unix timestamp. Nullable.
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `location` - The location identifier of the reader. Nullable. Expandable.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `terminal.reader`.
  * `serial_number` - Serial number of the reader. Max length: 5000.
  * `status` - The networking status of the reader. We do not recommend using this field in flows that may block taking payments. Possible values: `offline`, `online`. Nullable.
  """
  @type t :: %__MODULE__{
          action: __MODULE__.Action.t(),
          device_sw_version: String.t(),
          device_type: String.t(),
          id: String.t(),
          ip_address: String.t(),
          label: String.t(),
          last_seen_at: integer(),
          livemode: boolean(),
          location: String.t() | Stripe.Resources.Terminal.Location.t(),
          metadata: %{String.t() => String.t()},
          object: String.t(),
          serial_number: String.t(),
          status: String.t()
        }

  defstruct [
    :action,
    :device_sw_version,
    :device_type,
    :id,
    :ip_address,
    :label,
    :last_seen_at,
    :livemode,
    :location,
    :metadata,
    :object,
    :serial_number,
    :status
  ]

  @object_name "terminal.reader"
  def object_name, do: @object_name

  def expandable_fields, do: ["action", "location"]

  defmodule Action do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `collect_inputs`
    * `collect_payment_method`
    * `confirm_payment_intent`
    * `failure_code` - Failure code, only set if status is `failed`. Max length: 5000. Nullable.
    * `failure_message` - Detailed failure message, only set if status is `failed`. Max length: 5000. Nullable.
    * `process_payment_intent`
    * `process_setup_intent`
    * `refund_payment`
    * `set_reader_display`
    * `status` - Status of the action performed by the reader. Possible values: `failed`, `in_progress`, `succeeded`.
    * `type` - Type of action performed by the reader. Possible values: `collect_inputs`, `collect_payment_method`, `confirm_payment_intent`, `process_payment_intent`, `process_setup_intent`, `refund_payment`, `set_reader_display`.
    """
    @type t :: %__MODULE__{
            collect_inputs: __MODULE__.CollectInputs.t() | nil,
            collect_payment_method: __MODULE__.CollectPaymentMethod.t() | nil,
            confirm_payment_intent: __MODULE__.ConfirmPaymentIntent.t() | nil,
            failure_code: String.t() | nil,
            failure_message: String.t() | nil,
            process_payment_intent: __MODULE__.ProcessPaymentIntent.t() | nil,
            process_setup_intent: __MODULE__.ProcessSetupIntent.t() | nil,
            refund_payment: __MODULE__.RefundPayment.t() | nil,
            set_reader_display: __MODULE__.SetReaderDisplay.t() | nil,
            status: String.t() | nil,
            type: String.t() | nil
          }
    defstruct [
      :collect_inputs,
      :collect_payment_method,
      :confirm_payment_intent,
      :failure_code,
      :failure_message,
      :process_payment_intent,
      :process_setup_intent,
      :refund_payment,
      :set_reader_display,
      :status,
      :type
    ]

    defmodule CollectInputs do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `inputs` - List of inputs to be collected.
      * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Nullable.
      """
      @type t :: %__MODULE__{
              inputs: [__MODULE__.Inputs.t()] | nil,
              metadata: %{String.t() => String.t()} | nil
            }
      defstruct [:inputs, :metadata]

      defmodule Inputs do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `custom_text` - Default text of input being collected. Nullable.
        * `email`
        * `numeric`
        * `phone`
        * `required` - Indicate that this input is required, disabling the skip button. Nullable.
        * `selection`
        * `signature`
        * `skipped` - Indicate that this input was skipped by the user.
        * `text`
        * `toggles` - List of toggles being collected. Values are present if collection is complete. Nullable.
        * `type` - Type of input being collected. Possible values: `email`, `numeric`, `phone`, `selection`, `signature`, `text`.
        """
        @type t :: %__MODULE__{
                custom_text: __MODULE__.CustomText.t() | nil,
                email: __MODULE__.Email.t() | nil,
                numeric: __MODULE__.Numeric.t() | nil,
                phone: __MODULE__.Phone.t() | nil,
                required: boolean() | nil,
                selection: __MODULE__.Selection.t() | nil,
                signature: __MODULE__.Signature.t() | nil,
                skipped: boolean() | nil,
                text: __MODULE__.Text.t() | nil,
                toggles: [__MODULE__.Toggles.t()] | nil,
                type: String.t() | nil
              }
        defstruct [
          :custom_text,
          :email,
          :numeric,
          :phone,
          :required,
          :selection,
          :signature,
          :skipped,
          :text,
          :toggles,
          :type
        ]

        defmodule CustomText do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `description` - Customize the default description for this input Max length: 5000. Nullable.
          * `skip_button` - Customize the default label for this input's skip button Max length: 5000. Nullable.
          * `submit_button` - Customize the default label for this input's submit button Max length: 5000. Nullable.
          * `title` - Customize the default title for this input Max length: 5000. Nullable.
          """
          @type t :: %__MODULE__{
                  description: String.t() | nil,
                  skip_button: String.t() | nil,
                  submit_button: String.t() | nil,
                  title: String.t() | nil
                }
          defstruct [:description, :skip_button, :submit_button, :title]
        end

        defmodule Email do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `value` - The collected email address Max length: 5000. Nullable.
          """
          @type t :: %__MODULE__{
                  value: String.t() | nil
                }
          defstruct [:value]
        end

        defmodule Numeric do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `value` - The collected number Max length: 5000. Nullable.
          """
          @type t :: %__MODULE__{
                  value: String.t() | nil
                }
          defstruct [:value]
        end

        defmodule Phone do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `value` - The collected phone number Max length: 5000. Nullable.
          """
          @type t :: %__MODULE__{
                  value: String.t() | nil
                }
          defstruct [:value]
        end

        defmodule Selection do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `choices` - List of possible choices to be selected
          * `id` - The id of the selected choice Max length: 5000. Nullable.
          * `text` - The text of the selected choice Max length: 5000. Nullable.
          """
          @type t :: %__MODULE__{
                  choices: [__MODULE__.Choices.t()] | nil,
                  id: String.t() | nil,
                  text: String.t() | nil
                }
          defstruct [:choices, :id, :text]

          defmodule Choices do
            @moduledoc "Nested struct within the parent resource."

            @typedoc """
            * `id` - The identifier for the selected choice. Maximum 50 characters. Max length: 5000. Nullable.
            * `style` - The button style for the choice. Can be `primary` or `secondary`. Possible values: `primary`, `secondary`. Nullable.
            * `text` - The text to be selected. Maximum 30 characters. Max length: 5000.
            """
            @type t :: %__MODULE__{
                    id: String.t() | nil,
                    style: String.t() | nil,
                    text: String.t() | nil
                  }
            defstruct [:id, :style, :text]
          end

          def __inner_types__ do
            %{
              "choices" => __MODULE__.Choices
            }
          end
        end

        defmodule Signature do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `value` - The File ID of a collected signature image Max length: 5000. Nullable.
          """
          @type t :: %__MODULE__{
                  value: String.t() | nil
                }
          defstruct [:value]
        end

        defmodule Text do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `value` - The collected text value Max length: 5000. Nullable.
          """
          @type t :: %__MODULE__{
                  value: String.t() | nil
                }
          defstruct [:value]
        end

        defmodule Toggles do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `default_value` - The toggle's default value. Can be `enabled` or `disabled`. Possible values: `disabled`, `enabled`. Nullable.
          * `description` - The toggle's description text. Maximum 50 characters. Max length: 5000. Nullable.
          * `title` - The toggle's title text. Maximum 50 characters. Max length: 5000. Nullable.
          * `value` - The toggle's collected value. Can be `enabled` or `disabled`. Possible values: `disabled`, `enabled`. Nullable.
          """
          @type t :: %__MODULE__{
                  default_value: String.t() | nil,
                  description: String.t() | nil,
                  title: String.t() | nil,
                  value: String.t() | nil
                }
          defstruct [:default_value, :description, :title, :value]
        end

        def __inner_types__ do
          %{
            "custom_text" => __MODULE__.CustomText,
            "email" => __MODULE__.Email,
            "numeric" => __MODULE__.Numeric,
            "phone" => __MODULE__.Phone,
            "selection" => __MODULE__.Selection,
            "signature" => __MODULE__.Signature,
            "text" => __MODULE__.Text,
            "toggles" => __MODULE__.Toggles
          }
        end
      end

      def __inner_types__ do
        %{
          "inputs" => __MODULE__.Inputs
        }
      end
    end

    defmodule CollectPaymentMethod do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `collect_config`
      * `payment_intent` - Most recent PaymentIntent processed by the reader.
      * `payment_method`
      """
      @type t :: %__MODULE__{
              collect_config: __MODULE__.CollectConfig.t() | nil,
              payment_intent: String.t() | Stripe.Resources.PaymentIntent.t() | nil,
              payment_method: Stripe.Resources.PaymentMethod.t() | nil
            }
      defstruct [:collect_config, :payment_intent, :payment_method]

      defmodule CollectConfig do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `enable_customer_cancellation` - Enable customer-initiated cancellation when processing this payment.
        * `skip_tipping` - Override showing a tipping selection screen on this transaction.
        * `tipping`
        """
        @type t :: %__MODULE__{
                enable_customer_cancellation: boolean() | nil,
                skip_tipping: boolean() | nil,
                tipping: __MODULE__.Tipping.t() | nil
              }
        defstruct [:enable_customer_cancellation, :skip_tipping, :tipping]

        defmodule Tipping do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `amount_eligible` - Amount used to calculate tip suggestions on tipping selection screen for this transaction. Must be a positive integer in the smallest currency unit (e.g., 100 cents to represent $1.00 or 100 to represent ¥100, a zero-decimal currency).
          """
          @type t :: %__MODULE__{
                  amount_eligible: integer() | nil
                }
          defstruct [:amount_eligible]
        end

        def __inner_types__ do
          %{
            "tipping" => __MODULE__.Tipping
          }
        end
      end

      def __inner_types__ do
        %{
          "collect_config" => __MODULE__.CollectConfig
        }
      end
    end

    defmodule ConfirmPaymentIntent do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `confirm_config`
      * `payment_intent` - Most recent PaymentIntent processed by the reader.
      """
      @type t :: %__MODULE__{
              confirm_config: __MODULE__.ConfirmConfig.t() | nil,
              payment_intent: String.t() | Stripe.Resources.PaymentIntent.t() | nil
            }
      defstruct [:confirm_config, :payment_intent]

      defmodule ConfirmConfig do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `return_url` - If the customer doesn't abandon authenticating the payment, they're redirected to this URL after completion. Max length: 5000.
        """
        @type t :: %__MODULE__{
                return_url: String.t() | nil
              }
        defstruct [:return_url]
      end

      def __inner_types__ do
        %{
          "confirm_config" => __MODULE__.ConfirmConfig
        }
      end
    end

    defmodule ProcessPaymentIntent do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `payment_intent` - Most recent PaymentIntent processed by the reader.
      * `process_config`
      """
      @type t :: %__MODULE__{
              payment_intent: String.t() | Stripe.Resources.PaymentIntent.t() | nil,
              process_config: __MODULE__.ProcessConfig.t() | nil
            }
      defstruct [:payment_intent, :process_config]

      defmodule ProcessConfig do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `enable_customer_cancellation` - Enable customer-initiated cancellation when processing this payment.
        * `return_url` - If the customer doesn't abandon authenticating the payment, they're redirected to this URL after completion. Max length: 5000.
        * `skip_tipping` - Override showing a tipping selection screen on this transaction.
        * `tipping`
        """
        @type t :: %__MODULE__{
                enable_customer_cancellation: boolean() | nil,
                return_url: String.t() | nil,
                skip_tipping: boolean() | nil,
                tipping: __MODULE__.Tipping.t() | nil
              }
        defstruct [:enable_customer_cancellation, :return_url, :skip_tipping, :tipping]

        defmodule Tipping do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `amount_eligible` - Amount used to calculate tip suggestions on tipping selection screen for this transaction. Must be a positive integer in the smallest currency unit (e.g., 100 cents to represent $1.00 or 100 to represent ¥100, a zero-decimal currency).
          """
          @type t :: %__MODULE__{
                  amount_eligible: integer() | nil
                }
          defstruct [:amount_eligible]
        end

        def __inner_types__ do
          %{
            "tipping" => __MODULE__.Tipping
          }
        end
      end

      def __inner_types__ do
        %{
          "process_config" => __MODULE__.ProcessConfig
        }
      end
    end

    defmodule ProcessSetupIntent do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `generated_card` - ID of a card PaymentMethod generated from the card_present PaymentMethod that may be attached to a Customer for future transactions. Only present if it was possible to generate a card PaymentMethod. Max length: 5000.
      * `process_config`
      * `setup_intent` - Most recent SetupIntent processed by the reader.
      """
      @type t :: %__MODULE__{
              generated_card: String.t() | nil,
              process_config: __MODULE__.ProcessConfig.t() | nil,
              setup_intent: String.t() | Stripe.Resources.SetupIntent.t() | nil
            }
      defstruct [:generated_card, :process_config, :setup_intent]

      defmodule ProcessConfig do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `enable_customer_cancellation` - Enable customer-initiated cancellation when processing this SetupIntent.
        """
        @type t :: %__MODULE__{
                enable_customer_cancellation: boolean() | nil
              }
        defstruct [:enable_customer_cancellation]
      end

      def __inner_types__ do
        %{
          "process_config" => __MODULE__.ProcessConfig
        }
      end
    end

    defmodule RefundPayment do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `amount` - The amount being refunded.
      * `charge` - Charge that is being refunded.
      * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
      * `payment_intent` - Payment intent that is being refunded.
      * `reason` - The reason for the refund. Possible values: `duplicate`, `fraudulent`, `requested_by_customer`.
      * `refund` - Unique identifier for the refund object.
      * `refund_application_fee` - Boolean indicating whether the application fee should be refunded when refunding this charge. If a full charge refund is given, the full application fee will be refunded. Otherwise, the application fee will be refunded in an amount proportional to the amount of the charge refunded. An application fee can be refunded only by the application that created the charge.
      * `refund_payment_config`
      * `reverse_transfer` - Boolean indicating whether the transfer should be reversed when refunding this charge. The transfer will be reversed proportionally to the amount being refunded (either the entire or partial amount). A transfer can be reversed only by the application that created the charge.
      """
      @type t :: %__MODULE__{
              amount: integer() | nil,
              charge: String.t() | Stripe.Resources.Charge.t() | nil,
              metadata: %{String.t() => String.t()} | nil,
              payment_intent: String.t() | Stripe.Resources.PaymentIntent.t() | nil,
              reason: String.t() | nil,
              refund: String.t() | Stripe.Resources.Refund.t() | nil,
              refund_application_fee: boolean() | nil,
              refund_payment_config: __MODULE__.RefundPaymentConfig.t() | nil,
              reverse_transfer: boolean() | nil
            }
      defstruct [
        :amount,
        :charge,
        :metadata,
        :payment_intent,
        :reason,
        :refund,
        :refund_application_fee,
        :refund_payment_config,
        :reverse_transfer
      ]

      defmodule RefundPaymentConfig do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `enable_customer_cancellation` - Enable customer-initiated cancellation when refunding this payment.
        """
        @type t :: %__MODULE__{
                enable_customer_cancellation: boolean() | nil
              }
        defstruct [:enable_customer_cancellation]
      end

      def __inner_types__ do
        %{
          "refund_payment_config" => __MODULE__.RefundPaymentConfig
        }
      end
    end

    defmodule SetReaderDisplay do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `cart` - Cart object to be displayed by the reader, including line items, amounts, and currency. Nullable.
      * `type` - Type of information to be displayed by the reader. Only `cart` is currently supported. Possible values: `cart`.
      """
      @type t :: %__MODULE__{
              cart: __MODULE__.Cart.t() | nil,
              type: String.t() | nil
            }
      defstruct [:cart, :type]

      defmodule Cart do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
        * `line_items` - List of line items in the cart.
        * `tax` - Tax amount for the entire cart. A positive integer in the [smallest currency unit](https://docs.stripe.com/currencies#zero-decimal). Nullable.
        * `total` - Total amount for the entire cart, including tax. A positive integer in the [smallest currency unit](https://docs.stripe.com/currencies#zero-decimal).
        """
        @type t :: %__MODULE__{
                currency: String.t() | nil,
                line_items: [__MODULE__.LineItems.t()] | nil,
                tax: integer() | nil,
                total: integer() | nil
              }
        defstruct [:currency, :line_items, :tax, :total]

        defmodule LineItems do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `amount` - The amount of the line item. A positive integer in the [smallest currency unit](https://docs.stripe.com/currencies#zero-decimal).
          * `description` - Description of the line item. Max length: 5000.
          * `quantity` - The quantity of the line item.
          """
          @type t :: %__MODULE__{
                  amount: integer() | nil,
                  description: String.t() | nil,
                  quantity: integer() | nil
                }
          defstruct [:amount, :description, :quantity]
        end

        def __inner_types__ do
          %{
            "line_items" => __MODULE__.LineItems
          }
        end
      end

      def __inner_types__ do
        %{
          "cart" => __MODULE__.Cart
        }
      end
    end

    def __inner_types__ do
      %{
        "collect_inputs" => __MODULE__.CollectInputs,
        "collect_payment_method" => __MODULE__.CollectPaymentMethod,
        "confirm_payment_intent" => __MODULE__.ConfirmPaymentIntent,
        "process_payment_intent" => __MODULE__.ProcessPaymentIntent,
        "process_setup_intent" => __MODULE__.ProcessSetupIntent,
        "refund_payment" => __MODULE__.RefundPayment,
        "set_reader_display" => __MODULE__.SetReaderDisplay
      }
    end
  end

  def __inner_types__ do
    %{
      "action" => __MODULE__.Action
    }
  end
end
