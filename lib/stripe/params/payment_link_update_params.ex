# File generated from our OpenAPI spec
defmodule Stripe.Params.PaymentLinkUpdateParams do
  @moduledoc "Parameters for payment link update."

  @typedoc """
  * `active` - Whether the payment link's `url` is active. If `false`, customers visiting the URL will be shown a page saying that the link has been deactivated.
  * `after_completion` - Behavior after the purchase is complete.
  * `allow_promotion_codes` - Enables user redeemable promotion codes.
  * `automatic_tax` - Configuration for automatic tax collection.
  * `billing_address_collection` - Configuration for collecting the customer's billing address. Defaults to `auto`. Possible values: `auto`, `required`.
  * `custom_fields` - Collect additional information from your customer using custom fields. Up to 3 fields are supported. You can't set this parameter if `ui_mode` is `custom`.
  * `custom_text` - Display additional text for your customers using custom text. You can't set this parameter if `ui_mode` is `custom`.
  * `customer_creation` - Configures whether [checkout sessions](https://docs.stripe.com/api/checkout/sessions) created by this payment link create a [Customer](https://docs.stripe.com/api/customers). Possible values: `always`, `if_required`.
  * `expand` - Specifies which fields in the response should be expanded.
  * `inactive_message` - The custom message to be displayed to a customer when a payment link is no longer active.
  * `invoice_creation` - Generate a post-purchase Invoice for one-time payments.
  * `line_items` - The line items representing what is being sold. Each line item represents an item being sold. Up to 20 line items are supported.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`. Metadata associated with this Payment Link will automatically be copied to [checkout sessions](https://docs.stripe.com/api/checkout/sessions) created by this payment link.
  * `name_collection` - Controls settings applied for collecting the customer's name.
  * `payment_intent_data` - A subset of parameters to be passed to PaymentIntent creation for Checkout Sessions in `payment` mode.
  * `payment_method_collection` - Specify whether Checkout should collect a payment method. When set to `if_required`, Checkout will not collect a payment method when the total due for the session is 0.This may occur if the Checkout Session includes a free trial or a discount.

  Can only be set in `subscription` mode. Defaults to `always`.

  If you'd like information on how to collect a payment method outside of Checkout, read the guide on [configuring subscriptions with a free trial](https://docs.stripe.com/payments/checkout/free-trials). Possible values: `always`, `if_required`.
  * `payment_method_types` - The list of payment method types that customers can use. Pass an empty string to enable dynamic payment methods that use your [payment method settings](https://dashboard.stripe.com/settings/payment_methods).
  * `phone_number_collection` - Controls phone number collection settings during checkout.

  We recommend that you review your privacy policy and check with your legal contacts.
  * `restrictions` - Settings that restrict the usage of a payment link.
  * `shipping_address_collection` - Configuration for collecting the customer's shipping address.
  * `submit_type` - Describes the type of transaction being performed in order to customize relevant text on the page, such as the submit button. Changing this value will also affect the hostname in the [url](https://docs.stripe.com/api/payment_links/payment_links/object#url) property (example: `donate.stripe.com`). Possible values: `auto`, `book`, `donate`, `pay`, `subscribe`.
  * `subscription_data` - When creating a subscription, the specified configuration data will be used. There must be at least one line item with a recurring price to use `subscription_data`.
  * `tax_id_collection` - Controls tax ID collection during checkout.
  """
  @type t :: %__MODULE__{
          active: boolean() | nil,
          after_completion: after_completion() | nil,
          allow_promotion_codes: boolean() | nil,
          automatic_tax: automatic_tax() | nil,
          billing_address_collection: String.t() | nil,
          custom_fields: map() | nil,
          custom_text: custom_text() | nil,
          customer_creation: String.t() | nil,
          expand: [String.t()] | nil,
          inactive_message: map() | nil,
          invoice_creation: invoice_creation() | nil,
          line_items: [line_items()] | nil,
          metadata: %{String.t() => String.t()} | nil,
          name_collection: map() | nil,
          payment_intent_data: payment_intent_data() | nil,
          payment_method_collection: String.t() | nil,
          payment_method_types: map() | nil,
          phone_number_collection: phone_number_collection() | nil,
          restrictions: map() | nil,
          shipping_address_collection: map() | nil,
          submit_type: String.t() | nil,
          subscription_data: subscription_data() | nil,
          tax_id_collection: tax_id_collection() | nil
        }

  defstruct [
    :active,
    :after_completion,
    :allow_promotion_codes,
    :automatic_tax,
    :billing_address_collection,
    :custom_fields,
    :custom_text,
    :customer_creation,
    :expand,
    :inactive_message,
    :invoice_creation,
    :line_items,
    :metadata,
    :name_collection,
    :payment_intent_data,
    :payment_method_collection,
    :payment_method_types,
    :phone_number_collection,
    :restrictions,
    :shipping_address_collection,
    :submit_type,
    :subscription_data,
    :tax_id_collection
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
  * `id` - The ID of an existing line item on the payment link. Max length: 5000.
  * `quantity` - The quantity of the line item being purchased.
  """
  @type line_items :: %{
          optional(:adjustable_quantity) => line_items_adjustable_quantity() | nil,
          optional(:id) => String.t() | nil,
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
  * `description` - An arbitrary string attached to the object. Often useful for displaying to users.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that will declaratively set metadata on [Payment Intents](https://docs.stripe.com/api/payment_intents) generated from this payment link. Unlike object-level metadata, this field is declarative. Updates will clear prior values.
  * `statement_descriptor` - Text that appears on the customer's statement as the statement descriptor for a non-card charge. This value overrides the account's default statement descriptor. For information about requirements, including the 22-character limit, see [the Statement Descriptor docs](https://docs.stripe.com/get-started/account/statement-descriptors).

  Setting this value for a card charge returns an error. For card charges, set the [statement_descriptor_suffix](https://docs.stripe.com/get-started/account/statement-descriptors#dynamic) instead.
  * `statement_descriptor_suffix` - Provides information about a card charge. Concatenated to the account's [statement descriptor prefix](https://docs.stripe.com/get-started/account/statement-descriptors#static) to form the complete statement descriptor that appears on the customer's statement.
  * `transfer_group` - A string that identifies the resulting payment as part of a group. See the PaymentIntents [use case for connected accounts](https://docs.stripe.com/connect/separate-charges-and-transfers) for details.
  """
  @type payment_intent_data :: %{
          optional(:description) => map() | nil,
          optional(:metadata) => map() | nil,
          optional(:statement_descriptor) => map() | nil,
          optional(:statement_descriptor_suffix) => map() | nil,
          optional(:transfer_group) => map() | nil,
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
  * `invoice_settings` - All invoices will be billed using the specified settings.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that will declaratively set metadata on [Subscriptions](https://docs.stripe.com/api/subscriptions) generated from this payment link. Unlike object-level metadata, this field is declarative. Updates will clear prior values.
  * `trial_period_days` - Integer representing the number of trial period days before the customer is charged for the first time. Has to be at least 1.
  * `trial_settings` - Settings related to subscription trials.
  """
  @type subscription_data :: %{
          optional(:invoice_settings) => subscription_data_invoice_settings() | nil,
          optional(:metadata) => map() | nil,
          optional(:trial_period_days) => map() | nil,
          optional(:trial_settings) => map() | nil,
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
  * `enabled` - Enable tax ID collection during checkout. Defaults to `false`.
  * `required` - Describes whether a tax ID is required during checkout. Defaults to `never`. You can't set this parameter if `ui_mode` is `custom`. Possible values: `if_supported`, `never`.
  """
  @type tax_id_collection :: %{
          optional(:enabled) => boolean() | nil,
          optional(:required) => String.t() | nil,
          optional(String.t()) => term()
        }
end
