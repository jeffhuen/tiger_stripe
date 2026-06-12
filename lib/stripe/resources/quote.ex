# File generated from our OpenAPI spec
defmodule Stripe.Resources.Quote do
  @moduledoc """
  Quote

  A Quote is a way to model prices that you'd like to provide to a customer.
  Once accepted, it will automatically create an invoice, subscription or subscription schedule.
  """

  @typedoc """
  * `amount_subtotal` - Total before any discounts or taxes are applied.
  * `amount_total` - Total after discounts and taxes are applied.
  * `application` - ID of the Connect Application that created the quote. Nullable. Expandable.
  * `application_fee_amount` - The amount of the application fee (if any) that will be requested to be applied to the payment and transferred to the application owner's Stripe account. Only applicable if there are no line items with recurring prices on the quote. Nullable.
  * `application_fee_percent` - A non-negative decimal between 0 and 100, with at most two decimal places. This represents the percentage of the subscription invoice total that will be transferred to the application owner's Stripe account. Only applicable if there are line items with recurring prices on the quote. Nullable.
  * `automatic_tax` - Expandable.
  * `collection_method` - Either `charge_automatically`, or `send_invoice`. When charging automatically, Stripe will attempt to pay invoices at the end of the subscription cycle or on finalization using the default payment method attached to the subscription or customer. When sending an invoice, Stripe will email your customer an invoice with payment instructions and mark the subscription as `active`. Defaults to `charge_automatically`. Possible values: `charge_automatically`, `send_invoice`.
  * `computed` - Expandable.
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Max length: 5000. Nullable.
  * `customer` - The customer who received this quote. A customer is required to finalize the quote. Once specified, you can't change it. Nullable. Expandable.
  * `customer_account` - The account representing the customer who received this quote. A customer or account is required to finalize the quote. Once specified, you can't change it. Max length: 5000. Nullable.
  * `default_tax_rates` - The tax rates applied to this quote. Expandable.
  * `description` - A description that will be displayed on the quote PDF. Max length: 5000. Nullable.
  * `discounts` - The discounts applied to this quote. Expandable.
  * `expires_at` - The date on which the quote will be canceled if in `open` or `draft` status. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `footer` - A footer that will be displayed on the quote PDF. Max length: 5000. Nullable.
  * `from_quote` - Details of the quote that was cloned. See the [cloning documentation](https://docs.stripe.com/quotes/clone) for more details. Nullable. Expandable.
  * `header` - A header that will be displayed on the quote PDF. Max length: 5000. Nullable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `invoice` - The invoice that was created from this quote. Nullable. Expandable.
  * `invoice_settings` - Expandable.
  * `line_items` - A list of items the customer is being quoted for. Expandable.
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
  * `number` - A unique number that identifies this particular quote. This number is assigned once the quote is [finalized](https://docs.stripe.com/quotes/overview#finalize). Max length: 5000. Nullable.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `quote`.
  * `on_behalf_of` - The account on behalf of which to charge. See the [Connect documentation](https://support.stripe.com/questions/sending-invoices-on-behalf-of-connected-accounts) for details. Nullable. Expandable.
  * `status` - The status of the quote. Possible values: `accepted`, `canceled`, `draft`, `open`.
  * `status_transitions` - Expandable.
  * `subscription` - The subscription that was created or updated from this quote. Nullable. Expandable.
  * `subscription_data` - Expandable.
  * `subscription_schedule` - The subscription schedule that was created or updated from this quote. Nullable. Expandable.
  * `test_clock` - ID of the test clock this quote belongs to. Nullable. Expandable.
  * `total_details` - Expandable.
  * `transfer_data` - The account (if any) the payments will be attributed to for tax reporting, and where funds from each payment will be transferred to for each of the invoices. Nullable. Expandable.
  """
  @type t :: %__MODULE__{
          amount_subtotal: integer(),
          amount_total: integer(),
          application: String.t() | Stripe.Resources.Application.t(),
          application_fee_amount: integer(),
          application_fee_percent: float(),
          automatic_tax: automatic_tax(),
          collection_method: String.t(),
          computed: computed(),
          created: integer(),
          currency: String.t(),
          customer: String.t() | Stripe.Resources.Customer.t(),
          customer_account: String.t(),
          default_tax_rates: [String.t() | Stripe.Resources.TaxRate.t()] | nil,
          description: String.t(),
          discounts: [String.t() | Stripe.Resources.Discount.t()],
          expires_at: integer(),
          footer: String.t(),
          from_quote: from_quote(),
          header: String.t(),
          id: String.t(),
          invoice: String.t() | Stripe.Resources.Invoice.t(),
          invoice_settings: invoice_settings(),
          line_items: line_items() | nil,
          livemode: boolean(),
          metadata: %{String.t() => String.t()},
          number: String.t(),
          object: String.t(),
          on_behalf_of: String.t() | Stripe.Resources.Account.t(),
          status: String.t(),
          status_transitions: status_transitions(),
          subscription: String.t() | Stripe.Resources.Subscription.t(),
          subscription_data: subscription_data(),
          subscription_schedule: String.t() | Stripe.Resources.SubscriptionSchedule.t(),
          test_clock: String.t() | Stripe.Resources.TestHelpers.TestClock.t(),
          total_details: total_details(),
          transfer_data: transfer_data()
        }

  defstruct [
    :amount_subtotal,
    :amount_total,
    :application,
    :application_fee_amount,
    :application_fee_percent,
    :automatic_tax,
    :collection_method,
    :computed,
    :created,
    :currency,
    :customer,
    :customer_account,
    :default_tax_rates,
    :description,
    :discounts,
    :expires_at,
    :footer,
    :from_quote,
    :header,
    :id,
    :invoice,
    :invoice_settings,
    :line_items,
    :livemode,
    :metadata,
    :number,
    :object,
    :on_behalf_of,
    :status,
    :status_transitions,
    :subscription,
    :subscription_data,
    :subscription_schedule,
    :test_clock,
    :total_details,
    :transfer_data
  ]

  @object_name "quote"
  def object_name, do: @object_name

  def expandable_fields,
    do: [
      "application",
      "automatic_tax",
      "computed",
      "customer",
      "default_tax_rates",
      "discounts",
      "from_quote",
      "invoice",
      "invoice_settings",
      "line_items",
      "on_behalf_of",
      "status_transitions",
      "subscription",
      "subscription_data",
      "subscription_schedule",
      "test_clock",
      "total_details",
      "transfer_data"
    ]

  @typedoc """
  * `enabled` - Automatically calculate taxes
  * `liability` - The account that's liable for tax. If set, the business address and tax registrations required to perform the tax calculation are loaded from this account. The tax transaction is returned in the report of the connected account. Nullable.
  * `provider` - The tax provider powering automatic tax. Max length: 5000. Nullable.
  * `status` - The status of the most recent automated tax calculation for this quote. Possible values: `complete`, `failed`, `requires_location_inputs`. Nullable.
  """
  @type automatic_tax :: %{
          optional(:enabled) => boolean() | nil,
          optional(:liability) => automatic_tax_liability() | nil,
          optional(:provider) => String.t() | nil,
          optional(:status) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `account` - The connected account being referenced when `type` is `account`.
  * `type` - Type of the account referenced. Possible values: `account`, `self`.
  """
  @type automatic_tax_liability :: %{
          optional(:account) => String.t() | Stripe.Resources.Account.t() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `recurring` - The definitive totals and line items the customer will be charged on a recurring basis. Takes into account the line items with recurring prices and discounts with `duration=forever` coupons only. Defaults to `null` if no inputted line items with recurring prices. Nullable.
  * `upfront`
  """
  @type computed :: %{
          optional(:recurring) => computed_recurring() | nil,
          optional(:upfront) => computed_upfront() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `amount_subtotal` - Total before any discounts or taxes are applied.
  * `amount_total` - Total after discounts and taxes are applied.
  * `interval` - The frequency at which a subscription is billed. One of `day`, `week`, `month` or `year`. Possible values: `day`, `month`, `week`, `year`.
  * `interval_count` - The number of intervals (specified in the `interval` attribute) between subscription billings. For example, `interval=month` and `interval_count=3` bills every 3 months.
  * `total_details`
  """
  @type computed_recurring :: %{
          optional(:amount_subtotal) => integer() | nil,
          optional(:amount_total) => integer() | nil,
          optional(:interval) => String.t() | nil,
          optional(:interval_count) => integer() | nil,
          optional(:total_details) => computed_recurring_total_details() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `amount_discount` - This is the sum of all the discounts.
  * `amount_shipping` - This is the sum of all the shipping amounts. Nullable.
  * `amount_tax` - This is the sum of all the tax amounts.
  * `breakdown`
  """
  @type computed_recurring_total_details :: %{
          optional(:amount_discount) => integer() | nil,
          optional(:amount_shipping) => integer() | nil,
          optional(:amount_tax) => integer() | nil,
          optional(:breakdown) => computed_recurring_total_details_breakdown() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `discounts` - The aggregated discounts.
  * `taxes` - The aggregated tax amounts by rate.
  """
  @type computed_recurring_total_details_breakdown :: %{
          optional(:discounts) => [computed_recurring_total_details_breakdown_discounts()] | nil,
          optional(:taxes) => [computed_recurring_total_details_breakdown_taxes()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `amount` - The amount discounted.
  * `discount`
  """
  @type computed_recurring_total_details_breakdown_discounts :: %{
          optional(:amount) => integer() | nil,
          optional(:discount) => Stripe.Resources.Discount.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `amount` - Amount of tax applied for this rate.
  * `rate`
  * `taxability_reason` - The reasoning behind this tax, for example, if the product is tax exempt. The possible values for this field may be extended as new tax rules are supported. Possible values: `customer_exempt`, `not_collecting`, `not_subject_to_tax`, `not_supported`, `portion_product_exempt`, `portion_reduced_rated`, `portion_standard_rated`, `product_exempt`, `product_exempt_holiday`, `proportionally_rated`, `reduced_rated`, `reverse_charge`, `standard_rated`, `taxable_basis_reduced`, `zero_rated`. Nullable.
  * `taxable_amount` - The amount on which tax is calculated, in cents (or local equivalent). Nullable.
  """
  @type computed_recurring_total_details_breakdown_taxes :: %{
          optional(:amount) => integer() | nil,
          optional(:rate) => Stripe.Resources.TaxRate.t() | nil,
          optional(:taxability_reason) => String.t() | nil,
          optional(:taxable_amount) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `amount_subtotal` - Total before any discounts or taxes are applied.
  * `amount_total` - Total after discounts and taxes are applied.
  * `line_items` - The line items that will appear on the next invoice after this quote is accepted. This does not include pending invoice items that exist on the customer but may still be included in the next invoice.
  * `total_details`
  """
  @type computed_upfront :: %{
          optional(:amount_subtotal) => integer() | nil,
          optional(:amount_total) => integer() | nil,
          optional(:line_items) => computed_upfront_line_items() | nil,
          optional(:total_details) => computed_upfront_total_details() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `data` - Details about each object.
  * `has_more` - True if this list has another page of items after this one that can be fetched.
  * `object` - String representing the object's type. Objects of the same type share the same value. Always has the value `list`. Possible values: `list`.
  * `url` - The URL where this list can be accessed. Max length: 5000.
  """
  @type computed_upfront_line_items :: %{
          optional(:data) => [Stripe.Resources.LineItem.t()] | nil,
          optional(:has_more) => boolean() | nil,
          optional(:object) => String.t() | nil,
          optional(:url) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `amount_discount` - This is the sum of all the discounts.
  * `amount_shipping` - This is the sum of all the shipping amounts. Nullable.
  * `amount_tax` - This is the sum of all the tax amounts.
  * `breakdown`
  """
  @type computed_upfront_total_details :: %{
          optional(:amount_discount) => integer() | nil,
          optional(:amount_shipping) => integer() | nil,
          optional(:amount_tax) => integer() | nil,
          optional(:breakdown) => computed_upfront_total_details_breakdown() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `discounts` - The aggregated discounts.
  * `taxes` - The aggregated tax amounts by rate.
  """
  @type computed_upfront_total_details_breakdown :: %{
          optional(:discounts) => [computed_upfront_total_details_breakdown_discounts()] | nil,
          optional(:taxes) => [computed_upfront_total_details_breakdown_taxes()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `amount` - The amount discounted.
  * `discount`
  """
  @type computed_upfront_total_details_breakdown_discounts :: %{
          optional(:amount) => integer() | nil,
          optional(:discount) => Stripe.Resources.Discount.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `amount` - Amount of tax applied for this rate.
  * `rate`
  * `taxability_reason` - The reasoning behind this tax, for example, if the product is tax exempt. The possible values for this field may be extended as new tax rules are supported. Possible values: `customer_exempt`, `not_collecting`, `not_subject_to_tax`, `not_supported`, `portion_product_exempt`, `portion_reduced_rated`, `portion_standard_rated`, `product_exempt`, `product_exempt_holiday`, `proportionally_rated`, `reduced_rated`, `reverse_charge`, `standard_rated`, `taxable_basis_reduced`, `zero_rated`. Nullable.
  * `taxable_amount` - The amount on which tax is calculated, in cents (or local equivalent). Nullable.
  """
  @type computed_upfront_total_details_breakdown_taxes :: %{
          optional(:amount) => integer() | nil,
          optional(:rate) => Stripe.Resources.TaxRate.t() | nil,
          optional(:taxability_reason) => String.t() | nil,
          optional(:taxable_amount) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `is_revision` - Whether this quote is a revision of a different quote.
  * `quote` - The quote that was cloned.
  """
  @type from_quote :: %{
          optional(:is_revision) => boolean() | nil,
          optional(:quote) => String.t() | Stripe.Resources.Quote.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `days_until_due` - Number of days within which a customer must pay invoices generated by this quote. This value will be `null` for quotes where `collection_method=charge_automatically`. Nullable.
  * `issuer`
  """
  @type invoice_settings :: %{
          optional(:days_until_due) => integer() | nil,
          optional(:issuer) => invoice_settings_issuer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `account` - The connected account being referenced when `type` is `account`.
  * `type` - Type of the account referenced. Possible values: `account`, `self`.
  """
  @type invoice_settings_issuer :: %{
          optional(:account) => String.t() | Stripe.Resources.Account.t() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `data` - Details about each object.
  * `has_more` - True if this list has another page of items after this one that can be fetched.
  * `object` - String representing the object's type. Objects of the same type share the same value. Always has the value `list`. Possible values: `list`.
  * `url` - The URL where this list can be accessed. Max length: 5000.
  """
  @type line_items :: %{
          optional(:data) => [Stripe.Resources.LineItem.t()] | nil,
          optional(:has_more) => boolean() | nil,
          optional(:object) => String.t() | nil,
          optional(:url) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `accepted_at` - The time that the quote was accepted. Measured in seconds since Unix epoch. Format: Unix timestamp. Nullable.
  * `canceled_at` - The time that the quote was canceled. Measured in seconds since Unix epoch. Format: Unix timestamp. Nullable.
  * `finalized_at` - The time that the quote was finalized. Measured in seconds since Unix epoch. Format: Unix timestamp. Nullable.
  """
  @type status_transitions :: %{
          optional(:accepted_at) => integer() | nil,
          optional(:canceled_at) => integer() | nil,
          optional(:finalized_at) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `billing_mode`
  * `description` - The subscription's description, meant to be displayable to the customer. Use this field to optionally store an explanation of the subscription for rendering in Stripe surfaces and certain local payment methods UIs. Max length: 5000. Nullable.
  * `effective_date` - When creating a new subscription, the date of which the subscription schedule will start after the quote is accepted. This date is ignored if it is in the past when the quote is accepted. Measured in seconds since the Unix epoch. Format: Unix timestamp. Nullable.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that will set metadata on the subscription or subscription schedule when the quote is accepted. If a recurring price is included in `line_items`, this field will be passed to the resulting subscription's `metadata` field. If `subscription_data.effective_date` is used, this field will be passed to the resulting subscription schedule's `phases.metadata` field. Unlike object-level metadata, this field is declarative. Updates will clear prior values. Nullable.
  * `trial_period_days` - Integer representing the number of trial period days before the customer is charged for the first time. Nullable.
  """
  @type subscription_data :: %{
          optional(:billing_mode) => subscription_data_billing_mode() | nil,
          optional(:description) => String.t() | nil,
          optional(:effective_date) => integer() | nil,
          optional(:metadata) => %{String.t() => String.t()} | nil,
          optional(:trial_period_days) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `flexible`
  * `type` - Controls how prorations and invoices for subscriptions are calculated and orchestrated. Possible values: `classic`, `flexible`.
  """
  @type subscription_data_billing_mode :: %{
          optional(:flexible) => subscription_data_billing_mode_flexible() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `proration_discounts` - Controls how invoices and invoice items display proration amounts and discount amounts. Possible values: `included`, `itemized`.
  """
  @type subscription_data_billing_mode_flexible :: %{
          optional(:proration_discounts) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `amount_discount` - This is the sum of all the discounts.
  * `amount_shipping` - This is the sum of all the shipping amounts. Nullable.
  * `amount_tax` - This is the sum of all the tax amounts.
  * `breakdown`
  """
  @type total_details :: %{
          optional(:amount_discount) => integer() | nil,
          optional(:amount_shipping) => integer() | nil,
          optional(:amount_tax) => integer() | nil,
          optional(:breakdown) => total_details_breakdown() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `discounts` - The aggregated discounts.
  * `taxes` - The aggregated tax amounts by rate.
  """
  @type total_details_breakdown :: %{
          optional(:discounts) => [total_details_breakdown_discounts()] | nil,
          optional(:taxes) => [total_details_breakdown_taxes()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `amount` - The amount discounted.
  * `discount`
  """
  @type total_details_breakdown_discounts :: %{
          optional(:amount) => integer() | nil,
          optional(:discount) => Stripe.Resources.Discount.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `amount` - Amount of tax applied for this rate.
  * `rate`
  * `taxability_reason` - The reasoning behind this tax, for example, if the product is tax exempt. The possible values for this field may be extended as new tax rules are supported. Possible values: `customer_exempt`, `not_collecting`, `not_subject_to_tax`, `not_supported`, `portion_product_exempt`, `portion_reduced_rated`, `portion_standard_rated`, `product_exempt`, `product_exempt_holiday`, `proportionally_rated`, `reduced_rated`, `reverse_charge`, `standard_rated`, `taxable_basis_reduced`, `zero_rated`. Nullable.
  * `taxable_amount` - The amount on which tax is calculated, in cents (or local equivalent). Nullable.
  """
  @type total_details_breakdown_taxes :: %{
          optional(:amount) => integer() | nil,
          optional(:rate) => Stripe.Resources.TaxRate.t() | nil,
          optional(:taxability_reason) => String.t() | nil,
          optional(:taxable_amount) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `amount` - The amount in cents (or local equivalent) that will be transferred to the destination account when the invoice is paid. By default, the entire amount is transferred to the destination. Nullable.
  * `amount_percent` - A non-negative decimal between 0 and 100, with at most two decimal places. This represents the percentage of the subscription invoice total that will be transferred to the destination account. By default, the entire amount will be transferred to the destination. Nullable.
  * `destination` - The account where funds from the payment will be transferred to upon payment success.
  """
  @type transfer_data :: %{
          optional(:amount) => integer() | nil,
          optional(:amount_percent) => float() | nil,
          optional(:destination) => String.t() | Stripe.Resources.Account.t() | nil,
          optional(String.t()) => term()
        }

  def __nested_fields__ do
    %{
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
      "computed" => %{
        fields: %{
          "recurring" => %{
            fields: %{
              "amount_subtotal" => :scalar,
              "amount_total" => :scalar,
              "interval" => :scalar,
              "interval_count" => :scalar,
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
              }
            }
          },
          "upfront" => %{
            fields: %{
              "amount_subtotal" => :scalar,
              "amount_total" => :scalar,
              "line_items" => %{
                fields: %{
                  "data" => {:list, {:resource, Stripe.Resources.LineItem}},
                  "has_more" => :scalar,
                  "object" => :scalar,
                  "url" => :scalar
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
              }
            }
          }
        }
      },
      "from_quote" => %{
        fields: %{
          "is_revision" => :scalar,
          "quote" => {:resource, Stripe.Resources.Quote}
        }
      },
      "invoice_settings" => %{
        fields: %{
          "days_until_due" => :scalar,
          "issuer" => %{
            fields: %{
              "account" => {:resource, Stripe.Resources.Account},
              "type" => :scalar
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
      "status_transitions" => %{
        fields: %{
          "accepted_at" => :scalar,
          "canceled_at" => :scalar,
          "finalized_at" => :scalar
        }
      },
      "subscription_data" => %{
        fields: %{
          "billing_mode" => %{
            fields: %{
              "flexible" => %{
                fields: %{
                  "proration_discounts" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "description" => :scalar,
          "effective_date" => :scalar,
          "metadata" => {:map, :scalar},
          "trial_period_days" => :scalar
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
      "transfer_data" => %{
        fields: %{
          "amount" => :scalar,
          "amount_percent" => :scalar,
          "destination" => {:resource, Stripe.Resources.Account}
        }
      }
    }
  end
end
