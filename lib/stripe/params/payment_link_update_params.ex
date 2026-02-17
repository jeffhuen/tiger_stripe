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
          after_completion: __MODULE__.AfterCompletion.t() | nil,
          allow_promotion_codes: boolean() | nil,
          automatic_tax: __MODULE__.AutomaticTax.t() | nil,
          billing_address_collection: String.t() | nil,
          custom_fields: map() | nil,
          custom_text: __MODULE__.CustomText.t() | nil,
          customer_creation: String.t() | nil,
          expand: [String.t()] | nil,
          inactive_message: map() | nil,
          invoice_creation: __MODULE__.InvoiceCreation.t() | nil,
          line_items: [__MODULE__.LineItems.t()] | nil,
          metadata: %{String.t() => String.t()} | nil,
          name_collection: map() | nil,
          payment_intent_data: __MODULE__.PaymentIntentData.t() | nil,
          payment_method_collection: String.t() | nil,
          payment_method_types: map() | nil,
          phone_number_collection: __MODULE__.PhoneNumberCollection.t() | nil,
          restrictions: map() | nil,
          shipping_address_collection: map() | nil,
          submit_type: String.t() | nil,
          subscription_data: __MODULE__.SubscriptionData.t() | nil,
          tax_id_collection: __MODULE__.TaxIdCollection.t() | nil
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

  defmodule AfterCompletion do
    @moduledoc "Nested parameters."

    @typedoc """
    * `hosted_confirmation` - Configuration when `type=hosted_confirmation`.
    * `redirect` - Configuration when `type=redirect`.
    * `type` - The specified behavior after the purchase is complete. Either `redirect` or `hosted_confirmation`. Possible values: `hosted_confirmation`, `redirect`.
    """
    @type t :: %__MODULE__{
            hosted_confirmation: __MODULE__.HostedConfirmation.t() | nil,
            redirect: __MODULE__.Redirect.t() | nil,
            type: String.t() | nil
          }
    defstruct [:hosted_confirmation, :redirect, :type]

    defmodule HostedConfirmation do
      @moduledoc "Nested parameters."

      @typedoc """
      * `custom_message` - A custom message to display to the customer after the purchase is complete. Max length: 500.
      """
      @type t :: %__MODULE__{
              custom_message: String.t() | nil
            }
      defstruct [:custom_message]
    end

    defmodule Redirect do
      @moduledoc "Nested parameters."

      @typedoc """
      * `url` - The URL the customer will be redirected to after the purchase is complete. You can embed `{CHECKOUT_SESSION_ID}` into the URL to have the `id` of the completed [checkout session](https://docs.stripe.com/api/checkout/sessions/object#checkout_session_object-id) included.
      """
      @type t :: %__MODULE__{
              url: String.t() | nil
            }
      defstruct [:url]
    end
  end

  defmodule AutomaticTax do
    @moduledoc "Nested parameters."

    @typedoc """
    * `enabled` - Set to `true` to [calculate tax automatically](https://docs.stripe.com/tax) using the customer's location.

    Enabling this parameter causes the payment link to collect any billing address information necessary for tax calculation.
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

  defmodule CustomText do
    @moduledoc "Nested parameters."

    @typedoc """
    * `after_submit` - Custom text that should be displayed after the payment confirmation button.
    * `shipping_address` - Custom text that should be displayed alongside shipping address collection.
    * `submit` - Custom text that should be displayed alongside the payment confirmation button.
    * `terms_of_service_acceptance` - Custom text that should be displayed in place of the default terms of service agreement text.
    """
    @type t :: %__MODULE__{
            after_submit: map() | nil,
            shipping_address: map() | nil,
            submit: map() | nil,
            terms_of_service_acceptance: map() | nil
          }
    defstruct [:after_submit, :shipping_address, :submit, :terms_of_service_acceptance]
  end

  defmodule InvoiceCreation do
    @moduledoc "Nested parameters."

    @typedoc """
    * `enabled` - Whether the feature is enabled
    * `invoice_data` - Invoice PDF configuration.
    """
    @type t :: %__MODULE__{
            enabled: boolean() | nil,
            invoice_data: __MODULE__.InvoiceData.t() | nil
          }
    defstruct [:enabled, :invoice_data]

    defmodule InvoiceData do
      @moduledoc "Nested parameters."

      @typedoc """
      * `account_tax_ids` - The account tax IDs associated with the invoice.
      * `custom_fields` - Default custom fields to be displayed on invoices for this customer.
      * `description` - An arbitrary string attached to the object. Often useful for displaying to users. Max length: 1500.
      * `footer` - Default footer to be displayed on invoices for this customer. Max length: 5000.
      * `issuer` - The connected account that issues the invoice. The invoice is presented with the branding and support information of the specified account.
      * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
      * `rendering_options` - Default options for invoice PDF rendering for this customer.
      """
      @type t :: %__MODULE__{
              account_tax_ids: map() | nil,
              custom_fields: map() | nil,
              description: String.t() | nil,
              footer: String.t() | nil,
              issuer: __MODULE__.Issuer.t() | nil,
              metadata: map() | nil,
              rendering_options: map() | nil
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
  end

  defmodule LineItems do
    @moduledoc "Nested parameters."

    @typedoc """
    * `adjustable_quantity` - When set, provides configuration for this item’s quantity to be adjusted by the customer during checkout.
    * `id` - The ID of an existing line item on the payment link. Max length: 5000.
    * `quantity` - The quantity of the line item being purchased.
    """
    @type t :: %__MODULE__{
            adjustable_quantity: __MODULE__.AdjustableQuantity.t() | nil,
            id: String.t() | nil,
            quantity: integer() | nil
          }
    defstruct [:adjustable_quantity, :id, :quantity]

    defmodule AdjustableQuantity do
      @moduledoc "Nested parameters."

      @typedoc """
      * `enabled` - Set to true if the quantity can be adjusted to any non-negative Integer.
      * `maximum` - The maximum quantity the customer can purchase. By default this value is 99. You can specify a value up to 999999.
      * `minimum` - The minimum quantity the customer can purchase. By default this value is 0. If there is only one item in the cart then that item's quantity cannot go down to 0.
      """
      @type t :: %__MODULE__{
              enabled: boolean() | nil,
              maximum: integer() | nil,
              minimum: integer() | nil
            }
      defstruct [:enabled, :maximum, :minimum]
    end
  end

  defmodule PaymentIntentData do
    @moduledoc "Nested parameters."

    @typedoc """
    * `description` - An arbitrary string attached to the object. Often useful for displaying to users.
    * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that will declaratively set metadata on [Payment Intents](https://docs.stripe.com/api/payment_intents) generated from this payment link. Unlike object-level metadata, this field is declarative. Updates will clear prior values.
    * `statement_descriptor` - Text that appears on the customer's statement as the statement descriptor for a non-card charge. This value overrides the account's default statement descriptor. For information about requirements, including the 22-character limit, see [the Statement Descriptor docs](https://docs.stripe.com/get-started/account/statement-descriptors).

    Setting this value for a card charge returns an error. For card charges, set the [statement_descriptor_suffix](https://docs.stripe.com/get-started/account/statement-descriptors#dynamic) instead.
    * `statement_descriptor_suffix` - Provides information about a card charge. Concatenated to the account's [statement descriptor prefix](https://docs.stripe.com/get-started/account/statement-descriptors#static) to form the complete statement descriptor that appears on the customer's statement.
    * `transfer_group` - A string that identifies the resulting payment as part of a group. See the PaymentIntents [use case for connected accounts](https://docs.stripe.com/connect/separate-charges-and-transfers) for details.
    """
    @type t :: %__MODULE__{
            description: map() | nil,
            metadata: map() | nil,
            statement_descriptor: map() | nil,
            statement_descriptor_suffix: map() | nil,
            transfer_group: map() | nil
          }
    defstruct [
      :description,
      :metadata,
      :statement_descriptor,
      :statement_descriptor_suffix,
      :transfer_group
    ]
  end

  defmodule PhoneNumberCollection do
    @moduledoc "Nested parameters."

    @typedoc """
    * `enabled` - Set to `true` to enable phone number collection.
    """
    @type t :: %__MODULE__{
            enabled: boolean() | nil
          }
    defstruct [:enabled]
  end

  defmodule SubscriptionData do
    @moduledoc "Nested parameters."

    @typedoc """
    * `invoice_settings` - All invoices will be billed using the specified settings.
    * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that will declaratively set metadata on [Subscriptions](https://docs.stripe.com/api/subscriptions) generated from this payment link. Unlike object-level metadata, this field is declarative. Updates will clear prior values.
    * `trial_period_days` - Integer representing the number of trial period days before the customer is charged for the first time. Has to be at least 1.
    * `trial_settings` - Settings related to subscription trials.
    """
    @type t :: %__MODULE__{
            invoice_settings: __MODULE__.InvoiceSettings.t() | nil,
            metadata: map() | nil,
            trial_period_days: map() | nil,
            trial_settings: map() | nil
          }
    defstruct [:invoice_settings, :metadata, :trial_period_days, :trial_settings]

    defmodule InvoiceSettings do
      @moduledoc "Nested parameters."

      @typedoc """
      * `issuer` - The connected account that issues the invoice. The invoice is presented with the branding and support information of the specified account.
      """
      @type t :: %__MODULE__{
              issuer: __MODULE__.Issuer.t() | nil
            }
      defstruct [:issuer]

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
  end

  defmodule TaxIdCollection do
    @moduledoc "Nested parameters."

    @typedoc """
    * `enabled` - Enable tax ID collection during checkout. Defaults to `false`.
    * `required` - Describes whether a tax ID is required during checkout. Defaults to `never`. You can't set this parameter if `ui_mode` is `custom`. Possible values: `if_supported`, `never`.
    """
    @type t :: %__MODULE__{
            enabled: boolean() | nil,
            required: String.t() | nil
          }
    defstruct [:enabled, :required]
  end
end
