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
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `login_page` - Expandable.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Nullable.
  * `name` - The name of the configuration. Max length: 5000. Nullable.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `billing_portal.configuration`.
  * `updated` - Time at which the object was last updated. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  """
  @type t :: %__MODULE__{}

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

  def __nested_fields__ do
    %{
      "business_profile" => %{
        fields: %{
          "headline" => :scalar,
          "privacy_policy_url" => :scalar,
          "terms_of_service_url" => :scalar
        }
      },
      "features" => %{
        fields: %{
          "customer_update" => %{
            fields: %{
              "allowed_updates" => {:list, :scalar},
              "enabled" => :scalar
            }
          },
          "invoice_history" => %{
            fields: %{
              "enabled" => :scalar
            }
          },
          "payment_method_update" => %{
            fields: %{
              "enabled" => :scalar,
              "payment_method_configuration" => :scalar
            }
          },
          "subscription_cancel" => %{
            fields: %{
              "cancellation_reason" => %{
                fields: %{
                  "enabled" => :scalar,
                  "options" => {:list, :scalar}
                }
              },
              "enabled" => :scalar,
              "mode" => :scalar,
              "proration_behavior" => :scalar
            }
          },
          "subscription_update" => %{
            fields: %{
              "billing_cycle_anchor" => :scalar,
              "default_allowed_updates" => {:list, :scalar},
              "enabled" => :scalar,
              "products" =>
                {:list,
                 %{
                   fields: %{
                     "adjustable_quantity" => %{
                       fields: %{
                         "enabled" => :scalar,
                         "maximum" => :scalar,
                         "minimum" => :scalar
                       }
                     },
                     "prices" => {:list, :scalar},
                     "product" => :scalar
                   }
                 }},
              "proration_behavior" => :scalar,
              "schedule_at_period_end" => %{
                fields: %{
                  "conditions" =>
                    {:list,
                     %{
                       fields: %{
                         "type" => :scalar
                       }
                     }}
                }
              },
              "trial_update_behavior" => :scalar
            }
          }
        }
      },
      "login_page" => %{
        fields: %{
          "enabled" => :scalar,
          "url" => :scalar
        }
      }
    }
  end
end
