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
  * `device_type` - Device type of the reader. Possible values: `bbpos_chipper2x`, `bbpos_wisepad3`, `bbpos_wisepos_e`, `mobile_phone_reader`, `simulated_stripe_s700`, `simulated_wisepos_e`, `stripe_m2`, `stripe_s700`, `verifone_P400`.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `ip_address` - The local IP address of the reader. Max length: 5000. Nullable.
  * `label` - Custom label given to the reader for easier identification. Max length: 5000.
  * `last_seen_at` - The last time this reader reported to Stripe backend. Timestamp is measured in milliseconds since the Unix epoch. Unlike most other Stripe timestamp fields which use seconds, this field uses milliseconds. Format: Unix timestamp. Nullable.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `location` - The location identifier of the reader. Nullable. Expandable.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `terminal.reader`.
  * `serial_number` - Serial number of the reader. Max length: 5000.
  * `status` - The networking status of the reader. We do not recommend using this field in flows that may block taking payments. Possible values: `offline`, `online`. Nullable.
  """
  @type t :: %__MODULE__{
          action: action(),
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
  @type action :: %{
          optional(:collect_inputs) => action_collect_inputs() | nil,
          optional(:collect_payment_method) => action_collect_payment_method() | nil,
          optional(:confirm_payment_intent) => action_confirm_payment_intent() | nil,
          optional(:failure_code) => String.t() | nil,
          optional(:failure_message) => String.t() | nil,
          optional(:process_payment_intent) => action_process_payment_intent() | nil,
          optional(:process_setup_intent) => action_process_setup_intent() | nil,
          optional(:refund_payment) => action_refund_payment() | nil,
          optional(:set_reader_display) => action_set_reader_display() | nil,
          optional(:status) => String.t() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `inputs` - List of inputs to be collected.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Nullable.
  """
  @type action_collect_inputs :: %{
          optional(:inputs) => [action_collect_inputs_inputs()] | nil,
          optional(:metadata) => %{String.t() => String.t()} | nil,
          optional(String.t()) => term()
        }

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
  @type action_collect_inputs_inputs :: %{
          optional(:custom_text) => action_collect_inputs_inputs_custom_text() | nil,
          optional(:email) => action_collect_inputs_inputs_email() | nil,
          optional(:numeric) => action_collect_inputs_inputs_numeric() | nil,
          optional(:phone) => action_collect_inputs_inputs_phone() | nil,
          optional(:required) => boolean() | nil,
          optional(:selection) => action_collect_inputs_inputs_selection() | nil,
          optional(:signature) => action_collect_inputs_inputs_signature() | nil,
          optional(:skipped) => boolean() | nil,
          optional(:text) => action_collect_inputs_inputs_text() | nil,
          optional(:toggles) => [action_collect_inputs_inputs_toggles()] | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `description` - Customize the default description for this input Max length: 5000. Nullable.
  * `skip_button` - Customize the default label for this input's skip button Max length: 5000. Nullable.
  * `submit_button` - Customize the default label for this input's submit button Max length: 5000. Nullable.
  * `title` - Customize the default title for this input Max length: 5000. Nullable.
  """
  @type action_collect_inputs_inputs_custom_text :: %{
          optional(:description) => String.t() | nil,
          optional(:skip_button) => String.t() | nil,
          optional(:submit_button) => String.t() | nil,
          optional(:title) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `value` - The collected email address Max length: 5000. Nullable.
  """
  @type action_collect_inputs_inputs_email :: %{
          optional(:value) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `value` - The collected number Max length: 5000. Nullable.
  """
  @type action_collect_inputs_inputs_numeric :: %{
          optional(:value) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `value` - The collected phone number Max length: 5000. Nullable.
  """
  @type action_collect_inputs_inputs_phone :: %{
          optional(:value) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `choices` - List of possible choices to be selected
  * `id` - The id of the selected choice Max length: 5000. Nullable.
  * `text` - The text of the selected choice Max length: 5000. Nullable.
  """
  @type action_collect_inputs_inputs_selection :: %{
          optional(:choices) => [action_collect_inputs_inputs_selection_choices()] | nil,
          optional(:id) => String.t() | nil,
          optional(:text) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `id` - The identifier for the selected choice. Maximum 50 characters. Max length: 5000. Nullable.
  * `style` - The button style for the choice. Can be `primary` or `secondary`. Possible values: `primary`, `secondary`. Nullable.
  * `text` - The text to be selected. Maximum 30 characters. Max length: 5000.
  """
  @type action_collect_inputs_inputs_selection_choices :: %{
          optional(:id) => String.t() | nil,
          optional(:style) => String.t() | nil,
          optional(:text) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `value` - The File ID of a collected signature image Max length: 5000. Nullable.
  """
  @type action_collect_inputs_inputs_signature :: %{
          optional(:value) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `value` - The collected text value Max length: 5000. Nullable.
  """
  @type action_collect_inputs_inputs_text :: %{
          optional(:value) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `default_value` - The toggle's default value. Can be `enabled` or `disabled`. Possible values: `disabled`, `enabled`. Nullable.
  * `description` - The toggle's description text. Maximum 50 characters. Max length: 5000. Nullable.
  * `title` - The toggle's title text. Maximum 50 characters. Max length: 5000. Nullable.
  * `value` - The toggle's collected value. Can be `enabled` or `disabled`. Possible values: `disabled`, `enabled`. Nullable.
  """
  @type action_collect_inputs_inputs_toggles :: %{
          optional(:default_value) => String.t() | nil,
          optional(:description) => String.t() | nil,
          optional(:title) => String.t() | nil,
          optional(:value) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `collect_config`
  * `payment_intent` - Most recent PaymentIntent processed by the reader.
  * `payment_method`
  """
  @type action_collect_payment_method :: %{
          optional(:collect_config) => action_collect_payment_method_collect_config() | nil,
          optional(:payment_intent) => String.t() | Stripe.Resources.PaymentIntent.t() | nil,
          optional(:payment_method) => Stripe.Resources.PaymentMethod.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `enable_customer_cancellation` - Enable customer-initiated cancellation when processing this payment.
  * `skip_tipping` - Override showing a tipping selection screen on this transaction.
  * `tipping`
  """
  @type action_collect_payment_method_collect_config :: %{
          optional(:enable_customer_cancellation) => boolean() | nil,
          optional(:skip_tipping) => boolean() | nil,
          optional(:tipping) => action_collect_payment_method_collect_config_tipping() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `amount_eligible` - Amount used to calculate tip suggestions on tipping selection screen for this transaction. Must be a positive integer in the smallest currency unit (e.g., 100 cents to represent $1.00 or 100 to represent ¥100, a zero-decimal currency).
  """
  @type action_collect_payment_method_collect_config_tipping :: %{
          optional(:amount_eligible) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `confirm_config`
  * `payment_intent` - Most recent PaymentIntent processed by the reader.
  """
  @type action_confirm_payment_intent :: %{
          optional(:confirm_config) => action_confirm_payment_intent_confirm_config() | nil,
          optional(:payment_intent) => String.t() | Stripe.Resources.PaymentIntent.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `return_url` - If the customer doesn't abandon authenticating the payment, they're redirected to this URL after completion. Max length: 5000.
  """
  @type action_confirm_payment_intent_confirm_config :: %{
          optional(:return_url) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `payment_intent` - Most recent PaymentIntent processed by the reader.
  * `process_config`
  """
  @type action_process_payment_intent :: %{
          optional(:payment_intent) => String.t() | Stripe.Resources.PaymentIntent.t() | nil,
          optional(:process_config) => action_process_payment_intent_process_config() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `enable_customer_cancellation` - Enable customer-initiated cancellation when processing this payment.
  * `return_url` - If the customer doesn't abandon authenticating the payment, they're redirected to this URL after completion. Max length: 5000.
  * `skip_tipping` - Override showing a tipping selection screen on this transaction.
  * `tipping`
  """
  @type action_process_payment_intent_process_config :: %{
          optional(:enable_customer_cancellation) => boolean() | nil,
          optional(:return_url) => String.t() | nil,
          optional(:skip_tipping) => boolean() | nil,
          optional(:tipping) => action_process_payment_intent_process_config_tipping() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `amount_eligible` - Amount used to calculate tip suggestions on tipping selection screen for this transaction. Must be a positive integer in the smallest currency unit (e.g., 100 cents to represent $1.00 or 100 to represent ¥100, a zero-decimal currency).
  """
  @type action_process_payment_intent_process_config_tipping :: %{
          optional(:amount_eligible) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `generated_card` - ID of a card PaymentMethod generated from the card_present PaymentMethod that may be attached to a Customer for future transactions. Only present if it was possible to generate a card PaymentMethod. Max length: 5000.
  * `process_config`
  * `setup_intent` - Most recent SetupIntent processed by the reader.
  """
  @type action_process_setup_intent :: %{
          optional(:generated_card) => String.t() | nil,
          optional(:process_config) => action_process_setup_intent_process_config() | nil,
          optional(:setup_intent) => String.t() | Stripe.Resources.SetupIntent.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `enable_customer_cancellation` - Enable customer-initiated cancellation when processing this SetupIntent.
  """
  @type action_process_setup_intent_process_config :: %{
          optional(:enable_customer_cancellation) => boolean() | nil,
          optional(String.t()) => term()
        }

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
  @type action_refund_payment :: %{
          optional(:amount) => integer() | nil,
          optional(:charge) => String.t() | Stripe.Resources.Charge.t() | nil,
          optional(:metadata) => %{String.t() => String.t()} | nil,
          optional(:payment_intent) => String.t() | Stripe.Resources.PaymentIntent.t() | nil,
          optional(:reason) => String.t() | nil,
          optional(:refund) => String.t() | Stripe.Resources.Refund.t() | nil,
          optional(:refund_application_fee) => boolean() | nil,
          optional(:refund_payment_config) => action_refund_payment_refund_payment_config() | nil,
          optional(:reverse_transfer) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `enable_customer_cancellation` - Enable customer-initiated cancellation when refunding this payment.
  """
  @type action_refund_payment_refund_payment_config :: %{
          optional(:enable_customer_cancellation) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `cart` - Cart object to be displayed by the reader, including line items, amounts, and currency. Nullable.
  * `type` - Type of information to be displayed by the reader. Only `cart` is currently supported. Possible values: `cart`.
  """
  @type action_set_reader_display :: %{
          optional(:cart) => action_set_reader_display_cart() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `line_items` - List of line items in the cart.
  * `tax` - Tax amount for the entire cart. A positive integer in the [smallest currency unit](https://docs.stripe.com/currencies#zero-decimal). Nullable.
  * `total` - Total amount for the entire cart, including tax. A positive integer in the [smallest currency unit](https://docs.stripe.com/currencies#zero-decimal).
  """
  @type action_set_reader_display_cart :: %{
          optional(:currency) => String.t() | nil,
          optional(:line_items) => [action_set_reader_display_cart_line_items()] | nil,
          optional(:tax) => integer() | nil,
          optional(:total) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `amount` - The amount of the line item. A positive integer in the [smallest currency unit](https://docs.stripe.com/currencies#zero-decimal).
  * `description` - Description of the line item. Max length: 5000.
  * `quantity` - The quantity of the line item.
  """
  @type action_set_reader_display_cart_line_items :: %{
          optional(:amount) => integer() | nil,
          optional(:description) => String.t() | nil,
          optional(:quantity) => integer() | nil,
          optional(String.t()) => term()
        }

  def __nested_fields__ do
    %{
      "action" => %{
        fields: %{
          "collect_inputs" => %{
            fields: %{
              "inputs" =>
                {:list,
                 %{
                   fields: %{
                     "custom_text" => %{
                       fields: %{
                         "description" => :scalar,
                         "skip_button" => :scalar,
                         "submit_button" => :scalar,
                         "title" => :scalar
                       }
                     },
                     "email" => %{
                       fields: %{
                         "value" => :scalar
                       }
                     },
                     "numeric" => %{
                       fields: %{
                         "value" => :scalar
                       }
                     },
                     "phone" => %{
                       fields: %{
                         "value" => :scalar
                       }
                     },
                     "required" => :scalar,
                     "selection" => %{
                       fields: %{
                         "choices" =>
                           {:list,
                            %{
                              fields: %{
                                "id" => :scalar,
                                "style" => :scalar,
                                "text" => :scalar
                              }
                            }},
                         "id" => :scalar,
                         "text" => :scalar
                       }
                     },
                     "signature" => %{
                       fields: %{
                         "value" => :scalar
                       }
                     },
                     "skipped" => :scalar,
                     "text" => %{
                       fields: %{
                         "value" => :scalar
                       }
                     },
                     "toggles" =>
                       {:list,
                        %{
                          fields: %{
                            "default_value" => :scalar,
                            "description" => :scalar,
                            "title" => :scalar,
                            "value" => :scalar
                          }
                        }},
                     "type" => :scalar
                   }
                 }},
              "metadata" => {:map, :scalar}
            }
          },
          "collect_payment_method" => %{
            fields: %{
              "collect_config" => %{
                fields: %{
                  "enable_customer_cancellation" => :scalar,
                  "skip_tipping" => :scalar,
                  "tipping" => %{
                    fields: %{
                      "amount_eligible" => :scalar
                    }
                  }
                }
              },
              "payment_intent" => {:resource, Stripe.Resources.PaymentIntent},
              "payment_method" => {:resource, Stripe.Resources.PaymentMethod}
            }
          },
          "confirm_payment_intent" => %{
            fields: %{
              "confirm_config" => %{
                fields: %{
                  "return_url" => :scalar
                }
              },
              "payment_intent" => {:resource, Stripe.Resources.PaymentIntent}
            }
          },
          "failure_code" => :scalar,
          "failure_message" => :scalar,
          "process_payment_intent" => %{
            fields: %{
              "payment_intent" => {:resource, Stripe.Resources.PaymentIntent},
              "process_config" => %{
                fields: %{
                  "enable_customer_cancellation" => :scalar,
                  "return_url" => :scalar,
                  "skip_tipping" => :scalar,
                  "tipping" => %{
                    fields: %{
                      "amount_eligible" => :scalar
                    }
                  }
                }
              }
            }
          },
          "process_setup_intent" => %{
            fields: %{
              "generated_card" => :scalar,
              "process_config" => %{
                fields: %{
                  "enable_customer_cancellation" => :scalar
                }
              },
              "setup_intent" => {:resource, Stripe.Resources.SetupIntent}
            }
          },
          "refund_payment" => %{
            fields: %{
              "amount" => :scalar,
              "charge" => {:resource, Stripe.Resources.Charge},
              "metadata" => {:map, :scalar},
              "payment_intent" => {:resource, Stripe.Resources.PaymentIntent},
              "reason" => :scalar,
              "refund" => {:resource, Stripe.Resources.Refund},
              "refund_application_fee" => :scalar,
              "refund_payment_config" => %{
                fields: %{
                  "enable_customer_cancellation" => :scalar
                }
              },
              "reverse_transfer" => :scalar
            }
          },
          "set_reader_display" => %{
            fields: %{
              "cart" => %{
                fields: %{
                  "currency" => :scalar,
                  "line_items" =>
                    {:list,
                     %{
                       fields: %{
                         "amount" => :scalar,
                         "description" => :scalar,
                         "quantity" => :scalar
                       }
                     }},
                  "tax" => :scalar,
                  "total" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "status" => :scalar,
          "type" => :scalar
        }
      }
    }
  end
end
