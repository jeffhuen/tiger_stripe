# File generated from our OpenAPI spec
defmodule Stripe.Params.ThreeDSecure.AuthenticationCreateParams do
  @moduledoc "Parameters for authentication create."

  @typedoc """
  * `acquirer_details` - Contains additional details about the acquirer for this 3DS Authentication.

  Refer to the [Pass acquirer details and directory server section of the standalone 3DS guide](https://stripe.com/payments/3d-secure/standalone-3d-secure#pass-acquirer-details-and-directory-server) for more information.
  * `amount` - A non-negative integer representing the amount in the [smallest currency unit](https://stripe.com/currencies#zero-decimal). You can't include this parameter if `message_category` is `non_payment_authentication`
  * `channel` - Contains additional details on the channel used for this 3DS Authentication.
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `directory_server` - The 3DS directory server with which this 3DS Authentication was processed. Possible values: `american_express`, `cartes_bancaires`, `discover`, `mastercard`, `visa`.
  * `expand` - Specifies which fields in the response should be expanded.
  * `flow_preference` - Contains additional details on your flow preference for this 3DS Authentication.

  Refer to the [Specify a flow preference section of the standalone 3DS guide](https://stripe.com/payments/3d-secure/standalone-3d-secure#specify-a-flow-preference) for more information.
  * `future_usage` - Contains information about future usage of this 3DS Authentication
  * `message_category` - Indicates whether this 3DS Authentication is being performed for a payment or non-payment use case. Possible values: `non_payment_authentication`, `payment_authentication`.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `payment_method` - ID of the payment method (a PaymentMethod object) to attach to this 3DS Authentication. Max length: 255.
  * `payment_method_data` - Hash used to generate the PaymentMethod to be used for this Authentication. This is mutually exclusive with the `payment_method` parameter.
  * `reason` - The reason for invoking standalone 3DS. This is tailored specifically for cases when you want Stripe to help determine the standalone 3DS flow to fit your use case instead of needing to select a specific 3DS flow.

  This parameter is exclusive with `flow_preference`. You can either use `reason` for controlling 3DS according to your business requirements, or use `flow_preference` for having fine-grained control over your 3DS flow preference. Possible values: `cardholder_authentication`, `issuer_requested`, `liability_shift`, `processing_costs`, `regulatory_compliance`.
  * `shipping_address` - The shipping address requested by the cardholder. You should try to include as complete address information as possible.
  * `submit` - Set to `always` to skip the fingerprinting step and submit this Authentication immediately or `if_fingerprinting_not_supported` to submit this Authentication only if fingerprinting is not available. This parameter defaults to `never`.

  Refer to the [Submit at creation section of the standalone 3DS guide](https://stripe.com/payments/3d-secure/standalone-3d-secure#submit-at-creation) for more information. Possible values: `always`, `if_fingerprinting_not_supported`, `never`.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :acquirer_details,
    :amount,
    :channel,
    :currency,
    :directory_server,
    :expand,
    :flow_preference,
    :future_usage,
    :message_category,
    :metadata,
    :payment_method,
    :payment_method_data,
    :reason,
    :shipping_address,
    :submit
  ]
end
