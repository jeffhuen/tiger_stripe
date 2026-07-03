# File generated from our OpenAPI spec
defmodule Stripe.Resources.Tax.Registration do
  @moduledoc """
  TaxProductRegistrationsResourceTaxRegistration

  A Tax `Registration` lets us know that your business is registered to collect tax on payments within a region, enabling you to [automatically collect tax](https://docs.stripe.com/tax).

  Stripe doesn't register on your behalf with the relevant authorities when you create a Tax `Registration` object. For more information on how to register to collect tax, see [our guide](https://docs.stripe.com/tax/registering).

  Related guide: [Using the Registrations API](https://docs.stripe.com/tax/registrations-api)
  """

  @typedoc """
  * `active_from` - Time at which the registration becomes active. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)). Max length: 5000.
  * `country_options` - Expandable.
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `expires_at` - If set, the registration stops being active at this time. If not set, the registration will be active indefinitely. Measured in seconds since the Unix epoch. Format: Unix timestamp. Nullable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `tax.registration`.
  * `status` - The status of the registration. This field is present for convenience and can be deduced from `active_from` and `expires_at`. Possible values: `active`, `expired`, `scheduled`.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :active_from,
    :country,
    :country_options,
    :created,
    :expires_at,
    :id,
    :livemode,
    :object,
    :status
  ]

  @object_name "tax.registration"
  def object_name, do: @object_name

  def expandable_fields, do: ["country_options"]

  def __nested_fields__ do
    %{
      "country_options" => %{
        fields: %{
          "ae" => %{
            fields: %{
              "standard" => %{
                fields: %{
                  "place_of_supply_scheme" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "al" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "am" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "ao" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "at" => %{
            fields: %{
              "standard" => %{
                fields: %{
                  "place_of_supply_scheme" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "au" => %{
            fields: %{
              "standard" => %{
                fields: %{
                  "place_of_supply_scheme" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "aw" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "az" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "ba" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "bb" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "bd" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "be" => %{
            fields: %{
              "standard" => %{
                fields: %{
                  "place_of_supply_scheme" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "bf" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "bg" => %{
            fields: %{
              "standard" => %{
                fields: %{
                  "place_of_supply_scheme" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "bh" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "bj" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "bs" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "by" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "ca" => %{
            fields: %{
              "province_standard" => %{
                fields: %{
                  "province" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "cd" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "ch" => %{
            fields: %{
              "standard" => %{
                fields: %{
                  "place_of_supply_scheme" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "cl" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "cm" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "co" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "cr" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "cv" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "cy" => %{
            fields: %{
              "standard" => %{
                fields: %{
                  "place_of_supply_scheme" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "cz" => %{
            fields: %{
              "standard" => %{
                fields: %{
                  "place_of_supply_scheme" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "de" => %{
            fields: %{
              "standard" => %{
                fields: %{
                  "place_of_supply_scheme" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "dk" => %{
            fields: %{
              "standard" => %{
                fields: %{
                  "place_of_supply_scheme" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "ec" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "ee" => %{
            fields: %{
              "standard" => %{
                fields: %{
                  "place_of_supply_scheme" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "eg" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "es" => %{
            fields: %{
              "standard" => %{
                fields: %{
                  "place_of_supply_scheme" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "et" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "fi" => %{
            fields: %{
              "standard" => %{
                fields: %{
                  "place_of_supply_scheme" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "fr" => %{
            fields: %{
              "standard" => %{
                fields: %{
                  "place_of_supply_scheme" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "gb" => %{
            fields: %{
              "standard" => %{
                fields: %{
                  "place_of_supply_scheme" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "ge" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "gn" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "gr" => %{
            fields: %{
              "standard" => %{
                fields: %{
                  "place_of_supply_scheme" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "hr" => %{
            fields: %{
              "standard" => %{
                fields: %{
                  "place_of_supply_scheme" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "hu" => %{
            fields: %{
              "standard" => %{
                fields: %{
                  "place_of_supply_scheme" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "id" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "ie" => %{
            fields: %{
              "standard" => %{
                fields: %{
                  "place_of_supply_scheme" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "in" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "is" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "it" => %{
            fields: %{
              "standard" => %{
                fields: %{
                  "place_of_supply_scheme" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "jp" => %{
            fields: %{
              "standard" => %{
                fields: %{
                  "place_of_supply_scheme" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "ke" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "kg" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "kh" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "kr" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "kz" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "la" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "lk" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "lt" => %{
            fields: %{
              "standard" => %{
                fields: %{
                  "place_of_supply_scheme" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "lu" => %{
            fields: %{
              "standard" => %{
                fields: %{
                  "place_of_supply_scheme" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "lv" => %{
            fields: %{
              "standard" => %{
                fields: %{
                  "place_of_supply_scheme" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "ma" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "md" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "me" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "mk" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "mr" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "mt" => %{
            fields: %{
              "standard" => %{
                fields: %{
                  "place_of_supply_scheme" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "mx" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "my" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "ng" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "nl" => %{
            fields: %{
              "standard" => %{
                fields: %{
                  "place_of_supply_scheme" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "no" => %{
            fields: %{
              "standard" => %{
                fields: %{
                  "place_of_supply_scheme" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "np" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "nz" => %{
            fields: %{
              "standard" => %{
                fields: %{
                  "place_of_supply_scheme" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "om" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "pe" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "ph" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "pl" => %{
            fields: %{
              "standard" => %{
                fields: %{
                  "place_of_supply_scheme" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "pt" => %{
            fields: %{
              "standard" => %{
                fields: %{
                  "place_of_supply_scheme" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "ro" => %{
            fields: %{
              "standard" => %{
                fields: %{
                  "place_of_supply_scheme" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "rs" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "ru" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "sa" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "se" => %{
            fields: %{
              "standard" => %{
                fields: %{
                  "place_of_supply_scheme" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "sg" => %{
            fields: %{
              "standard" => %{
                fields: %{
                  "place_of_supply_scheme" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "si" => %{
            fields: %{
              "standard" => %{
                fields: %{
                  "place_of_supply_scheme" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "sk" => %{
            fields: %{
              "standard" => %{
                fields: %{
                  "place_of_supply_scheme" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "sn" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "sr" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "th" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "tj" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "tr" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "tw" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "tz" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "ua" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "ug" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "us" => %{
            fields: %{
              "local_amusement_tax" => %{
                fields: %{
                  "jurisdiction" => :scalar
                }
              },
              "local_lease_tax" => %{
                fields: %{
                  "jurisdiction" => :scalar
                }
              },
              "state" => :scalar,
              "state_sales_tax" => %{
                fields: %{
                  "elections" =>
                    {:list,
                     %{
                       fields: %{
                         "jurisdiction" => :scalar,
                         "type" => :scalar
                       }
                     }}
                }
              },
              "type" => :scalar
            }
          },
          "uy" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "uz" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "vn" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "za" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "zm" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "zw" => %{
            fields: %{
              "type" => :scalar
            }
          }
        }
      }
    }
  end
end
