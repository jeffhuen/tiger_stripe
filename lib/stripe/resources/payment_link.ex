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
          after_completion: __MODULE__.AfterCompletion.t(),
          allow_promotion_codes: boolean(),
          application: String.t() | Stripe.Resources.Application.t(),
          application_fee_amount: integer(),
          application_fee_percent: float(),
          automatic_tax: __MODULE__.AutomaticTax.t(),
          billing_address_collection: String.t(),
          consent_collection: __MODULE__.ConsentCollection.t(),
          currency: String.t(),
          custom_fields: [__MODULE__.CustomFields.t()],
          custom_text: __MODULE__.CustomText.t(),
          customer_creation: String.t(),
          id: String.t(),
          inactive_message: String.t(),
          invoice_creation: __MODULE__.InvoiceCreation.t(),
          line_items: __MODULE__.LineItems.t() | nil,
          livemode: boolean(),
          metadata: %{String.t() => String.t()},
          name_collection: __MODULE__.NameCollection.t() | nil,
          object: String.t(),
          on_behalf_of: String.t() | Stripe.Resources.Account.t(),
          optional_items: [__MODULE__.OptionalItems.t()] | nil,
          payment_intent_data: __MODULE__.PaymentIntentData.t(),
          payment_method_collection: String.t(),
          payment_method_types: [String.t()],
          phone_number_collection: __MODULE__.PhoneNumberCollection.t(),
          restrictions: __MODULE__.Restrictions.t(),
          shipping_address_collection: __MODULE__.ShippingAddressCollection.t(),
          shipping_options: [__MODULE__.ShippingOptions.t()],
          submit_type: String.t(),
          subscription_data: __MODULE__.SubscriptionData.t(),
          tax_id_collection: __MODULE__.TaxIdCollection.t(),
          transfer_data: __MODULE__.TransferData.t(),
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

  defmodule AfterCompletion do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `hosted_confirmation`
    * `redirect`
    * `type` - The specified behavior after the purchase is complete. Possible values: `hosted_confirmation`, `redirect`.
    """
    @type t :: %__MODULE__{
            hosted_confirmation: __MODULE__.HostedConfirmation.t() | nil,
            redirect: __MODULE__.Redirect.t() | nil,
            type: String.t() | nil
          }
    defstruct [:hosted_confirmation, :redirect, :type]

    defmodule HostedConfirmation do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `custom_message` - The custom message that is displayed to the customer after the purchase is complete. Max length: 5000. Nullable.
      """
      @type t :: %__MODULE__{
              custom_message: String.t() | nil
            }
      defstruct [:custom_message]
    end

    defmodule Redirect do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `url` - The URL the customer will be redirected to after the purchase is complete. Max length: 5000.
      """
      @type t :: %__MODULE__{
              url: String.t() | nil
            }
      defstruct [:url]
    end

    def __inner_types__ do
      %{
        "hosted_confirmation" => __MODULE__.HostedConfirmation,
        "redirect" => __MODULE__.Redirect
      }
    end
  end

  defmodule AutomaticTax do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `enabled` - If `true`, tax will be calculated automatically using the customer's location.
    * `liability` - The account that's liable for tax. If set, the business address and tax registrations required to perform the tax calculation are loaded from this account. The tax transaction is returned in the report of the connected account. Nullable.
    """
    @type t :: %__MODULE__{
            enabled: boolean() | nil,
            liability: __MODULE__.Liability.t() | nil
          }
    defstruct [:enabled, :liability]

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

  defmodule ConsentCollection do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `payment_method_reuse_agreement` - Settings related to the payment method reuse text shown in the Checkout UI. Nullable.
    * `promotions` - If set to `auto`, enables the collection of customer consent for promotional communications. Possible values: `auto`, `none`. Nullable.
    * `terms_of_service` - If set to `required`, it requires cutomers to accept the terms of service before being able to pay. If set to `none`, customers won't be shown a checkbox to accept the terms of service. Possible values: `none`, `required`. Nullable.
    """
    @type t :: %__MODULE__{
            payment_method_reuse_agreement: __MODULE__.PaymentMethodReuseAgreement.t() | nil,
            promotions: String.t() | nil,
            terms_of_service: String.t() | nil
          }
    defstruct [:payment_method_reuse_agreement, :promotions, :terms_of_service]

    defmodule PaymentMethodReuseAgreement do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `position` - Determines the position and visibility of the payment method reuse agreement in the UI. When set to `auto`, Stripe's defaults will be used.

      When set to `hidden`, the payment method reuse agreement text will always be hidden in the UI. Possible values: `auto`, `hidden`.
      """
      @type t :: %__MODULE__{
              position: String.t() | nil
            }
      defstruct [:position]
    end

    def __inner_types__ do
      %{
        "payment_method_reuse_agreement" => __MODULE__.PaymentMethodReuseAgreement
      }
    end
  end

  defmodule CustomFields do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `dropdown`
    * `key` - String of your choice that your integration can use to reconcile this field. Must be unique to this field, alphanumeric, and up to 200 characters. Max length: 5000.
    * `label`
    * `numeric`
    * `optional` - Whether the customer is required to complete the field before completing the Checkout Session. Defaults to `false`.
    * `text`
    * `type` - The type of the field. Possible values: `dropdown`, `numeric`, `text`.
    """
    @type t :: %__MODULE__{
            dropdown: __MODULE__.Dropdown.t() | nil,
            key: String.t() | nil,
            label: __MODULE__.Label.t() | nil,
            numeric: __MODULE__.Numeric.t() | nil,
            optional: boolean() | nil,
            text: __MODULE__.Text.t() | nil,
            type: String.t() | nil
          }
    defstruct [:dropdown, :key, :label, :numeric, :optional, :text, :type]

    defmodule Dropdown do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `default_value` - The value that pre-fills on the payment page. Max length: 5000. Nullable.
      * `options` - The options available for the customer to select. Up to 200 options allowed.
      """
      @type t :: %__MODULE__{
              default_value: String.t() | nil,
              options: [Stripe.Resources.CustomFieldDropdownOption.t()] | nil
            }
      defstruct [:default_value, :options]
    end

    defmodule Label do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `custom` - Custom text for the label, displayed to the customer. Up to 50 characters. Max length: 5000. Nullable.
      * `type` - The type of the label. Possible values: `custom`.
      """
      @type t :: %__MODULE__{
              custom: String.t() | nil,
              type: String.t() | nil
            }
      defstruct [:custom, :type]
    end

    defmodule Numeric do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `default_value` - The value that pre-fills the field on the payment page. Max length: 5000. Nullable.
      * `maximum_length` - The maximum character length constraint for the customer's input. Nullable.
      * `minimum_length` - The minimum character length requirement for the customer's input. Nullable.
      """
      @type t :: %__MODULE__{
              default_value: String.t() | nil,
              maximum_length: integer() | nil,
              minimum_length: integer() | nil
            }
      defstruct [:default_value, :maximum_length, :minimum_length]
    end

    defmodule Text do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `default_value` - The value that pre-fills the field on the payment page. Max length: 5000. Nullable.
      * `maximum_length` - The maximum character length constraint for the customer's input. Nullable.
      * `minimum_length` - The minimum character length requirement for the customer's input. Nullable.
      """
      @type t :: %__MODULE__{
              default_value: String.t() | nil,
              maximum_length: integer() | nil,
              minimum_length: integer() | nil
            }
      defstruct [:default_value, :maximum_length, :minimum_length]
    end

    def __inner_types__ do
      %{
        "dropdown" => __MODULE__.Dropdown,
        "label" => __MODULE__.Label,
        "numeric" => __MODULE__.Numeric,
        "text" => __MODULE__.Text
      }
    end
  end

  defmodule CustomText do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `after_submit` - Custom text that should be displayed after the payment confirmation button. Nullable.
    * `shipping_address` - Custom text that should be displayed alongside shipping address collection. Nullable.
    * `submit` - Custom text that should be displayed alongside the payment confirmation button. Nullable.
    * `terms_of_service_acceptance` - Custom text that should be displayed in place of the default terms of service agreement text. Nullable.
    """
    @type t :: %__MODULE__{
            after_submit: __MODULE__.AfterSubmit.t() | nil,
            shipping_address: __MODULE__.ShippingAddress.t() | nil,
            submit: __MODULE__.Submit.t() | nil,
            terms_of_service_acceptance: __MODULE__.TermsOfServiceAcceptance.t() | nil
          }
    defstruct [:after_submit, :shipping_address, :submit, :terms_of_service_acceptance]

    defmodule AfterSubmit do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `message` - Text can be up to 1200 characters in length. Max length: 500.
      """
      @type t :: %__MODULE__{
              message: String.t() | nil
            }
      defstruct [:message]
    end

    defmodule ShippingAddress do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `message` - Text can be up to 1200 characters in length. Max length: 500.
      """
      @type t :: %__MODULE__{
              message: String.t() | nil
            }
      defstruct [:message]
    end

    defmodule Submit do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `message` - Text can be up to 1200 characters in length. Max length: 500.
      """
      @type t :: %__MODULE__{
              message: String.t() | nil
            }
      defstruct [:message]
    end

    defmodule TermsOfServiceAcceptance do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `message` - Text can be up to 1200 characters in length. Max length: 500.
      """
      @type t :: %__MODULE__{
              message: String.t() | nil
            }
      defstruct [:message]
    end

    def __inner_types__ do
      %{
        "after_submit" => __MODULE__.AfterSubmit,
        "shipping_address" => __MODULE__.ShippingAddress,
        "submit" => __MODULE__.Submit,
        "terms_of_service_acceptance" => __MODULE__.TermsOfServiceAcceptance
      }
    end
  end

  defmodule InvoiceCreation do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `enabled` - Enable creating an invoice on successful payment.
    * `invoice_data` - Configuration for the invoice. Default invoice values will be used if unspecified. Nullable.
    """
    @type t :: %__MODULE__{
            enabled: boolean() | nil,
            invoice_data: __MODULE__.InvoiceData.t() | nil
          }
    defstruct [:enabled, :invoice_data]

    defmodule InvoiceData do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `account_tax_ids` - The account tax IDs associated with the invoice. Nullable.
      * `custom_fields` - A list of up to 4 custom fields to be displayed on the invoice. Nullable.
      * `description` - An arbitrary string attached to the object. Often useful for displaying to users. Max length: 5000. Nullable.
      * `footer` - Footer to be displayed on the invoice. Max length: 5000. Nullable.
      * `issuer` - The connected account that issues the invoice. The invoice is presented with the branding and support information of the specified account. Nullable.
      * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Nullable.
      * `rendering_options` - Options for invoice PDF rendering. Nullable.
      """
      @type t :: %__MODULE__{
              account_tax_ids: [String.t() | Stripe.Resources.TaxId.t()] | nil,
              custom_fields: [__MODULE__.CustomFields.t()] | nil,
              description: String.t() | nil,
              footer: String.t() | nil,
              issuer: __MODULE__.Issuer.t() | nil,
              metadata: %{String.t() => String.t()} | nil,
              rendering_options: __MODULE__.RenderingOptions.t() | nil
            }
      defstruct [
        :account_tax_ids,
        :custom_fields,
        :description,
        :footer,
        :issuer,
        :metadata,
        :rendering_options
      ]

      defmodule CustomFields do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `name` - The name of the custom field. Max length: 5000.
        * `value` - The value of the custom field. Max length: 5000.
        """
        @type t :: %__MODULE__{
                name: String.t() | nil,
                value: String.t() | nil
              }
        defstruct [:name, :value]
      end

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

      defmodule RenderingOptions do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `amount_tax_display` - How line-item prices and amounts will be displayed with respect to tax on invoice PDFs. Max length: 5000. Nullable.
        * `template` - ID of the invoice rendering template to be used for the generated invoice. Max length: 5000. Nullable.
        """
        @type t :: %__MODULE__{
                amount_tax_display: String.t() | nil,
                template: String.t() | nil
              }
        defstruct [:amount_tax_display, :template]
      end

      def __inner_types__ do
        %{
          "custom_fields" => __MODULE__.CustomFields,
          "issuer" => __MODULE__.Issuer,
          "rendering_options" => __MODULE__.RenderingOptions
        }
      end
    end

    def __inner_types__ do
      %{
        "invoice_data" => __MODULE__.InvoiceData
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

  defmodule NameCollection do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `business`
    * `individual`
    """
    @type t :: %__MODULE__{
            business: __MODULE__.Business.t() | nil,
            individual: __MODULE__.Individual.t() | nil
          }
    defstruct [:business, :individual]

    defmodule Business do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `enabled` - Indicates whether business name collection is enabled for the payment link.
      * `optional` - Whether the customer is required to complete the field before checking out. Defaults to `false`.
      """
      @type t :: %__MODULE__{
              enabled: boolean() | nil,
              optional: boolean() | nil
            }
      defstruct [:enabled, :optional]
    end

    defmodule Individual do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `enabled` - Indicates whether individual name collection is enabled for the payment link.
      * `optional` - Whether the customer is required to complete the field before checking out. Defaults to `false`.
      """
      @type t :: %__MODULE__{
              enabled: boolean() | nil,
              optional: boolean() | nil
            }
      defstruct [:enabled, :optional]
    end

    def __inner_types__ do
      %{
        "business" => __MODULE__.Business,
        "individual" => __MODULE__.Individual
      }
    end
  end

  defmodule OptionalItems do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `adjustable_quantity` - Nullable.
    * `price` - Max length: 5000.
    * `quantity`
    """
    @type t :: %__MODULE__{
            adjustable_quantity: __MODULE__.AdjustableQuantity.t() | nil,
            price: String.t() | nil,
            quantity: integer() | nil
          }
    defstruct [:adjustable_quantity, :price, :quantity]

    defmodule AdjustableQuantity do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `enabled` - Set to true if the quantity can be adjusted to any non-negative integer.
      * `maximum` - The maximum quantity of this item the customer can purchase. By default this value is 99. Nullable.
      * `minimum` - The minimum quantity of this item the customer must purchase, if they choose to purchase it. Because this item is optional, the customer will always be able to remove it from their order, even if the `minimum` configured here is greater than 0. By default this value is 0. Nullable.
      """
      @type t :: %__MODULE__{
              enabled: boolean() | nil,
              maximum: integer() | nil,
              minimum: integer() | nil
            }
      defstruct [:enabled, :maximum, :minimum]
    end

    def __inner_types__ do
      %{
        "adjustable_quantity" => __MODULE__.AdjustableQuantity
      }
    end
  end

  defmodule PaymentIntentData do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `capture_method` - Indicates when the funds will be captured from the customer's account. Possible values: `automatic`, `automatic_async`, `manual`. Nullable.
    * `description` - An arbitrary string attached to the object. Often useful for displaying to users. Max length: 5000. Nullable.
    * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that will set metadata on [Payment Intents](https://docs.stripe.com/api/payment_intents) generated from this payment link.
    * `setup_future_usage` - Indicates that you intend to make future payments with the payment method collected during checkout. Possible values: `off_session`, `on_session`. Nullable.
    * `statement_descriptor` - For a non-card payment, information about the charge that appears on the customer's statement when this payment succeeds in creating a charge. Max length: 5000. Nullable.
    * `statement_descriptor_suffix` - For a card payment, information about the charge that appears on the customer's statement when this payment succeeds in creating a charge. Concatenated with the account's statement descriptor prefix to form the complete statement descriptor. Max length: 5000. Nullable.
    * `transfer_group` - A string that identifies the resulting payment as part of a group. See the PaymentIntents [use case for connected accounts](https://docs.stripe.com/connect/separate-charges-and-transfers) for details. Max length: 5000. Nullable.
    """
    @type t :: %__MODULE__{
            capture_method: String.t() | nil,
            description: String.t() | nil,
            metadata: %{String.t() => String.t()} | nil,
            setup_future_usage: String.t() | nil,
            statement_descriptor: String.t() | nil,
            statement_descriptor_suffix: String.t() | nil,
            transfer_group: String.t() | nil
          }
    defstruct [
      :capture_method,
      :description,
      :metadata,
      :setup_future_usage,
      :statement_descriptor,
      :statement_descriptor_suffix,
      :transfer_group
    ]
  end

  defmodule PhoneNumberCollection do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `enabled` - If `true`, a phone number will be collected during checkout.
    """
    @type t :: %__MODULE__{
            enabled: boolean() | nil
          }
    defstruct [:enabled]
  end

  defmodule Restrictions do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `completed_sessions`
    """
    @type t :: %__MODULE__{
            completed_sessions: __MODULE__.CompletedSessions.t() | nil
          }
    defstruct [:completed_sessions]

    defmodule CompletedSessions do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `count` - The current number of checkout sessions that have been completed on the payment link which count towards the `completed_sessions` restriction to be met.
      * `limit` - The maximum number of checkout sessions that can be completed for the `completed_sessions` restriction to be met.
      """
      @type t :: %__MODULE__{
              count: integer() | nil,
              limit: integer() | nil
            }
      defstruct [:count, :limit]
    end

    def __inner_types__ do
      %{
        "completed_sessions" => __MODULE__.CompletedSessions
      }
    end
  end

  defmodule ShippingAddressCollection do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `allowed_countries` - An array of two-letter ISO country codes representing which countries Checkout should provide as options for shipping locations. Unsupported country codes: `AS, CX, CC, CU, HM, IR, KP, MH, FM, NF, MP, PW, SD, SY, UM, VI`.
    """
    @type t :: %__MODULE__{
            allowed_countries: [String.t()] | nil
          }
    defstruct [:allowed_countries]
  end

  defmodule ShippingOptions do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `shipping_amount` - A non-negative integer in cents representing how much to charge.
    * `shipping_rate` - The ID of the Shipping Rate to use for this shipping option.
    """
    @type t :: %__MODULE__{
            shipping_amount: integer() | nil,
            shipping_rate: String.t() | Stripe.Resources.ShippingRate.t() | nil
          }
    defstruct [:shipping_amount, :shipping_rate]
  end

  defmodule SubscriptionData do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `description` - The subscription's description, meant to be displayable to the customer. Use this field to optionally store an explanation of the subscription for rendering in Stripe surfaces and certain local payment methods UIs. Max length: 5000. Nullable.
    * `invoice_settings`
    * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that will set metadata on [Subscriptions](https://docs.stripe.com/api/subscriptions) generated from this payment link.
    * `trial_period_days` - Integer representing the number of trial period days before the customer is charged for the first time. Nullable.
    * `trial_settings` - Settings related to subscription trials. Nullable.
    """
    @type t :: %__MODULE__{
            description: String.t() | nil,
            invoice_settings: __MODULE__.InvoiceSettings.t() | nil,
            metadata: %{String.t() => String.t()} | nil,
            trial_period_days: integer() | nil,
            trial_settings: __MODULE__.TrialSettings.t() | nil
          }
    defstruct [:description, :invoice_settings, :metadata, :trial_period_days, :trial_settings]

    defmodule InvoiceSettings do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `issuer`
      """
      @type t :: %__MODULE__{
              issuer: __MODULE__.Issuer.t() | nil
            }
      defstruct [:issuer]

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

    defmodule TrialSettings do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `end_behavior`
      """
      @type t :: %__MODULE__{
              end_behavior: __MODULE__.EndBehavior.t() | nil
            }
      defstruct [:end_behavior]

      defmodule EndBehavior do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `missing_payment_method` - Indicates how the subscription should change when the trial ends if the user did not provide a payment method. Possible values: `cancel`, `create_invoice`, `pause`.
        """
        @type t :: %__MODULE__{
                missing_payment_method: String.t() | nil
              }
        defstruct [:missing_payment_method]
      end

      def __inner_types__ do
        %{
          "end_behavior" => __MODULE__.EndBehavior
        }
      end
    end

    def __inner_types__ do
      %{
        "invoice_settings" => __MODULE__.InvoiceSettings,
        "trial_settings" => __MODULE__.TrialSettings
      }
    end
  end

  defmodule TaxIdCollection do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `enabled` - Indicates whether tax ID collection is enabled for the session.
    * `required` - Possible values: `if_supported`, `never`.
    """
    @type t :: %__MODULE__{
            enabled: boolean() | nil,
            required: String.t() | nil
          }
    defstruct [:enabled, :required]
  end

  defmodule TransferData do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `amount` - The amount in cents (or local equivalent) that will be transferred to the destination account. By default, the entire amount is transferred to the destination. Nullable.
    * `destination` - The connected account receiving the transfer.
    """
    @type t :: %__MODULE__{
            amount: integer() | nil,
            destination: String.t() | Stripe.Resources.Account.t() | nil
          }
    defstruct [:amount, :destination]
  end

  def __inner_types__ do
    %{
      "after_completion" => __MODULE__.AfterCompletion,
      "automatic_tax" => __MODULE__.AutomaticTax,
      "consent_collection" => __MODULE__.ConsentCollection,
      "custom_fields" => __MODULE__.CustomFields,
      "custom_text" => __MODULE__.CustomText,
      "invoice_creation" => __MODULE__.InvoiceCreation,
      "line_items" => __MODULE__.LineItems,
      "name_collection" => __MODULE__.NameCollection,
      "optional_items" => __MODULE__.OptionalItems,
      "payment_intent_data" => __MODULE__.PaymentIntentData,
      "phone_number_collection" => __MODULE__.PhoneNumberCollection,
      "restrictions" => __MODULE__.Restrictions,
      "shipping_address_collection" => __MODULE__.ShippingAddressCollection,
      "shipping_options" => __MODULE__.ShippingOptions,
      "subscription_data" => __MODULE__.SubscriptionData,
      "tax_id_collection" => __MODULE__.TaxIdCollection,
      "transfer_data" => __MODULE__.TransferData
    }
  end
end
