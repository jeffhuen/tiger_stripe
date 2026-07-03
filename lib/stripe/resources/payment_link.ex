# File generated from our OpenAPI spec
defmodule Stripe.Resources.PaymentLink do
  @moduledoc """
  PaymentLink

  A payment link is a shareable URL that will take your customers to a hosted payment page. A payment link can be shared and used multiple times.

  When a customer opens a payment link it will open a new [checkout session](https://docs.stripe.com/api/checkout/sessions) to render the payment page. You can use [checkout session events](https://docs.stripe.com/api/events/types#event_types-checkout.session.completed) to track payments through payment links.

  Related guide: [Payment Links API](https://docs.stripe.com/payment-links)
  """

  @typedoc """
  * `active` - Whether the payment link's `url` is active. If `false`, customers visiting the URL will be shown a page saying that the link has been deactivated.
  * `after_completion` - Expandable.
  * `allow_promotion_codes` - Whether user redeemable promotion codes are enabled.
  * `application` - The ID of the Connect application that created the Payment Link. Nullable. Expandable.
  * `application_fee_amount` - The amount of the application fee (if any) that will be requested to be applied to the payment and transferred to the application owner's Stripe account. Nullable.
  * `application_fee_percent` - This represents the percentage of the subscription invoice total that will be transferred to the application owner's Stripe account. Nullable.
  * `automatic_tax` - Expandable.
  * `billing_address_collection` - Configuration for collecting the customer's billing address. Defaults to `auto`. Possible values: `auto`, `required`.
  * `consent_collection` - When set, provides configuration to gather active consent from customers. Nullable. Expandable.
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `custom_fields` - Collect additional information from your customer using custom fields. Up to 3 fields are supported. You can't set this parameter if `ui_mode` is `custom`. Expandable.
  * `custom_text` - Expandable.
  * `customer_creation` - Configuration for Customer creation during checkout. Possible values: `always`, `if_required`.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `inactive_message` - The custom message to be displayed to a customer when a payment link is no longer active. Max length: 5000. Nullable.
  * `invoice_creation` - Configuration for creating invoice for payment mode payment links. Nullable. Expandable.
  * `line_items` - The line items representing what is being sold. Expandable.
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `managed_payments` - Settings for Managed Payments for this Payment Link and resulting [CheckoutSessions](https://docs.stripe.com/api/checkout/sessions/object), [PaymentIntents](https://docs.stripe.com/api/payment_intents/object), [Invoices](https://docs.stripe.com/api/invoices/object), and [Subscriptions](https://docs.stripe.com/api/subscriptions/object). Nullable. Expandable.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
  * `name_collection` - Expandable.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `payment_link`.
  * `on_behalf_of` - The account on behalf of which to charge. See the [Connect documentation](https://support.stripe.com/questions/sending-invoices-on-behalf-of-connected-accounts) for details. Nullable. Expandable.
  * `optional_items` - The optional items presented to the customer at checkout. Nullable. Expandable.
  * `payment_intent_data` - Indicates the parameters to be passed to PaymentIntent creation during checkout. Nullable. Expandable.
  * `payment_method_collection` - Configuration for collecting a payment method during checkout. Defaults to `always`. Possible values: `always`, `if_required`.
  * `payment_method_options` - Payment-method-specific configuration. Nullable. Expandable.
  * `payment_method_types` - The list of payment method types that customers can use. When `null`, Stripe will dynamically show relevant payment methods you've enabled in your [payment method settings](https://dashboard.stripe.com/settings/payment_methods). Nullable.
  * `phone_number_collection` - Expandable.
  * `restrictions` - Settings that restrict the usage of a payment link. Nullable. Expandable.
  * `shipping_address_collection` - Configuration for collecting the customer's shipping address. Nullable. Expandable.
  * `shipping_options` - The shipping rate options applied to the session. Expandable.
  * `submit_type` - Indicates the type of transaction being performed which customizes relevant text on the page, such as the submit button. Possible values: `auto`, `book`, `donate`, `pay`, `subscribe`.
  * `subscription_data` - When creating a subscription, the specified configuration data will be used. There must be at least one line item with a recurring price to use `subscription_data`. Nullable. Expandable.
  * `tax_id_collection` - Expandable.
  * `transfer_data` - The account (if any) the payments will be attributed to for tax reporting, and where funds from each payment will be transferred to. Nullable. Expandable.
  * `url` - The public URL that can be shared with customers. Max length: 5000.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :active,
    :after_completion,
    :allow_promotion_codes,
    :application,
    :application_fee_amount,
    :application_fee_percent,
    :automatic_tax,
    :billing_address_collection,
    :consent_collection,
    :currency,
    :custom_fields,
    :custom_text,
    :customer_creation,
    :id,
    :inactive_message,
    :invoice_creation,
    :line_items,
    :livemode,
    :managed_payments,
    :metadata,
    :name_collection,
    :object,
    :on_behalf_of,
    :optional_items,
    :payment_intent_data,
    :payment_method_collection,
    :payment_method_options,
    :payment_method_types,
    :phone_number_collection,
    :restrictions,
    :shipping_address_collection,
    :shipping_options,
    :submit_type,
    :subscription_data,
    :tax_id_collection,
    :transfer_data,
    :url
  ]

  @object_name "payment_link"
  def object_name, do: @object_name

  def expandable_fields,
    do: [
      "after_completion",
      "application",
      "automatic_tax",
      "consent_collection",
      "custom_fields",
      "custom_text",
      "invoice_creation",
      "line_items",
      "managed_payments",
      "name_collection",
      "on_behalf_of",
      "optional_items",
      "payment_intent_data",
      "payment_method_options",
      "phone_number_collection",
      "restrictions",
      "shipping_address_collection",
      "shipping_options",
      "subscription_data",
      "tax_id_collection",
      "transfer_data"
    ]

  def __nested_fields__ do
    %{
      "after_completion" => %{
        fields: %{
          "hosted_confirmation" => %{
            fields: %{
              "custom_message" => :scalar
            }
          },
          "redirect" => %{
            fields: %{
              "url" => :scalar
            }
          },
          "type" => :scalar
        }
      },
      "automatic_tax" => %{
        fields: %{
          "enabled" => :scalar,
          "liability" => %{
            fields: %{
              "account" => {:resource, Stripe.Resources.Account},
              "type" => :scalar
            }
          }
        }
      },
      "consent_collection" => %{
        fields: %{
          "payment_method_reuse_agreement" => %{
            fields: %{
              "position" => :scalar
            }
          },
          "promotions" => :scalar,
          "terms_of_service" => :scalar
        }
      },
      "custom_fields" => %{
        fields: %{
          "dropdown" => %{
            fields: %{
              "default_value" => :scalar,
              "options" => {:list, {:resource, Stripe.Resources.CustomFieldDropdownOption}}
            }
          },
          "key" => :scalar,
          "label" => %{
            fields: %{
              "custom" => :scalar,
              "type" => :scalar
            }
          },
          "numeric" => %{
            fields: %{
              "default_value" => :scalar,
              "maximum_length" => :scalar,
              "minimum_length" => :scalar
            }
          },
          "optional" => :scalar,
          "text" => %{
            fields: %{
              "default_value" => :scalar,
              "maximum_length" => :scalar,
              "minimum_length" => :scalar
            }
          },
          "type" => :scalar
        }
      },
      "custom_text" => %{
        fields: %{
          "after_submit" => %{
            fields: %{
              "message" => :scalar
            }
          },
          "shipping_address" => %{
            fields: %{
              "message" => :scalar
            }
          },
          "submit" => %{
            fields: %{
              "message" => :scalar
            }
          },
          "terms_of_service_acceptance" => %{
            fields: %{
              "message" => :scalar
            }
          }
        }
      },
      "invoice_creation" => %{
        fields: %{
          "enabled" => :scalar,
          "invoice_data" => %{
            fields: %{
              "account_tax_ids" => {:list, {:resource, Stripe.Resources.TaxId}},
              "custom_fields" =>
                {:list,
                 %{
                   fields: %{
                     "name" => :scalar,
                     "value" => :scalar
                   }
                 }},
              "description" => :scalar,
              "footer" => :scalar,
              "issuer" => %{
                fields: %{
                  "account" => {:resource, Stripe.Resources.Account},
                  "type" => :scalar
                }
              },
              "metadata" => {:map, :scalar},
              "rendering_options" => %{
                fields: %{
                  "amount_tax_display" => :scalar,
                  "template" => :scalar
                }
              }
            }
          }
        }
      },
      "line_items" => %{
        fields: %{
          "data" => {:list, {:resource, Stripe.Resources.LineItem}},
          "has_more" => :scalar,
          "object" => :scalar,
          "url" => :scalar
        }
      },
      "managed_payments" => %{
        fields: %{
          "enabled" => :scalar
        }
      },
      "name_collection" => %{
        fields: %{
          "business" => %{
            fields: %{
              "enabled" => :scalar,
              "optional" => :scalar
            }
          },
          "individual" => %{
            fields: %{
              "enabled" => :scalar,
              "optional" => :scalar
            }
          }
        }
      },
      "optional_items" => %{
        fields: %{
          "adjustable_quantity" => %{
            fields: %{
              "enabled" => :scalar,
              "maximum" => :scalar,
              "minimum" => :scalar
            }
          },
          "price" => :scalar,
          "quantity" => :scalar
        }
      },
      "payment_intent_data" => %{
        fields: %{
          "capture_method" => :scalar,
          "description" => :scalar,
          "metadata" => {:map, :scalar},
          "setup_future_usage" => :scalar,
          "statement_descriptor" => :scalar,
          "statement_descriptor_suffix" => :scalar,
          "transfer_group" => :scalar
        }
      },
      "payment_method_options" => %{
        fields: %{
          "card" => %{
            fields: %{
              "restrictions" => %{
                fields: %{
                  "brands_blocked" => {:list, :scalar}
                }
              }
            }
          }
        }
      },
      "phone_number_collection" => %{
        fields: %{
          "enabled" => :scalar
        }
      },
      "restrictions" => %{
        fields: %{
          "completed_sessions" => %{
            fields: %{
              "count" => :scalar,
              "limit" => :scalar
            }
          }
        }
      },
      "shipping_address_collection" => %{
        fields: %{
          "allowed_countries" => {:list, :scalar}
        }
      },
      "shipping_options" => %{
        fields: %{
          "shipping_amount" => :scalar,
          "shipping_rate" => {:resource, Stripe.Resources.ShippingRate}
        }
      },
      "subscription_data" => %{
        fields: %{
          "description" => :scalar,
          "invoice_settings" => %{
            fields: %{
              "issuer" => %{
                fields: %{
                  "account" => {:resource, Stripe.Resources.Account},
                  "type" => :scalar
                }
              }
            }
          },
          "metadata" => {:map, :scalar},
          "trial_period_days" => :scalar,
          "trial_settings" => %{
            fields: %{
              "end_behavior" => %{
                fields: %{
                  "missing_payment_method" => :scalar
                }
              }
            }
          }
        }
      },
      "tax_id_collection" => %{
        fields: %{
          "enabled" => :scalar,
          "required" => :scalar
        }
      },
      "transfer_data" => %{
        fields: %{
          "amount" => :scalar,
          "destination" => {:resource, Stripe.Resources.Account}
        }
      }
    }
  end
end
