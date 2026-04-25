# File generated from our OpenAPI spec
defmodule Stripe.Params.PaymentLinkCreateParams do
  @moduledoc "Parameters for payment link create."

  @typedoc """
  * `after_completion` - Behavior after the purchase is complete.
  * `allow_promotion_codes` - Enables user redeemable promotion codes.
  * `application_fee_amount` - The amount of the application fee (if any) that will be requested to be applied to the payment and transferred to the application owner's Stripe account. Can only be applied when there are no line items with recurring prices.
  * `application_fee_percent` - A non-negative decimal between 0 and 100, with at most two decimal places. This represents the percentage of the subscription invoice total that will be transferred to the application owner's Stripe account. There must be at least 1 line item with a recurring price to use this field.
  * `automatic_tax` - Configuration for automatic tax collection.
  * `billing_address_collection` - Configuration for collecting the customer's billing address. Defaults to `auto`. Possible values: `auto`, `required`.
  * `consent_collection` - Configure fields to gather active consent from customers.
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies) and supported by each line item's price. Format: ISO 4217 currency code.
  * `custom_fields` - Collect additional information from your customer using custom fields. Up to 3 fields are supported. You can't set this parameter if `ui_mode` is `custom`.
  * `custom_text` - Display additional text for your customers using custom text. You can't set this parameter if `ui_mode` is `custom`.
  * `customer_creation` - Configures whether [checkout sessions](https://docs.stripe.com/api/checkout/sessions) created by this payment link create a [Customer](https://docs.stripe.com/api/customers). Possible values: `always`, `if_required`.
  * `expand` - Specifies which fields in the response should be expanded.
  * `inactive_message` - The custom message to be displayed to a customer when a payment link is no longer active. Max length: 500.
  * `invoice_creation` - Generate a post-purchase Invoice for one-time payments.
  * `line_items` - The line items representing what is being sold. Each line item represents an item being sold. Up to 20 line items are supported.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`. Metadata associated with this Payment Link will automatically be copied to [checkout sessions](https://docs.stripe.com/api/checkout/sessions) created by this payment link.
  * `name_collection` - Controls settings applied for collecting the customer's name.
  * `on_behalf_of` - The account on behalf of which to charge.
  * `optional_items` - A list of optional items the customer can add to their order at checkout. Use this parameter to pass one-time or recurring [Prices](https://docs.stripe.com/api/prices).
  There is a maximum of 10 optional items allowed on a payment link, and the existing limits on the number of line items allowed on a payment link apply to the combined number of line items and optional items.
  There is a maximum of 20 combined line items and optional items.
  * `payment_intent_data` - A subset of parameters to be passed to PaymentIntent creation for Checkout Sessions in `payment` mode.
  * `payment_method_collection` - Specify whether Checkout should collect a payment method. When set to `if_required`, Checkout will not collect a payment method when the total due for the session is 0.This may occur if the Checkout Session includes a free trial or a discount.

  Can only be set in `subscription` mode. Defaults to `always`.

  If you'd like information on how to collect a payment method outside of Checkout, read the guide on [configuring subscriptions with a free trial](https://docs.stripe.com/payments/checkout/free-trials). Possible values: `always`, `if_required`.
  * `payment_method_types` - The list of payment method types that customers can use. If no value is passed, Stripe will dynamically show relevant payment methods from your [payment method settings](https://dashboard.stripe.com/settings/payment_methods) (20+ payment methods [supported](https://docs.stripe.com/payments/payment-methods/integration-options#payment-method-product-support)).
  * `phone_number_collection` - Controls phone number collection settings during checkout.

  We recommend that you review your privacy policy and check with your legal contacts.
  * `restrictions` - Settings that restrict the usage of a payment link.
  * `shipping_address_collection` - Configuration for collecting the customer's shipping address.
  * `shipping_options` - The shipping rate options to apply to [checkout sessions](https://docs.stripe.com/api/checkout/sessions) created by this payment link.
  * `submit_type` - Describes the type of transaction being performed in order to customize relevant text on the page, such as the submit button. Changing this value will also affect the hostname in the [url](https://docs.stripe.com/api/payment_links/payment_links/object#url) property (example: `donate.stripe.com`). Possible values: `auto`, `book`, `donate`, `pay`, `subscribe`.
  * `subscription_data` - When creating a subscription, the specified configuration data will be used. There must be at least one line item with a recurring price to use `subscription_data`.
  * `tax_id_collection` - Controls tax ID collection during checkout.
  * `transfer_data` - The account (if any) the payments will be attributed to for tax reporting, and where funds from each payment will be transferred to.
  """
  @type t :: %__MODULE__{
          after_completion: after_completion() | nil,
          allow_promotion_codes: boolean() | nil,
          application_fee_amount: integer() | nil,
          application_fee_percent: float() | nil,
          automatic_tax: automatic_tax() | nil,
          billing_address_collection: String.t() | nil,
          consent_collection: consent_collection() | nil,
          currency: String.t() | nil,
          custom_fields: [custom_fields()] | nil,
          custom_text: custom_text() | nil,
          customer_creation: String.t() | nil,
          expand: [String.t()] | nil,
          inactive_message: String.t() | nil,
          invoice_creation: invoice_creation() | nil,
          line_items: [line_items()],
          metadata: %{String.t() => String.t()} | nil,
          name_collection: name_collection() | nil,
          on_behalf_of: String.t() | nil,
          optional_items: [optional_items()] | nil,
          payment_intent_data: payment_intent_data() | nil,
          payment_method_collection: String.t() | nil,
          payment_method_types: [String.t()] | nil,
          phone_number_collection: phone_number_collection() | nil,
          restrictions: restrictions() | nil,
          shipping_address_collection: shipping_address_collection() | nil,
          shipping_options: [shipping_options()] | nil,
          submit_type: String.t() | nil,
          subscription_data: subscription_data() | nil,
          tax_id_collection: tax_id_collection() | nil,
          transfer_data: transfer_data() | nil
        }

  defstruct [
    :after_completion,
    :allow_promotion_codes,
    :application_fee_amount,
    :application_fee_percent,
    :automatic_tax,
    :billing_address_collection,
    :consent_collection,
    :currency,
    :custom_fields,
    :custom_text,
    :customer_creation,
    :expand,
    :inactive_message,
    :invoice_creation,
    :line_items,
    :metadata,
    :name_collection,
    :on_behalf_of,
    :optional_items,
    :payment_intent_data,
    :payment_method_collection,
    :payment_method_types,
    :phone_number_collection,
    :restrictions,
    :shipping_address_collection,
    :shipping_options,
    :submit_type,
    :subscription_data,
    :tax_id_collection,
    :transfer_data
  ]

  @typedoc """
  * `hosted_confirmation` - Configuration when `type=hosted_confirmation`.
  * `redirect` - Configuration when `type=redirect`.
  * `type` - The specified behavior after the purchase is complete. Either `redirect` or `hosted_confirmation`. Possible values: `hosted_confirmation`, `redirect`.
  """
  @type after_completion :: %{
          optional(:hosted_confirmation) => after_completion_hosted_confirmation() | nil,
          optional(:redirect) => after_completion_redirect() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `custom_message` - A custom message to display to the customer after the purchase is complete. Max length: 500.
  """
  @type after_completion_hosted_confirmation :: %{
          optional(:custom_message) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `url` - The URL the customer will be redirected to after the purchase is complete. You can embed `{CHECKOUT_SESSION_ID}` into the URL to have the `id` of the completed [checkout session](https://docs.stripe.com/api/checkout/sessions/object#checkout_session_object-id) included.
  """
  @type after_completion_redirect :: %{
          optional(:url) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `enabled` - Set to `true` to [calculate tax automatically](https://docs.stripe.com/tax) using the customer's location.

  Enabling this parameter causes the payment link to collect any billing address information necessary for tax calculation.
  * `liability` - The account that's liable for tax. If set, the business address and tax registrations required to perform the tax calculation are loaded from this account. The tax transaction is returned in the report of the connected account.
  """
  @type automatic_tax :: %{
          optional(:enabled) => boolean() | nil,
          optional(:liability) => automatic_tax_liability() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `account` - The connected account being referenced when `type` is `account`.
  * `type` - Type of the account referenced in the request. Possible values: `account`, `self`.
  """
  @type automatic_tax_liability :: %{
          optional(:account) => String.t() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `payment_method_reuse_agreement` - Determines the display of payment method reuse agreement text in the UI. If set to `hidden`, it will hide legal text related to the reuse of a payment method.
  * `promotions` - If set to `auto`, enables the collection of customer consent for promotional communications. The Checkout
  Session will determine whether to display an option to opt into promotional communication
  from the merchant depending on the customer's locale. Only available to US merchants. Possible values: `auto`, `none`.
  * `terms_of_service` - If set to `required`, it requires customers to check a terms of service checkbox before being able to pay.
  There must be a valid terms of service URL set in your [Dashboard settings](https://dashboard.stripe.com/settings/public). Possible values: `none`, `required`.
  """
  @type consent_collection :: %{
          optional(:payment_method_reuse_agreement) =>
            consent_collection_payment_method_reuse_agreement() | nil,
          optional(:promotions) => String.t() | nil,
          optional(:terms_of_service) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `position` - Determines the position and visibility of the payment method reuse agreement in the UI. When set to `auto`, Stripe's
  defaults will be used. When set to `hidden`, the payment method reuse agreement text will always be hidden in the UI. Possible values: `auto`, `hidden`.
  """
  @type consent_collection_payment_method_reuse_agreement :: %{
          optional(:position) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `dropdown` - Configuration for `type=dropdown` fields.
  * `key` - String of your choice that your integration can use to reconcile this field. Must be unique to this field, alphanumeric, and up to 200 characters. Max length: 200.
  * `label` - The label for the field, displayed to the customer.
  * `numeric` - Configuration for `type=numeric` fields.
  * `optional` - Whether the customer is required to complete the field before completing the Checkout Session. Defaults to `false`.
  * `text` - Configuration for `type=text` fields.
  * `type` - The type of the field. Possible values: `dropdown`, `numeric`, `text`.
  """
  @type custom_fields :: %{
          optional(:dropdown) => custom_fields_dropdown() | nil,
          optional(:key) => String.t() | nil,
          optional(:label) => custom_fields_label() | nil,
          optional(:numeric) => custom_fields_numeric() | nil,
          optional(:optional) => boolean() | nil,
          optional(:text) => custom_fields_text() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `default_value` - The value that will pre-fill the field on the payment page.Must match a `value` in the `options` array. Max length: 100.
  * `options` - The options available for the customer to select. Up to 200 options allowed.
  """
  @type custom_fields_dropdown :: %{
          optional(:default_value) => String.t() | nil,
          optional(:options) => [custom_fields_dropdown_options()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `label` - The label for the option, displayed to the customer. Up to 100 characters. Max length: 100.
  * `value` - The value for this option, not displayed to the customer, used by your integration to reconcile the option selected by the customer. Must be unique to this option, alphanumeric, and up to 100 characters. Max length: 100.
  """
  @type custom_fields_dropdown_options :: %{
          optional(:label) => String.t() | nil,
          optional(:value) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `custom` - Custom text for the label, displayed to the customer. Up to 50 characters. Max length: 50.
  * `type` - The type of the label. Possible values: `custom`.
  """
  @type custom_fields_label :: %{
          optional(:custom) => String.t() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `default_value` - The value that will pre-fill the field on the payment page. Max length: 255.
  * `maximum_length` - The maximum character length constraint for the customer's input.
  * `minimum_length` - The minimum character length requirement for the customer's input.
  """
  @type custom_fields_numeric :: %{
          optional(:default_value) => String.t() | nil,
          optional(:maximum_length) => integer() | nil,
          optional(:minimum_length) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `default_value` - The value that will pre-fill the field on the payment page. Max length: 255.
  * `maximum_length` - The maximum character length constraint for the customer's input.
  * `minimum_length` - The minimum character length requirement for the customer's input.
  """
  @type custom_fields_text :: %{
          optional(:default_value) => String.t() | nil,
          optional(:maximum_length) => integer() | nil,
          optional(:minimum_length) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `after_submit` - Custom text that should be displayed after the payment confirmation button.
  * `shipping_address` - Custom text that should be displayed alongside shipping address collection.
  * `submit` - Custom text that should be displayed alongside the payment confirmation button.
  * `terms_of_service_acceptance` - Custom text that should be displayed in place of the default terms of service agreement text.
  """
  @type custom_text :: %{
          optional(:after_submit) => map() | nil,
          optional(:shipping_address) => map() | nil,
          optional(:submit) => map() | nil,
          optional(:terms_of_service_acceptance) => map() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `enabled` - Whether the feature is enabled
  * `invoice_data` - Invoice PDF configuration.
  """
  @type invoice_creation :: %{
          optional(:enabled) => boolean() | nil,
          optional(:invoice_data) => invoice_creation_invoice_data() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `account_tax_ids` - The account tax IDs associated with the invoice.
  * `custom_fields` - Default custom fields to be displayed on invoices for this customer.
  * `description` - An arbitrary string attached to the object. Often useful for displaying to users. Max length: 1500.
  * `footer` - Default footer to be displayed on invoices for this customer. Max length: 5000.
  * `issuer` - The connected account that issues the invoice. The invoice is presented with the branding and support information of the specified account.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `rendering_options` - Default options for invoice PDF rendering for this customer.
  """
  @type invoice_creation_invoice_data :: %{
          optional(:account_tax_ids) => map() | nil,
          optional(:custom_fields) => map() | nil,
          optional(:description) => String.t() | nil,
          optional(:footer) => String.t() | nil,
          optional(:issuer) => invoice_creation_invoice_data_issuer() | nil,
          optional(:metadata) => map() | nil,
          optional(:rendering_options) => map() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `account` - The connected account being referenced when `type` is `account`.
  * `type` - Type of the account referenced in the request. Possible values: `account`, `self`.
  """
  @type invoice_creation_invoice_data_issuer :: %{
          optional(:account) => String.t() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `adjustable_quantity` - When set, provides configuration for this item’s quantity to be adjusted by the customer during checkout.
  * `price` - The ID of the [Price](https://docs.stripe.com/api/prices) or [Plan](https://docs.stripe.com/api/plans) object. One of `price` or `price_data` is required. Max length: 5000.
  * `price_data` - Data used to generate a new [Price](https://docs.stripe.com/api/prices) object inline. One of `price` or `price_data` is required.
  * `quantity` - The quantity of the line item being purchased.
  """
  @type line_items :: %{
          optional(:adjustable_quantity) => line_items_adjustable_quantity() | nil,
          optional(:price) => String.t() | nil,
          optional(:price_data) => line_items_price_data() | nil,
          optional(:quantity) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `enabled` - Set to true if the quantity can be adjusted to any non-negative Integer.
  * `maximum` - The maximum quantity the customer can purchase. By default this value is 99. You can specify a value up to 999999.
  * `minimum` - The minimum quantity the customer can purchase. By default this value is 0. If there is only one item in the cart then that item's quantity cannot go down to 0.
  """
  @type line_items_adjustable_quantity :: %{
          optional(:enabled) => boolean() | nil,
          optional(:maximum) => integer() | nil,
          optional(:minimum) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `product` - The ID of the [Product](https://docs.stripe.com/api/products) that this [Price](https://docs.stripe.com/api/prices) will belong to. One of `product` or `product_data` is required. Max length: 5000.
  * `product_data` - Data used to generate a new [Product](https://docs.stripe.com/api/products) object inline. One of `product` or `product_data` is required.
  * `recurring` - The recurring components of a price such as `interval` and `interval_count`.
  * `tax_behavior` - Only required if a [default tax behavior](https://docs.stripe.com/tax/products-prices-tax-categories-tax-behavior#setting-a-default-tax-behavior-(recommended)) was not provided in the Stripe Tax settings. Specifies whether the price is considered inclusive of taxes or exclusive of taxes. One of `inclusive`, `exclusive`, or `unspecified`. Once specified as either `inclusive` or `exclusive`, it cannot be changed. Possible values: `exclusive`, `inclusive`, `unspecified`.
  * `unit_amount` - A non-negative integer in cents (or local equivalent) representing how much to charge. One of `unit_amount` or `unit_amount_decimal` is required.
  * `unit_amount_decimal` - Same as `unit_amount`, but accepts a decimal value in cents (or local equivalent) with at most 12 decimal places. Only one of `unit_amount` and `unit_amount_decimal` can be set. Format: decimal string.
  """
  @type line_items_price_data :: %{
          optional(:currency) => String.t() | nil,
          optional(:product) => String.t() | nil,
          optional(:product_data) => line_items_price_data_product_data() | nil,
          optional(:recurring) => line_items_price_data_recurring() | nil,
          optional(:tax_behavior) => String.t() | nil,
          optional(:unit_amount) => integer() | nil,
          optional(:unit_amount_decimal) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `description` - The product's description, meant to be displayable to the customer. Use this field to optionally store a long form explanation of the product being sold for your own rendering purposes. Max length: 40000.
  * `images` - A list of up to 8 URLs of images for this product, meant to be displayable to the customer.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `name` - The product's name, meant to be displayable to the customer. Max length: 5000.
  * `tax_code` - A [tax code](https://docs.stripe.com/tax/tax-categories) ID. Max length: 5000.
  * `unit_label` - A label that represents units of this product. When set, this will be included in customers' receipts, invoices, Checkout, and the customer portal. Max length: 12.
  """
  @type line_items_price_data_product_data :: %{
          optional(:description) => String.t() | nil,
          optional(:images) => [String.t()] | nil,
          optional(:metadata) => %{String.t() => String.t()} | nil,
          optional(:name) => String.t() | nil,
          optional(:tax_code) => String.t() | nil,
          optional(:unit_label) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `interval` - Specifies billing frequency. Either `day`, `week`, `month` or `year`. Possible values: `day`, `month`, `week`, `year`.
  * `interval_count` - The number of intervals between subscription billings. For example, `interval=month` and `interval_count=3` bills every 3 months. Maximum of three years interval allowed (3 years, 36 months, or 156 weeks).
  """
  @type line_items_price_data_recurring :: %{
          optional(:interval) => String.t() | nil,
          optional(:interval_count) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `business` - Controls settings applied for collecting the customer's business name.
  * `individual` - Controls settings applied for collecting the customer's individual name.
  """
  @type name_collection :: %{
          optional(:business) => name_collection_business() | nil,
          optional(:individual) => name_collection_individual() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `enabled` - Enable business name collection on the payment link. Defaults to `false`.
  * `optional` - Whether the customer is required to provide their business name before checking out. Defaults to `false`.
  """
  @type name_collection_business :: %{
          optional(:enabled) => boolean() | nil,
          optional(:optional) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `enabled` - Enable individual name collection on the payment link. Defaults to `false`.
  * `optional` - Whether the customer is required to provide their full name before checking out. Defaults to `false`.
  """
  @type name_collection_individual :: %{
          optional(:enabled) => boolean() | nil,
          optional(:optional) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `adjustable_quantity` - When set, provides configuration for the customer to adjust the quantity of the line item created when a customer chooses to add this optional item to their order.
  * `price` - The ID of the [Price](https://docs.stripe.com/api/prices) or [Plan](https://docs.stripe.com/api/plans) object. Max length: 5000.
  * `quantity` - The initial quantity of the line item created when a customer chooses to add this optional item to their order.
  """
  @type optional_items :: %{
          optional(:adjustable_quantity) => optional_items_adjustable_quantity() | nil,
          optional(:price) => String.t() | nil,
          optional(:quantity) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `enabled` - Set to true if the quantity can be adjusted to any non-negative integer.
  * `maximum` - The maximum quantity of this item the customer can purchase. By default this value is 99.
  * `minimum` - The minimum quantity of this item the customer must purchase, if they choose to purchase it. Because this item is optional, the customer will always be able to remove it from their order, even if the `minimum` configured here is greater than 0. By default this value is 0.
  """
  @type optional_items_adjustable_quantity :: %{
          optional(:enabled) => boolean() | nil,
          optional(:maximum) => integer() | nil,
          optional(:minimum) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `capture_method` - Controls when the funds will be captured from the customer's account. Possible values: `automatic`, `automatic_async`, `manual`.
  * `description` - An arbitrary string attached to the object. Often useful for displaying to users. Max length: 1000.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that will declaratively set metadata on [Payment Intents](https://docs.stripe.com/api/payment_intents) generated from this payment link. Unlike object-level metadata, this field is declarative. Updates will clear prior values.
  * `setup_future_usage` - Indicates that you intend to [make future payments](https://docs.stripe.com/payments/payment-intents#future-usage) with the payment method collected by this Checkout Session.

  When setting this to `on_session`, Checkout will show a notice to the customer that their payment details will be saved.

  When setting this to `off_session`, Checkout will show a notice to the customer that their payment details will be saved and used for future payments.

  If a Customer has been provided or Checkout creates a new Customer,Checkout will attach the payment method to the Customer.

  If Checkout does not create a Customer, the payment method is not attached to a Customer. To reuse the payment method, you can retrieve it from the Checkout Session's PaymentIntent.

  When processing card payments, Checkout also uses `setup_future_usage` to dynamically optimize your payment flow and comply with regional legislation and network rules, such as SCA. Possible values: `off_session`, `on_session`.
  * `statement_descriptor` - Text that appears on the customer's statement as the statement descriptor for a non-card charge. This value overrides the account's default statement descriptor. For information about requirements, including the 22-character limit, see [the Statement Descriptor docs](https://docs.stripe.com/get-started/account/statement-descriptors).

  Setting this value for a card charge returns an error. For card charges, set the [statement_descriptor_suffix](https://docs.stripe.com/get-started/account/statement-descriptors#dynamic) instead. Max length: 22.
  * `statement_descriptor_suffix` - Provides information about a card charge. Concatenated to the account's [statement descriptor prefix](https://docs.stripe.com/get-started/account/statement-descriptors#static) to form the complete statement descriptor that appears on the customer's statement. Max length: 22.
  * `transfer_group` - A string that identifies the resulting payment as part of a group. See the PaymentIntents [use case for connected accounts](https://docs.stripe.com/connect/separate-charges-and-transfers) for details. Max length: 5000.
  """
  @type payment_intent_data :: %{
          optional(:capture_method) => String.t() | nil,
          optional(:description) => String.t() | nil,
          optional(:metadata) => %{String.t() => String.t()} | nil,
          optional(:setup_future_usage) => String.t() | nil,
          optional(:statement_descriptor) => String.t() | nil,
          optional(:statement_descriptor_suffix) => String.t() | nil,
          optional(:transfer_group) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `enabled` - Set to `true` to enable phone number collection.
  """
  @type phone_number_collection :: %{
          optional(:enabled) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `completed_sessions` - Configuration for the `completed_sessions` restriction type.
  """
  @type restrictions :: %{
          optional(:completed_sessions) => restrictions_completed_sessions() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `limit` - The maximum number of checkout sessions that can be completed for the `completed_sessions` restriction to be met.
  """
  @type restrictions_completed_sessions :: %{
          optional(:limit) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `allowed_countries` - An array of two-letter ISO country codes representing which countries Checkout should provide as options for
  shipping locations.
  """
  @type shipping_address_collection :: %{
          optional(:allowed_countries) => [String.t()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `shipping_rate` - The ID of the Shipping Rate to use for this shipping option. Max length: 5000.
  """
  @type shipping_options :: %{
          optional(:shipping_rate) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `description` - The subscription's description, meant to be displayable to the customer. Use this field to optionally store an explanation of the subscription for rendering in Stripe surfaces and certain local payment methods UIs. Max length: 500.
  * `invoice_settings` - All invoices will be billed using the specified settings.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that will declaratively set metadata on [Subscriptions](https://docs.stripe.com/api/subscriptions) generated from this payment link. Unlike object-level metadata, this field is declarative. Updates will clear prior values.
  * `trial_period_days` - Integer representing the number of trial period days before the customer is charged for the first time. Has to be at least 1.
  * `trial_settings` - Settings related to subscription trials.
  """
  @type subscription_data :: %{
          optional(:description) => String.t() | nil,
          optional(:invoice_settings) => subscription_data_invoice_settings() | nil,
          optional(:metadata) => %{String.t() => String.t()} | nil,
          optional(:trial_period_days) => integer() | nil,
          optional(:trial_settings) => subscription_data_trial_settings() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `issuer` - The connected account that issues the invoice. The invoice is presented with the branding and support information of the specified account.
  """
  @type subscription_data_invoice_settings :: %{
          optional(:issuer) => subscription_data_invoice_settings_issuer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `account` - The connected account being referenced when `type` is `account`.
  * `type` - Type of the account referenced in the request. Possible values: `account`, `self`.
  """
  @type subscription_data_invoice_settings_issuer :: %{
          optional(:account) => String.t() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `end_behavior` - Defines how the subscription should behave when the user's free trial ends.
  """
  @type subscription_data_trial_settings :: %{
          optional(:end_behavior) => subscription_data_trial_settings_end_behavior() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `missing_payment_method` - Indicates how the subscription should change when the trial ends if the user did not provide a payment method. Possible values: `cancel`, `create_invoice`, `pause`.
  """
  @type subscription_data_trial_settings_end_behavior :: %{
          optional(:missing_payment_method) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `enabled` - Enable tax ID collection during checkout. Defaults to `false`.
  * `required` - Describes whether a tax ID is required during checkout. Defaults to `never`. You can't set this parameter if `ui_mode` is `custom`. Possible values: `if_supported`, `never`.
  """
  @type tax_id_collection :: %{
          optional(:enabled) => boolean() | nil,
          optional(:required) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `amount` - The amount that will be transferred automatically when a charge succeeds.
  * `destination` - If specified, successful charges will be attributed to the destination
  account for tax reporting, and the funds from charges will be transferred
  to the destination account. The ID of the resulting transfer will be
  returned on the successful charge's `transfer` field.
  """
  @type transfer_data :: %{
          optional(:amount) => integer() | nil,
          optional(:destination) => String.t() | nil,
          optional(String.t()) => term()
        }
end
