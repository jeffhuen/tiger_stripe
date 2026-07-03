# File generated from our OpenAPI spec
defmodule Stripe.Params.SetupIntentUpdateParams do
  @moduledoc "Parameters for setup intent update."

  @typedoc """
  * `attach_to_self` - If present, the SetupIntent's payment method will be attached to the in-context Stripe Account.

  It can only be used for this Stripe Account’s own money movement flows like InboundTransfer and OutboundTransfers. It cannot be set to true when setting up a PaymentMethod for a Customer, and defaults to false when attaching a PaymentMethod to a Customer.
  * `customer` - ID of the Customer this SetupIntent belongs to, if one exists.

  If present, the SetupIntent's payment method will be attached to the Customer on successful setup. Payment methods attached to other Customers cannot be used with this SetupIntent. Max length: 5000.
  * `customer_account` - ID of the Account this SetupIntent belongs to, if one exists.

  If present, the SetupIntent's payment method will be attached to the Account on successful setup. Payment methods attached to other Accounts cannot be used with this SetupIntent. Max length: 5000.
  * `description` - An arbitrary string attached to the object. Often useful for displaying to users. Max length: 1000.
  * `excluded_payment_method_types` - The list of payment method types to exclude from use with this SetupIntent.
  * `expand` - Specifies which fields in the response should be expanded.
  * `flow_directions` - Indicates the directions of money movement for which this payment method is intended to be used.

  Include `inbound` if you intend to use the payment method as the origin to pull funds from. Include `outbound` if you intend to use the payment method as the destination to send funds to. You can include both if you intend to use the payment method for both purposes.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `payment_method` - ID of the payment method (a PaymentMethod, Card, or saved Source object) to attach to this SetupIntent. To unset this field to null, pass in an empty string. Max length: 5000.
  * `payment_method_configuration` - The ID of the [payment method configuration](https://docs.stripe.com/api/payment_method_configurations) to use with this SetupIntent. Max length: 100.
  * `payment_method_data` - When included, this hash creates a PaymentMethod that is set as the [`payment_method`](https://docs.stripe.com/api/setup_intents/object#setup_intent_object-payment_method)
  value in the SetupIntent.
  * `payment_method_options` - Payment method-specific configuration for this SetupIntent.
  * `payment_method_types` - The list of payment method types (for example, card) that this SetupIntent can set up. If you don't provide this, Stripe will dynamically show relevant payment methods from your [payment method settings](https://dashboard.stripe.com/settings/payment_methods). A list of valid payment method types can be found [here](https://docs.stripe.com/api/payment_methods/object#payment_method_object-type).
  """
  @type t :: %__MODULE__{}

  defstruct [
    :attach_to_self,
    :customer,
    :customer_account,
    :description,
    :excluded_payment_method_types,
    :expand,
    :flow_directions,
    :metadata,
    :payment_method,
    :payment_method_configuration,
    :payment_method_data,
    :payment_method_options,
    :payment_method_types
  ]
end
