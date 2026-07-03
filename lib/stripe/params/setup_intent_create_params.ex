# File generated from our OpenAPI spec
defmodule Stripe.Params.SetupIntentCreateParams do
  @moduledoc "Parameters for setup intent create."

  @typedoc """
  * `attach_to_self` - If present, the SetupIntent's payment method will be attached to the in-context Stripe Account.

  It can only be used for this Stripe Account’s own money movement flows like InboundTransfer and OutboundTransfers. It cannot be set to true when setting up a PaymentMethod for a Customer, and defaults to false when attaching a PaymentMethod to a Customer.
  * `automatic_payment_methods` - When you enable this parameter, this SetupIntent accepts payment methods that you enable in the Dashboard and that are compatible with its other parameters.
  * `confirm` - Set to `true` to attempt to confirm this SetupIntent immediately. This parameter defaults to `false`. If a card is the attached payment method, you can provide a `return_url` in case further authentication is necessary.
  * `confirmation_token` - ID of the ConfirmationToken used to confirm this SetupIntent.

  If the provided ConfirmationToken contains properties that are also being provided in this request, such as `payment_method`, then the values in this request will take precedence. Max length: 5000.
  * `customer` - ID of the Customer this SetupIntent belongs to, if one exists.

  If present, the SetupIntent's payment method will be attached to the Customer on successful setup. Payment methods attached to other Customers cannot be used with this SetupIntent. Max length: 5000.
  * `customer_account` - ID of the Account this SetupIntent belongs to, if one exists.

  If present, the SetupIntent's payment method will be attached to the Account on successful setup. Payment methods attached to other Accounts cannot be used with this SetupIntent. Max length: 5000.
  * `description` - An arbitrary string attached to the object. Often useful for displaying to users. Max length: 1000.
  * `excluded_payment_method_types` - The list of payment method types to exclude from use with this SetupIntent.
  * `expand` - Specifies which fields in the response should be expanded.
  * `flow_directions` - Indicates the directions of money movement for which this payment method is intended to be used.

  Include `inbound` if you intend to use the payment method as the origin to pull funds from. Include `outbound` if you intend to use the payment method as the destination to send funds to. You can include both if you intend to use the payment method for both purposes.
  * `mandate_data` - This hash contains details about the mandate to create. This parameter can only be used with [`confirm=true`](https://docs.stripe.com/api/setup_intents/create#create_setup_intent-confirm).
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `on_behalf_of` - The Stripe account ID created for this SetupIntent.
  * `payment_method` - ID of the payment method (a PaymentMethod, Card, or saved Source object) to attach to this SetupIntent. Max length: 5000.
  * `payment_method_configuration` - The ID of the [payment method configuration](https://docs.stripe.com/api/payment_method_configurations) to use with this SetupIntent. Max length: 100.
  * `payment_method_data` - When included, this hash creates a PaymentMethod that is set as the [`payment_method`](https://docs.stripe.com/api/setup_intents/object#setup_intent_object-payment_method)
  value in the SetupIntent.
  * `payment_method_options` - Payment method-specific configuration for this SetupIntent.
  * `payment_method_types` - The list of payment method types (for example, card) that this SetupIntent can use. If you don't provide this, Stripe will dynamically show relevant payment methods from your [payment method settings](https://dashboard.stripe.com/settings/payment_methods). A list of valid payment method types can be found [here](https://docs.stripe.com/api/payment_methods/object#payment_method_object-type).
  * `return_url` - The URL to redirect your customer back to after they authenticate or cancel their payment on the payment method's app or site. To redirect to a mobile application, you can alternatively supply an application URI scheme. This parameter can only be used with [`confirm=true`](https://docs.stripe.com/api/setup_intents/create#create_setup_intent-confirm).
  * `single_use` - If you populate this hash, this SetupIntent generates a `single_use` mandate after successful completion.

  Single-use mandates are only valid for the following payment methods: `acss_debit`, `alipay`, `au_becs_debit`, `bacs_debit`, `bancontact`, `boleto`, `ideal`, `link`, `sepa_debit`, and `us_bank_account`.
  * `usage` - Indicates how the payment method is intended to be used in the future. If not provided, this value defaults to `off_session`. Possible values: `off_session`, `on_session`.
  * `use_stripe_sdk` - Set to `true` when confirming server-side and using Stripe.js, iOS, or Android client-side SDKs to handle the next actions.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :attach_to_self,
    :automatic_payment_methods,
    :confirm,
    :confirmation_token,
    :customer,
    :customer_account,
    :description,
    :excluded_payment_method_types,
    :expand,
    :flow_directions,
    :mandate_data,
    :metadata,
    :on_behalf_of,
    :payment_method,
    :payment_method_configuration,
    :payment_method_data,
    :payment_method_options,
    :payment_method_types,
    :return_url,
    :single_use,
    :usage,
    :use_stripe_sdk
  ]
end
