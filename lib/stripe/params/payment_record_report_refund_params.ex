# File generated from our OpenAPI spec
defmodule Stripe.Params.PaymentRecordReportRefundParams do
  @moduledoc "Parameters for payment record report refund."

  @typedoc """
  * `amount` - A positive integer in the [smallest currency unit](https://docs.stripe.com/currencies#zero-decimal) representing how much of this payment to refund. Can refund only up to the remaining, unrefunded amount of the payment.
  * `expand` - Specifies which fields in the response should be expanded.
  * `initiated_at` - When the reported refund was initiated. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `outcome` - The outcome of the reported refund. Possible values: `refunded`.
  * `processor_details` - Processor information for this refund.
  * `refunded` - Information about the payment attempt refund.
  """
  @type t :: %__MODULE__{
          amount: __MODULE__.Amount.t() | nil,
          expand: [String.t()] | nil,
          initiated_at: integer() | nil,
          metadata: map() | nil,
          outcome: String.t(),
          processor_details: __MODULE__.ProcessorDetails.t(),
          refunded: __MODULE__.Refunded.t()
        }

  defstruct [:amount, :expand, :initiated_at, :metadata, :outcome, :processor_details, :refunded]

  defmodule Amount do
    @moduledoc "Nested parameters."

    @typedoc """
    * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
    * `value` - A positive integer representing the amount in the currency's [minor unit](https://docs.stripe.com/currencies#zero-decimal). For example, `100` can represent 1 USD or 100 JPY.
    """
    @type t :: %__MODULE__{
            currency: String.t() | nil,
            value: integer() | nil
          }
    defstruct [:currency, :value]
  end

  defmodule ProcessorDetails do
    @moduledoc "Nested parameters."

    @typedoc """
    * `custom` - Information about the custom processor used to make this refund.
    * `type` - The type of the processor details. An additional hash is included on processor_details with a name matching this value. It contains additional information specific to the processor. Possible values: `custom`.
    """
    @type t :: %__MODULE__{
            custom: __MODULE__.Custom.t() | nil,
            type: String.t() | nil
          }
    defstruct [:custom, :type]

    defmodule Custom do
      @moduledoc "Nested parameters."

      @typedoc """
      * `refund_reference` - A reference to the external refund. This field must be unique across all refunds. Max length: 5000.
      """
      @type t :: %__MODULE__{
              refund_reference: String.t() | nil
            }
      defstruct [:refund_reference]
    end
  end

  defmodule Refunded do
    @moduledoc "Nested parameters."

    @typedoc """
    * `refunded_at` - When the reported refund completed. Measured in seconds since the Unix epoch. Format: Unix timestamp.
    """
    @type t :: %__MODULE__{
            refunded_at: integer() | nil
          }
    defstruct [:refunded_at]
  end
end
