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
  * `verifone_p400` - An object containing device type specific settings for Verifone P400 readers.
  * `wifi` - Configurations for connecting to a WiFi network.
  """
  @type t :: %__MODULE__{
          bbpos_wisepad3: bbpos_wisepad3() | nil,
          bbpos_wisepos_e: bbpos_wisepos_e() | nil,
          cellular: map() | nil,
          expand: [String.t()] | nil,
          name: String.t() | nil,
          offline: map() | nil,
          reboot_window: reboot_window() | nil,
          stripe_s700: stripe_s700() | nil,
          stripe_s710: stripe_s710() | nil,
          tipping: map() | nil,
          verifone_p400: verifone_p400() | nil,
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

  @typedoc """
  * `splashscreen` - A File ID representing an image you want to display on the reader.
  """
  @type bbpos_wisepad3 :: %{
          optional(:splashscreen) => map() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `splashscreen` - A File ID representing an image to display on the reader
  """
  @type bbpos_wisepos_e :: %{
          optional(:splashscreen) => map() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `end_hour` - Integer between 0 to 23 that represents the end hour of the reboot time window. The value must be different than the start_hour.
  * `start_hour` - Integer between 0 to 23 that represents the start hour of the reboot time window.
  """
  @type reboot_window :: %{
          optional(:end_hour) => integer() | nil,
          optional(:start_hour) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `splashscreen` - A File ID representing an image you want to display on the reader.
  """
  @type stripe_s700 :: %{
          optional(:splashscreen) => map() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `splashscreen` - A File ID representing an image you want to display on the reader.
  """
  @type stripe_s710 :: %{
          optional(:splashscreen) => map() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `splashscreen` - A File ID representing an image you want to display on the reader.
  """
  @type verifone_p400 :: %{
          optional(:splashscreen) => map() | nil,
          optional(String.t()) => term()
        }
end
