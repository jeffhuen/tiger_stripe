# File generated from our OpenAPI spec
defmodule Stripe.Params.QuoteCreateParams do
  @moduledoc "Parameters for quote create."

  @typedoc """
  * `application_fee_amount` - The amount of the application fee (if any) that will be requested to be applied to the payment and transferred to the application owner's Stripe account. There cannot be any line items with recurring prices when using this field.
  * `application_fee_percent` - A non-negative decimal between 0 and 100, with at most two decimal places. This represents the percentage of the subscription invoice total that will be transferred to the application owner's Stripe account. There must be at least 1 line item with a recurring price to use this field.
  * `automatic_tax` - Settings for automatic tax lookup for this quote and resulting invoices and subscriptions.
  * `collection_method` - Either `charge_automatically`, or `send_invoice`. When charging automatically, Stripe will attempt to pay invoices at the end of the subscription cycle or at invoice finalization using the default payment method attached to the subscription or customer. When sending an invoice, Stripe will email your customer an invoice with payment instructions and mark the subscription as `active`. Defaults to `charge_automatically`. Possible values: `charge_automatically`, `send_invoice`.
  * `customer` - The customer for which this quote belongs to. A customer is required before finalizing the quote. Once specified, it cannot be changed. Max length: 5000.
  * `customer_account` - The account for which this quote belongs to. A customer or account is required before finalizing the quote. Once specified, it cannot be changed. Max length: 5000.
  * `default_tax_rates` - The tax rates that will apply to any line item that does not have `tax_rates` set.
  * `description` - A description that will be displayed on the quote PDF. If no value is passed, the default description configured in your [quote template settings](https://dashboard.stripe.com/settings/billing/quote) will be used.
  * `discounts` - The discounts applied to the quote.
  * `expand` - Specifies which fields in the response should be expanded.
  * `expires_at` - A future timestamp on which the quote will be canceled if in `open` or `draft` status. Measured in seconds since the Unix epoch. If no value is passed, the default expiration date configured in your [quote template settings](https://dashboard.stripe.com/settings/billing/quote) will be used. Format: Unix timestamp.
  * `footer` - A footer that will be displayed on the quote PDF. If no value is passed, the default footer configured in your [quote template settings](https://dashboard.stripe.com/settings/billing/quote) will be used.
  * `from_quote` - Clone an existing quote. The new quote will be created in `status=draft`. When using this parameter, you cannot specify any other parameters except for `expires_at`.
  * `header` - A header that will be displayed on the quote PDF. If no value is passed, the default header configured in your [quote template settings](https://dashboard.stripe.com/settings/billing/quote) will be used.
  * `invoice_settings` - All invoices will be billed using the specified settings.
  * `line_items` - A list of line items the customer is being quoted for. Each line item includes information about the product, the quantity, and the resulting cost.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `on_behalf_of` - The account on behalf of which to charge.
  * `subscription_data` - When creating a subscription or subscription schedule, the specified configuration data will be used. There must be at least one line item with a recurring price for a subscription or subscription schedule to be created. A subscription schedule is created if `subscription_data[effective_date]` is present and in the future, otherwise a subscription is created.
  * `test_clock` - ID of the test clock to attach to the quote. Max length: 5000.
  * `transfer_data` - The data with which to automatically create a Transfer for each of the invoices.
  """
  @type t :: %__MODULE__{
          application_fee_amount: map() | nil,
          application_fee_percent: map() | nil,
          automatic_tax: __MODULE__.AutomaticTax.t() | nil,
          collection_method: String.t() | nil,
          customer: String.t() | nil,
          customer_account: String.t() | nil,
          default_tax_rates: map() | nil,
          description: map() | nil,
          discounts: map() | nil,
          expand: [String.t()] | nil,
          expires_at: integer() | nil,
          footer: map() | nil,
          from_quote: __MODULE__.FromQuote.t() | nil,
          header: map() | nil,
          invoice_settings: __MODULE__.InvoiceSettings.t() | nil,
          line_items: [__MODULE__.LineItems.t()] | nil,
          metadata: %{String.t() => String.t()} | nil,
          on_behalf_of: map() | nil,
          subscription_data: __MODULE__.SubscriptionData.t() | nil,
          test_clock: String.t() | nil,
          transfer_data: map() | nil
        }

  defstruct [
    :application_fee_amount,
    :application_fee_percent,
    :automatic_tax,
    :collection_method,
    :customer,
    :customer_account,
    :default_tax_rates,
    :description,
    :discounts,
    :expand,
    :expires_at,
    :footer,
    :from_quote,
    :header,
    :invoice_settings,
    :line_items,
    :metadata,
    :on_behalf_of,
    :subscription_data,
    :test_clock,
    :transfer_data
  ]

  defmodule AutomaticTax do
    @moduledoc "Nested parameters."

    @typedoc """
    * `enabled` - Controls whether Stripe will automatically compute tax on the resulting invoices or subscriptions as well as the quote itself.
    * `liability` - The account that's liable for tax. If set, the business address and tax registrations required to perform the tax calculation are loaded from this account. The tax transaction is returned in the report of the connected account.
    """
    @type t :: %__MODULE__{
            enabled: boolean() | nil,
            liability: __MODULE__.Liability.t() | nil
          }
    defstruct [:enabled, :liability]

    defmodule Liability do
      @moduledoc "Nested parameters."

      @typedoc """
      * `account` - The connected account being referenced when `type` is `account`.
      * `type` - Type of the account referenced in the request. Possible values: `account`, `self`.
      """
      @type t :: %__MODULE__{
              account: String.t() | nil,
              type: String.t() | nil
            }
      defstruct [:account, :type]
    end
  end

  defmodule FromQuote do
    @moduledoc "Nested parameters."

    @typedoc """
    * `is_revision` - Whether this quote is a revision of the previous quote.
    * `quote` - The `id` of the quote that will be cloned. Max length: 5000.
    """
    @type t :: %__MODULE__{
            is_revision: boolean() | nil,
            quote: String.t() | nil
          }
    defstruct [:is_revision, :quote]
  end

  defmodule InvoiceSettings do
    @moduledoc "Nested parameters."

    @typedoc """
    * `days_until_due` - Number of days within which a customer must pay the invoice generated by this quote. This value will be `null` for quotes where `collection_method=charge_automatically`.
    * `issuer` - The connected account that issues the invoice. The invoice is presented with the branding and support information of the specified account.
    """
    @type t :: %__MODULE__{
            days_until_due: integer() | nil,
            issuer: __MODULE__.Issuer.t() | nil
          }
    defstruct [:days_until_due, :issuer]

    defmodule Issuer do
      @moduledoc "Nested parameters."

      @typedoc """
      * `account` - The connected account being referenced when `type` is `account`.
      * `type` - Type of the account referenced in the request. Possible values: `account`, `self`.
      """
      @type t :: %__MODULE__{
              account: String.t() | nil,
              type: String.t() | nil
            }
      defstruct [:account, :type]
    end
  end

  defmodule LineItems do
    @moduledoc "Nested parameters."

    @typedoc """
    * `discounts` - The discounts applied to this line item.
    * `price` - The ID of the price object. One of `price` or `price_data` is required. Max length: 5000.
    * `price_data` - Data used to generate a new [Price](https://docs.stripe.com/api/prices) object inline. One of `price` or `price_data` is required.
    * `quantity` - The quantity of the line item.
    * `tax_rates` - The tax rates which apply to the line item. When set, the `default_tax_rates` on the quote do not apply to this line item.
    """
    @type t :: %__MODULE__{
            discounts: map() | nil,
            price: String.t() | nil,
            price_data: __MODULE__.PriceData.t() | nil,
            quantity: integer() | nil,
            tax_rates: map() | nil
          }
    defstruct [:discounts, :price, :price_data, :quantity, :tax_rates]

    defmodule PriceData do
      @moduledoc "Nested parameters."

      @typedoc """
      * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
      * `product` - The ID of the [Product](https://docs.stripe.com/api/products) that this [Price](https://docs.stripe.com/api/prices) will belong to. Max length: 5000.
      * `recurring` - The recurring components of a price such as `interval` and `interval_count`.
      * `tax_behavior` - Only required if a [default tax behavior](https://docs.stripe.com/tax/products-prices-tax-categories-tax-behavior#setting-a-default-tax-behavior-(recommended)) was not provided in the Stripe Tax settings. Specifies whether the price is considered inclusive of taxes or exclusive of taxes. One of `inclusive`, `exclusive`, or `unspecified`. Once specified as either `inclusive` or `exclusive`, it cannot be changed. Possible values: `exclusive`, `inclusive`, `unspecified`.
      * `unit_amount` - A positive integer in cents (or local equivalent) (or 0 for a free price) representing how much to charge.
      * `unit_amount_decimal` - Same as `unit_amount`, but accepts a decimal value in cents (or local equivalent) with at most 12 decimal places. Only one of `unit_amount` and `unit_amount_decimal` can be set. Format: decimal string.
      """
      @type t :: %__MODULE__{
              currency: String.t() | nil,
              product: String.t() | nil,
              recurring: __MODULE__.Recurring.t() | nil,
              tax_behavior: String.t() | nil,
              unit_amount: integer() | nil,
              unit_amount_decimal: String.t() | nil
            }
      defstruct [
        :currency,
        :product,
        :recurring,
        :tax_behavior,
        :unit_amount,
        :unit_amount_decimal
      ]

      defmodule Recurring do
        @moduledoc "Nested parameters."

        @typedoc """
        * `interval` - Specifies billing frequency. Either `day`, `week`, `month` or `year`. Possible values: `day`, `month`, `week`, `year`.
        * `interval_count` - The number of intervals between subscription billings. For example, `interval=month` and `interval_count=3` bills every 3 months. Maximum of three years interval allowed (3 years, 36 months, or 156 weeks).
        """
        @type t :: %__MODULE__{
                interval: String.t() | nil,
                interval_count: integer() | nil
              }
        defstruct [:interval, :interval_count]
      end
    end
  end

  defmodule SubscriptionData do
    @moduledoc "Nested parameters."

    @typedoc """
    * `billing_mode` - Controls how prorations and invoices for subscriptions are calculated and orchestrated.
    * `description` - The subscription's description, meant to be displayable to the customer. Use this field to optionally store an explanation of the subscription for rendering in Stripe surfaces and certain local payment methods UIs. Max length: 500.
    * `effective_date` - When creating a new subscription, the date of which the subscription schedule will start after the quote is accepted. The `effective_date` is ignored if it is in the past when the quote is accepted.
    * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that will set metadata on the subscription or subscription schedule when the quote is accepted. If a recurring price is included in `line_items`, this field will be passed to the resulting subscription's `metadata` field. If `subscription_data.effective_date` is used, this field will be passed to the resulting subscription schedule's `phases.metadata` field. Unlike object-level metadata, this field is declarative. Updates will clear prior values.
    * `trial_period_days` - Integer representing the number of trial period days before the customer is charged for the first time.
    """
    @type t :: %__MODULE__{
            billing_mode: __MODULE__.BillingMode.t() | nil,
            description: String.t() | nil,
            effective_date: map() | nil,
            metadata: %{String.t() => String.t()} | nil,
            trial_period_days: map() | nil
          }
    defstruct [:billing_mode, :description, :effective_date, :metadata, :trial_period_days]

    defmodule BillingMode do
      @moduledoc "Nested parameters."

      @typedoc """
      * `flexible` - Configure behavior for flexible billing mode.
      * `type` - Controls the calculation and orchestration of prorations and invoices for subscriptions. If no value is passed, the default is `flexible`. Possible values: `classic`, `flexible`.
      """
      @type t :: %__MODULE__{
              flexible: __MODULE__.Flexible.t() | nil,
              type: String.t() | nil
            }
      defstruct [:flexible, :type]

      defmodule Flexible do
        @moduledoc "Nested parameters."

        @typedoc """
        * `proration_discounts` - Controls how invoices and invoice items display proration amounts and discount amounts. Possible values: `included`, `itemized`.
        """
        @type t :: %__MODULE__{
                proration_discounts: String.t() | nil
              }
        defstruct [:proration_discounts]
      end
    end
  end
end
