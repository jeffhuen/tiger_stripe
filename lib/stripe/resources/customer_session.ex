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
  @type t :: %__MODULE__{}

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
