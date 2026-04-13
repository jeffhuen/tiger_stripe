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
  * `cellular` - Expandable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `is_account_default` - Whether this Configuration is the default for your account Nullable.
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `name` - String indicating the name of the Configuration object, set by the user Max length: 5000. Nullable.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `terminal.configuration`.
  * `offline` - Expandable.
  * `reboot_window` - Expandable.
  * `stripe_s700` - Expandable.
  * `stripe_s710` - Expandable.
  * `tipping` - Expandable.
  * `verifone_p400` - Expandable.
  * `wifi` - Expandable.
  """
  @type t :: %__MODULE__{
          bbpos_wisepad3: __MODULE__.BbposWisepad3.t() | nil,
          bbpos_wisepos_e: __MODULE__.BbposWiseposE.t() | nil,
          cellular: __MODULE__.Cellular.t() | nil,
          id: String.t(),
          is_account_default: boolean(),
          livemode: boolean(),
          name: String.t(),
          object: String.t(),
          offline: __MODULE__.Offline.t() | nil,
          reboot_window: __MODULE__.RebootWindow.t() | nil,
          stripe_s700: __MODULE__.StripeS700.t() | nil,
          stripe_s710: __MODULE__.StripeS710.t() | nil,
          tipping: __MODULE__.Tipping.t() | nil,
          verifone_p400: __MODULE__.VerifoneP400.t() | nil,
          wifi: __MODULE__.Wifi.t() | nil
        }

  defstruct [
    :bbpos_wisepad3,
    :bbpos_wisepos_e,
    :cellular,
    :id,
    :is_account_default,
    :livemode,
    :name,
    :object,
    :offline,
    :reboot_window,
    :stripe_s700,
    :stripe_s710,
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
      "cellular",
      "offline",
      "reboot_window",
      "stripe_s700",
      "stripe_s710",
      "tipping",
      "verifone_p400",
      "wifi"
    ]

  defmodule BbposWisepad3 do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `splashscreen` - A File ID representing an image to display on the reader
    """
    @type t :: %__MODULE__{
            splashscreen: String.t() | Stripe.Resources.File.t() | nil
          }
    defstruct [:splashscreen]
  end

  defmodule BbposWiseposE do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `splashscreen` - A File ID representing an image to display on the reader
    """
    @type t :: %__MODULE__{
            splashscreen: String.t() | Stripe.Resources.File.t() | nil
          }
    defstruct [:splashscreen]
  end

  defmodule Cellular do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `enabled` - Whether a cellular-capable reader can connect to the internet over cellular.
    """
    @type t :: %__MODULE__{
            enabled: boolean() | nil
          }
    defstruct [:enabled]
  end

  defmodule Offline do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `enabled` - Determines whether to allow transactions to be collected while reader is offline. Defaults to false. Nullable.
    """
    @type t :: %__MODULE__{
            enabled: boolean() | nil
          }
    defstruct [:enabled]
  end

  defmodule RebootWindow do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `end_hour` - Integer between 0 to 23 that represents the end hour of the reboot time window. The value must be different than the start_hour.
    * `start_hour` - Integer between 0 to 23 that represents the start hour of the reboot time window.
    """
    @type t :: %__MODULE__{
            end_hour: integer() | nil,
            start_hour: integer() | nil
          }
    defstruct [:end_hour, :start_hour]
  end

  defmodule StripeS700 do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `splashscreen` - A File ID representing an image to display on the reader
    """
    @type t :: %__MODULE__{
            splashscreen: String.t() | Stripe.Resources.File.t() | nil
          }
    defstruct [:splashscreen]
  end

  defmodule StripeS710 do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `splashscreen` - A File ID representing an image to display on the reader
    """
    @type t :: %__MODULE__{
            splashscreen: String.t() | Stripe.Resources.File.t() | nil
          }
    defstruct [:splashscreen]
  end

  defmodule Tipping do
    @moduledoc "Nested struct within the parent resource."

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
    @type t :: %__MODULE__{
            aed: __MODULE__.Aed.t() | nil,
            aud: __MODULE__.Aud.t() | nil,
            cad: __MODULE__.Cad.t() | nil,
            chf: __MODULE__.Chf.t() | nil,
            czk: __MODULE__.Czk.t() | nil,
            dkk: __MODULE__.Dkk.t() | nil,
            eur: __MODULE__.Eur.t() | nil,
            gbp: __MODULE__.Gbp.t() | nil,
            gip: __MODULE__.Gip.t() | nil,
            hkd: __MODULE__.Hkd.t() | nil,
            huf: __MODULE__.Huf.t() | nil,
            jpy: __MODULE__.Jpy.t() | nil,
            mxn: __MODULE__.Mxn.t() | nil,
            myr: __MODULE__.Myr.t() | nil,
            nok: __MODULE__.Nok.t() | nil,
            nzd: __MODULE__.Nzd.t() | nil,
            pln: __MODULE__.Pln.t() | nil,
            ron: __MODULE__.Ron.t() | nil,
            sek: __MODULE__.Sek.t() | nil,
            sgd: __MODULE__.Sgd.t() | nil,
            usd: __MODULE__.Usd.t() | nil
          }
    defstruct [
      :aed,
      :aud,
      :cad,
      :chf,
      :czk,
      :dkk,
      :eur,
      :gbp,
      :gip,
      :hkd,
      :huf,
      :jpy,
      :mxn,
      :myr,
      :nok,
      :nzd,
      :pln,
      :ron,
      :sek,
      :sgd,
      :usd
    ]

    defmodule Aed do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `fixed_amounts` - Fixed amounts displayed when collecting a tip Nullable.
      * `percentages` - Percentages displayed when collecting a tip Nullable.
      * `smart_tip_threshold` - Below this amount, fixed amounts will be displayed; above it, percentages will be displayed
      """
      @type t :: %__MODULE__{
              fixed_amounts: [integer()] | nil,
              percentages: [integer()] | nil,
              smart_tip_threshold: integer() | nil
            }
      defstruct [:fixed_amounts, :percentages, :smart_tip_threshold]
    end

    defmodule Aud do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `fixed_amounts` - Fixed amounts displayed when collecting a tip Nullable.
      * `percentages` - Percentages displayed when collecting a tip Nullable.
      * `smart_tip_threshold` - Below this amount, fixed amounts will be displayed; above it, percentages will be displayed
      """
      @type t :: %__MODULE__{
              fixed_amounts: [integer()] | nil,
              percentages: [integer()] | nil,
              smart_tip_threshold: integer() | nil
            }
      defstruct [:fixed_amounts, :percentages, :smart_tip_threshold]
    end

    defmodule Cad do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `fixed_amounts` - Fixed amounts displayed when collecting a tip Nullable.
      * `percentages` - Percentages displayed when collecting a tip Nullable.
      * `smart_tip_threshold` - Below this amount, fixed amounts will be displayed; above it, percentages will be displayed
      """
      @type t :: %__MODULE__{
              fixed_amounts: [integer()] | nil,
              percentages: [integer()] | nil,
              smart_tip_threshold: integer() | nil
            }
      defstruct [:fixed_amounts, :percentages, :smart_tip_threshold]
    end

    defmodule Chf do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `fixed_amounts` - Fixed amounts displayed when collecting a tip Nullable.
      * `percentages` - Percentages displayed when collecting a tip Nullable.
      * `smart_tip_threshold` - Below this amount, fixed amounts will be displayed; above it, percentages will be displayed
      """
      @type t :: %__MODULE__{
              fixed_amounts: [integer()] | nil,
              percentages: [integer()] | nil,
              smart_tip_threshold: integer() | nil
            }
      defstruct [:fixed_amounts, :percentages, :smart_tip_threshold]
    end

    defmodule Czk do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `fixed_amounts` - Fixed amounts displayed when collecting a tip Nullable.
      * `percentages` - Percentages displayed when collecting a tip Nullable.
      * `smart_tip_threshold` - Below this amount, fixed amounts will be displayed; above it, percentages will be displayed
      """
      @type t :: %__MODULE__{
              fixed_amounts: [integer()] | nil,
              percentages: [integer()] | nil,
              smart_tip_threshold: integer() | nil
            }
      defstruct [:fixed_amounts, :percentages, :smart_tip_threshold]
    end

    defmodule Dkk do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `fixed_amounts` - Fixed amounts displayed when collecting a tip Nullable.
      * `percentages` - Percentages displayed when collecting a tip Nullable.
      * `smart_tip_threshold` - Below this amount, fixed amounts will be displayed; above it, percentages will be displayed
      """
      @type t :: %__MODULE__{
              fixed_amounts: [integer()] | nil,
              percentages: [integer()] | nil,
              smart_tip_threshold: integer() | nil
            }
      defstruct [:fixed_amounts, :percentages, :smart_tip_threshold]
    end

    defmodule Eur do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `fixed_amounts` - Fixed amounts displayed when collecting a tip Nullable.
      * `percentages` - Percentages displayed when collecting a tip Nullable.
      * `smart_tip_threshold` - Below this amount, fixed amounts will be displayed; above it, percentages will be displayed
      """
      @type t :: %__MODULE__{
              fixed_amounts: [integer()] | nil,
              percentages: [integer()] | nil,
              smart_tip_threshold: integer() | nil
            }
      defstruct [:fixed_amounts, :percentages, :smart_tip_threshold]
    end

    defmodule Gbp do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `fixed_amounts` - Fixed amounts displayed when collecting a tip Nullable.
      * `percentages` - Percentages displayed when collecting a tip Nullable.
      * `smart_tip_threshold` - Below this amount, fixed amounts will be displayed; above it, percentages will be displayed
      """
      @type t :: %__MODULE__{
              fixed_amounts: [integer()] | nil,
              percentages: [integer()] | nil,
              smart_tip_threshold: integer() | nil
            }
      defstruct [:fixed_amounts, :percentages, :smart_tip_threshold]
    end

    defmodule Gip do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `fixed_amounts` - Fixed amounts displayed when collecting a tip Nullable.
      * `percentages` - Percentages displayed when collecting a tip Nullable.
      * `smart_tip_threshold` - Below this amount, fixed amounts will be displayed; above it, percentages will be displayed
      """
      @type t :: %__MODULE__{
              fixed_amounts: [integer()] | nil,
              percentages: [integer()] | nil,
              smart_tip_threshold: integer() | nil
            }
      defstruct [:fixed_amounts, :percentages, :smart_tip_threshold]
    end

    defmodule Hkd do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `fixed_amounts` - Fixed amounts displayed when collecting a tip Nullable.
      * `percentages` - Percentages displayed when collecting a tip Nullable.
      * `smart_tip_threshold` - Below this amount, fixed amounts will be displayed; above it, percentages will be displayed
      """
      @type t :: %__MODULE__{
              fixed_amounts: [integer()] | nil,
              percentages: [integer()] | nil,
              smart_tip_threshold: integer() | nil
            }
      defstruct [:fixed_amounts, :percentages, :smart_tip_threshold]
    end

    defmodule Huf do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `fixed_amounts` - Fixed amounts displayed when collecting a tip Nullable.
      * `percentages` - Percentages displayed when collecting a tip Nullable.
      * `smart_tip_threshold` - Below this amount, fixed amounts will be displayed; above it, percentages will be displayed
      """
      @type t :: %__MODULE__{
              fixed_amounts: [integer()] | nil,
              percentages: [integer()] | nil,
              smart_tip_threshold: integer() | nil
            }
      defstruct [:fixed_amounts, :percentages, :smart_tip_threshold]
    end

    defmodule Jpy do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `fixed_amounts` - Fixed amounts displayed when collecting a tip Nullable.
      * `percentages` - Percentages displayed when collecting a tip Nullable.
      * `smart_tip_threshold` - Below this amount, fixed amounts will be displayed; above it, percentages will be displayed
      """
      @type t :: %__MODULE__{
              fixed_amounts: [integer()] | nil,
              percentages: [integer()] | nil,
              smart_tip_threshold: integer() | nil
            }
      defstruct [:fixed_amounts, :percentages, :smart_tip_threshold]
    end

    defmodule Mxn do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `fixed_amounts` - Fixed amounts displayed when collecting a tip Nullable.
      * `percentages` - Percentages displayed when collecting a tip Nullable.
      * `smart_tip_threshold` - Below this amount, fixed amounts will be displayed; above it, percentages will be displayed
      """
      @type t :: %__MODULE__{
              fixed_amounts: [integer()] | nil,
              percentages: [integer()] | nil,
              smart_tip_threshold: integer() | nil
            }
      defstruct [:fixed_amounts, :percentages, :smart_tip_threshold]
    end

    defmodule Myr do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `fixed_amounts` - Fixed amounts displayed when collecting a tip Nullable.
      * `percentages` - Percentages displayed when collecting a tip Nullable.
      * `smart_tip_threshold` - Below this amount, fixed amounts will be displayed; above it, percentages will be displayed
      """
      @type t :: %__MODULE__{
              fixed_amounts: [integer()] | nil,
              percentages: [integer()] | nil,
              smart_tip_threshold: integer() | nil
            }
      defstruct [:fixed_amounts, :percentages, :smart_tip_threshold]
    end

    defmodule Nok do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `fixed_amounts` - Fixed amounts displayed when collecting a tip Nullable.
      * `percentages` - Percentages displayed when collecting a tip Nullable.
      * `smart_tip_threshold` - Below this amount, fixed amounts will be displayed; above it, percentages will be displayed
      """
      @type t :: %__MODULE__{
              fixed_amounts: [integer()] | nil,
              percentages: [integer()] | nil,
              smart_tip_threshold: integer() | nil
            }
      defstruct [:fixed_amounts, :percentages, :smart_tip_threshold]
    end

    defmodule Nzd do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `fixed_amounts` - Fixed amounts displayed when collecting a tip Nullable.
      * `percentages` - Percentages displayed when collecting a tip Nullable.
      * `smart_tip_threshold` - Below this amount, fixed amounts will be displayed; above it, percentages will be displayed
      """
      @type t :: %__MODULE__{
              fixed_amounts: [integer()] | nil,
              percentages: [integer()] | nil,
              smart_tip_threshold: integer() | nil
            }
      defstruct [:fixed_amounts, :percentages, :smart_tip_threshold]
    end

    defmodule Pln do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `fixed_amounts` - Fixed amounts displayed when collecting a tip Nullable.
      * `percentages` - Percentages displayed when collecting a tip Nullable.
      * `smart_tip_threshold` - Below this amount, fixed amounts will be displayed; above it, percentages will be displayed
      """
      @type t :: %__MODULE__{
              fixed_amounts: [integer()] | nil,
              percentages: [integer()] | nil,
              smart_tip_threshold: integer() | nil
            }
      defstruct [:fixed_amounts, :percentages, :smart_tip_threshold]
    end

    defmodule Ron do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `fixed_amounts` - Fixed amounts displayed when collecting a tip Nullable.
      * `percentages` - Percentages displayed when collecting a tip Nullable.
      * `smart_tip_threshold` - Below this amount, fixed amounts will be displayed; above it, percentages will be displayed
      """
      @type t :: %__MODULE__{
              fixed_amounts: [integer()] | nil,
              percentages: [integer()] | nil,
              smart_tip_threshold: integer() | nil
            }
      defstruct [:fixed_amounts, :percentages, :smart_tip_threshold]
    end

    defmodule Sek do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `fixed_amounts` - Fixed amounts displayed when collecting a tip Nullable.
      * `percentages` - Percentages displayed when collecting a tip Nullable.
      * `smart_tip_threshold` - Below this amount, fixed amounts will be displayed; above it, percentages will be displayed
      """
      @type t :: %__MODULE__{
              fixed_amounts: [integer()] | nil,
              percentages: [integer()] | nil,
              smart_tip_threshold: integer() | nil
            }
      defstruct [:fixed_amounts, :percentages, :smart_tip_threshold]
    end

    defmodule Sgd do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `fixed_amounts` - Fixed amounts displayed when collecting a tip Nullable.
      * `percentages` - Percentages displayed when collecting a tip Nullable.
      * `smart_tip_threshold` - Below this amount, fixed amounts will be displayed; above it, percentages will be displayed
      """
      @type t :: %__MODULE__{
              fixed_amounts: [integer()] | nil,
              percentages: [integer()] | nil,
              smart_tip_threshold: integer() | nil
            }
      defstruct [:fixed_amounts, :percentages, :smart_tip_threshold]
    end

    defmodule Usd do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `fixed_amounts` - Fixed amounts displayed when collecting a tip Nullable.
      * `percentages` - Percentages displayed when collecting a tip Nullable.
      * `smart_tip_threshold` - Below this amount, fixed amounts will be displayed; above it, percentages will be displayed
      """
      @type t :: %__MODULE__{
              fixed_amounts: [integer()] | nil,
              percentages: [integer()] | nil,
              smart_tip_threshold: integer() | nil
            }
      defstruct [:fixed_amounts, :percentages, :smart_tip_threshold]
    end

    def __inner_types__ do
      %{
        "aed" => __MODULE__.Aed,
        "aud" => __MODULE__.Aud,
        "cad" => __MODULE__.Cad,
        "chf" => __MODULE__.Chf,
        "czk" => __MODULE__.Czk,
        "dkk" => __MODULE__.Dkk,
        "eur" => __MODULE__.Eur,
        "gbp" => __MODULE__.Gbp,
        "gip" => __MODULE__.Gip,
        "hkd" => __MODULE__.Hkd,
        "huf" => __MODULE__.Huf,
        "jpy" => __MODULE__.Jpy,
        "mxn" => __MODULE__.Mxn,
        "myr" => __MODULE__.Myr,
        "nok" => __MODULE__.Nok,
        "nzd" => __MODULE__.Nzd,
        "pln" => __MODULE__.Pln,
        "ron" => __MODULE__.Ron,
        "sek" => __MODULE__.Sek,
        "sgd" => __MODULE__.Sgd,
        "usd" => __MODULE__.Usd
      }
    end
  end

  defmodule VerifoneP400 do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `splashscreen` - A File ID representing an image to display on the reader
    """
    @type t :: %__MODULE__{
            splashscreen: String.t() | Stripe.Resources.File.t() | nil
          }
    defstruct [:splashscreen]
  end

  defmodule Wifi do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `enterprise_eap_peap`
    * `enterprise_eap_tls`
    * `personal_psk`
    * `type` - Security type of the WiFi network. The hash with the corresponding name contains the credentials for this security type. Possible values: `enterprise_eap_peap`, `enterprise_eap_tls`, `personal_psk`.
    """
    @type t :: %__MODULE__{
            enterprise_eap_peap: __MODULE__.EnterpriseEapPeap.t() | nil,
            enterprise_eap_tls: __MODULE__.EnterpriseEapTls.t() | nil,
            personal_psk: __MODULE__.PersonalPsk.t() | nil,
            type: String.t() | nil
          }
    defstruct [:enterprise_eap_peap, :enterprise_eap_tls, :personal_psk, :type]

    defmodule EnterpriseEapPeap do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `ca_certificate_file` - A File ID representing a PEM file containing the server certificate Max length: 5000.
      * `password` - Password for connecting to the WiFi network Max length: 5000.
      * `ssid` - Name of the WiFi network Max length: 5000.
      * `username` - Username for connecting to the WiFi network Max length: 5000.
      """
      @type t :: %__MODULE__{
              ca_certificate_file: String.t() | nil,
              password: String.t() | nil,
              ssid: String.t() | nil,
              username: String.t() | nil
            }
      defstruct [:ca_certificate_file, :password, :ssid, :username]
    end

    defmodule EnterpriseEapTls do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `ca_certificate_file` - A File ID representing a PEM file containing the server certificate Max length: 5000.
      * `client_certificate_file` - A File ID representing a PEM file containing the client certificate Max length: 5000.
      * `private_key_file` - A File ID representing a PEM file containing the client RSA private key Max length: 5000.
      * `private_key_file_password` - Password for the private key file Max length: 5000.
      * `ssid` - Name of the WiFi network Max length: 5000.
      """
      @type t :: %__MODULE__{
              ca_certificate_file: String.t() | nil,
              client_certificate_file: String.t() | nil,
              private_key_file: String.t() | nil,
              private_key_file_password: String.t() | nil,
              ssid: String.t() | nil
            }
      defstruct [
        :ca_certificate_file,
        :client_certificate_file,
        :private_key_file,
        :private_key_file_password,
        :ssid
      ]
    end

    defmodule PersonalPsk do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `password` - Password for connecting to the WiFi network Max length: 5000.
      * `ssid` - Name of the WiFi network Max length: 5000.
      """
      @type t :: %__MODULE__{
              password: String.t() | nil,
              ssid: String.t() | nil
            }
      defstruct [:password, :ssid]
    end

    def __inner_types__ do
      %{
        "enterprise_eap_peap" => __MODULE__.EnterpriseEapPeap,
        "enterprise_eap_tls" => __MODULE__.EnterpriseEapTls,
        "personal_psk" => __MODULE__.PersonalPsk
      }
    end
  end

  def __inner_types__ do
    %{
      "bbpos_wisepad3" => __MODULE__.BbposWisepad3,
      "bbpos_wisepos_e" => __MODULE__.BbposWiseposE,
      "cellular" => __MODULE__.Cellular,
      "offline" => __MODULE__.Offline,
      "reboot_window" => __MODULE__.RebootWindow,
      "stripe_s700" => __MODULE__.StripeS700,
      "stripe_s710" => __MODULE__.StripeS710,
      "tipping" => __MODULE__.Tipping,
      "verifone_p400" => __MODULE__.VerifoneP400,
      "wifi" => __MODULE__.Wifi
    }
  end
end
