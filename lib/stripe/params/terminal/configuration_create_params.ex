# File generated from our OpenAPI spec
defmodule Stripe.Params.Terminal.ConfigurationCreateParams do
  @moduledoc "Parameters for configuration create."

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
  * `verifone_m425` - An object containing device type specific settings for Verifone M425 readers.
  * `verifone_p400` - An object containing device type specific settings for Verifone P400 readers.
  * `verifone_p630` - An object containing device type specific settings for Verifone P630 readers.
  * `verifone_ux700` - An object containing device type specific settings for Verifone UX700 readers.
  * `verifone_v660p` - An object containing device type specific settings for Verifone V660p readers.
  * `wifi` - Configurations for connecting to a WiFi network.
  """
  @type t :: %__MODULE__{}

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
    :verifone_m425,
    :verifone_p400,
    :verifone_p630,
    :verifone_ux700,
    :verifone_v660p,
    :wifi
  ]
end
