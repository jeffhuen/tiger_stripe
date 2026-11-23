# File generated from our OpenAPI spec
defmodule Stripe.Resources.V2.Core.ClaimableSandbox do
  @moduledoc """
  Claimable Sandbox

  A claimable sandbox is a Stripe sandbox that a user can claim into a new or existing Stripe account
  through an onboarding link. You can prefill it with an email address, sandbox name, and country.
  Claimable sandboxes have 60 days to be claimed. After this expiration time has passed,
  if the sandbox is not claimed, it will be deleted.
  """

  @typedoc """
  * `channel` - The distribution channel used to pre-install your Stripe App on the claimable sandbox.
  Use `testing` to install your app's external test version or `public` to install its published version. Possible values: `public`, `testing`.
  * `claimed_at` - Time at which the sandbox was claimed. Set when the status is `claimed` or `live`.
  Represented as an RFC 3339 timestamp in UTC with millisecond precision,
  for example `2022-09-18T13:22:18.123Z`. Format: date-time.
  * `created` - Time at which the sandbox was created. Represented as an RFC 3339 timestamp in UTC
  with millisecond precision, for example `2022-09-18T13:22:18.123Z`. Format: date-time.
  * `expires_at` - Time at which the unclaimed sandbox expires. Null when the status is `claimed` or `live`.
  Represented as an RFC 3339 timestamp in UTC with millisecond precision,
  for example `2022-09-18T13:22:18.123Z`. Format: date-time.
  * `id` - Unique identifier for the claimable sandbox.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `object` - String representing the object's type. Objects of the same type share the same value of the object field. Possible values: `v2.core.claimable_sandbox`.
  * `onboarding_link_details` - Details about the onboarding link.
  Null when the sandbox status is `live` or `expired`.
  * `owner_details` - Details about the live mode owner account of the sandbox.
  This will be null until the sandbox is claimed.
  * `prefill` - Values prefilled during the creation of the sandbox. When a user claims the sandbox, they will be able to update these values.
  * `sandbox_details` - Data about the Stripe sandbox object.
  * `status` - Status of the sandbox. Possible values: `claimed`, `expired`, `live`, `unclaimed`.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :channel,
    :claimed_at,
    :created,
    :expires_at,
    :id,
    :livemode,
    :object,
    :onboarding_link_details,
    :owner_details,
    :prefill,
    :sandbox_details,
    :status
  ]

  @object_name "v2.core.claimable_sandbox"
  def object_name, do: @object_name

  def __nested_fields__ do
    %{
      "onboarding_link_details" => %{
        fields: %{
          "expires_at" => :scalar,
          "refresh_url" => :scalar,
          "return_url" => :scalar,
          "url" => :scalar
        }
      },
      "owner_details" => %{
        fields: %{
          "account" => :scalar,
          "app_install_status" => :scalar
        }
      },
      "prefill" => %{
        fields: %{
          "country" => :scalar,
          "email" => :scalar,
          "name" => :scalar
        }
      },
      "sandbox_details" => %{
        fields: %{
          "account" => :scalar,
          "api_keys" => %{
            fields: %{
              "mcp" => %{
                fields: %{
                  "created" => :scalar,
                  "expires_at" => :scalar,
                  "id" => :scalar,
                  "secret_key" => %{
                    fields: %{
                      "token" => :scalar
                    }
                  },
                  "status" => :scalar,
                  "type" => :scalar
                }
              },
              "publishable" => %{
                fields: %{
                  "created" => :scalar,
                  "expires_at" => :scalar,
                  "id" => :scalar,
                  "publishable_key" => %{
                    fields: %{
                      "token" => :scalar
                    }
                  },
                  "status" => :scalar,
                  "type" => :scalar
                }
              },
              "secret" => %{
                fields: %{
                  "created" => :scalar,
                  "expires_at" => :scalar,
                  "id" => :scalar,
                  "secret_key" => %{
                    fields: %{
                      "token" => :scalar
                    }
                  },
                  "status" => :scalar,
                  "type" => :scalar
                }
              }
            }
          }
        }
      }
    }
  end
end
