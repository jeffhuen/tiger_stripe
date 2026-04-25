# File generated from our OpenAPI spec
defmodule Stripe.Resources.Terminal.Configuration do
  @moduledoc """
  TerminalConfigurationConfiguration

  A Configurations object represents how features should be configured for terminal readers.
  For information about how to use it, see the [Terminal configurations documentation](https://docs.stripe.com/terminal/fleet/configurations-overview).
  """

  @typedoc """
  * `bbpos_wisepad3` - Expandable.
  * `bbpos_wisepos_e` - Expandable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `is_account_default` - Whether this Configuration is the default for your account Nullable.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `name` - String indicating the name of the Configuration object, set by the user Max length: 5000. Nullable.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `terminal.configuration`.
  * `offline` - Expandable.
  * `reboot_window` - Expandable.
  * `stripe_s700` - Expandable.
  * `tipping` - Expandable.
  * `verifone_p400` - Expandable.
  * `wifi` - Expandable.
  """
  @type t :: %__MODULE__{
          bbpos_wisepad3: bbpos_wisepad3() | nil,
          bbpos_wisepos_e: bbpos_wisepos_e() | nil,
          id: String.t(),
          is_account_default: boolean(),
          livemode: boolean(),
          name: String.t(),
          object: String.t(),
          offline: offline() | nil,
          reboot_window: reboot_window() | nil,
          stripe_s700: stripe_s700() | nil,
          tipping: tipping() | nil,
          verifone_p400: verifone_p400() | nil,
          wifi: wifi() | nil
        }

  defstruct [
    :bbpos_wisepad3,
    :bbpos_wisepos_e,
    :id,
    :is_account_default,
    :livemode,
    :name,
    :object,
    :offline,
    :reboot_window,
    :stripe_s700,
    :tipping,
    :verifone_p400,
    :wifi
  ]

  @object_name "terminal.configuration"
  def object_name, do: @object_name

  def expandable_fields,
    do: [
      "bbpos_wisepad3",
      "bbpos_wisepos_e",
      "offline",
      "reboot_window",
      "stripe_s700",
      "tipping",
      "verifone_p400",
      "wifi"
    ]

  @typedoc """
  * `splashscreen` - A File ID representing an image to display on the reader
  """
  @type bbpos_wisepad3 :: %{
          optional(:splashscreen) => String.t() | Stripe.Resources.File.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `splashscreen` - A File ID representing an image to display on the reader
  """
  @type bbpos_wisepos_e :: %{
          optional(:splashscreen) => String.t() | Stripe.Resources.File.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `enabled` - Determines whether to allow transactions to be collected while reader is offline. Defaults to false. Nullable.
  """
  @type offline :: %{
          optional(:enabled) => boolean() | nil,
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
  * `splashscreen` - A File ID representing an image to display on the reader
  """
  @type stripe_s700 :: %{
          optional(:splashscreen) => String.t() | Stripe.Resources.File.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `aed`
  * `aud`
  * `cad`
  * `chf`
  * `czk`
  * `dkk`
  * `eur`
  * `gbp`
  * `gip`
  * `hkd`
  * `huf`
  * `jpy`
  * `mxn`
  * `myr`
  * `nok`
  * `nzd`
  * `pln`
  * `ron`
  * `sek`
  * `sgd`
  * `usd`
  """
  @type tipping :: %{
          optional(:aed) => tipping_aed() | nil,
          optional(:aud) => tipping_aud() | nil,
          optional(:cad) => tipping_cad() | nil,
          optional(:chf) => tipping_chf() | nil,
          optional(:czk) => tipping_czk() | nil,
          optional(:dkk) => tipping_dkk() | nil,
          optional(:eur) => tipping_eur() | nil,
          optional(:gbp) => tipping_gbp() | nil,
          optional(:gip) => tipping_gip() | nil,
          optional(:hkd) => tipping_hkd() | nil,
          optional(:huf) => tipping_huf() | nil,
          optional(:jpy) => tipping_jpy() | nil,
          optional(:mxn) => tipping_mxn() | nil,
          optional(:myr) => tipping_myr() | nil,
          optional(:nok) => tipping_nok() | nil,
          optional(:nzd) => tipping_nzd() | nil,
          optional(:pln) => tipping_pln() | nil,
          optional(:ron) => tipping_ron() | nil,
          optional(:sek) => tipping_sek() | nil,
          optional(:sgd) => tipping_sgd() | nil,
          optional(:usd) => tipping_usd() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `fixed_amounts` - Fixed amounts displayed when collecting a tip Nullable.
  * `percentages` - Percentages displayed when collecting a tip Nullable.
  * `smart_tip_threshold` - Below this amount, fixed amounts will be displayed; above it, percentages will be displayed
  """
  @type tipping_aed :: %{
          optional(:fixed_amounts) => [integer()] | nil,
          optional(:percentages) => [integer()] | nil,
          optional(:smart_tip_threshold) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `fixed_amounts` - Fixed amounts displayed when collecting a tip Nullable.
  * `percentages` - Percentages displayed when collecting a tip Nullable.
  * `smart_tip_threshold` - Below this amount, fixed amounts will be displayed; above it, percentages will be displayed
  """
  @type tipping_aud :: %{
          optional(:fixed_amounts) => [integer()] | nil,
          optional(:percentages) => [integer()] | nil,
          optional(:smart_tip_threshold) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `fixed_amounts` - Fixed amounts displayed when collecting a tip Nullable.
  * `percentages` - Percentages displayed when collecting a tip Nullable.
  * `smart_tip_threshold` - Below this amount, fixed amounts will be displayed; above it, percentages will be displayed
  """
  @type tipping_cad :: %{
          optional(:fixed_amounts) => [integer()] | nil,
          optional(:percentages) => [integer()] | nil,
          optional(:smart_tip_threshold) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `fixed_amounts` - Fixed amounts displayed when collecting a tip Nullable.
  * `percentages` - Percentages displayed when collecting a tip Nullable.
  * `smart_tip_threshold` - Below this amount, fixed amounts will be displayed; above it, percentages will be displayed
  """
  @type tipping_chf :: %{
          optional(:fixed_amounts) => [integer()] | nil,
          optional(:percentages) => [integer()] | nil,
          optional(:smart_tip_threshold) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `fixed_amounts` - Fixed amounts displayed when collecting a tip Nullable.
  * `percentages` - Percentages displayed when collecting a tip Nullable.
  * `smart_tip_threshold` - Below this amount, fixed amounts will be displayed; above it, percentages will be displayed
  """
  @type tipping_czk :: %{
          optional(:fixed_amounts) => [integer()] | nil,
          optional(:percentages) => [integer()] | nil,
          optional(:smart_tip_threshold) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `fixed_amounts` - Fixed amounts displayed when collecting a tip Nullable.
  * `percentages` - Percentages displayed when collecting a tip Nullable.
  * `smart_tip_threshold` - Below this amount, fixed amounts will be displayed; above it, percentages will be displayed
  """
  @type tipping_dkk :: %{
          optional(:fixed_amounts) => [integer()] | nil,
          optional(:percentages) => [integer()] | nil,
          optional(:smart_tip_threshold) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `fixed_amounts` - Fixed amounts displayed when collecting a tip Nullable.
  * `percentages` - Percentages displayed when collecting a tip Nullable.
  * `smart_tip_threshold` - Below this amount, fixed amounts will be displayed; above it, percentages will be displayed
  """
  @type tipping_eur :: %{
          optional(:fixed_amounts) => [integer()] | nil,
          optional(:percentages) => [integer()] | nil,
          optional(:smart_tip_threshold) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `fixed_amounts` - Fixed amounts displayed when collecting a tip Nullable.
  * `percentages` - Percentages displayed when collecting a tip Nullable.
  * `smart_tip_threshold` - Below this amount, fixed amounts will be displayed; above it, percentages will be displayed
  """
  @type tipping_gbp :: %{
          optional(:fixed_amounts) => [integer()] | nil,
          optional(:percentages) => [integer()] | nil,
          optional(:smart_tip_threshold) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `fixed_amounts` - Fixed amounts displayed when collecting a tip Nullable.
  * `percentages` - Percentages displayed when collecting a tip Nullable.
  * `smart_tip_threshold` - Below this amount, fixed amounts will be displayed; above it, percentages will be displayed
  """
  @type tipping_gip :: %{
          optional(:fixed_amounts) => [integer()] | nil,
          optional(:percentages) => [integer()] | nil,
          optional(:smart_tip_threshold) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `fixed_amounts` - Fixed amounts displayed when collecting a tip Nullable.
  * `percentages` - Percentages displayed when collecting a tip Nullable.
  * `smart_tip_threshold` - Below this amount, fixed amounts will be displayed; above it, percentages will be displayed
  """
  @type tipping_hkd :: %{
          optional(:fixed_amounts) => [integer()] | nil,
          optional(:percentages) => [integer()] | nil,
          optional(:smart_tip_threshold) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `fixed_amounts` - Fixed amounts displayed when collecting a tip Nullable.
  * `percentages` - Percentages displayed when collecting a tip Nullable.
  * `smart_tip_threshold` - Below this amount, fixed amounts will be displayed; above it, percentages will be displayed
  """
  @type tipping_huf :: %{
          optional(:fixed_amounts) => [integer()] | nil,
          optional(:percentages) => [integer()] | nil,
          optional(:smart_tip_threshold) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `fixed_amounts` - Fixed amounts displayed when collecting a tip Nullable.
  * `percentages` - Percentages displayed when collecting a tip Nullable.
  * `smart_tip_threshold` - Below this amount, fixed amounts will be displayed; above it, percentages will be displayed
  """
  @type tipping_jpy :: %{
          optional(:fixed_amounts) => [integer()] | nil,
          optional(:percentages) => [integer()] | nil,
          optional(:smart_tip_threshold) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `fixed_amounts` - Fixed amounts displayed when collecting a tip Nullable.
  * `percentages` - Percentages displayed when collecting a tip Nullable.
  * `smart_tip_threshold` - Below this amount, fixed amounts will be displayed; above it, percentages will be displayed
  """
  @type tipping_mxn :: %{
          optional(:fixed_amounts) => [integer()] | nil,
          optional(:percentages) => [integer()] | nil,
          optional(:smart_tip_threshold) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `fixed_amounts` - Fixed amounts displayed when collecting a tip Nullable.
  * `percentages` - Percentages displayed when collecting a tip Nullable.
  * `smart_tip_threshold` - Below this amount, fixed amounts will be displayed; above it, percentages will be displayed
  """
  @type tipping_myr :: %{
          optional(:fixed_amounts) => [integer()] | nil,
          optional(:percentages) => [integer()] | nil,
          optional(:smart_tip_threshold) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `fixed_amounts` - Fixed amounts displayed when collecting a tip Nullable.
  * `percentages` - Percentages displayed when collecting a tip Nullable.
  * `smart_tip_threshold` - Below this amount, fixed amounts will be displayed; above it, percentages will be displayed
  """
  @type tipping_nok :: %{
          optional(:fixed_amounts) => [integer()] | nil,
          optional(:percentages) => [integer()] | nil,
          optional(:smart_tip_threshold) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `fixed_amounts` - Fixed amounts displayed when collecting a tip Nullable.
  * `percentages` - Percentages displayed when collecting a tip Nullable.
  * `smart_tip_threshold` - Below this amount, fixed amounts will be displayed; above it, percentages will be displayed
  """
  @type tipping_nzd :: %{
          optional(:fixed_amounts) => [integer()] | nil,
          optional(:percentages) => [integer()] | nil,
          optional(:smart_tip_threshold) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `fixed_amounts` - Fixed amounts displayed when collecting a tip Nullable.
  * `percentages` - Percentages displayed when collecting a tip Nullable.
  * `smart_tip_threshold` - Below this amount, fixed amounts will be displayed; above it, percentages will be displayed
  """
  @type tipping_pln :: %{
          optional(:fixed_amounts) => [integer()] | nil,
          optional(:percentages) => [integer()] | nil,
          optional(:smart_tip_threshold) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `fixed_amounts` - Fixed amounts displayed when collecting a tip Nullable.
  * `percentages` - Percentages displayed when collecting a tip Nullable.
  * `smart_tip_threshold` - Below this amount, fixed amounts will be displayed; above it, percentages will be displayed
  """
  @type tipping_ron :: %{
          optional(:fixed_amounts) => [integer()] | nil,
          optional(:percentages) => [integer()] | nil,
          optional(:smart_tip_threshold) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `fixed_amounts` - Fixed amounts displayed when collecting a tip Nullable.
  * `percentages` - Percentages displayed when collecting a tip Nullable.
  * `smart_tip_threshold` - Below this amount, fixed amounts will be displayed; above it, percentages will be displayed
  """
  @type tipping_sek :: %{
          optional(:fixed_amounts) => [integer()] | nil,
          optional(:percentages) => [integer()] | nil,
          optional(:smart_tip_threshold) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `fixed_amounts` - Fixed amounts displayed when collecting a tip Nullable.
  * `percentages` - Percentages displayed when collecting a tip Nullable.
  * `smart_tip_threshold` - Below this amount, fixed amounts will be displayed; above it, percentages will be displayed
  """
  @type tipping_sgd :: %{
          optional(:fixed_amounts) => [integer()] | nil,
          optional(:percentages) => [integer()] | nil,
          optional(:smart_tip_threshold) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `fixed_amounts` - Fixed amounts displayed when collecting a tip Nullable.
  * `percentages` - Percentages displayed when collecting a tip Nullable.
  * `smart_tip_threshold` - Below this amount, fixed amounts will be displayed; above it, percentages will be displayed
  """
  @type tipping_usd :: %{
          optional(:fixed_amounts) => [integer()] | nil,
          optional(:percentages) => [integer()] | nil,
          optional(:smart_tip_threshold) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `splashscreen` - A File ID representing an image to display on the reader
  """
  @type verifone_p400 :: %{
          optional(:splashscreen) => String.t() | Stripe.Resources.File.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `enterprise_eap_peap`
  * `enterprise_eap_tls`
  * `personal_psk`
  * `type` - Security type of the WiFi network. The hash with the corresponding name contains the credentials for this security type. Possible values: `enterprise_eap_peap`, `enterprise_eap_tls`, `personal_psk`.
  """
  @type wifi :: %{
          optional(:enterprise_eap_peap) => wifi_enterprise_eap_peap() | nil,
          optional(:enterprise_eap_tls) => wifi_enterprise_eap_tls() | nil,
          optional(:personal_psk) => wifi_personal_psk() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `ca_certificate_file` - A File ID representing a PEM file containing the server certificate Max length: 5000.
  * `password` - Password for connecting to the WiFi network Max length: 5000.
  * `ssid` - Name of the WiFi network Max length: 5000.
  * `username` - Username for connecting to the WiFi network Max length: 5000.
  """
  @type wifi_enterprise_eap_peap :: %{
          optional(:ca_certificate_file) => String.t() | nil,
          optional(:password) => String.t() | nil,
          optional(:ssid) => String.t() | nil,
          optional(:username) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `ca_certificate_file` - A File ID representing a PEM file containing the server certificate Max length: 5000.
  * `client_certificate_file` - A File ID representing a PEM file containing the client certificate Max length: 5000.
  * `private_key_file` - A File ID representing a PEM file containing the client RSA private key Max length: 5000.
  * `private_key_file_password` - Password for the private key file Max length: 5000.
  * `ssid` - Name of the WiFi network Max length: 5000.
  """
  @type wifi_enterprise_eap_tls :: %{
          optional(:ca_certificate_file) => String.t() | nil,
          optional(:client_certificate_file) => String.t() | nil,
          optional(:private_key_file) => String.t() | nil,
          optional(:private_key_file_password) => String.t() | nil,
          optional(:ssid) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `password` - Password for connecting to the WiFi network Max length: 5000.
  * `ssid` - Name of the WiFi network Max length: 5000.
  """
  @type wifi_personal_psk :: %{
          optional(:password) => String.t() | nil,
          optional(:ssid) => String.t() | nil,
          optional(String.t()) => term()
        }

  def __nested_fields__ do
    %{
      "bbpos_wisepad3" => %{
        fields: %{
          "splashscreen" => {:resource, Stripe.Resources.File}
        }
      },
      "bbpos_wisepos_e" => %{
        fields: %{
          "splashscreen" => {:resource, Stripe.Resources.File}
        }
      },
      "offline" => %{
        fields: %{
          "enabled" => :scalar
        }
      },
      "reboot_window" => %{
        fields: %{
          "end_hour" => :scalar,
          "start_hour" => :scalar
        }
      },
      "stripe_s700" => %{
        fields: %{
          "splashscreen" => {:resource, Stripe.Resources.File}
        }
      },
      "tipping" => %{
        fields: %{
          "aed" => %{
            fields: %{
              "fixed_amounts" => {:list, :scalar},
              "percentages" => {:list, :scalar},
              "smart_tip_threshold" => :scalar
            }
          },
          "aud" => %{
            fields: %{
              "fixed_amounts" => {:list, :scalar},
              "percentages" => {:list, :scalar},
              "smart_tip_threshold" => :scalar
            }
          },
          "cad" => %{
            fields: %{
              "fixed_amounts" => {:list, :scalar},
              "percentages" => {:list, :scalar},
              "smart_tip_threshold" => :scalar
            }
          },
          "chf" => %{
            fields: %{
              "fixed_amounts" => {:list, :scalar},
              "percentages" => {:list, :scalar},
              "smart_tip_threshold" => :scalar
            }
          },
          "czk" => %{
            fields: %{
              "fixed_amounts" => {:list, :scalar},
              "percentages" => {:list, :scalar},
              "smart_tip_threshold" => :scalar
            }
          },
          "dkk" => %{
            fields: %{
              "fixed_amounts" => {:list, :scalar},
              "percentages" => {:list, :scalar},
              "smart_tip_threshold" => :scalar
            }
          },
          "eur" => %{
            fields: %{
              "fixed_amounts" => {:list, :scalar},
              "percentages" => {:list, :scalar},
              "smart_tip_threshold" => :scalar
            }
          },
          "gbp" => %{
            fields: %{
              "fixed_amounts" => {:list, :scalar},
              "percentages" => {:list, :scalar},
              "smart_tip_threshold" => :scalar
            }
          },
          "gip" => %{
            fields: %{
              "fixed_amounts" => {:list, :scalar},
              "percentages" => {:list, :scalar},
              "smart_tip_threshold" => :scalar
            }
          },
          "hkd" => %{
            fields: %{
              "fixed_amounts" => {:list, :scalar},
              "percentages" => {:list, :scalar},
              "smart_tip_threshold" => :scalar
            }
          },
          "huf" => %{
            fields: %{
              "fixed_amounts" => {:list, :scalar},
              "percentages" => {:list, :scalar},
              "smart_tip_threshold" => :scalar
            }
          },
          "jpy" => %{
            fields: %{
              "fixed_amounts" => {:list, :scalar},
              "percentages" => {:list, :scalar},
              "smart_tip_threshold" => :scalar
            }
          },
          "mxn" => %{
            fields: %{
              "fixed_amounts" => {:list, :scalar},
              "percentages" => {:list, :scalar},
              "smart_tip_threshold" => :scalar
            }
          },
          "myr" => %{
            fields: %{
              "fixed_amounts" => {:list, :scalar},
              "percentages" => {:list, :scalar},
              "smart_tip_threshold" => :scalar
            }
          },
          "nok" => %{
            fields: %{
              "fixed_amounts" => {:list, :scalar},
              "percentages" => {:list, :scalar},
              "smart_tip_threshold" => :scalar
            }
          },
          "nzd" => %{
            fields: %{
              "fixed_amounts" => {:list, :scalar},
              "percentages" => {:list, :scalar},
              "smart_tip_threshold" => :scalar
            }
          },
          "pln" => %{
            fields: %{
              "fixed_amounts" => {:list, :scalar},
              "percentages" => {:list, :scalar},
              "smart_tip_threshold" => :scalar
            }
          },
          "ron" => %{
            fields: %{
              "fixed_amounts" => {:list, :scalar},
              "percentages" => {:list, :scalar},
              "smart_tip_threshold" => :scalar
            }
          },
          "sek" => %{
            fields: %{
              "fixed_amounts" => {:list, :scalar},
              "percentages" => {:list, :scalar},
              "smart_tip_threshold" => :scalar
            }
          },
          "sgd" => %{
            fields: %{
              "fixed_amounts" => {:list, :scalar},
              "percentages" => {:list, :scalar},
              "smart_tip_threshold" => :scalar
            }
          },
          "usd" => %{
            fields: %{
              "fixed_amounts" => {:list, :scalar},
              "percentages" => {:list, :scalar},
              "smart_tip_threshold" => :scalar
            }
          }
        }
      },
      "verifone_p400" => %{
        fields: %{
          "splashscreen" => {:resource, Stripe.Resources.File}
        }
      },
      "wifi" => %{
        fields: %{
          "enterprise_eap_peap" => %{
            fields: %{
              "ca_certificate_file" => :scalar,
              "password" => :scalar,
              "ssid" => :scalar,
              "username" => :scalar
            }
          },
          "enterprise_eap_tls" => %{
            fields: %{
              "ca_certificate_file" => :scalar,
              "client_certificate_file" => :scalar,
              "private_key_file" => :scalar,
              "private_key_file_password" => :scalar,
              "ssid" => :scalar
            }
          },
          "personal_psk" => %{
            fields: %{
              "password" => :scalar,
              "ssid" => :scalar
            }
          },
          "type" => :scalar
        }
      }
    }
  end
end
