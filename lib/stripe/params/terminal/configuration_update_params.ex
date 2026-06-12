# File generated from our OpenAPI spec
defmodule Stripe.Params.Terminal.ConfigurationUpdateParams do
  @moduledoc "Parameters for configuration update."

  @typedoc """
  * `bbpos_wisepad3` - An object containing device type specific settings for BBPOS WisePad 3 readers.
  * `bbpos_wisepos_e` - An object containing device type specific settings for BBPOS WisePOS E readers.
  * `cellular` - Configuration for cellular connectivity.
  * `expand` - Specifies which fields in the response should be expanded.
  * `name` - Name of the configuration Max length: 100.
  * `offline` - Configurations for collecting transactions offline.
  * `reboot_window` - Reboot time settings for readers. that support customized reboot time configuration.
  * `stripe_s700` - An object containing device type specific settings for Stripe S700 readers.
  * `stripe_s710` - An object containing device type specific settings for Stripe S710 readers.
  * `tipping` - Tipping configurations for readers that support on-reader tips.
  * `verifone_p400` - An object containing device type specific settings for Verifone P400 readers.
  * `wifi` - Configurations for connecting to a WiFi network.
  """
  @type t :: %__MODULE__{
          bbpos_wisepad3: map() | nil,
          bbpos_wisepos_e: map() | nil,
          cellular: map() | nil,
          expand: [String.t()] | nil,
          name: String.t() | nil,
          offline: map() | nil,
          reboot_window: map() | nil,
          stripe_s700: map() | nil,
          stripe_s710: map() | nil,
          tipping: map() | nil,
          verifone_p400: map() | nil,
          wifi: map() | nil
        }

  defstruct [
    :bbpos_wisepad3,
    :bbpos_wisepos_e,
    :cellular,
    :expand,
    :name,
    :offline,
    :reboot_window,
    :stripe_s700,
    :stripe_s710,
    :tipping,
    :verifone_p400,
    :wifi
  ]
end
