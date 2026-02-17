# File generated from our OpenAPI spec
defmodule Stripe.Params.InvoiceCreateParams do
  @moduledoc "Parameters for invoice create."

  @typedoc """
  * `account_tax_ids` - The account tax IDs associated with the invoice. Only editable when the invoice is a draft.
  * `application_fee_amount` - A fee in cents (or local equivalent) that will be applied to the invoice and transferred to the application owner's Stripe account. The request must be made with an OAuth key or the Stripe-Account header in order to take an application fee. For more information, see the application fees [documentation](https://docs.stripe.com/billing/invoices/connect#collecting-fees).
  * `auto_advance` - Controls whether Stripe performs [automatic collection](https://docs.stripe.com/invoicing/integration/automatic-advancement-collection) of the invoice. If `false`, the invoice's state doesn't automatically advance without an explicit action. Defaults to false.
  * `automatic_tax` - Settings for automatic tax lookup for this invoice.
  * `automatically_finalizes_at` - The time when this invoice should be scheduled to finalize (up to 5 years in the future). The invoice is finalized at this time if it's still in draft state. Format: Unix timestamp.
  * `collection_method` - Either `charge_automatically`, or `send_invoice`. When charging automatically, Stripe will attempt to pay this invoice using the default source attached to the customer. When sending an invoice, Stripe will email this invoice to the customer with payment instructions. Defaults to `charge_automatically`. Possible values: `charge_automatically`, `send_invoice`.
  * `currency` - The currency to create this invoice in. Defaults to that of `customer` if not specified. Format: ISO 4217 currency code.
  * `custom_fields` - A list of up to 4 custom fields to be displayed on the invoice.
  * `customer` - The ID of the customer to bill. Max length: 5000.
  * `customer_account` - The ID of the account to bill. Max length: 5000.
  * `days_until_due` - The number of days from when the invoice is created until it is due. Valid only for invoices where `collection_method=send_invoice`.
  * `default_payment_method` - ID of the default payment method for the invoice. It must belong to the customer associated with the invoice. If not set, defaults to the subscription's default payment method, if any, or to the default payment method in the customer's invoice settings. Max length: 5000.
  * `default_source` - ID of the default payment source for the invoice. It must belong to the customer associated with the invoice and be in a chargeable state. If not set, defaults to the subscription's default source, if any, or to the customer's default source. Max length: 5000.
  * `default_tax_rates` - The tax rates that will apply to any line item that does not have `tax_rates` set.
  * `description` - An arbitrary string attached to the object. Often useful for displaying to users. Referenced as 'memo' in the Dashboard. Max length: 1500.
  * `discounts` - The coupons and promotion codes to redeem into discounts for the invoice. If not specified, inherits the discount from the invoice's customer. Pass an empty string to avoid inheriting any discounts.
  * `due_date` - The date on which payment for this invoice is due. Valid only for invoices where `collection_method=send_invoice`. Format: Unix timestamp.
  * `effective_at` - The date when this invoice is in effect. Same as `finalized_at` unless overwritten. When defined, this value replaces the system-generated 'Date of issue' printed on the invoice PDF and receipt. Format: Unix timestamp.
  * `expand` - Specifies which fields in the response should be expanded.
  * `footer` - Footer to be displayed on the invoice. Max length: 5000.
  * `from_invoice` - Revise an existing invoice. The new invoice will be created in `status=draft`. See the [revision documentation](https://docs.stripe.com/invoicing/invoice-revisions) for more details.
  * `issuer` - The connected account that issues the invoice. The invoice is presented with the branding and support information of the specified account.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `number` - Set the number for this invoice. If no number is present then a number will be assigned automatically when the invoice is finalized. In many markets, regulations require invoices to be unique, sequential and / or gapless. You are responsible for ensuring this is true across all your different invoicing systems in the event that you edit the invoice number using our API. If you use only Stripe for your invoices and do not change invoice numbers, Stripe handles this aspect of compliance for you automatically. Max length: 26.
  * `on_behalf_of` - The account (if any) for which the funds of the invoice payment are intended. If set, the invoice will be presented with the branding and support information of the specified account. See the [Invoices with Connect](https://docs.stripe.com/billing/invoices/connect) documentation for details.
  * `payment_settings` - Configuration settings for the PaymentIntent that is generated when the invoice is finalized.
  * `pending_invoice_items_behavior` - How to handle pending invoice items on invoice creation. Defaults to `exclude` if the parameter is omitted. Possible values: `exclude`, `include`.
  * `rendering` - The rendering-related settings that control how the invoice is displayed on customer-facing surfaces such as PDF and Hosted Invoice Page.
  * `shipping_cost` - Settings for the cost of shipping for this invoice.
  * `shipping_details` - Shipping details for the invoice. The Invoice PDF will use the `shipping_details` value if it is set, otherwise the PDF will render the shipping address from the customer.
  * `statement_descriptor` - Extra information about a charge for the customer's credit card statement. It must contain at least one letter. If not specified and this invoice is part of a subscription, the default `statement_descriptor` will be set to the first subscription item's product's `statement_descriptor`. Max length: 22.
  * `subscription` - The ID of the subscription to invoice, if any. If set, the created invoice will only include pending invoice items for that subscription. The subscription's billing cycle and regular subscription events won't be affected. Max length: 5000.
  * `transfer_data` - If specified, the funds from the invoice will be transferred to the destination and the ID of the resulting transfer will be found on the invoice's charge.
  """
  @type t :: %__MODULE__{
          account_tax_ids: map() | nil,
          application_fee_amount: integer() | nil,
          auto_advance: boolean() | nil,
          automatic_tax: __MODULE__.AutomaticTax.t() | nil,
          automatically_finalizes_at: integer() | nil,
          collection_method: String.t() | nil,
          currency: String.t() | nil,
          custom_fields: map() | nil,
          customer: String.t() | nil,
          customer_account: String.t() | nil,
          days_until_due: integer() | nil,
          default_payment_method: String.t() | nil,
          default_source: String.t() | nil,
          default_tax_rates: [String.t()] | nil,
          description: String.t() | nil,
          discounts: map() | nil,
          due_date: integer() | nil,
          effective_at: integer() | nil,
          expand: [String.t()] | nil,
          footer: String.t() | nil,
          from_invoice: __MODULE__.FromInvoice.t() | nil,
          issuer: __MODULE__.Issuer.t() | nil,
          metadata: map() | nil,
          number: String.t() | nil,
          on_behalf_of: String.t() | nil,
          payment_settings: __MODULE__.PaymentSettings.t() | nil,
          pending_invoice_items_behavior: String.t() | nil,
          rendering: __MODULE__.Rendering.t() | nil,
          shipping_cost: __MODULE__.ShippingCost.t() | nil,
          shipping_details: __MODULE__.ShippingDetails.t() | nil,
          statement_descriptor: String.t() | nil,
          subscription: String.t() | nil,
          transfer_data: __MODULE__.TransferData.t() | nil
        }

  defstruct [
    :account_tax_ids,
    :application_fee_amount,
    :auto_advance,
    :automatic_tax,
    :automatically_finalizes_at,
    :collection_method,
    :currency,
    :custom_fields,
    :customer,
    :customer_account,
    :days_until_due,
    :default_payment_method,
    :default_source,
    :default_tax_rates,
    :description,
    :discounts,
    :due_date,
    :effective_at,
    :expand,
    :footer,
    :from_invoice,
    :issuer,
    :metadata,
    :number,
    :on_behalf_of,
    :payment_settings,
    :pending_invoice_items_behavior,
    :rendering,
    :shipping_cost,
    :shipping_details,
    :statement_descriptor,
    :subscription,
    :transfer_data
  ]

  defmodule AutomaticTax do
    @moduledoc "Nested parameters."

    @typedoc """
    * `enabled` - Whether Stripe automatically computes tax on this invoice. Note that incompatible invoice items (invoice items with manually specified [tax rates](https://docs.stripe.com/api/tax_rates), negative amounts, or `tax_behavior=unspecified`) cannot be added to automatic tax invoices.
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

  defmodule FromInvoice do
    @moduledoc "Nested parameters."

    @typedoc """
    * `action` - The relation between the new invoice and the original invoice. Currently, only 'revision' is permitted Possible values: `revision`. Max length: 5000.
    * `invoice` - The `id` of the invoice that will be cloned. Max length: 5000.
    """
    @type t :: %__MODULE__{
            action: String.t() | nil,
            invoice: String.t() | nil
          }
    defstruct [:action, :invoice]
  end

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

  defmodule PaymentSettings do
    @moduledoc "Nested parameters."

    @typedoc """
    * `default_mandate` - ID of the mandate to be used for this invoice. It must correspond to the payment method used to pay the invoice, including the invoice's default_payment_method or default_source, if set.
    * `payment_method_options` - Payment-method-specific configuration to provide to the invoice’s PaymentIntent.
    * `payment_method_types` - The list of payment method types (e.g. card) to provide to the invoice’s PaymentIntent. If not set, Stripe attempts to automatically determine the types to use by looking at the invoice’s default payment method, the subscription’s default payment method, the customer’s default payment method, and your [invoice template settings](https://dashboard.stripe.com/settings/billing/invoice).
    """
    @type t :: %__MODULE__{
            default_mandate: map() | nil,
            payment_method_options: __MODULE__.PaymentMethodOptions.t() | nil,
            payment_method_types: map() | nil
          }
    defstruct [:default_mandate, :payment_method_options, :payment_method_types]

    defmodule PaymentMethodOptions do
      @moduledoc "Nested parameters."

      @typedoc """
      * `acss_debit` - If paying by `acss_debit`, this sub-hash contains details about the Canadian pre-authorized debit payment method options to pass to the invoice’s PaymentIntent.
      * `bancontact` - If paying by `bancontact`, this sub-hash contains details about the Bancontact payment method options to pass to the invoice’s PaymentIntent.
      * `card` - If paying by `card`, this sub-hash contains details about the Card payment method options to pass to the invoice’s PaymentIntent.
      * `customer_balance` - If paying by `customer_balance`, this sub-hash contains details about the Bank transfer payment method options to pass to the invoice’s PaymentIntent.
      * `konbini` - If paying by `konbini`, this sub-hash contains details about the Konbini payment method options to pass to the invoice’s PaymentIntent.
      * `payto` - If paying by `payto`, this sub-hash contains details about the PayTo payment method options to pass to the invoice’s PaymentIntent.
      * `sepa_debit` - If paying by `sepa_debit`, this sub-hash contains details about the SEPA Direct Debit payment method options to pass to the invoice’s PaymentIntent.
      * `us_bank_account` - If paying by `us_bank_account`, this sub-hash contains details about the ACH direct debit payment method options to pass to the invoice’s PaymentIntent.
      """
      @type t :: %__MODULE__{
              acss_debit: map() | nil,
              bancontact: map() | nil,
              card: map() | nil,
              customer_balance: map() | nil,
              konbini: map() | nil,
              payto: map() | nil,
              sepa_debit: map() | nil,
              us_bank_account: map() | nil
            }
      defstruct [
        :acss_debit,
        :bancontact,
        :card,
        :customer_balance,
        :konbini,
        :payto,
        :sepa_debit,
        :us_bank_account
      ]
    end
  end

  defmodule Rendering do
    @moduledoc "Nested parameters."

    @typedoc """
    * `amount_tax_display` - How line-item prices and amounts will be displayed with respect to tax on invoice PDFs. One of `exclude_tax` or `include_inclusive_tax`. `include_inclusive_tax` will include inclusive tax (and exclude exclusive tax) in invoice PDF amounts. `exclude_tax` will exclude all tax (inclusive and exclusive alike) from invoice PDF amounts. Possible values: `exclude_tax`, `include_inclusive_tax`.
    * `pdf` - Invoice pdf rendering options
    * `template` - ID of the invoice rendering template to use for this invoice. Max length: 5000.
    * `template_version` - The specific version of invoice rendering template to use for this invoice.
    """
    @type t :: %__MODULE__{
            amount_tax_display: String.t() | nil,
            pdf: __MODULE__.Pdf.t() | nil,
            template: String.t() | nil,
            template_version: map() | nil
          }
    defstruct [:amount_tax_display, :pdf, :template, :template_version]

    defmodule Pdf do
      @moduledoc "Nested parameters."

      @typedoc """
      * `page_size` - Page size for invoice PDF. Can be set to `a4`, `letter`, or `auto`.
      If set to `auto`, invoice PDF page size defaults to `a4` for customers with
      Japanese locale and `letter` for customers with other locales. Possible values: `a4`, `auto`, `letter`.
      """
      @type t :: %__MODULE__{
              page_size: String.t() | nil
            }
      defstruct [:page_size]
    end
  end

  defmodule ShippingCost do
    @moduledoc "Nested parameters."

    @typedoc """
    * `shipping_rate` - The ID of the shipping rate to use for this order. Max length: 5000.
    * `shipping_rate_data` - Parameters to create a new ad-hoc shipping rate for this order.
    """
    @type t :: %__MODULE__{
            shipping_rate: String.t() | nil,
            shipping_rate_data: __MODULE__.ShippingRateData.t() | nil
          }
    defstruct [:shipping_rate, :shipping_rate_data]

    defmodule ShippingRateData do
      @moduledoc "Nested parameters."

      @typedoc """
      * `delivery_estimate` - The estimated range for how long shipping will take, meant to be displayable to the customer. This will appear on CheckoutSessions.
      * `display_name` - The name of the shipping rate, meant to be displayable to the customer. This will appear on CheckoutSessions. Max length: 100.
      * `fixed_amount` - Describes a fixed amount to charge for shipping. Must be present if type is `fixed_amount`.
      * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
      * `tax_behavior` - Specifies whether the rate is considered inclusive of taxes or exclusive of taxes. One of `inclusive`, `exclusive`, or `unspecified`. Possible values: `exclusive`, `inclusive`, `unspecified`.
      * `tax_code` - A [tax code](https://docs.stripe.com/tax/tax-categories) ID. The Shipping tax code is `txcd_92010001`.
      * `type` - The type of calculation to use on the shipping rate. Possible values: `fixed_amount`.
      """
      @type t :: %__MODULE__{
              delivery_estimate: __MODULE__.DeliveryEstimate.t() | nil,
              display_name: String.t() | nil,
              fixed_amount: __MODULE__.FixedAmount.t() | nil,
              metadata: %{String.t() => String.t()} | nil,
              tax_behavior: String.t() | nil,
              tax_code: String.t() | nil,
              type: String.t() | nil
            }
      defstruct [
        :delivery_estimate,
        :display_name,
        :fixed_amount,
        :metadata,
        :tax_behavior,
        :tax_code,
        :type
      ]

      defmodule DeliveryEstimate do
        @moduledoc "Nested parameters."

        @typedoc """
        * `maximum` - The upper bound of the estimated range. If empty, represents no upper bound i.e., infinite.
        * `minimum` - The lower bound of the estimated range. If empty, represents no lower bound.
        """
        @type t :: %__MODULE__{
                maximum: __MODULE__.Maximum.t() | nil,
                minimum: __MODULE__.Minimum.t() | nil
              }
        defstruct [:maximum, :minimum]

        defmodule Maximum do
          @moduledoc "Nested parameters."

          @typedoc """
          * `unit` - A unit of time. Possible values: `business_day`, `day`, `hour`, `month`, `week`.
          * `value` - Must be greater than 0.
          """
          @type t :: %__MODULE__{
                  unit: String.t() | nil,
                  value: integer() | nil
                }
          defstruct [:unit, :value]
        end

        defmodule Minimum do
          @moduledoc "Nested parameters."

          @typedoc """
          * `unit` - A unit of time. Possible values: `business_day`, `day`, `hour`, `month`, `week`.
          * `value` - Must be greater than 0.
          """
          @type t :: %__MODULE__{
                  unit: String.t() | nil,
                  value: integer() | nil
                }
          defstruct [:unit, :value]
        end
      end

      defmodule FixedAmount do
        @moduledoc "Nested parameters."

        @typedoc """
        * `amount` - A non-negative integer in cents representing how much to charge.
        * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
        * `currency_options` - Shipping rates defined in each available currency option. Each key must be a three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html) and a [supported currency](https://stripe.com/docs/currencies).
        """
        @type t :: %__MODULE__{
                amount: integer() | nil,
                currency: String.t() | nil,
                currency_options: %{String.t() => __MODULE__.CurrencyOptions.t()} | nil
              }
        defstruct [:amount, :currency, :currency_options]

        defmodule CurrencyOptions do
          @moduledoc "Nested parameters."

          @typedoc """
          * `amount` - A non-negative integer in cents representing how much to charge.
          * `tax_behavior` - Specifies whether the rate is considered inclusive of taxes or exclusive of taxes. One of `inclusive`, `exclusive`, or `unspecified`. Possible values: `exclusive`, `inclusive`, `unspecified`.
          """
          @type t :: %__MODULE__{
                  amount: integer() | nil,
                  tax_behavior: String.t() | nil
                }
          defstruct [:amount, :tax_behavior]
        end
      end
    end
  end

  defmodule ShippingDetails do
    @moduledoc "Nested parameters."

    @typedoc """
    * `address` - Shipping address
    * `name` - Recipient name. Max length: 5000.
    * `phone` - Recipient phone (including extension)
    """
    @type t :: %__MODULE__{
            address: __MODULE__.Address.t() | nil,
            name: String.t() | nil,
            phone: map() | nil
          }
    defstruct [:address, :name, :phone]

    defmodule Address do
      @moduledoc "Nested parameters."

      @typedoc """
      * `city` - City, district, suburb, town, or village. Max length: 5000.
      * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)). Max length: 5000.
      * `line1` - Address line 1, such as the street, PO Box, or company name. Max length: 5000.
      * `line2` - Address line 2, such as the apartment, suite, unit, or building. Max length: 5000.
      * `postal_code` - ZIP or postal code. Max length: 5000.
      * `state` - State, county, province, or region ([ISO 3166-2](https://en.wikipedia.org/wiki/ISO_3166-2)). Max length: 5000.
      """
      @type t :: %__MODULE__{
              city: String.t() | nil,
              country: String.t() | nil,
              line1: String.t() | nil,
              line2: String.t() | nil,
              postal_code: String.t() | nil,
              state: String.t() | nil
            }
      defstruct [:city, :country, :line1, :line2, :postal_code, :state]
    end
  end

  defmodule TransferData do
    @moduledoc "Nested parameters."

    @typedoc """
    * `amount` - The amount that will be transferred automatically when the invoice is paid. If no amount is set, the full amount is transferred.
    * `destination` - ID of an existing, connected Stripe account.
    """
    @type t :: %__MODULE__{
            amount: integer() | nil,
            destination: String.t() | nil
          }
    defstruct [:amount, :destination]
  end
end
