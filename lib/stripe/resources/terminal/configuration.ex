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
  @type t :: %__MODULE__{}

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
