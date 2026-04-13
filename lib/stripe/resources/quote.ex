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
          automatic_tax: __MODULE__.AutomaticTax.t(),
          collection_method: String.t(),
          computed: __MODULE__.Computed.t(),
          created: integer(),
          currency: String.t(),
          customer: String.t() | Stripe.Resources.Customer.t(),
          customer_account: String.t(),
          default_tax_rates: [String.t() | Stripe.Resources.TaxRate.t()] | nil,
          description: String.t(),
          discounts: [String.t() | Stripe.Resources.Discount.t()],
          expires_at: integer(),
          footer: String.t(),
          from_quote: __MODULE__.FromQuote.t(),
          header: String.t(),
          id: String.t(),
          invoice: String.t() | Stripe.Resources.Invoice.t(),
          invoice_settings: __MODULE__.InvoiceSettings.t(),
          line_items: __MODULE__.LineItems.t() | nil,
          livemode: boolean(),
          metadata: %{String.t() => String.t()},
          number: String.t(),
          object: String.t(),
          on_behalf_of: String.t() | Stripe.Resources.Account.t(),
          status: String.t(),
          status_transitions: __MODULE__.StatusTransitions.t(),
          subscription: String.t() | Stripe.Resources.Subscription.t(),
          subscription_data: __MODULE__.SubscriptionData.t(),
          subscription_schedule: String.t() | Stripe.Resources.SubscriptionSchedule.t(),
          test_clock: String.t() | Stripe.Resources.TestHelpers.TestClock.t(),
          total_details: __MODULE__.TotalDetails.t(),
          transfer_data: __MODULE__.TransferData.t()
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

  defmodule AutomaticTax do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `enabled` - Automatically calculate taxes
    * `liability` - The account that's liable for tax. If set, the business address and tax registrations required to perform the tax calculation are loaded from this account. The tax transaction is returned in the report of the connected account. Nullable.
    * `provider` - The tax provider powering automatic tax. Max length: 5000. Nullable.
    * `status` - The status of the most recent automated tax calculation for this quote. Possible values: `complete`, `failed`, `requires_location_inputs`. Nullable.
    """
    @type t :: %__MODULE__{
            enabled: boolean() | nil,
            liability: __MODULE__.Liability.t() | nil,
            provider: String.t() | nil,
            status: String.t() | nil
          }
    defstruct [:enabled, :liability, :provider, :status]

    defmodule Liability do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `account` - The connected account being referenced when `type` is `account`.
      * `type` - Type of the account referenced. Possible values: `account`, `self`.
      """
      @type t :: %__MODULE__{
              account: String.t() | Stripe.Resources.Account.t() | nil,
              type: String.t() | nil
            }
      defstruct [:account, :type]
    end

    def __inner_types__ do
      %{
        "liability" => __MODULE__.Liability
      }
    end
  end

  defmodule Computed do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `recurring` - The definitive totals and line items the customer will be charged on a recurring basis. Takes into account the line items with recurring prices and discounts with `duration=forever` coupons only. Defaults to `null` if no inputted line items with recurring prices. Nullable.
    * `upfront`
    """
    @type t :: %__MODULE__{
            recurring: __MODULE__.Recurring.t() | nil,
            upfront: __MODULE__.Upfront.t() | nil
          }
    defstruct [:recurring, :upfront]

    defmodule Recurring do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `amount_subtotal` - Total before any discounts or taxes are applied.
      * `amount_total` - Total after discounts and taxes are applied.
      * `interval` - The frequency at which a subscription is billed. One of `day`, `week`, `month` or `year`. Possible values: `day`, `month`, `week`, `year`.
      * `interval_count` - The number of intervals (specified in the `interval` attribute) between subscription billings. For example, `interval=month` and `interval_count=3` bills every 3 months.
      * `total_details`
      """
      @type t :: %__MODULE__{
              amount_subtotal: integer() | nil,
              amount_total: integer() | nil,
              interval: String.t() | nil,
              interval_count: integer() | nil,
              total_details: __MODULE__.TotalDetails.t() | nil
            }
      defstruct [:amount_subtotal, :amount_total, :interval, :interval_count, :total_details]

      defmodule TotalDetails do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `amount_discount` - This is the sum of all the discounts.
        * `amount_shipping` - This is the sum of all the shipping amounts. Nullable.
        * `amount_tax` - This is the sum of all the tax amounts.
        * `breakdown`
        """
        @type t :: %__MODULE__{
                amount_discount: integer() | nil,
                amount_shipping: integer() | nil,
                amount_tax: integer() | nil,
                breakdown: __MODULE__.Breakdown.t() | nil
              }
        defstruct [:amount_discount, :amount_shipping, :amount_tax, :breakdown]

        defmodule Breakdown do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `discounts` - The aggregated discounts.
          * `taxes` - The aggregated tax amounts by rate.
          """
          @type t :: %__MODULE__{
                  discounts: [__MODULE__.Discounts.t()] | nil,
                  taxes: [__MODULE__.Taxes.t()] | nil
                }
          defstruct [:discounts, :taxes]

          defmodule Discounts do
            @moduledoc "Nested struct within the parent resource."

            @typedoc """
            * `amount` - The amount discounted.
            * `discount`
            """
            @type t :: %__MODULE__{
                    amount: integer() | nil,
                    discount: Stripe.Resources.Discount.t() | nil
                  }
            defstruct [:amount, :discount]
          end

          defmodule Taxes do
            @moduledoc "Nested struct within the parent resource."

            @typedoc """
            * `amount` - Amount of tax applied for this rate.
            * `rate`
            * `taxability_reason` - The reasoning behind this tax, for example, if the product is tax exempt. The possible values for this field may be extended as new tax rules are supported. Possible values: `customer_exempt`, `not_collecting`, `not_subject_to_tax`, `not_supported`, `portion_product_exempt`, `portion_reduced_rated`, `portion_standard_rated`, `product_exempt`, `product_exempt_holiday`, `proportionally_rated`, `reduced_rated`, `reverse_charge`, `standard_rated`, `taxable_basis_reduced`, `zero_rated`. Nullable.
            * `taxable_amount` - The amount on which tax is calculated, in cents (or local equivalent). Nullable.
            """
            @type t :: %__MODULE__{
                    amount: integer() | nil,
                    rate: Stripe.Resources.TaxRate.t() | nil,
                    taxability_reason: String.t() | nil,
                    taxable_amount: integer() | nil
                  }
            defstruct [:amount, :rate, :taxability_reason, :taxable_amount]
          end

          def __inner_types__ do
            %{
              "discounts" => __MODULE__.Discounts,
              "taxes" => __MODULE__.Taxes
            }
          end
        end

        def __inner_types__ do
          %{
            "breakdown" => __MODULE__.Breakdown
          }
        end
      end

      def __inner_types__ do
        %{
          "total_details" => __MODULE__.TotalDetails
        }
      end
    end

    defmodule Upfront do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `amount_subtotal` - Total before any discounts or taxes are applied.
      * `amount_total` - Total after discounts and taxes are applied.
      * `line_items` - The line items that will appear on the next invoice after this quote is accepted. This does not include pending invoice items that exist on the customer but may still be included in the next invoice.
      * `total_details`
      """
      @type t :: %__MODULE__{
              amount_subtotal: integer() | nil,
              amount_total: integer() | nil,
              line_items: __MODULE__.LineItems.t() | nil,
              total_details: __MODULE__.TotalDetails.t() | nil
            }
      defstruct [:amount_subtotal, :amount_total, :line_items, :total_details]

      defmodule LineItems do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `data` - Details about each object.
        * `has_more` - True if this list has another page of items after this one that can be fetched.
        * `object` - String representing the object's type. Objects of the same type share the same value. Always has the value `list`. Possible values: `list`.
        * `url` - The URL where this list can be accessed. Max length: 5000.
        """
        @type t :: %__MODULE__{
                data: [Stripe.Resources.LineItem.t()] | nil,
                has_more: boolean() | nil,
                object: String.t() | nil,
                url: String.t() | nil
              }
        defstruct [:data, :has_more, :object, :url]
      end

      defmodule TotalDetails do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `amount_discount` - This is the sum of all the discounts.
        * `amount_shipping` - This is the sum of all the shipping amounts. Nullable.
        * `amount_tax` - This is the sum of all the tax amounts.
        * `breakdown`
        """
        @type t :: %__MODULE__{
                amount_discount: integer() | nil,
                amount_shipping: integer() | nil,
                amount_tax: integer() | nil,
                breakdown: __MODULE__.Breakdown.t() | nil
              }
        defstruct [:amount_discount, :amount_shipping, :amount_tax, :breakdown]

        defmodule Breakdown do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `discounts` - The aggregated discounts.
          * `taxes` - The aggregated tax amounts by rate.
          """
          @type t :: %__MODULE__{
                  discounts: [__MODULE__.Discounts.t()] | nil,
                  taxes: [__MODULE__.Taxes.t()] | nil
                }
          defstruct [:discounts, :taxes]

          defmodule Discounts do
            @moduledoc "Nested struct within the parent resource."

            @typedoc """
            * `amount` - The amount discounted.
            * `discount`
            """
            @type t :: %__MODULE__{
                    amount: integer() | nil,
                    discount: Stripe.Resources.Discount.t() | nil
                  }
            defstruct [:amount, :discount]
          end

          defmodule Taxes do
            @moduledoc "Nested struct within the parent resource."

            @typedoc """
            * `amount` - Amount of tax applied for this rate.
            * `rate`
            * `taxability_reason` - The reasoning behind this tax, for example, if the product is tax exempt. The possible values for this field may be extended as new tax rules are supported. Possible values: `customer_exempt`, `not_collecting`, `not_subject_to_tax`, `not_supported`, `portion_product_exempt`, `portion_reduced_rated`, `portion_standard_rated`, `product_exempt`, `product_exempt_holiday`, `proportionally_rated`, `reduced_rated`, `reverse_charge`, `standard_rated`, `taxable_basis_reduced`, `zero_rated`. Nullable.
            * `taxable_amount` - The amount on which tax is calculated, in cents (or local equivalent). Nullable.
            """
            @type t :: %__MODULE__{
                    amount: integer() | nil,
                    rate: Stripe.Resources.TaxRate.t() | nil,
                    taxability_reason: String.t() | nil,
                    taxable_amount: integer() | nil
                  }
            defstruct [:amount, :rate, :taxability_reason, :taxable_amount]
          end

          def __inner_types__ do
            %{
              "discounts" => __MODULE__.Discounts,
              "taxes" => __MODULE__.Taxes
            }
          end
        end

        def __inner_types__ do
          %{
            "breakdown" => __MODULE__.Breakdown
          }
        end
      end

      def __inner_types__ do
        %{
          "line_items" => __MODULE__.LineItems,
          "total_details" => __MODULE__.TotalDetails
        }
      end
    end

    def __inner_types__ do
      %{
        "recurring" => __MODULE__.Recurring,
        "upfront" => __MODULE__.Upfront
      }
    end
  end

  defmodule FromQuote do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `is_revision` - Whether this quote is a revision of a different quote.
    * `quote` - The quote that was cloned.
    """
    @type t :: %__MODULE__{
            is_revision: boolean() | nil,
            quote: String.t() | Stripe.Resources.Quote.t() | nil
          }
    defstruct [:is_revision, :quote]
  end

  defmodule InvoiceSettings do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `days_until_due` - Number of days within which a customer must pay invoices generated by this quote. This value will be `null` for quotes where `collection_method=charge_automatically`. Nullable.
    * `issuer`
    """
    @type t :: %__MODULE__{
            days_until_due: integer() | nil,
            issuer: __MODULE__.Issuer.t() | nil
          }
    defstruct [:days_until_due, :issuer]

    defmodule Issuer do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `account` - The connected account being referenced when `type` is `account`.
      * `type` - Type of the account referenced. Possible values: `account`, `self`.
      """
      @type t :: %__MODULE__{
              account: String.t() | Stripe.Resources.Account.t() | nil,
              type: String.t() | nil
            }
      defstruct [:account, :type]
    end

    def __inner_types__ do
      %{
        "issuer" => __MODULE__.Issuer
      }
    end
  end

  defmodule LineItems do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `data` - Details about each object.
    * `has_more` - True if this list has another page of items after this one that can be fetched.
    * `object` - String representing the object's type. Objects of the same type share the same value. Always has the value `list`. Possible values: `list`.
    * `url` - The URL where this list can be accessed. Max length: 5000.
    """
    @type t :: %__MODULE__{
            data: [Stripe.Resources.LineItem.t()] | nil,
            has_more: boolean() | nil,
            object: String.t() | nil,
            url: String.t() | nil
          }
    defstruct [:data, :has_more, :object, :url]
  end

  defmodule StatusTransitions do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `accepted_at` - The time that the quote was accepted. Measured in seconds since Unix epoch. Format: Unix timestamp. Nullable.
    * `canceled_at` - The time that the quote was canceled. Measured in seconds since Unix epoch. Format: Unix timestamp. Nullable.
    * `finalized_at` - The time that the quote was finalized. Measured in seconds since Unix epoch. Format: Unix timestamp. Nullable.
    """
    @type t :: %__MODULE__{
            accepted_at: integer() | nil,
            canceled_at: integer() | nil,
            finalized_at: integer() | nil
          }
    defstruct [:accepted_at, :canceled_at, :finalized_at]
  end

  defmodule SubscriptionData do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `billing_mode`
    * `description` - The subscription's description, meant to be displayable to the customer. Use this field to optionally store an explanation of the subscription for rendering in Stripe surfaces and certain local payment methods UIs. Max length: 5000. Nullable.
    * `effective_date` - When creating a new subscription, the date of which the subscription schedule will start after the quote is accepted. This date is ignored if it is in the past when the quote is accepted. Measured in seconds since the Unix epoch. Format: Unix timestamp. Nullable.
    * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that will set metadata on the subscription or subscription schedule when the quote is accepted. If a recurring price is included in `line_items`, this field will be passed to the resulting subscription's `metadata` field. If `subscription_data.effective_date` is used, this field will be passed to the resulting subscription schedule's `phases.metadata` field. Unlike object-level metadata, this field is declarative. Updates will clear prior values. Nullable.
    * `trial_period_days` - Integer representing the number of trial period days before the customer is charged for the first time. Nullable.
    """
    @type t :: %__MODULE__{
            billing_mode: __MODULE__.BillingMode.t() | nil,
            description: String.t() | nil,
            effective_date: integer() | nil,
            metadata: %{String.t() => String.t()} | nil,
            trial_period_days: integer() | nil
          }
    defstruct [:billing_mode, :description, :effective_date, :metadata, :trial_period_days]

    defmodule BillingMode do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `flexible`
      * `type` - Controls how prorations and invoices for subscriptions are calculated and orchestrated. Possible values: `classic`, `flexible`.
      """
      @type t :: %__MODULE__{
              flexible: __MODULE__.Flexible.t() | nil,
              type: String.t() | nil
            }
      defstruct [:flexible, :type]

      defmodule Flexible do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `proration_discounts` - Controls how invoices and invoice items display proration amounts and discount amounts. Possible values: `included`, `itemized`.
        """
        @type t :: %__MODULE__{
                proration_discounts: String.t() | nil
              }
        defstruct [:proration_discounts]
      end

      def __inner_types__ do
        %{
          "flexible" => __MODULE__.Flexible
        }
      end
    end

    def __inner_types__ do
      %{
        "billing_mode" => __MODULE__.BillingMode
      }
    end
  end

  defmodule TotalDetails do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `amount_discount` - This is the sum of all the discounts.
    * `amount_shipping` - This is the sum of all the shipping amounts. Nullable.
    * `amount_tax` - This is the sum of all the tax amounts.
    * `breakdown`
    """
    @type t :: %__MODULE__{
            amount_discount: integer() | nil,
            amount_shipping: integer() | nil,
            amount_tax: integer() | nil,
            breakdown: __MODULE__.Breakdown.t() | nil
          }
    defstruct [:amount_discount, :amount_shipping, :amount_tax, :breakdown]

    defmodule Breakdown do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `discounts` - The aggregated discounts.
      * `taxes` - The aggregated tax amounts by rate.
      """
      @type t :: %__MODULE__{
              discounts: [__MODULE__.Discounts.t()] | nil,
              taxes: [__MODULE__.Taxes.t()] | nil
            }
      defstruct [:discounts, :taxes]

      defmodule Discounts do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `amount` - The amount discounted.
        * `discount`
        """
        @type t :: %__MODULE__{
                amount: integer() | nil,
                discount: Stripe.Resources.Discount.t() | nil
              }
        defstruct [:amount, :discount]
      end

      defmodule Taxes do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `amount` - Amount of tax applied for this rate.
        * `rate`
        * `taxability_reason` - The reasoning behind this tax, for example, if the product is tax exempt. The possible values for this field may be extended as new tax rules are supported. Possible values: `customer_exempt`, `not_collecting`, `not_subject_to_tax`, `not_supported`, `portion_product_exempt`, `portion_reduced_rated`, `portion_standard_rated`, `product_exempt`, `product_exempt_holiday`, `proportionally_rated`, `reduced_rated`, `reverse_charge`, `standard_rated`, `taxable_basis_reduced`, `zero_rated`. Nullable.
        * `taxable_amount` - The amount on which tax is calculated, in cents (or local equivalent). Nullable.
        """
        @type t :: %__MODULE__{
                amount: integer() | nil,
                rate: Stripe.Resources.TaxRate.t() | nil,
                taxability_reason: String.t() | nil,
                taxable_amount: integer() | nil
              }
        defstruct [:amount, :rate, :taxability_reason, :taxable_amount]
      end

      def __inner_types__ do
        %{
          "discounts" => __MODULE__.Discounts,
          "taxes" => __MODULE__.Taxes
        }
      end
    end

    def __inner_types__ do
      %{
        "breakdown" => __MODULE__.Breakdown
      }
    end
  end

  defmodule TransferData do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `amount` - The amount in cents (or local equivalent) that will be transferred to the destination account when the invoice is paid. By default, the entire amount is transferred to the destination. Nullable.
    * `amount_percent` - A non-negative decimal between 0 and 100, with at most two decimal places. This represents the percentage of the subscription invoice total that will be transferred to the destination account. By default, the entire amount will be transferred to the destination. Nullable.
    * `destination` - The account where funds from the payment will be transferred to upon payment success.
    """
    @type t :: %__MODULE__{
            amount: integer() | nil,
            amount_percent: float() | nil,
            destination: String.t() | Stripe.Resources.Account.t() | nil
          }
    defstruct [:amount, :amount_percent, :destination]
  end

  def __inner_types__ do
    %{
      "automatic_tax" => __MODULE__.AutomaticTax,
      "computed" => __MODULE__.Computed,
      "from_quote" => __MODULE__.FromQuote,
      "invoice_settings" => __MODULE__.InvoiceSettings,
      "line_items" => __MODULE__.LineItems,
      "status_transitions" => __MODULE__.StatusTransitions,
      "subscription_data" => __MODULE__.SubscriptionData,
      "total_details" => __MODULE__.TotalDetails,
      "transfer_data" => __MODULE__.TransferData
    }
  end
end
