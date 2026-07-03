# File generated from our OpenAPI spec
defmodule Stripe.Resources.V2.Core.AccountLink do
  @moduledoc """
  Account Link

  Account Links let a platform create a temporary, single-use URL that an account can use to access a Stripe-hosted flow for collecting or updating required information.
  """

  @typedoc """
  * `account` - The ID of the connected account this Account Link applies to.
  * `created` - The timestamp at which this Account Link was created. Format: date-time.
  * `expires_at` - The timestamp at which this Account Link will expire. Format: date-time.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `object` - String representing the object's type. Objects of the same type share the same value of the object field. Possible values: `v2.core.account_link`.
  * `url` - The URL at which the account can access the Stripe-hosted flow.
  * `use_case` - Hash containing usage options.
  """
  @type t :: %__MODULE__{}

  defstruct [:account, :created, :expires_at, :livemode, :object, :url, :use_case]

  @object_name "v2.core.account_link"
  def object_name, do: @object_name

  def __nested_fields__ do
    %{
      "use_case" => %{
        fields: %{
          "account_onboarding" => %{
            fields: %{
              "collection_options" => %{
                fields: %{
                  "fields" => :scalar,
                  "future_requirements" => :scalar
                }
              },
              "configurations" => {:list, :scalar},
              "refresh_url" => :scalar,
              "return_url" => :scalar
            }
          },
          "account_update" => %{
            fields: %{
              "collection_options" => %{
                fields: %{
                  "fields" => :scalar,
                  "future_requirements" => :scalar
                }
              },
              "configurations" => {:list, :scalar},
              "refresh_url" => :scalar,
              "return_url" => :scalar
            }
          },
          "type" => :scalar
        }
      }
    }
  end
end
