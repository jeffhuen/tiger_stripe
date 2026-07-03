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
  * `device_type` - Device type of the reader. Possible values: `bbpos_chipper2x`, `bbpos_wisepad3`, `bbpos_wisepos_e`, `mobile_phone_reader`, `simulated_stripe_s700`, `simulated_stripe_s710`, `simulated_verifone_m425`, `simulated_verifone_p630`, `simulated_verifone_ux700`, `simulated_verifone_v660p`, `simulated_wisepos_e`, `stripe_m2`, `stripe_s700`, `stripe_s710`, `verifone_P400`, `verifone_m425`, `verifone_p630`, `verifone_ux700`, `verifone_v660p`.
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
  @type t :: %__MODULE__{}

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

  def __nested_fields__ do
    %{
      "action" => %{
        fields: %{
          "api_error" => {:resource, Stripe.Resources.StripeError},
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
          "print_content" => %{
            fields: %{
              "image" => %{
                fields: %{
                  "created_at" => :scalar,
                  "filename" => :scalar,
                  "size" => :scalar,
                  "type" => :scalar
                }
              },
              "type" => :scalar
            }
          },
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
