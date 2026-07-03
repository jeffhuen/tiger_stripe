# File generated from our OpenAPI spec
defmodule Stripe.Resources.BillingPortal.Session do
  @moduledoc """
  PortalSession

  The Billing customer portal is a Stripe-hosted UI for subscription and
  billing management.

  A portal configuration describes the functionality and features that you
  want to provide to your customers through the portal.

  A portal session describes the instantiation of the customer portal for
  a particular customer. By visiting the session's URL, the customer
  can manage their subscriptions and billing details. For security reasons,
  sessions are short-lived and will expire if the customer does not visit the URL.
  Create sessions on-demand when customers intend to manage their subscriptions
  and billing details.

  Related guide: [Customer management](https://stripe.com/customer-management)
  """

  @typedoc """
  * `configuration` - The configuration used by this session, describing the features available. Expandable.
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `customer` - The ID of the customer for this session. Max length: 5000.
  * `customer_account` - The ID of the account for this session. Max length: 5000. Nullable.
  * `flow` - Information about a specific flow for the customer to go through. See the [docs](https://docs.stripe.com/customer-management/portal-deep-links) to learn more about using customer portal deep links and flows. Nullable. Expandable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `locale` - The IETF language tag of the locale Customer Portal is displayed in. If blank or auto, the customer’s `preferred_locales` or browser’s locale is used. Possible values: `auto`, `bg`, `cs`, `da`, `de`, `el`, `en`, `en-AU`, `en-CA`, `en-GB`, `en-IE`, `en-IN`, `en-NZ`, `en-SG`, `es`, `es-419`, `et`, `fi`, `fil`, `fr`, `fr-CA`, `hr`, `hu`, `id`, `it`, `ja`, `ko`, `lt`, `lv`, `ms`, `mt`, `nb`, `nl`, `pl`, `pt`, `pt-BR`, `ro`, `ru`, `sk`, `sl`, `sv`, `th`, `tr`, `vi`, `zh`, `zh-HK`, `zh-TW`. Nullable.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `billing_portal.session`.
  * `on_behalf_of` - The account for which the session was created on behalf of. When specified, only subscriptions and invoices with this `on_behalf_of` account appear in the portal. For more information, see the [docs](https://docs.stripe.com/connect/separate-charges-and-transfers#settlement-merchant). Use the [Accounts API](https://docs.stripe.com/api/accounts/object#account_object-settings-branding) to modify the `on_behalf_of` account's branding settings, which the portal displays. Max length: 5000. Nullable.
  * `return_url` - The URL to redirect customers to when they click on the portal's link to return to your website. Max length: 5000. Nullable.
  * `url` - The short-lived URL of the session that gives customers access to the customer portal. Max length: 5000.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :configuration,
    :created,
    :customer,
    :customer_account,
    :flow,
    :id,
    :livemode,
    :locale,
    :object,
    :on_behalf_of,
    :return_url,
    :url
  ]

  @object_name "billing_portal.session"
  def object_name, do: @object_name

  def expandable_fields, do: ["configuration", "flow"]

  def __nested_fields__ do
    %{
      "flow" => %{
        fields: %{
          "after_completion" => %{
            fields: %{
              "hosted_confirmation" => %{
                fields: %{
                  "custom_message" => :scalar
                }
              },
              "redirect" => %{
                fields: %{
                  "return_url" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "subscription_cancel" => %{
            fields: %{
              "retention" => %{
                fields: %{
                  "coupon_offer" => %{
                    fields: %{
                      "coupon" => :scalar
                    }
                  },
                  "type" => :scalar
                }
              },
              "subscription" => :scalar
            }
          },
          "subscription_update" => %{
            fields: %{
              "subscription" => :scalar
            }
          },
          "subscription_update_confirm" => %{
            fields: %{
              "discounts" =>
                {:list,
                 %{
                   fields: %{
                     "coupon" => :scalar,
                     "promotion_code" => :scalar
                   }
                 }},
              "items" =>
                {:list,
                 %{
                   fields: %{
                     "id" => :scalar,
                     "price" => :scalar,
                     "quantity" => :scalar
                   }
                 }},
              "subscription" => :scalar
            }
          },
          "type" => :scalar
        }
      }
    }
  end
end
