# File generated from our OpenAPI spec
defmodule Stripe.Resources.Checkout.Session do
  @moduledoc """
  Session

  A Checkout Session represents your customer's session as they pay for
  one-time purchases or subscriptions through [Checkout](https://docs.stripe.com/payments/checkout)
  or [Payment Links](https://docs.stripe.com/payments/payment-links). We recommend creating a
  new Session each time your customer attempts to pay.

  Once payment is successful, the Checkout Session will contain a reference
  to the [Customer](https://docs.stripe.com/api/customers), and either the successful
  [PaymentIntent](https://docs.stripe.com/api/payment_intents) or an active
  [Subscription](https://docs.stripe.com/api/subscriptions).

  You can create a Checkout Session on your server and redirect to its URL
  to begin Checkout.

  Related guide: [Checkout quickstart](https://docs.stripe.com/checkout/quickstart)
  """

  @typedoc """
  * `adaptive_pricing` - Settings for price localization with [Adaptive Pricing](https://docs.stripe.com/payments/checkout/adaptive-pricing). Nullable. Expandable.
  * `after_expiration` - When set, provides configuration for actions to take if this Checkout Session expires. Nullable. Expandable.
  * `allow_promotion_codes` - Enables user redeemable promotion codes. Nullable.
  * `amount_subtotal` - Total of all items before discounts or taxes are applied. Nullable.
  * `amount_total` - Total of all items after discounts and taxes are applied. Nullable.
  * `automatic_tax` - Expandable.
  * `billing_address_collection` - Describes whether Checkout should collect the customer's billing address. Defaults to `auto`. Possible values: `auto`, `required`. Nullable.
  * `branding_settings` - Expandable.
  * `cancel_url` - If set, Checkout displays a back button and customers will be directed to this URL if they decide to cancel payment and return to your website. Max length: 5000. Nullable.
  * `client_reference_id` - A unique string to reference the Checkout Session. This can be a
  customer ID, a cart ID, or similar, and can be used to reconcile the
  Session with your internal systems. Max length: 5000. Nullable.
  * `client_secret` - The client secret of your Checkout Session. Applies to Checkout Sessions with `ui_mode: embedded` or `ui_mode: custom`. For `ui_mode: embedded`, the client secret is to be used when initializing Stripe.js embedded checkout.
  For `ui_mode: custom`, use the client secret with [initCheckout](https://docs.stripe.com/js/custom_checkout/init) on your front end. Max length: 5000. Nullable.
  * `collected_information` - Information about the customer collected within the Checkout Session. Nullable. Expandable.
  * `consent` - Results of `consent_collection` for this session. Nullable. Expandable.
  * `consent_collection` - When set, provides configuration for the Checkout Session to gather active consent from customers. Nullable. Expandable.
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code. Nullable.
  * `currency_conversion` - Currency conversion details for [Adaptive Pricing](https://docs.stripe.com/payments/checkout/adaptive-pricing) sessions created before 2025-03-31. Nullable. Expandable.
  * `custom_fields` - Collect additional information from your customer using custom fields. Up to 3 fields are supported. You can't set this parameter if `ui_mode` is `custom`. Expandable.
  * `custom_text` - Expandable.
  * `customer` - The ID of the customer for this Session.
  For Checkout Sessions in `subscription` mode or Checkout Sessions with `customer_creation` set as `always` in `payment` mode, Checkout
  will create a new customer object based on information provided
  during the payment flow unless an existing customer was provided when
  the Session was created. Nullable. Expandable.
  * `customer_account` - The ID of the account for this Session. Max length: 5000. Nullable.
  * `customer_creation` - Configure whether a Checkout Session creates a Customer when the Checkout Session completes. Possible values: `always`, `if_required`. Nullable.
  * `customer_details` - The customer details including the customer's tax exempt status and the customer's tax IDs. Customer's address details are not present on Sessions in `setup` mode. Nullable. Expandable.
  * `customer_email` - If provided, this value will be used when the Customer object is created.
  If not provided, customers will be asked to enter their email address.
  Use this parameter to prefill customer data if you already have an email
  on file. To access information about the customer once the payment flow is
  complete, use the `customer` attribute. Max length: 5000. Nullable.
  * `discounts` - List of coupons and promotion codes attached to the Checkout Session. Nullable. Expandable.
  * `excluded_payment_method_types` - A list of the types of payment methods (e.g., `card`) that should be excluded from this Checkout Session. This should only be used when payment methods for this Checkout Session are managed through the [Stripe Dashboard](https://dashboard.stripe.com/settings/payment_methods).
  * `expires_at` - The timestamp at which the Checkout Session will expire. Format: Unix timestamp.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `invoice` - ID of the invoice created by the Checkout Session, if it exists. Nullable. Expandable.
  * `invoice_creation` - Details on the state of invoice creation for the Checkout Session. Nullable. Expandable.
  * `line_items` - The line items purchased by the customer. Expandable.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `locale` - The IETF language tag of the locale Checkout is displayed in. If blank or `auto`, the browser's locale is used. Possible values: `auto`, `bg`, `cs`, `da`, `de`, `el`, `en`, `en-GB`, `es`, `es-419`, `et`, `fi`, `fil`, `fr`, `fr-CA`, `hr`, `hu`, `id`, `it`, `ja`, `ko`, `lt`, `lv`, `ms`, `mt`, `nb`, `nl`, `pl`, `pt`, `pt-BR`, `ro`, `ru`, `sk`, `sl`, `sv`, `th`, `tr`, `vi`, `zh`, `zh-HK`, `zh-TW`. Nullable.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Nullable.
  * `mode` - The mode of the Checkout Session. Possible values: `payment`, `setup`, `subscription`.
  * `name_collection` - Expandable.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `checkout.session`.
  * `optional_items` - The optional items presented to the customer at checkout. Nullable. Expandable.
  * `origin_context` - Where the user is coming from. This informs the optimizations that are applied to the session. Possible values: `mobile_app`, `web`. Nullable.
  * `payment_intent` - The ID of the PaymentIntent for Checkout Sessions in `payment` mode. You can't confirm or cancel the PaymentIntent for a Checkout Session. To cancel, [expire the Checkout Session](https://docs.stripe.com/api/checkout/sessions/expire) instead. Nullable. Expandable.
  * `payment_link` - The ID of the Payment Link that created this Session. Nullable. Expandable.
  * `payment_method_collection` - Configure whether a Checkout Session should collect a payment method. Defaults to `always`. Possible values: `always`, `if_required`. Nullable.
  * `payment_method_configuration_details` - Information about the payment method configuration used for this Checkout session if using dynamic payment methods. Nullable. Expandable.
  * `payment_method_options` - Payment-method-specific configuration for the PaymentIntent or SetupIntent of this CheckoutSession. Nullable. Expandable.
  * `payment_method_types` - A list of the types of payment methods (e.g. card) this Checkout
  Session is allowed to accept.
  * `payment_status` - The payment status of the Checkout Session, one of `paid`, `unpaid`, or `no_payment_required`.
  You can use this value to decide when to fulfill your customer's order. Possible values: `no_payment_required`, `paid`, `unpaid`.
  * `permissions` - This property is used to set up permissions for various actions (e.g., update) on the CheckoutSession object.

  For specific permissions, please refer to their dedicated subsections, such as `permissions.update_shipping_details`. Nullable. Expandable.
  * `phone_number_collection` - Expandable.
  * `presentment_details` - Expandable.
  * `recovered_from` - The ID of the original expired Checkout Session that triggered the recovery flow. Max length: 5000. Nullable.
  * `redirect_on_completion` - This parameter applies to `ui_mode: embedded`. Learn more about the [redirect behavior](https://docs.stripe.com/payments/checkout/custom-success-page?payment-ui=embedded-form) of embedded sessions. Defaults to `always`. Possible values: `always`, `if_required`, `never`.
  * `return_url` - Applies to Checkout Sessions with `ui_mode: embedded` or `ui_mode: custom`. The URL to redirect your customer back to after they authenticate or cancel their payment on the payment method's app or site. Max length: 5000.
  * `saved_payment_method_options` - Controls saved payment method settings for the session. Only available in `payment` and `subscription` mode. Nullable. Expandable.
  * `setup_intent` - The ID of the SetupIntent for Checkout Sessions in `setup` mode. You can't confirm or cancel the SetupIntent for a Checkout Session. To cancel, [expire the Checkout Session](https://docs.stripe.com/api/checkout/sessions/expire) instead. Nullable. Expandable.
  * `shipping_address_collection` - When set, provides configuration for Checkout to collect a shipping address from a customer. Nullable. Expandable.
  * `shipping_cost` - The details of the customer cost of shipping, including the customer chosen ShippingRate. Nullable. Expandable.
  * `shipping_options` - The shipping rate options applied to this Session. Expandable.
  * `status` - The status of the Checkout Session, one of `open`, `complete`, or `expired`. Possible values: `complete`, `expired`, `open`. Nullable.
  * `submit_type` - Describes the type of transaction being performed by Checkout in order to customize
  relevant text on the page, such as the submit button. `submit_type` can only be
  specified on Checkout Sessions in `payment` mode. If blank or `auto`, `pay` is used. Possible values: `auto`, `book`, `donate`, `pay`, `subscribe`. Nullable.
  * `subscription` - The ID of the [Subscription](https://docs.stripe.com/api/subscriptions) for Checkout Sessions in `subscription` mode. Nullable. Expandable.
  * `success_url` - The URL the customer will be directed to after the payment or
  subscription creation is successful. Max length: 5000. Nullable.
  * `tax_id_collection` - Expandable.
  * `total_details` - Tax and discount details for the computed total amount. Nullable. Expandable.
  * `ui_mode` - The UI mode of the Session. Defaults to `hosted`. Possible values: `custom`, `embedded`, `hosted`. Nullable.
  * `url` - The URL to the Checkout Session. Applies to Checkout Sessions with `ui_mode: hosted`. Redirect customers to this URL to take them to Checkout. If you’re using [Custom Domains](https://docs.stripe.com/payments/checkout/custom-domains), the URL will use your subdomain. Otherwise, it’ll use `checkout.stripe.com.`
  This value is only present when the session is active. Max length: 5000. Nullable.
  * `wallet_options` - Wallet-specific configuration for this Checkout Session. Nullable. Expandable.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :adaptive_pricing,
    :after_expiration,
    :allow_promotion_codes,
    :amount_subtotal,
    :amount_total,
    :automatic_tax,
    :billing_address_collection,
    :branding_settings,
    :cancel_url,
    :client_reference_id,
    :client_secret,
    :collected_information,
    :consent,
    :consent_collection,
    :created,
    :currency,
    :currency_conversion,
    :custom_fields,
    :custom_text,
    :customer,
    :customer_account,
    :customer_creation,
    :customer_details,
    :customer_email,
    :discounts,
    :excluded_payment_method_types,
    :expires_at,
    :id,
    :invoice,
    :invoice_creation,
    :line_items,
    :livemode,
    :locale,
    :metadata,
    :mode,
    :name_collection,
    :object,
    :optional_items,
    :origin_context,
    :payment_intent,
    :payment_link,
    :payment_method_collection,
    :payment_method_configuration_details,
    :payment_method_options,
    :payment_method_types,
    :payment_status,
    :permissions,
    :phone_number_collection,
    :presentment_details,
    :recovered_from,
    :redirect_on_completion,
    :return_url,
    :saved_payment_method_options,
    :setup_intent,
    :shipping_address_collection,
    :shipping_cost,
    :shipping_options,
    :status,
    :submit_type,
    :subscription,
    :success_url,
    :tax_id_collection,
    :total_details,
    :ui_mode,
    :url,
    :wallet_options
  ]

  @object_name "checkout.session"
  def object_name, do: @object_name

  def expandable_fields,
    do: [
      "adaptive_pricing",
      "after_expiration",
      "automatic_tax",
      "branding_settings",
      "collected_information",
      "consent",
      "consent_collection",
      "currency_conversion",
      "custom_fields",
      "custom_text",
      "customer",
      "customer_details",
      "discounts",
      "invoice",
      "invoice_creation",
      "line_items",
      "name_collection",
      "optional_items",
      "payment_intent",
      "payment_link",
      "payment_method_configuration_details",
      "payment_method_options",
      "permissions",
      "phone_number_collection",
      "presentment_details",
      "saved_payment_method_options",
      "setup_intent",
      "shipping_address_collection",
      "shipping_cost",
      "shipping_options",
      "subscription",
      "tax_id_collection",
      "total_details",
      "wallet_options"
    ]

  def __nested_fields__ do
    %{
      "adaptive_pricing" => %{
        fields: %{
          "enabled" => :scalar
        }
      },
      "after_expiration" => %{
        fields: %{
          "recovery" => %{
            fields: %{
              "allow_promotion_codes" => :scalar,
              "enabled" => :scalar,
              "expires_at" => :scalar,
              "url" => :scalar
            }
          }
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
          },
          "provider" => :scalar,
          "status" => :scalar
        }
      },
      "branding_settings" => %{
        fields: %{
          "background_color" => :scalar,
          "border_style" => :scalar,
          "button_color" => :scalar,
          "display_name" => :scalar,
          "font_family" => :scalar,
          "icon" => %{
            fields: %{
              "file" => :scalar,
              "type" => :scalar,
              "url" => :scalar
            }
          },
          "logo" => %{
            fields: %{
              "file" => :scalar,
              "type" => :scalar,
              "url" => :scalar
            }
          }
        }
      },
      "collected_information" => %{
        fields: %{
          "business_name" => :scalar,
          "individual_name" => :scalar,
          "shipping_details" => %{
            fields: %{
              "address" => {:resource, Stripe.Resources.Address},
              "name" => :scalar
            }
          }
        }
      },
      "consent" => %{
        fields: %{
          "promotions" => :scalar,
          "terms_of_service" => :scalar
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
      "currency_conversion" => %{
        fields: %{
          "amount_subtotal" => :scalar,
          "amount_total" => :scalar,
          "fx_rate" => :scalar,
          "source_currency" => :scalar
        }
      },
      "custom_fields" => %{
        fields: %{
          "dropdown" => {:resource, Stripe.Resources.CustomFieldDropdown},
          "key" => :scalar,
          "label" => %{
            fields: %{
              "custom" => :scalar,
              "type" => :scalar
            }
          },
          "numeric" => {:resource, Stripe.Resources.CustomFieldNumeric},
          "optional" => :scalar,
          "text" => %{
            fields: %{
              "default_value" => :scalar,
              "maximum_length" => :scalar,
              "minimum_length" => :scalar,
              "value" => :scalar
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
      "customer_details" => %{
        fields: %{
          "address" => {:resource, Stripe.Resources.Address},
          "business_name" => :scalar,
          "email" => :scalar,
          "individual_name" => :scalar,
          "name" => :scalar,
          "phone" => :scalar,
          "tax_exempt" => :scalar,
          "tax_ids" =>
            {:list,
             %{
               fields: %{
                 "type" => :scalar,
                 "value" => :scalar
               }
             }}
        }
      },
      "discounts" => %{
        fields: %{
          "coupon" => {:resource, Stripe.Resources.Coupon},
          "promotion_code" => {:resource, Stripe.Resources.PromotionCode}
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
      "payment_method_configuration_details" => %{
        fields: %{
          "id" => :scalar,
          "parent" => :scalar
        }
      },
      "payment_method_options" => %{
        fields: %{
          "acss_debit" => %{
            fields: %{
              "currency" => :scalar,
              "mandate_options" => %{
                fields: %{
                  "custom_mandate_url" => :scalar,
                  "default_for" => {:list, :scalar},
                  "interval_description" => :scalar,
                  "payment_schedule" => :scalar,
                  "transaction_type" => :scalar
                }
              },
              "setup_future_usage" => :scalar,
              "target_date" => :scalar,
              "verification_method" => :scalar
            }
          },
          "affirm" => %{
            fields: %{
              "capture_method" => :scalar,
              "setup_future_usage" => :scalar
            }
          },
          "afterpay_clearpay" => {:resource, Stripe.Resources.AfterpayClearpay},
          "alipay" => %{
            fields: %{
              "setup_future_usage" => :scalar
            }
          },
          "alma" => %{
            fields: %{
              "capture_method" => :scalar
            }
          },
          "amazon_pay" => %{
            fields: %{
              "capture_method" => :scalar,
              "setup_future_usage" => :scalar
            }
          },
          "au_becs_debit" => %{
            fields: %{
              "setup_future_usage" => :scalar,
              "target_date" => :scalar
            }
          },
          "bacs_debit" => %{
            fields: %{
              "mandate_options" => {:resource, Stripe.Resources.BacsDebitMandateOptions},
              "setup_future_usage" => :scalar,
              "target_date" => :scalar
            }
          },
          "bancontact" => %{
            fields: %{
              "setup_future_usage" => :scalar
            }
          },
          "billie" => %{
            fields: %{
              "capture_method" => :scalar
            }
          },
          "boleto" => %{
            fields: %{
              "expires_after_days" => :scalar,
              "setup_future_usage" => :scalar
            }
          },
          "card" => %{
            fields: %{
              "capture_method" => :scalar,
              "installments" => %{
                fields: %{
                  "enabled" => :scalar
                }
              },
              "request_extended_authorization" => :scalar,
              "request_incremental_authorization" => :scalar,
              "request_multicapture" => :scalar,
              "request_overcapture" => :scalar,
              "request_three_d_secure" => :scalar,
              "restrictions" => {:resource, Stripe.Resources.CheckoutCardRestrictions},
              "setup_future_usage" => :scalar,
              "statement_descriptor_suffix_kana" => :scalar,
              "statement_descriptor_suffix_kanji" => :scalar
            }
          },
          "cashapp" => %{
            fields: %{
              "capture_method" => :scalar,
              "setup_future_usage" => :scalar
            }
          },
          "customer_balance" => %{
            fields: %{
              "bank_transfer" => %{
                fields: %{
                  "eu_bank_transfer" => %{
                    fields: %{
                      "country" => :scalar
                    }
                  },
                  "requested_address_types" => {:list, :scalar},
                  "type" => :scalar
                }
              },
              "funding_type" => :scalar,
              "setup_future_usage" => :scalar
            }
          },
          "eps" => %{
            fields: %{
              "setup_future_usage" => :scalar
            }
          },
          "fpx" => %{
            fields: %{
              "setup_future_usage" => :scalar
            }
          },
          "giropay" => %{
            fields: %{
              "setup_future_usage" => :scalar
            }
          },
          "grabpay" => %{
            fields: %{
              "setup_future_usage" => :scalar
            }
          },
          "ideal" => %{
            fields: %{
              "setup_future_usage" => :scalar
            }
          },
          "kakao_pay" => %{
            fields: %{
              "capture_method" => :scalar,
              "setup_future_usage" => :scalar
            }
          },
          "klarna" => %{
            fields: %{
              "capture_method" => :scalar,
              "setup_future_usage" => :scalar
            }
          },
          "konbini" => %{
            fields: %{
              "expires_after_days" => :scalar,
              "setup_future_usage" => :scalar
            }
          },
          "kr_card" => %{
            fields: %{
              "capture_method" => :scalar,
              "setup_future_usage" => :scalar
            }
          },
          "link" => %{
            fields: %{
              "capture_method" => :scalar,
              "setup_future_usage" => :scalar
            }
          },
          "mobilepay" => %{
            fields: %{
              "capture_method" => :scalar,
              "setup_future_usage" => :scalar
            }
          },
          "multibanco" => %{
            fields: %{
              "setup_future_usage" => :scalar
            }
          },
          "naver_pay" => %{
            fields: %{
              "capture_method" => :scalar,
              "setup_future_usage" => :scalar
            }
          },
          "oxxo" => %{
            fields: %{
              "expires_after_days" => :scalar,
              "setup_future_usage" => :scalar
            }
          },
          "p24" => %{
            fields: %{
              "setup_future_usage" => :scalar
            }
          },
          "payco" => %{
            fields: %{
              "capture_method" => :scalar
            }
          },
          "paynow" => %{
            fields: %{
              "setup_future_usage" => :scalar
            }
          },
          "paypal" => %{
            fields: %{
              "capture_method" => :scalar,
              "preferred_locale" => :scalar,
              "reference" => :scalar,
              "setup_future_usage" => :scalar
            }
          },
          "payto" => %{
            fields: %{
              "mandate_options" => {:resource, Stripe.Resources.Payto},
              "setup_future_usage" => :scalar
            }
          },
          "pix" => %{
            fields: %{
              "amount_includes_iof" => :scalar,
              "expires_after_seconds" => :scalar,
              "setup_future_usage" => :scalar
            }
          },
          "revolut_pay" => %{
            fields: %{
              "capture_method" => :scalar,
              "setup_future_usage" => :scalar
            }
          },
          "samsung_pay" => %{
            fields: %{
              "capture_method" => :scalar
            }
          },
          "satispay" => %{
            fields: %{
              "capture_method" => :scalar
            }
          },
          "sepa_debit" => %{
            fields: %{
              "mandate_options" => {:resource, Stripe.Resources.SepaDebitMandateOptions},
              "setup_future_usage" => :scalar,
              "target_date" => :scalar
            }
          },
          "sofort" => %{
            fields: %{
              "setup_future_usage" => :scalar
            }
          },
          "swish" => %{
            fields: %{
              "reference" => :scalar
            }
          },
          "twint" => %{
            fields: %{
              "setup_future_usage" => :scalar
            }
          },
          "us_bank_account" => %{
            fields: %{
              "financial_connections" => %{
                fields: %{
                  "filters" => %{
                    fields: %{
                      "account_subcategories" => {:list, :scalar}
                    }
                  },
                  "permissions" => {:list, :scalar},
                  "prefetch" => {:list, :scalar},
                  "return_url" => :scalar
                }
              },
              "setup_future_usage" => :scalar,
              "target_date" => :scalar,
              "verification_method" => :scalar
            }
          }
        }
      },
      "phone_number_collection" => %{
        fields: %{
          "enabled" => :scalar
        }
      },
      "presentment_details" => %{
        fields: %{
          "presentment_amount" => :scalar,
          "presentment_currency" => :scalar
        }
      },
      "saved_payment_method_options" => %{
        fields: %{
          "allow_redisplay_filters" => {:list, :scalar},
          "payment_method_remove" => :scalar,
          "payment_method_save" => :scalar
        }
      },
      "shipping_cost" => %{
        fields: %{
          "amount_subtotal" => :scalar,
          "amount_tax" => :scalar,
          "amount_total" => :scalar,
          "shipping_rate" => {:resource, Stripe.Resources.ShippingRate},
          "taxes" =>
            {:list,
             %{
               fields: %{
                 "amount" => :scalar,
                 "rate" => {:resource, Stripe.Resources.TaxRate},
                 "taxability_reason" => :scalar,
                 "taxable_amount" => :scalar
               }
             }}
        }
      },
      "shipping_options" => %{
        fields: %{
          "shipping_amount" => :scalar,
          "shipping_rate" => {:resource, Stripe.Resources.ShippingRate}
        }
      },
      "tax_id_collection" => %{
        fields: %{
          "enabled" => :scalar,
          "required" => :scalar
        }
      },
      "total_details" => %{
        fields: %{
          "amount_discount" => :scalar,
          "amount_shipping" => :scalar,
          "amount_tax" => :scalar,
          "breakdown" => %{
            fields: %{
              "discounts" =>
                {:list,
                 %{
                   fields: %{
                     "amount" => :scalar,
                     "discount" => {:resource, Stripe.Resources.Discount}
                   }
                 }},
              "taxes" =>
                {:list,
                 %{
                   fields: %{
                     "amount" => :scalar,
                     "rate" => {:resource, Stripe.Resources.TaxRate},
                     "taxability_reason" => :scalar,
                     "taxable_amount" => :scalar
                   }
                 }}
            }
          }
        }
      },
      "wallet_options" => %{
        fields: %{
          "link" => %{
            fields: %{
              "display" => :scalar
            }
          }
        }
      },
      "permissions" => {:resource, Stripe.Resources.Permissions},
      "shipping_address_collection" => {:resource, Stripe.Resources.ShippingAddressCollection}
    }
  end
end
