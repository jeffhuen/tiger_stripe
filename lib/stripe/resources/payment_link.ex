# File generated from our OpenAPI spec
defmodule Stripe.Resources.PaymentLink do
  @moduledoc """
  PaymentLink

  A payment link is a shareable URL that will take your customers to a hosted payment page. A payment link can be shared and used multiple times.

  When a customer opens a payment link it will open a new [checkout session](https://docs.stripe.com/api/checkout/sessions) to render the payment page. You can use [checkout session events](https://docs.stripe.com/api/events/types#event_types-checkout.session.completed) to track payments through payment links.

  Related guide: [Payment Links API](https://docs.stripe.com/payment-links)
  """

  @typedoc """
  * `active` - Whether the payment link's `url` is active. If `false`, customers visiting the URL will be shown a page saying that the link has been deactivated.
  * `after_completion` - Expandable.
  * `allow_promotion_codes` - Whether user redeemable promotion codes are enabled.
  * `application` - The ID of the Connect application that created the Payment Link. Nullable. Expandable.
  * `application_fee_amount` - The amount of the application fee (if any) that will be requested to be applied to the payment and transferred to the application owner's Stripe account. Nullable.
  * `application_fee_percent` - This represents the percentage of the subscription invoice total that will be transferred to the application owner's Stripe account. Nullable.
  * `automatic_tax` - Expandable.
  * `billing_address_collection` - Configuration for collecting the customer's billing address. Defaults to `auto`. Possible values: `auto`, `required`.
  * `consent_collection` - When set, provides configuration to gather active consent from customers. Nullable. Expandable.
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `custom_fields` - Collect additional information from your customer using custom fields. Up to 3 fields are supported. You can't set this parameter if `ui_mode` is `custom`. Expandable.
  * `custom_text` - Expandable.
  * `customer_creation` - Configuration for Customer creation during checkout. Possible values: `always`, `if_required`.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `inactive_message` - The custom message to be displayed to a customer when a payment link is no longer active. Max length: 5000. Nullable.
  * `invoice_creation` - Configuration for creating invoice for payment mode payment links. Nullable. Expandable.
  * `line_items` - The line items representing what is being sold. Expandable.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
  * `name_collection` - Expandable.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `payment_link`.
  * `on_behalf_of` - The account on behalf of which to charge. See the [Connect documentation](https://support.stripe.com/questions/sending-invoices-on-behalf-of-connected-accounts) for details. Nullable. Expandable.
  * `optional_items` - The optional items presented to the customer at checkout. Nullable. Expandable.
  * `payment_intent_data` - Indicates the parameters to be passed to PaymentIntent creation during checkout. Nullable. Expandable.
  * `payment_method_collection` - Configuration for collecting a payment method during checkout. Defaults to `always`. Possible values: `always`, `if_required`.
  * `payment_method_types` - The list of payment method types that customers can use. When `null`, Stripe will dynamically show relevant payment methods you've enabled in your [payment method settings](https://dashboard.stripe.com/settings/payment_methods). Nullable.
  * `phone_number_collection` - Expandable.
  * `restrictions` - Settings that restrict the usage of a payment link. Nullable. Expandable.
  * `shipping_address_collection` - Configuration for collecting the customer's shipping address. Nullable. Expandable.
  * `shipping_options` - The shipping rate options applied to the session. Expandable.
  * `submit_type` - Indicates the type of transaction being performed which customizes relevant text on the page, such as the submit button. Possible values: `auto`, `book`, `donate`, `pay`, `subscribe`.
  * `subscription_data` - When creating a subscription, the specified configuration data will be used. There must be at least one line item with a recurring price to use `subscription_data`. Nullable. Expandable.
  * `tax_id_collection` - Expandable.
  * `transfer_data` - The account (if any) the payments will be attributed to for tax reporting, and where funds from each payment will be transferred to. Nullable. Expandable.
  * `url` - The public URL that can be shared with customers. Max length: 5000.
  """
  @type t :: %__MODULE__{
          active: boolean(),
          after_completion: after_completion(),
          allow_promotion_codes: boolean(),
          application: String.t() | Stripe.Resources.Application.t(),
          application_fee_amount: integer(),
          application_fee_percent: float(),
          automatic_tax: automatic_tax(),
          billing_address_collection: String.t(),
          consent_collection: consent_collection(),
          currency: String.t(),
          custom_fields: [custom_fields()],
          custom_text: custom_text(),
          customer_creation: String.t(),
          id: String.t(),
          inactive_message: String.t(),
          invoice_creation: invoice_creation(),
          line_items: line_items() | nil,
          livemode: boolean(),
          metadata: %{String.t() => String.t()},
          name_collection: name_collection() | nil,
          object: String.t(),
          on_behalf_of: String.t() | Stripe.Resources.Account.t(),
          optional_items: [optional_items()] | nil,
          payment_intent_data: payment_intent_data(),
          payment_method_collection: String.t(),
          payment_method_types: [String.t()],
          phone_number_collection: phone_number_collection(),
          restrictions: restrictions(),
          shipping_address_collection: shipping_address_collection(),
          shipping_options: [shipping_options()],
          submit_type: String.t(),
          subscription_data: subscription_data(),
          tax_id_collection: tax_id_collection(),
          transfer_data: transfer_data(),
          url: String.t()
        }

  defstruct [
    :active,
    :after_completion,
    :allow_promotion_codes,
    :application,
    :application_fee_amount,
    :application_fee_percent,
    :automatic_tax,
    :billing_address_collection,
    :consent_collection,
    :currency,
    :custom_fields,
    :custom_text,
    :customer_creation,
    :id,
    :inactive_message,
    :invoice_creation,
    :line_items,
    :livemode,
    :metadata,
    :name_collection,
    :object,
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
    :transfer_data,
    :url
  ]

  @object_name "payment_link"
  def object_name, do: @object_name

  def expandable_fields,
    do: [
      "after_completion",
      "application",
      "automatic_tax",
      "consent_collection",
      "custom_fields",
      "custom_text",
      "invoice_creation",
      "line_items",
      "name_collection",
      "on_behalf_of",
      "optional_items",
      "payment_intent_data",
      "phone_number_collection",
      "restrictions",
      "shipping_address_collection",
      "shipping_options",
      "subscription_data",
      "tax_id_collection",
      "transfer_data"
    ]

  @typedoc """
  * `hosted_confirmation`
  * `redirect`
  * `type` - The specified behavior after the purchase is complete. Possible values: `hosted_confirmation`, `redirect`.
  """
  @type after_completion :: %{
          optional(:hosted_confirmation) => after_completion_hosted_confirmation() | nil,
          optional(:redirect) => after_completion_redirect() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `custom_message` - The custom message that is displayed to the customer after the purchase is complete. Max length: 5000. Nullable.
  """
  @type after_completion_hosted_confirmation :: %{
          optional(:custom_message) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `url` - The URL the customer will be redirected to after the purchase is complete. Max length: 5000.
  """
  @type after_completion_redirect :: %{
          optional(:url) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `enabled` - If `true`, tax will be calculated automatically using the customer's location.
  * `liability` - The account that's liable for tax. If set, the business address and tax registrations required to perform the tax calculation are loaded from this account. The tax transaction is returned in the report of the connected account. Nullable.
  """
  @type automatic_tax :: %{
          optional(:enabled) => boolean() | nil,
          optional(:liability) => automatic_tax_liability() | nil,
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
  * `payment_method_reuse_agreement` - Settings related to the payment method reuse text shown in the Checkout UI. Nullable.
  * `promotions` - If set to `auto`, enables the collection of customer consent for promotional communications. Possible values: `auto`, `none`. Nullable.
  * `terms_of_service` - If set to `required`, it requires cutomers to accept the terms of service before being able to pay. If set to `none`, customers won't be shown a checkbox to accept the terms of service. Possible values: `none`, `required`. Nullable.
  """
  @type consent_collection :: %{
          optional(:payment_method_reuse_agreement) =>
            consent_collection_payment_method_reuse_agreement() | nil,
          optional(:promotions) => String.t() | nil,
          optional(:terms_of_service) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `position` - Determines the position and visibility of the payment method reuse agreement in the UI. When set to `auto`, Stripe's defaults will be used.

  When set to `hidden`, the payment method reuse agreement text will always be hidden in the UI. Possible values: `auto`, `hidden`.
  """
  @type consent_collection_payment_method_reuse_agreement :: %{
          optional(:position) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `dropdown`
  * `key` - String of your choice that your integration can use to reconcile this field. Must be unique to this field, alphanumeric, and up to 200 characters. Max length: 5000.
  * `label`
  * `numeric`
  * `optional` - Whether the customer is required to complete the field before completing the Checkout Session. Defaults to `false`.
  * `text`
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
  * `default_value` - The value that will pre-fill on the payment page. Max length: 5000. Nullable.
  * `options` - The options available for the customer to select. Up to 200 options allowed.
  """
  @type custom_fields_dropdown :: %{
          optional(:default_value) => String.t() | nil,
          optional(:options) => [Stripe.Resources.CustomFieldDropdownOption.t()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `custom` - Custom text for the label, displayed to the customer. Up to 50 characters. Max length: 5000. Nullable.
  * `type` - The type of the label. Possible values: `custom`.
  """
  @type custom_fields_label :: %{
          optional(:custom) => String.t() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `default_value` - The value that will pre-fill the field on the payment page. Max length: 5000. Nullable.
  * `maximum_length` - The maximum character length constraint for the customer's input. Nullable.
  * `minimum_length` - The minimum character length requirement for the customer's input. Nullable.
  """
  @type custom_fields_numeric :: %{
          optional(:default_value) => String.t() | nil,
          optional(:maximum_length) => integer() | nil,
          optional(:minimum_length) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `default_value` - The value that will pre-fill the field on the payment page. Max length: 5000. Nullable.
  * `maximum_length` - The maximum character length constraint for the customer's input. Nullable.
  * `minimum_length` - The minimum character length requirement for the customer's input. Nullable.
  """
  @type custom_fields_text :: %{
          optional(:default_value) => String.t() | nil,
          optional(:maximum_length) => integer() | nil,
          optional(:minimum_length) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `after_submit` - Custom text that should be displayed after the payment confirmation button. Nullable.
  * `shipping_address` - Custom text that should be displayed alongside shipping address collection. Nullable.
  * `submit` - Custom text that should be displayed alongside the payment confirmation button. Nullable.
  * `terms_of_service_acceptance` - Custom text that should be displayed in place of the default terms of service agreement text. Nullable.
  """
  @type custom_text :: %{
          optional(:after_submit) => custom_text_after_submit() | nil,
          optional(:shipping_address) => custom_text_shipping_address() | nil,
          optional(:submit) => custom_text_submit() | nil,
          optional(:terms_of_service_acceptance) =>
            custom_text_terms_of_service_acceptance() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `message` - Text may be up to 1200 characters in length. Max length: 500.
  """
  @type custom_text_after_submit :: %{
          optional(:message) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `message` - Text may be up to 1200 characters in length. Max length: 500.
  """
  @type custom_text_shipping_address :: %{
          optional(:message) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `message` - Text may be up to 1200 characters in length. Max length: 500.
  """
  @type custom_text_submit :: %{
          optional(:message) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `message` - Text may be up to 1200 characters in length. Max length: 500.
  """
  @type custom_text_terms_of_service_acceptance :: %{
          optional(:message) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `enabled` - Enable creating an invoice on successful payment.
  * `invoice_data` - Configuration for the invoice. Default invoice values will be used if unspecified. Nullable.
  """
  @type invoice_creation :: %{
          optional(:enabled) => boolean() | nil,
          optional(:invoice_data) => invoice_creation_invoice_data() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `account_tax_ids` - The account tax IDs associated with the invoice. Nullable.
  * `custom_fields` - A list of up to 4 custom fields to be displayed on the invoice. Nullable.
  * `description` - An arbitrary string attached to the object. Often useful for displaying to users. Max length: 5000. Nullable.
  * `footer` - Footer to be displayed on the invoice. Max length: 5000. Nullable.
  * `issuer` - The connected account that issues the invoice. The invoice is presented with the branding and support information of the specified account. Nullable.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Nullable.
  * `rendering_options` - Options for invoice PDF rendering. Nullable.
  """
  @type invoice_creation_invoice_data :: %{
          optional(:account_tax_ids) => [String.t() | Stripe.Resources.TaxId.t()] | nil,
          optional(:custom_fields) => [invoice_creation_invoice_data_custom_fields()] | nil,
          optional(:description) => String.t() | nil,
          optional(:footer) => String.t() | nil,
          optional(:issuer) => invoice_creation_invoice_data_issuer() | nil,
          optional(:metadata) => %{String.t() => String.t()} | nil,
          optional(:rendering_options) => invoice_creation_invoice_data_rendering_options() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `name` - The name of the custom field. Max length: 5000.
  * `value` - The value of the custom field. Max length: 5000.
  """
  @type invoice_creation_invoice_data_custom_fields :: %{
          optional(:name) => String.t() | nil,
          optional(:value) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `account` - The connected account being referenced when `type` is `account`.
  * `type` - Type of the account referenced. Possible values: `account`, `self`.
  """
  @type invoice_creation_invoice_data_issuer :: %{
          optional(:account) => String.t() | Stripe.Resources.Account.t() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `amount_tax_display` - How line-item prices and amounts will be displayed with respect to tax on invoice PDFs. Max length: 5000. Nullable.
  * `template` - ID of the invoice rendering template to be used for the generated invoice. Max length: 5000. Nullable.
  """
  @type invoice_creation_invoice_data_rendering_options :: %{
          optional(:amount_tax_display) => String.t() | nil,
          optional(:template) => String.t() | nil,
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
  * `business`
  * `individual`
  """
  @type name_collection :: %{
          optional(:business) => name_collection_business() | nil,
          optional(:individual) => name_collection_individual() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `enabled` - Indicates whether business name collection is enabled for the payment link.
  * `optional` - Whether the customer is required to complete the field before checking out. Defaults to `false`.
  """
  @type name_collection_business :: %{
          optional(:enabled) => boolean() | nil,
          optional(:optional) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `enabled` - Indicates whether individual name collection is enabled for the payment link.
  * `optional` - Whether the customer is required to complete the field before checking out. Defaults to `false`.
  """
  @type name_collection_individual :: %{
          optional(:enabled) => boolean() | nil,
          optional(:optional) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `adjustable_quantity` - Nullable.
  * `price` - Max length: 5000.
  * `quantity`
  """
  @type optional_items :: %{
          optional(:adjustable_quantity) => optional_items_adjustable_quantity() | nil,
          optional(:price) => String.t() | nil,
          optional(:quantity) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `enabled` - Set to true if the quantity can be adjusted to any non-negative integer.
  * `maximum` - The maximum quantity of this item the customer can purchase. By default this value is 99. Nullable.
  * `minimum` - The minimum quantity of this item the customer must purchase, if they choose to purchase it. Because this item is optional, the customer will always be able to remove it from their order, even if the `minimum` configured here is greater than 0. By default this value is 0. Nullable.
  """
  @type optional_items_adjustable_quantity :: %{
          optional(:enabled) => boolean() | nil,
          optional(:maximum) => integer() | nil,
          optional(:minimum) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `capture_method` - Indicates when the funds will be captured from the customer's account. Possible values: `automatic`, `automatic_async`, `manual`. Nullable.
  * `description` - An arbitrary string attached to the object. Often useful for displaying to users. Max length: 5000. Nullable.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that will set metadata on [Payment Intents](https://docs.stripe.com/api/payment_intents) generated from this payment link.
  * `setup_future_usage` - Indicates that you intend to make future payments with the payment method collected during checkout. Possible values: `off_session`, `on_session`. Nullable.
  * `statement_descriptor` - For a non-card payment, information about the charge that appears on the customer's statement when this payment succeeds in creating a charge. Max length: 5000. Nullable.
  * `statement_descriptor_suffix` - For a card payment, information about the charge that appears on the customer's statement when this payment succeeds in creating a charge. Concatenated with the account's statement descriptor prefix to form the complete statement descriptor. Max length: 5000. Nullable.
  * `transfer_group` - A string that identifies the resulting payment as part of a group. See the PaymentIntents [use case for connected accounts](https://docs.stripe.com/connect/separate-charges-and-transfers) for details. Max length: 5000. Nullable.
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
  * `enabled` - If `true`, a phone number will be collected during checkout.
  """
  @type phone_number_collection :: %{
          optional(:enabled) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `completed_sessions`
  """
  @type restrictions :: %{
          optional(:completed_sessions) => restrictions_completed_sessions() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `count` - The current number of checkout sessions that have been completed on the payment link which count towards the `completed_sessions` restriction to be met.
  * `limit` - The maximum number of checkout sessions that can be completed for the `completed_sessions` restriction to be met.
  """
  @type restrictions_completed_sessions :: %{
          optional(:count) => integer() | nil,
          optional(:limit) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `allowed_countries` - An array of two-letter ISO country codes representing which countries Checkout should provide as options for shipping locations. Unsupported country codes: `AS, CX, CC, CU, HM, IR, KP, MH, FM, NF, MP, PW, SD, SY, UM, VI`.
  """
  @type shipping_address_collection :: %{
          optional(:allowed_countries) => [String.t()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `shipping_amount` - A non-negative integer in cents representing how much to charge.
  * `shipping_rate` - The ID of the Shipping Rate to use for this shipping option.
  """
  @type shipping_options :: %{
          optional(:shipping_amount) => integer() | nil,
          optional(:shipping_rate) => String.t() | Stripe.Resources.ShippingRate.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `description` - The subscription's description, meant to be displayable to the customer. Use this field to optionally store an explanation of the subscription for rendering in Stripe surfaces and certain local payment methods UIs. Max length: 5000. Nullable.
  * `invoice_settings`
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that will set metadata on [Subscriptions](https://docs.stripe.com/api/subscriptions) generated from this payment link.
  * `trial_period_days` - Integer representing the number of trial period days before the customer is charged for the first time. Nullable.
  * `trial_settings` - Settings related to subscription trials. Nullable.
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
  * `issuer`
  """
  @type subscription_data_invoice_settings :: %{
          optional(:issuer) => subscription_data_invoice_settings_issuer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `account` - The connected account being referenced when `type` is `account`.
  * `type` - Type of the account referenced. Possible values: `account`, `self`.
  """
  @type subscription_data_invoice_settings_issuer :: %{
          optional(:account) => String.t() | Stripe.Resources.Account.t() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `end_behavior`
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
  * `enabled` - Indicates whether tax ID collection is enabled for the session.
  * `required` - Possible values: `if_supported`, `never`.
  """
  @type tax_id_collection :: %{
          optional(:enabled) => boolean() | nil,
          optional(:required) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `amount` - The amount in cents (or local equivalent) that will be transferred to the destination account. By default, the entire amount is transferred to the destination. Nullable.
  * `destination` - The connected account receiving the transfer.
  """
  @type transfer_data :: %{
          optional(:amount) => integer() | nil,
          optional(:destination) => String.t() | Stripe.Resources.Account.t() | nil,
          optional(String.t()) => term()
        }

  def __nested_fields__ do
    %{
      "after_completion" => %{
        fields: %{
          "hosted_confirmation" => %{
            fields: %{
              "custom_message" => :scalar
            }
          },
          "redirect" => %{
            fields: %{
              "url" => :scalar
            }
          },
          "type" => :scalar
        }
      },
      "automatic_tax" => %{
        fields: %{
          "enabled" => :scalar,
          "liability" => %{
            fields: %{
              "account" => {:resource, Stripe.Resources.Account},
              "type" => :scalar
            }
          }
        }
      },
      "consent_collection" => %{
        fields: %{
          "payment_method_reuse_agreement" => %{
            fields: %{
              "position" => :scalar
            }
          },
          "promotions" => :scalar,
          "terms_of_service" => :scalar
        }
      },
      "custom_fields" => %{
        fields: %{
          "dropdown" => %{
            fields: %{
              "default_value" => :scalar,
              "options" => {:list, {:resource, Stripe.Resources.CustomFieldDropdownOption}}
            }
          },
          "key" => :scalar,
          "label" => %{
            fields: %{
              "custom" => :scalar,
              "type" => :scalar
            }
          },
          "numeric" => %{
            fields: %{
              "default_value" => :scalar,
              "maximum_length" => :scalar,
              "minimum_length" => :scalar
            }
          },
          "optional" => :scalar,
          "text" => %{
            fields: %{
              "default_value" => :scalar,
              "maximum_length" => :scalar,
              "minimum_length" => :scalar
            }
          },
          "type" => :scalar
        }
      },
      "custom_text" => %{
        fields: %{
          "after_submit" => %{
            fields: %{
              "message" => :scalar
            }
          },
          "shipping_address" => %{
            fields: %{
              "message" => :scalar
            }
          },
          "submit" => %{
            fields: %{
              "message" => :scalar
            }
          },
          "terms_of_service_acceptance" => %{
            fields: %{
              "message" => :scalar
            }
          }
        }
      },
      "invoice_creation" => %{
        fields: %{
          "enabled" => :scalar,
          "invoice_data" => %{
            fields: %{
              "account_tax_ids" => {:list, {:resource, Stripe.Resources.TaxId}},
              "custom_fields" =>
                {:list,
                 %{
                   fields: %{
                     "name" => :scalar,
                     "value" => :scalar
                   }
                 }},
              "description" => :scalar,
              "footer" => :scalar,
              "issuer" => %{
                fields: %{
                  "account" => {:resource, Stripe.Resources.Account},
                  "type" => :scalar
                }
              },
              "metadata" => {:map, :scalar},
              "rendering_options" => %{
                fields: %{
                  "amount_tax_display" => :scalar,
                  "template" => :scalar
                }
              }
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
      "name_collection" => %{
        fields: %{
          "business" => %{
            fields: %{
              "enabled" => :scalar,
              "optional" => :scalar
            }
          },
          "individual" => %{
            fields: %{
              "enabled" => :scalar,
              "optional" => :scalar
            }
          }
        }
      },
      "optional_items" => %{
        fields: %{
          "adjustable_quantity" => %{
            fields: %{
              "enabled" => :scalar,
              "maximum" => :scalar,
              "minimum" => :scalar
            }
          },
          "price" => :scalar,
          "quantity" => :scalar
        }
      },
      "payment_intent_data" => %{
        fields: %{
          "capture_method" => :scalar,
          "description" => :scalar,
          "metadata" => {:map, :scalar},
          "setup_future_usage" => :scalar,
          "statement_descriptor" => :scalar,
          "statement_descriptor_suffix" => :scalar,
          "transfer_group" => :scalar
        }
      },
      "phone_number_collection" => %{
        fields: %{
          "enabled" => :scalar
        }
      },
      "restrictions" => %{
        fields: %{
          "completed_sessions" => %{
            fields: %{
              "count" => :scalar,
              "limit" => :scalar
            }
          }
        }
      },
      "shipping_address_collection" => %{
        fields: %{
          "allowed_countries" => {:list, :scalar}
        }
      },
      "shipping_options" => %{
        fields: %{
          "shipping_amount" => :scalar,
          "shipping_rate" => {:resource, Stripe.Resources.ShippingRate}
        }
      },
      "subscription_data" => %{
        fields: %{
          "description" => :scalar,
          "invoice_settings" => %{
            fields: %{
              "issuer" => %{
                fields: %{
                  "account" => {:resource, Stripe.Resources.Account},
                  "type" => :scalar
                }
              }
            }
          },
          "metadata" => {:map, :scalar},
          "trial_period_days" => :scalar,
          "trial_settings" => %{
            fields: %{
              "end_behavior" => %{
                fields: %{
                  "missing_payment_method" => :scalar
                }
              }
            }
          }
        }
      },
      "tax_id_collection" => %{
        fields: %{
          "enabled" => :scalar,
          "required" => :scalar
        }
      },
      "transfer_data" => %{
        fields: %{
          "amount" => :scalar,
          "destination" => {:resource, Stripe.Resources.Account}
        }
      }
    }
  end
end
