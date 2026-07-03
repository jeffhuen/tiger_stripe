# File generated from our OpenAPI spec
defmodule Stripe.Resources.Invoice do
  @moduledoc """
  Invoice

  Invoices are statements of amounts owed by a customer, and are either
  generated one-off, or generated periodically from a subscription.

  They contain [invoice items](https://api.stripe.com#invoiceitems), and proration adjustments
  that may be caused by subscription upgrades/downgrades (if necessary).

  If your invoice is configured to be billed through automatic charges,
  Stripe automatically finalizes your invoice and attempts payment. Note
  that finalizing the invoice,
  [when automatic](https://docs.stripe.com/invoicing/integration/automatic-advancement-collection), does
  not happen immediately as the invoice is created. Stripe waits
  until one hour after the last webhook was successfully sent (or the last
  webhook timed out after failing). If you (and the platforms you may have
  connected to) have no webhooks configured, Stripe waits one hour after
  creation to finalize the invoice.

  If your invoice is configured to be billed by sending an email, then based on your
  [email settings](https://dashboard.stripe.com/account/billing/automatic),
  Stripe will email the invoice to your customer and await payment. These
  emails can contain a link to a hosted page to pay the invoice.

  Stripe applies any customer credit on the account before determining the
  amount due for the invoice (i.e., the amount that will be actually
  charged). If the amount due for the invoice is less than Stripe's [minimum allowed charge
  per currency](https://docs.stripe.com/docs/currencies#minimum-and-maximum-charge-amounts), the
  invoice is automatically marked paid, and we add the amount due to the
  customer's credit balance which is applied to the next invoice.

  More details on the customer's credit balance are
  [here](https://docs.stripe.com/billing/customer/balance).

  Related guide: [Send invoices to customers](https://docs.stripe.com/billing/invoices/sending)
  """

  @typedoc """
  * `account_country` - The country of the business associated with this invoice, most often the business creating the invoice. Max length: 5000. Nullable.
  * `account_name` - The public name of the business associated with this invoice, most often the business creating the invoice. Max length: 5000. Nullable.
  * `account_tax_ids` - The account tax IDs associated with the invoice. Only editable when the invoice is a draft. Nullable. Expandable.
  * `amount_due` - Final amount due at this time for this invoice. If the invoice's total is smaller than the minimum charge amount, for example, or if there is account credit that can be applied to the invoice, the `amount_due` may be 0. If there is a positive `starting_balance` for the invoice (the customer owes money), the `amount_due` will also take that into account. The charge that gets generated for the invoice will be for the amount specified in `amount_due`.
  * `amount_overpaid` - Amount that was overpaid on the invoice. The amount overpaid is credited to the customer's credit balance.
  * `amount_paid` - The amount, in cents (or local equivalent), that was paid.
  * `amount_paid_off_stripe` - Amount, in cents (or local equivalent), that was paid on the invoice outside of Stripe.
  * `amount_remaining` - The difference between amount_due and amount_paid, in cents (or local equivalent).
  * `amount_shipping` - This is the sum of all the shipping amounts.
  * `application` - ID of the Connect Application that created the invoice. Nullable. Expandable.
  * `attempt_count` - Number of payment attempts made for this invoice, from the perspective of the payment retry schedule. Any payment attempt counts as the first attempt, and subsequently only automatic retries increment the attempt count. In other words, manual payment attempts after the first attempt do not affect the retry schedule. If a failure is returned with a non-retryable return code, the invoice can no longer be retried unless a new payment method is obtained. Retries will continue to be scheduled, and attempt_count will continue to increment, but retries will only be executed if a new payment method is obtained.
  * `attempted` - Whether an attempt has been made to pay the invoice. An invoice is not attempted until 1 hour after the `invoice.created` webhook, for example, so you might not want to display that invoice as unpaid to your users.
  * `auto_advance` - Controls whether Stripe performs [automatic collection](https://docs.stripe.com/invoicing/integration/automatic-advancement-collection) of the invoice. If `false`, the invoice's state doesn't automatically advance without an explicit action.
  * `automatic_tax` - Expandable.
  * `automatically_finalizes_at` - The time when this invoice is currently scheduled to be automatically finalized. The field will be `null` if the invoice is not scheduled to finalize in the future. If the invoice is not in the draft state, this field will always be `null` - see `finalized_at` for the time when an already-finalized invoice was finalized. Format: Unix timestamp. Nullable.
  * `billing_reason` - Indicates the reason why the invoice was created.

  * `manual`: Unrelated to a subscription, for example, created via the invoice editor.
  * `subscription`: No longer in use. Applies to subscriptions from before May 2018 where no distinction was made between updates, cycles, and thresholds.
  * `subscription_create`: A new subscription was created.
  * `subscription_cycle`: A subscription advanced into a new period.
  * `subscription_threshold`: A subscription reached a billing threshold.
  * `subscription_update`: A subscription was updated.
  * `upcoming`: Reserved for upcoming invoices created through the Create Preview Invoice API or when an `invoice.upcoming` event is generated for an upcoming invoice on a subscription. Possible values: `automatic_pending_invoice_item_invoice`, `manual`, `quote_accept`, `subscription`, `subscription_create`, `subscription_cycle`, `subscription_threshold`, `subscription_update`, `upcoming`. Nullable.
  * `collection_method` - Either `charge_automatically`, or `send_invoice`. When charging automatically, Stripe will attempt to pay this invoice using the default source attached to the customer. When sending an invoice, Stripe will email this invoice to the customer with payment instructions. Possible values: `charge_automatically`, `send_invoice`.
  * `confirmation_secret` - The confirmation secret associated with this invoice. Currently, this contains the client_secret of the PaymentIntent that Stripe creates during invoice finalization. Nullable. Expandable.
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `custom_fields` - Custom fields displayed on the invoice. Nullable. Expandable.
  * `customer` - The ID of the customer to bill. Nullable. Expandable.
  * `customer_account` - The ID of the account representing the customer to bill. Max length: 5000. Nullable.
  * `customer_address` - The customer's address. Until the invoice is finalized, this field will equal `customer.address`. Once the invoice is finalized, this field will no longer be updated. Nullable. Expandable.
  * `customer_email` - The customer's email. Until the invoice is finalized, this field will equal `customer.email`. Once the invoice is finalized, this field will no longer be updated. Max length: 5000. Nullable.
  * `customer_name` - The customer's name. Until the invoice is finalized, this field will equal `customer.name`. Once the invoice is finalized, this field will no longer be updated. Max length: 5000. Nullable.
  * `customer_phone` - The customer's phone number. Until the invoice is finalized, this field will equal `customer.phone`. Once the invoice is finalized, this field will no longer be updated. Max length: 5000. Nullable.
  * `customer_shipping` - The customer's shipping information. Until the invoice is finalized, this field will equal `customer.shipping`. Once the invoice is finalized, this field will no longer be updated. Nullable. Expandable.
  * `customer_tax_exempt` - The customer's tax exempt status. Until the invoice is finalized, this field will equal `customer.tax_exempt`. Once the invoice is finalized, this field will no longer be updated. Possible values: `exempt`, `none`, `reverse`. Nullable.
  * `customer_tax_ids` - The customer's tax IDs. Until the invoice is finalized, this field will contain the same tax IDs as `customer.tax_ids`. Once the invoice is finalized, this field will no longer be updated. Nullable. Expandable.
  * `default_payment_method` - ID of the default payment method for the invoice. It must belong to the customer associated with the invoice. If not set, defaults to the subscription's default payment method, if any, or to the default payment method in the customer's invoice settings. Nullable. Expandable.
  * `default_source` - ID of the default payment source for the invoice. It must belong to the customer associated with the invoice and be in a chargeable state. If not set, defaults to the subscription's default source, if any, or to the customer's default source. Nullable. Expandable.
  * `default_tax_rates` - The tax rates applied to this invoice, if any. Expandable.
  * `description` - An arbitrary string attached to the object. Often useful for displaying to users. Referenced as 'memo' in the Dashboard. Max length: 5000. Nullable.
  * `discounts` - The discounts applied to the invoice. Line item discounts are applied before invoice discounts. Use `expand[]=discounts` to expand each discount. Expandable.
  * `due_date` - The date on which payment for this invoice is due. This value will be `null` for invoices where `collection_method=charge_automatically`. Format: Unix timestamp. Nullable.
  * `effective_at` - The date when this invoice is in effect. Same as `finalized_at` unless overwritten. When defined, this value replaces the system-generated 'Date of issue' printed on the invoice PDF and receipt. Format: Unix timestamp. Nullable.
  * `ending_balance` - Ending customer balance after the invoice is finalized. Invoices are finalized approximately an hour after successful webhook delivery or when payment collection is attempted for the invoice. If the invoice has not been finalized yet, this will be null. Nullable.
  * `footer` - Footer displayed on the invoice. Max length: 5000. Nullable.
  * `from_invoice` - Details of the invoice that was cloned. See the [revision documentation](https://docs.stripe.com/invoicing/invoice-revisions) for more details. Nullable. Expandable.
  * `hosted_invoice_url` - The URL for the hosted invoice page, which allows customers to view and pay an invoice. If the invoice has not been finalized yet, this will be null. Max length: 5000. Nullable.
  * `id` - Unique identifier for the object. For preview invoices created using the [create preview](https://stripe.com/docs/api/invoices/create_preview) endpoint, this id will be prefixed with `upcoming_in`. Max length: 5000.
  * `invoice_pdf` - The link to download the PDF for the invoice. If the invoice has not been finalized yet, this will be null. Max length: 5000. Nullable.
  * `issuer` - Expandable.
  * `last_finalization_error` - The error encountered during the previous attempt to finalize the invoice. This field is cleared when the invoice is successfully finalized. Nullable. Expandable.
  * `latest_revision` - The ID of the most recent non-draft revision of this invoice Nullable. Expandable.
  * `lines` - The individual line items that make up the invoice. `lines` is sorted as follows: (1) pending invoice items (including prorations) in reverse chronological order, (2) subscription items in reverse chronological order, and (3) invoice items added after invoice creation in chronological order. Expandable.
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Nullable.
  * `next_payment_attempt` - The time at which payment will next be attempted. This value will be `null` for invoices where `collection_method=send_invoice`. Format: Unix timestamp. Nullable.
  * `number` - A unique, identifying string that appears on emails sent to the customer for this invoice. This starts with the customer's unique invoice_prefix if it is specified. Max length: 5000. Nullable.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `invoice`.
  * `on_behalf_of` - The account (if any) for which the funds of the invoice payment are intended. If set, the invoice will be presented with the branding and support information of the specified account. See the [Invoices with Connect](https://docs.stripe.com/billing/invoices/connect) documentation for details. Nullable. Expandable.
  * `parent` - The parent that generated this invoice Nullable. Expandable.
  * `payment_settings` - Expandable.
  * `payments` - Payments for this invoice. Use [invoice payment](https://docs.stripe.com/api/invoice-payment) to get more details. Expandable.
  * `period_end` - The latest timestamp at which invoice items can be associated with this invoice. Use the [line item period](https://docs.stripe.com/api/invoices/line_item#invoice_line_item_object-period) to get the service period for each price. Format: Unix timestamp.
  * `period_start` - The earliest timestamp at which invoice items can be associated with this invoice. Use the [line item period](https://docs.stripe.com/api/invoices/line_item#invoice_line_item_object-period) to get the service period for each price. Format: Unix timestamp.
  * `post_payment_credit_notes_amount` - Total amount of all post-payment credit notes issued for this invoice.
  * `pre_payment_credit_notes_amount` - Total amount of all pre-payment credit notes issued for this invoice.
  * `receipt_number` - This is the transaction number that appears on email receipts sent for this invoice. Max length: 5000. Nullable.
  * `rendering` - The rendering-related settings that control how the invoice is displayed on customer-facing surfaces such as PDF and Hosted Invoice Page. Nullable. Expandable.
  * `shipping_cost` - The details of the cost of shipping, including the ShippingRate applied on the invoice. Nullable. Expandable.
  * `shipping_details` - Shipping details for the invoice. The Invoice PDF will use the `shipping_details` value if it is set, otherwise the PDF will render the shipping address from the customer. Nullable. Expandable.
  * `starting_balance` - Starting customer balance before the invoice is finalized. If the invoice has not been finalized yet, this will be the current customer balance. For revision invoices, this also includes any customer balance that was applied to the original invoice.
  * `statement_descriptor` - Extra information about an invoice for the customer's credit card statement. Max length: 5000. Nullable.
  * `status` - The status of the invoice, one of `draft`, `open`, `paid`, `uncollectible`, or `void`. [Learn more](https://docs.stripe.com/billing/invoices/workflow#workflow-overview) Possible values: `draft`, `open`, `paid`, `uncollectible`, `void`. Nullable.
  * `status_transitions` - Expandable.
  * `subscription` - Nullable. Expandable.
  * `subtotal` - Total of all subscriptions, invoice items, and prorations on the invoice before any invoice level discount or exclusive tax is applied. Item discounts are already incorporated
  * `subtotal_excluding_tax` - The integer amount in cents (or local equivalent) representing the subtotal of the invoice before any invoice level discount or tax is applied. Item discounts are already incorporated Nullable.
  * `test_clock` - ID of the test clock this invoice belongs to. Nullable. Expandable.
  * `threshold_reason` - Expandable.
  * `total` - Total after discounts and taxes.
  * `total_discount_amounts` - The aggregate amounts calculated per discount across all line items. Nullable. Expandable.
  * `total_excluding_tax` - The integer amount in cents (or local equivalent) representing the total amount of the invoice including all discounts but excluding all tax. Nullable.
  * `total_pretax_credit_amounts` - Contains pretax credit amounts (ex: discount, credit grants, etc) that apply to this invoice. This is a combined list of total_pretax_credit_amounts across all invoice line items. Nullable. Expandable.
  * `total_taxes` - The aggregate tax information of all line items. Nullable. Expandable.
  * `webhooks_delivered_at` - Invoices are automatically paid or sent 1 hour after webhooks are delivered, or until all webhook delivery attempts have [been exhausted](https://docs.stripe.com/billing/webhooks#understand). This field tracks the time when webhooks for this invoice were successfully delivered. If the invoice had no webhooks to deliver, this will be set while the invoice is being created. Format: Unix timestamp. Nullable.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :account_country,
    :account_name,
    :account_tax_ids,
    :amount_due,
    :amount_overpaid,
    :amount_paid,
    :amount_paid_off_stripe,
    :amount_remaining,
    :amount_shipping,
    :application,
    :attempt_count,
    :attempted,
    :auto_advance,
    :automatic_tax,
    :automatically_finalizes_at,
    :billing_reason,
    :collection_method,
    :confirmation_secret,
    :created,
    :currency,
    :custom_fields,
    :customer,
    :customer_account,
    :customer_address,
    :customer_email,
    :customer_name,
    :customer_phone,
    :customer_shipping,
    :customer_tax_exempt,
    :customer_tax_ids,
    :default_payment_method,
    :default_source,
    :default_tax_rates,
    :description,
    :discounts,
    :due_date,
    :effective_at,
    :ending_balance,
    :footer,
    :from_invoice,
    :hosted_invoice_url,
    :id,
    :invoice_pdf,
    :issuer,
    :last_finalization_error,
    :latest_revision,
    :lines,
    :livemode,
    :metadata,
    :next_payment_attempt,
    :number,
    :object,
    :on_behalf_of,
    :parent,
    :payment_settings,
    :payments,
    :period_end,
    :period_start,
    :post_payment_credit_notes_amount,
    :pre_payment_credit_notes_amount,
    :receipt_number,
    :rendering,
    :shipping_cost,
    :shipping_details,
    :starting_balance,
    :statement_descriptor,
    :status,
    :status_transitions,
    :subscription,
    :subtotal,
    :subtotal_excluding_tax,
    :test_clock,
    :threshold_reason,
    :total,
    :total_discount_amounts,
    :total_excluding_tax,
    :total_pretax_credit_amounts,
    :total_taxes,
    :webhooks_delivered_at
  ]

  @object_name "invoice"
  def object_name, do: @object_name

  def expandable_fields,
    do: [
      "account_tax_ids",
      "application",
      "automatic_tax",
      "confirmation_secret",
      "custom_fields",
      "customer",
      "customer_address",
      "customer_shipping",
      "customer_tax_ids",
      "default_payment_method",
      "default_source",
      "default_tax_rates",
      "discounts",
      "from_invoice",
      "issuer",
      "last_finalization_error",
      "latest_revision",
      "lines",
      "on_behalf_of",
      "parent",
      "payment_settings",
      "payments",
      "rendering",
      "shipping_cost",
      "shipping_details",
      "status_transitions",
      "subscription",
      "test_clock",
      "threshold_reason",
      "total_discount_amounts",
      "total_pretax_credit_amounts",
      "total_taxes"
    ]

  def __nested_fields__ do
    %{
      "automatic_tax" => %{
        fields: %{
          "disabled_reason" => :scalar,
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
      "confirmation_secret" => %{
        fields: %{
          "client_secret" => :scalar,
          "type" => :scalar
        }
      },
      "custom_fields" => %{
        fields: %{
          "name" => :scalar,
          "value" => :scalar
        }
      },
      "customer_tax_ids" => %{
        fields: %{
          "type" => :scalar,
          "value" => :scalar
        }
      },
      "from_invoice" => %{
        fields: %{
          "action" => :scalar,
          "invoice" => {:resource, Stripe.Resources.Invoice}
        }
      },
      "issuer" => %{
        fields: %{
          "account" => {:resource, Stripe.Resources.Account},
          "type" => :scalar
        }
      },
      "lines" => %{
        fields: %{
          "data" => {:list, {:resource, Stripe.Resources.InvoiceLineItem}},
          "has_more" => :scalar,
          "object" => :scalar,
          "url" => :scalar
        }
      },
      "parent" => %{
        fields: %{
          "quote_details" => %{
            fields: %{
              "quote" => :scalar
            }
          },
          "subscription_details" => %{
            fields: %{
              "metadata" => {:map, :scalar},
              "subscription" => {:resource, Stripe.Resources.Subscription},
              "subscription_proration_date" => :scalar
            }
          },
          "type" => :scalar
        }
      },
      "payment_settings" => %{
        fields: %{
          "default_mandate" => :scalar,
          "payment_method_options" => %{
            fields: %{
              "acss_debit" => %{
                fields: %{
                  "mandate_options" => %{
                    fields: %{
                      "transaction_type" => :scalar
                    }
                  },
                  "verification_method" => :scalar
                }
              },
              "bancontact" => %{
                fields: %{
                  "preferred_language" => :scalar
                }
              },
              "card" => %{
                fields: %{
                  "installments" => %{
                    fields: %{
                      "enabled" => :scalar
                    }
                  },
                  "request_three_d_secure" => :scalar
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
                      "type" => :scalar
                    }
                  },
                  "funding_type" => :scalar
                }
              },
              "konbini" => :scalar,
              "payto" => %{
                fields: %{
                  "mandate_options" => %{
                    fields: %{
                      "amount" => :scalar,
                      "amount_type" => :scalar,
                      "purpose" => :scalar
                    }
                  }
                }
              },
              "pix" => %{
                fields: %{
                  "amount_includes_iof" => :scalar,
                  "expires_after_seconds" => :scalar
                }
              },
              "sepa_debit" => :scalar,
              "upi" => %{
                fields: %{
                  "mandate_options" => %{
                    fields: %{
                      "amount" => :scalar,
                      "amount_type" => :scalar,
                      "description" => :scalar,
                      "end_date" => :scalar
                    }
                  }
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
                      "prefetch" => {:list, :scalar}
                    }
                  },
                  "verification_method" => :scalar
                }
              }
            }
          },
          "payment_method_types" => {:list, :scalar}
        }
      },
      "payments" => %{
        fields: %{
          "data" => {:list, {:resource, Stripe.Resources.InvoicePayment}},
          "has_more" => :scalar,
          "object" => :scalar,
          "url" => :scalar
        }
      },
      "rendering" => %{
        fields: %{
          "amount_tax_display" => :scalar,
          "pdf" => %{
            fields: %{
              "page_size" => :scalar
            }
          },
          "template" => :scalar,
          "template_version" => :scalar
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
      "status_transitions" => %{
        fields: %{
          "finalized_at" => :scalar,
          "marked_uncollectible_at" => :scalar,
          "paid_at" => :scalar,
          "voided_at" => :scalar
        }
      },
      "threshold_reason" => %{
        fields: %{
          "amount_gte" => :scalar,
          "item_reasons" =>
            {:list,
             %{
               fields: %{
                 "line_item_ids" => {:list, :scalar},
                 "usage_gte" => :scalar
               }
             }}
        }
      },
      "total_discount_amounts" => %{
        fields: %{
          "amount" => :scalar,
          "discount" => {:resource, Stripe.Resources.Discount}
        }
      },
      "total_pretax_credit_amounts" => %{
        fields: %{
          "amount" => :scalar,
          "credit_balance_transaction" =>
            {:resource, Stripe.Resources.Billing.CreditBalanceTransaction},
          "discount" => {:resource, Stripe.Resources.Discount},
          "type" => :scalar
        }
      },
      "total_taxes" => %{
        fields: %{
          "amount" => :scalar,
          "tax_behavior" => :scalar,
          "tax_rate_details" => %{
            fields: %{
              "tax_rate" => {:resource, Stripe.Resources.TaxRate}
            }
          },
          "taxability_reason" => :scalar,
          "taxable_amount" => :scalar,
          "type" => :scalar
        }
      },
      "customer_address" => {:resource, Stripe.Resources.Address},
      "customer_shipping" => {:resource, Stripe.Resources.ShippingDetails},
      "last_finalization_error" => {:resource, Stripe.Resources.StripeError},
      "shipping_details" => {:resource, Stripe.Resources.ShippingDetails}
    }
  end
end
