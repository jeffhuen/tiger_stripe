# File generated from our OpenAPI spec
defmodule Stripe.Params.TestHelpers.Treasury.OutboundTransferUpdateParams do
  @moduledoc "Parameters for outbound transfer update."

  @typedoc """
  * `expand` - Specifies which fields in the response should be expanded.
  * `tracking_details` - Details about network-specific tracking information.
  """
  @type t :: %__MODULE__{
          expand: [String.t()] | nil,
          tracking_details: tracking_details()
        }

  defstruct [:expand, :tracking_details]

  @typedoc """
  * `ach` - ACH network tracking details.
  * `type` - The US bank account network used to send funds. Possible values: `ach`, `us_domestic_wire`.
  * `us_domestic_wire` - US domestic wire network tracking details.
  """
  @type tracking_details :: %{
          optional(:ach) => tracking_details_ach() | nil,
          optional(:type) => String.t() | nil,
          optional(:us_domestic_wire) => tracking_details_us_domestic_wire() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `trace_id` - ACH trace ID for funds sent over the `ach` network. Max length: 5000.
  """
  @type tracking_details_ach :: %{
          optional(:trace_id) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `chips` - CHIPS System Sequence Number (SSN) for funds sent over the `us_domestic_wire` network. Max length: 5000.
  * `imad` - IMAD for funds sent over the `us_domestic_wire` network. Max length: 5000.
  * `omad` - OMAD for funds sent over the `us_domestic_wire` network. Max length: 5000.
  """
  @type tracking_details_us_domestic_wire :: %{
          optional(:chips) => String.t() | nil,
          optional(:imad) => String.t() | nil,
          optional(:omad) => String.t() | nil,
          optional(String.t()) => term()
        }
end
