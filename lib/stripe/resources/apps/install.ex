# File generated from our OpenAPI spec
defmodule Stripe.Resources.Apps.Install do
  @moduledoc """
  App Install

  An app install represents a Stripe App that is installed on an account. It reports the permissions,
  content security policy entries, and endpoints that the installing account has authorized, along with any
  that the app's latest version requests but the account has not authorized yet. Use the Install API to
  install, reauthorize, and uninstall apps, and to check the state of existing installs.
  """

  @typedoc """
  * `account` - The ID of the account that the app install belongs to. Max length: 5000.
  * `app` - The ID of the app installed. Max length: 5000.
  * `approval_required` - Whether the installer must authorize pending permissions, content security policy entries, or endpoints. For private apps, `approval_required` stays `false`; creating or reauthorizing the install through the API installs the newest completed upload and grants its permissions.
  * `auth_code` - The authorization code for an oauth app install. Max length: 5000. Nullable.
  * `channel` - The distribution channel associated with the app install. Possible values: `private_live`, `private_test`, `public`, `review`, `testing`.
  * `content_security_policy_granted` - Expandable.
  * `content_security_policy_pending` - Expandable.
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `created_by` - The ID of the embedding platform that created the install, if applicable. Max length: 5000. Nullable.
  * `endpoints_granted` - The endpoint URLs authorized by the installer.
  * `endpoints_pending` - The endpoint URLs requested by the latest app version that the installer has not authorized.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `apps.install`.
  * `permissions_granted` - The permissions authorized by the installer.
  * `permissions_pending` - The permissions requested by the latest app version that the installer has not authorized.
  * `status` - The status of the app install. Possible values: `install_failed`, `installed`, `installing`, `uninstall_failed`, `uninstalling`.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :account,
    :app,
    :approval_required,
    :auth_code,
    :channel,
    :content_security_policy_granted,
    :content_security_policy_pending,
    :created,
    :created_by,
    :endpoints_granted,
    :endpoints_pending,
    :id,
    :livemode,
    :object,
    :permissions_granted,
    :permissions_pending,
    :status
  ]

  @object_name "apps.install"
  def object_name, do: @object_name

  def expandable_fields,
    do: ["content_security_policy_granted", "content_security_policy_pending"]

  def __nested_fields__ do
    %{
      "content_security_policy_granted" => %{
        fields: %{
          "connect_src" => {:list, :scalar},
          "image_src" => {:list, :scalar}
        }
      },
      "content_security_policy_pending" => %{
        fields: %{
          "connect_src" => {:list, :scalar},
          "image_src" => {:list, :scalar}
        }
      }
    }
  end
end
