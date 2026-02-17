# File generated from our OpenAPI spec
defmodule Stripe.Params.TestHelpers.Treasury.OutboundPaymentUpdateParams do
  @moduledoc "Parameters for outbound payment update."

  @typedoc """
  * `expand` - Specifies which fields in the response should be expanded.
  * `tracking_details` - Details about network-specific tracking information.
  """
  @type t :: %__MODULE__{
          expand: [String.t()] | nil,
          tracking_details: __MODULE__.TrackingDetails.t()
        }

  defstruct [:expand, :tracking_details]

  defmodule TrackingDetails do
    @moduledoc "Nested parameters."

    @typedoc """
    * `ach` - ACH network tracking details.
    * `type` - The US bank account network used to send funds. Possible values: `ach`, `us_domestic_wire`.
    * `us_domestic_wire` - US domestic wire network tracking details.
    """
    @type t :: %__MODULE__{
            ach: __MODULE__.Ach.t() | nil,
            type: String.t() | nil,
            us_domestic_wire: __MODULE__.UsDomesticWire.t() | nil
          }
    defstruct [:ach, :type, :us_domestic_wire]

    defmodule Ach do
      @moduledoc "Nested parameters."

      @typedoc """
      * `trace_id` - ACH trace ID for funds sent over the `ach` network. Max length: 5000.
      """
      @type t :: %__MODULE__{
              trace_id: String.t() | nil
            }
      defstruct [:trace_id]
    end

    defmodule UsDomesticWire do
      @moduledoc "Nested parameters."

      @typedoc """
      * `chips` - CHIPS System Sequence Number (SSN) for funds sent over the `us_domestic_wire` network. Max length: 5000.
      * `imad` - IMAD for funds sent over the `us_domestic_wire` network. Max length: 5000.
      * `omad` - OMAD for funds sent over the `us_domestic_wire` network. Max length: 5000.
      """
      @type t :: %__MODULE__{
              chips: String.t() | nil,
              imad: String.t() | nil,
              omad: String.t() | nil
            }
      defstruct [:chips, :imad, :omad]
    end
  end
end
