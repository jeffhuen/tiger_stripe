# File generated from our OpenAPI spec
defmodule Stripe.Resources.Customer do
  @moduledoc """
  Customer

  This object represents a customer of your business. Use it to [create recurring charges](https://docs.stripe.com/invoicing/customer), [save payment](https://docs.stripe.com/payments/save-during-payment) and contact information,
  and track payments that belong to the same customer.
  """

  @typedoc """
  * `address` - The customer's address. Nullable. Expandable.
  * `balance` - The current balance, if any, that's stored on the customer in their default currency. If negative, the customer has credit to apply to their next invoice. If positive, the customer has an amount owed that's added to their next invoice. The balance only considers amounts that Stripe hasn't successfully applied to any invoice. It doesn't reflect unpaid invoices. This balance is only taken into account after invoices finalize. For multi-currency balances, see [invoice_credit_balance](https://docs.stripe.com/api/customers/object#customer_object-invoice_credit_balance).
  * `business_name` - The customer's business name. Max length: 150.
  * `cash_balance` - The current funds being held by Stripe on behalf of the customer. You can apply these funds towards payment intents when the source is "cash_balance". The `settings[reconciliation_mode]` field describes if these funds apply to these payment intents manually or automatically. Nullable. Expandable.
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `currency` - Three-letter [ISO code for the currency](https://stripe.com/docs/currencies) the customer can be charged in for recurring billing purposes. Max length: 5000. Nullable.
  * `customer_account` - The ID of an Account representing a customer. You can use this ID with any v1 API that accepts a customer_account parameter. Max length: 5000. Nullable.
  * `default_source` - ID of the default payment source for the customer.

  If you use payment methods created through the PaymentMethods API, see the [invoice_settings.default_payment_method](https://docs.stripe.com/api/customers/object#customer_object-invoice_settings-default_payment_method) field instead. Nullable. Expandable.
  * `delinquent` - Tracks the most recent state change on any invoice belonging to the customer. Paying an invoice or marking it uncollectible via the API will set this field to false. An automatic payment failure or passing the `invoice.due_date` will set this field to `true`.

  If an invoice becomes uncollectible by [dunning](https://docs.stripe.com/billing/automatic-collection), `delinquent` doesn't reset to `false`.

  If you care whether the customer has paid their most recent subscription invoice, use `subscription.status` instead. Paying or marking uncollectible any customer invoice regardless of whether it is the latest invoice for a subscription will always set this field to `false`. Nullable.
  * `description` - An arbitrary string attached to the object. Often useful for displaying to users. Max length: 5000. Nullable.
  * `discount` - Describes the current discount active on the customer, if there is one. Nullable. Expandable.
  * `email` - The customer's email address. Max length: 5000. Nullable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `individual_name` - The customer's individual name. Max length: 150.
  * `invoice_credit_balance` - The current multi-currency balances, if any, that's stored on the customer. If positive in a currency, the customer has a credit to apply to their next invoice denominated in that currency. If negative, the customer has an amount owed that's added to their next invoice denominated in that currency. These balances don't apply to unpaid invoices. They solely track amounts that Stripe hasn't successfully applied to any invoice. Stripe only applies a balance in a specific currency to an invoice after that invoice (which is in the same currency) finalizes.
  * `invoice_prefix` - The prefix for the customer used to generate unique invoice numbers. Max length: 5000. Nullable.
  * `invoice_settings` - Expandable.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
  * `name` - The customer's full name or business name. Max length: 5000. Nullable.
  * `next_invoice_sequence` - The suffix of the customer's next invoice number (for example, 0001). When the account uses account level sequencing, this parameter is ignored in API requests and the field omitted in API responses.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `customer`.
  * `phone` - The customer's phone number. Max length: 5000. Nullable.
  * `preferred_locales` - The customer's preferred locales (languages), ordered by preference. Nullable.
  * `shipping` - Mailing and shipping address for the customer. Appears on invoices emailed to this customer. Nullable. Expandable.
  * `sources` - The customer's payment sources, if any. Expandable.
  * `subscriptions` - The customer's current subscriptions, if any. Expandable.
  * `tax` - Expandable.
  * `tax_exempt` - Describes the customer's tax exemption status, which is `none`, `exempt`, or `reverse`. When set to `reverse`, invoice and receipt PDFs include the following text: **"Reverse charge"**. Possible values: `exempt`, `none`, `reverse`. Nullable.
  * `tax_ids` - The customer's tax IDs. Expandable.
  * `test_clock` - ID of the test clock that this customer belongs to. Nullable. Expandable.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :address,
    :balance,
    :business_name,
    :cash_balance,
    :created,
    :currency,
    :customer_account,
    :default_source,
    :delinquent,
    :description,
    :discount,
    :email,
    :id,
    :individual_name,
    :invoice_credit_balance,
    :invoice_prefix,
    :invoice_settings,
    :livemode,
    :metadata,
    :name,
    :next_invoice_sequence,
    :object,
    :phone,
    :preferred_locales,
    :shipping,
    :sources,
    :subscriptions,
    :tax,
    :tax_exempt,
    :tax_ids,
    :test_clock
  ]

  @object_name "customer"
  def object_name, do: @object_name

  def expandable_fields,
    do: [
      "address",
      "cash_balance",
      "default_source",
      "discount",
      "invoice_settings",
      "shipping",
      "sources",
      "subscriptions",
      "tax",
      "tax_ids",
      "test_clock"
    ]

  def __nested_fields__ do
    %{
      "invoice_settings" => %{
        fields: %{
          "custom_fields" =>
            {:list,
             %{
               fields: %{
                 "name" => :scalar,
                 "value" => :scalar
               }
             }},
          "default_payment_method" => {:resource, Stripe.Resources.PaymentMethod},
          "footer" => :scalar,
          "rendering_options" => %{
            fields: %{
              "amount_tax_display" => :scalar,
              "template" => :scalar
            }
          }
        }
      },
      "sources" => %{
        fields: %{
          "data" => {:list, {:resource, Stripe.Resources.PaymentSource}},
          "has_more" => :scalar,
          "object" => :scalar,
          "url" => :scalar
        }
      },
      "subscriptions" => %{
        fields: %{
          "data" => {:list, {:resource, Stripe.Resources.Subscription}},
          "has_more" => :scalar,
          "object" => :scalar,
          "url" => :scalar
        }
      },
      "tax" => %{
        fields: %{
          "automatic_tax" => :scalar,
          "ip_address" => :scalar,
          "location" => %{
            fields: %{
              "country" => :scalar,
              "source" => :scalar,
              "state" => :scalar
            }
          },
          "provider" => :scalar
        }
      },
      "tax_ids" => %{
        fields: %{
          "data" => {:list, {:resource, Stripe.Resources.TaxId}},
          "has_more" => :scalar,
          "object" => :scalar,
          "url" => :scalar
        }
      },
      "address" => {:resource, Stripe.Resources.Address},
      "cash_balance" => {:resource, Stripe.Resources.CashBalance},
      "discount" => {:resource, Stripe.Resources.Discount},
      "shipping" => {:resource, Stripe.Resources.ShippingDetails}
    }
  end
end
