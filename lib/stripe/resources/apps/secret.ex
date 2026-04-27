# File generated from our OpenAPI spec
defmodule Stripe.Resources.Apps.Secret do
  @moduledoc """
  SecretServiceResourceSecret

  Secret Store is an API that allows Stripe Apps developers to securely persist secrets for use by UI Extensions and app backends.

  The primary resource in Secret Store is a `secret`. Other apps can't view secrets created by an app. Additionally, secrets are scoped to provide further permission control.

  All Dashboard users and the app backend share `account` scoped secrets. Use the `account` scope for secrets that don't change per-user, like a third-party API key.

  A `user` scoped secret is accessible by the app backend and one specific Dashboard user. Use the `user` scope for per-user secrets like per-user OAuth tokens, where different users might have different permissions.

  Related guide: [Store data between page reloads](https://docs.stripe.com/stripe-apps/store-auth-data-custom-objects)
  """

  @typedoc """
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `deleted` - If true, indicates that this secret has been deleted
  * `expires_at` - The Unix timestamp for the expiry time of the secret, after which the secret deletes. Format: Unix timestamp. Nullable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `name` - A name for the secret that's unique within the scope. Max length: 5000.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `apps.secret`.
  * `payload` - The plaintext secret value to be stored. Max length: 5000. Nullable.
  * `scope` - Expandable.
  """
  @type t :: %__MODULE__{
          created: integer(),
          deleted: boolean() | nil,
          expires_at: integer(),
          id: String.t(),
          livemode: boolean(),
          name: String.t(),
          object: String.t(),
          payload: String.t() | nil,
          scope: scope()
        }

  defstruct [:created, :deleted, :expires_at, :id, :livemode, :name, :object, :payload, :scope]

  @object_name "apps.secret"
  def object_name, do: @object_name

  def expandable_fields, do: ["scope"]

  @typedoc """
  * `type` - The secret scope type. Possible values: `account`, `user`.
  * `user` - The user ID, if type is set to "user" Max length: 5000.
  """
  @type scope :: %{
          optional(:type) => String.t() | nil,
          optional(:user) => String.t() | nil,
          optional(String.t()) => term()
        }

  def __nested_fields__ do
    %{
      "scope" => %{
        fields: %{
          "type" => :scalar,
          "user" => :scalar
        }
      }
    }
  end
end
