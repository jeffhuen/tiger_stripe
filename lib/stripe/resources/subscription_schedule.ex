# File generated from our OpenAPI spec
defmodule Stripe.Resources.SubscriptionSchedule do
  @moduledoc """
  SubscriptionSchedule

  A subscription schedule allows you to create and manage the lifecycle of a subscription by predefining expected changes.

  Related guide: [Subscription schedules](https://docs.stripe.com/billing/subscriptions/subscription-schedules)
  """

  @typedoc """
  * `application` - ID of the Connect Application that created the schedule. Nullable. Expandable.
  * `billing_mode` - Expandable.
  * `canceled_at` - Time at which the subscription schedule was canceled. Measured in seconds since the Unix epoch. Format: Unix timestamp. Nullable.
  * `completed_at` - Time at which the subscription schedule was completed. Measured in seconds since the Unix epoch. Format: Unix timestamp. Nullable.
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `current_phase` - Object representing the start and end dates for the current phase of the subscription schedule, if it is `active`. Nullable. Expandable.
  * `customer` - ID of the customer who owns the subscription schedule. Expandable.
  * `customer_account` - ID of the account who owns the subscription schedule. Max length: 5000. Nullable.
  * `default_settings` - Expandable.
  * `end_behavior` - Behavior of the subscription schedule and underlying subscription when it ends. Possible values are `release` or `cancel` with the default being `release`. `release` will end the subscription schedule and keep the underlying subscription running. `cancel` will end the subscription schedule and cancel the underlying subscription. Possible values: `cancel`, `none`, `release`, `renew`.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Nullable.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `subscription_schedule`.
  * `phases` - Configuration for the subscription schedule's phases. Expandable.
  * `released_at` - Time at which the subscription schedule was released. Measured in seconds since the Unix epoch. Format: Unix timestamp. Nullable.
  * `released_subscription` - ID of the subscription once managed by the subscription schedule (if it is released). Max length: 5000. Nullable.
  * `status` - The present status of the subscription schedule. Possible values are `not_started`, `active`, `completed`, `released`, and `canceled`. You can read more about the different states in our [behavior guide](https://docs.stripe.com/billing/subscriptions/subscription-schedules). Possible values: `active`, `canceled`, `completed`, `not_started`, `released`.
  * `subscription` - ID of the subscription managed by the subscription schedule. Nullable. Expandable.
  * `test_clock` - ID of the test clock this subscription schedule belongs to. Nullable. Expandable.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :application,
    :billing_mode,
    :canceled_at,
    :completed_at,
    :created,
    :current_phase,
    :customer,
    :customer_account,
    :default_settings,
    :end_behavior,
    :id,
    :livemode,
    :metadata,
    :object,
    :phases,
    :released_at,
    :released_subscription,
    :status,
    :subscription,
    :test_clock
  ]

  @object_name "subscription_schedule"
  def object_name, do: @object_name

  def expandable_fields,
    do: [
      "application",
      "billing_mode",
      "current_phase",
      "customer",
      "default_settings",
      "phases",
      "subscription",
      "test_clock"
    ]

  def __nested_fields__ do
    %{
      "billing_mode" => %{
        fields: %{
          "flexible" => %{
            fields: %{
              "proration_discounts" => :scalar
            }
          },
          "type" => :scalar,
          "updated_at" => :scalar
        }
      },
      "current_phase" => %{
        fields: %{
          "end_date" => :scalar,
          "start_date" => :scalar
        }
      },
      "default_settings" => %{
        fields: %{
          "application_fee_percent" => :scalar,
          "automatic_tax" => %{
            fields: %{
              "disabled_reason" => :scalar,
              "enabled" => :scalar,
              "liability" => %{
                fields: %{
                  "account" => {:resource, Stripe.Resources.Account},
                  "type" => :scalar
                }
              }
            }
          },
          "billing_cycle_anchor" => :scalar,
          "billing_thresholds" => %{
            fields: %{
              "amount_gte" => :scalar,
              "reset_billing_cycle_anchor" => :scalar
            }
          },
          "collection_method" => :scalar,
          "default_payment_method" => {:resource, Stripe.Resources.PaymentMethod},
          "description" => :scalar,
          "invoice_settings" => %{
            fields: %{
              "account_tax_ids" => {:list, {:resource, Stripe.Resources.TaxId}},
              "days_until_due" => :scalar,
              "issuer" => %{
                fields: %{
                  "account" => {:resource, Stripe.Resources.Account},
                  "type" => :scalar
                }
              }
            }
          },
          "on_behalf_of" => {:resource, Stripe.Resources.Account},
          "transfer_data" => %{
            fields: %{
              "amount_percent" => :scalar,
              "destination" => {:resource, Stripe.Resources.Account}
            }
          }
        }
      },
      "phases" => %{
        fields: %{
          "add_invoice_items" =>
            {:list,
             %{
               fields: %{
                 "discountable" => :scalar,
                 "discounts" =>
                   {:list,
                    %{
                      fields: %{
                        "coupon" => {:resource, Stripe.Resources.Coupon},
                        "discount" => {:resource, Stripe.Resources.Discount},
                        "promotion_code" => {:resource, Stripe.Resources.PromotionCode}
                      }
                    }},
                 "metadata" => {:map, :scalar},
                 "period" => %{
                   fields: %{
                     "end" => %{
                       fields: %{
                         "timestamp" => :scalar,
                         "type" => :scalar
                       }
                     },
                     "start" => %{
                       fields: %{
                         "timestamp" => :scalar,
                         "type" => :scalar
                       }
                     }
                   }
                 },
                 "price" => {:resource, Stripe.Resources.Price},
                 "quantity" => :scalar,
                 "tax_rates" => {:list, {:resource, Stripe.Resources.TaxRate}}
               }
             }},
          "application_fee_percent" => :scalar,
          "automatic_tax" => %{
            fields: %{
              "disabled_reason" => :scalar,
              "enabled" => :scalar,
              "liability" => %{
                fields: %{
                  "account" => {:resource, Stripe.Resources.Account},
                  "type" => :scalar
                }
              }
            }
          },
          "billing_cycle_anchor" => :scalar,
          "billing_thresholds" => %{
            fields: %{
              "amount_gte" => :scalar,
              "reset_billing_cycle_anchor" => :scalar
            }
          },
          "collection_method" => :scalar,
          "currency" => :scalar,
          "default_payment_method" => {:resource, Stripe.Resources.PaymentMethod},
          "default_tax_rates" => {:list, {:resource, Stripe.Resources.TaxRate}},
          "description" => :scalar,
          "discounts" =>
            {:list,
             %{
               fields: %{
                 "coupon" => {:resource, Stripe.Resources.Coupon},
                 "discount" => {:resource, Stripe.Resources.Discount},
                 "promotion_code" => {:resource, Stripe.Resources.PromotionCode}
               }
             }},
          "end_date" => :scalar,
          "invoice_settings" => %{
            fields: %{
              "account_tax_ids" => {:list, {:resource, Stripe.Resources.TaxId}},
              "days_until_due" => :scalar,
              "issuer" => %{
                fields: %{
                  "account" => {:resource, Stripe.Resources.Account},
                  "type" => :scalar
                }
              }
            }
          },
          "items" =>
            {:list,
             %{
               fields: %{
                 "billing_thresholds" => %{
                   fields: %{
                     "usage_gte" => :scalar
                   }
                 },
                 "discounts" =>
                   {:list,
                    %{
                      fields: %{
                        "coupon" => {:resource, Stripe.Resources.Coupon},
                        "discount" => {:resource, Stripe.Resources.Discount},
                        "promotion_code" => {:resource, Stripe.Resources.PromotionCode}
                      }
                    }},
                 "metadata" => {:map, :scalar},
                 "plan" => {:resource, Stripe.Resources.Plan},
                 "price" => {:resource, Stripe.Resources.Price},
                 "quantity" => :scalar,
                 "tax_rates" => {:list, {:resource, Stripe.Resources.TaxRate}}
               }
             }},
          "metadata" => {:map, :scalar},
          "on_behalf_of" => {:resource, Stripe.Resources.Account},
          "proration_behavior" => :scalar,
          "start_date" => :scalar,
          "transfer_data" => %{
            fields: %{
              "amount_percent" => :scalar,
              "destination" => {:resource, Stripe.Resources.Account}
            }
          },
          "trial_end" => :scalar
        }
      }
    }
  end
end
