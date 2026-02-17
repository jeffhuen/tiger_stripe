# File generated from our OpenAPI spec
defmodule Stripe.Params.PaymentIntentIncrementAuthorizationParams do
  @moduledoc "Parameters for payment intent increment authorization."

  @typedoc """
  * `amount` - The updated total amount that you intend to collect from the cardholder. This amount must be greater than the currently authorized amount.
  * `amount_details` - Provides industry-specific information about the amount.
  * `application_fee_amount` - The amount of the application fee (if any) that will be requested to be applied to the payment and transferred to the application owner's Stripe account. The amount of the application fee collected will be capped at the total amount captured. For more information, see the PaymentIntents [use case for connected accounts](https://docs.stripe.com/payments/connected-accounts).
  * `description` - An arbitrary string attached to the object. Often useful for displaying to users. Max length: 1000.
  * `expand` - Specifies which fields in the response should be expanded.
  * `hooks` - Automations to be run during the PaymentIntent lifecycle
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `payment_details` - Provides industry-specific information about the charge.
  * `statement_descriptor` - Text that appears on the customer's statement as the statement descriptor for a non-card or card charge. This value overrides the account's default statement descriptor. For information about requirements, including the 22-character limit, see [the Statement Descriptor docs](https://docs.stripe.com/get-started/account/statement-descriptors). Max length: 22.
  * `transfer_data` - The parameters used to automatically create a transfer after the payment is captured.
  Learn more about the [use case for connected accounts](https://docs.stripe.com/payments/connected-accounts).
  """
  @type t :: %__MODULE__{
          amount: integer(),
          amount_details: __MODULE__.AmountDetails.t() | nil,
          application_fee_amount: integer() | nil,
          description: String.t() | nil,
          expand: [String.t()] | nil,
          hooks: __MODULE__.Hooks.t() | nil,
          metadata: %{String.t() => String.t()} | nil,
          payment_details: __MODULE__.PaymentDetails.t() | nil,
          statement_descriptor: String.t() | nil,
          transfer_data: __MODULE__.TransferData.t() | nil
        }

  defstruct [
    :amount,
    :amount_details,
    :application_fee_amount,
    :description,
    :expand,
    :hooks,
    :metadata,
    :payment_details,
    :statement_descriptor,
    :transfer_data
  ]

  defmodule AmountDetails do
    @moduledoc "Nested parameters."

    @typedoc """
    * `discount_amount` - The total discount applied on the transaction represented in the [smallest currency unit](https://docs.stripe.com/currencies#zero-decimal). An integer greater than 0.

    This field is mutually exclusive with the `amount_details[line_items][#][discount_amount]` field.
    * `enforce_arithmetic_validation` - Set to `false` to return arithmetic validation errors in the response without failing the request. Use this when you want the operation to proceed regardless of arithmetic errors in the line item data.

    Omit or set to `true` to immediately return a 400 error when arithmetic validation fails. Use this for strict validation that prevents processing with line item data that has arithmetic inconsistencies.

    For card payments, Stripe doesn't send line item data if there's an arithmetic validation error to card networks.
    * `line_items` - A list of line items, each containing information about a product in the PaymentIntent. There is a maximum of 200 line items.
    * `shipping` - Contains information about the shipping portion of the amount.
    * `tax` - Contains information about the tax portion of the amount.
    """
    @type t :: %__MODULE__{
            discount_amount: map() | nil,
            enforce_arithmetic_validation: boolean() | nil,
            line_items: map() | nil,
            shipping: map() | nil,
            tax: map() | nil
          }
    defstruct [:discount_amount, :enforce_arithmetic_validation, :line_items, :shipping, :tax]
  end

  defmodule Hooks do
    @moduledoc "Nested parameters."

    @typedoc """
    * `inputs` - Arguments passed in automations
    """
    @type t :: %__MODULE__{
            inputs: __MODULE__.Inputs.t() | nil
          }
    defstruct [:inputs]

    defmodule Inputs do
      @moduledoc "Nested parameters."

      @typedoc """
      * `tax` - Tax arguments for automations
      """
      @type t :: %__MODULE__{
              tax: __MODULE__.Tax.t() | nil
            }
      defstruct [:tax]

      defmodule Tax do
        @moduledoc "Nested parameters."

        @typedoc """
        * `calculation` - The [TaxCalculation](https://docs.stripe.com/api/tax/calculations) id
        """
        @type t :: %__MODULE__{
                calculation: map() | nil
              }
        defstruct [:calculation]
      end
    end
  end

  defmodule PaymentDetails do
    @moduledoc "Nested parameters."

    @typedoc """
    * `customer_reference` - A unique value to identify the customer. This field is available only for card payments.

    This field is truncated to 25 alphanumeric characters, excluding spaces, before being sent to card networks.
    * `order_reference` - A unique value assigned by the business to identify the transaction. Required for L2 and L3 rates.

    Required when the Payment Method Types array contains `card`, including when [automatic_payment_methods.enabled](https://docs.stripe.com/api/payment_intents/create#create_payment_intent-automatic_payment_methods-enabled) is set to `true`.

    For Cards, this field is truncated to 25 alphanumeric characters, excluding spaces, before being sent to card networks. For Klarna, this field is truncated to 255 characters and is visible to customers when they view the order in the Klarna app.
    """
    @type t :: %__MODULE__{
            customer_reference: map() | nil,
            order_reference: map() | nil
          }
    defstruct [:customer_reference, :order_reference]
  end

  defmodule TransferData do
    @moduledoc "Nested parameters."

    @typedoc """
    * `amount` - The amount that will be transferred automatically when a charge succeeds.
    """
    @type t :: %__MODULE__{
            amount: integer() | nil
          }
    defstruct [:amount]
  end
end
