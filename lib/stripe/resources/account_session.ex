# File generated from our OpenAPI spec
defmodule Stripe.Resources.AccountSession do
  @moduledoc """
  ConnectEmbeddedMethodAccountSessionCreateMethodAccountSession

  An AccountSession allows a Connect platform to grant access to a connected account in Connect embedded components.

  We recommend that you create an AccountSession each time you need to display an embedded component
  to your user. Do not save AccountSessions to your database as they expire relatively
  quickly, and cannot be used more than once.

  Related guide: [Connect embedded components](https://docs.stripe.com/connect/get-started-connect-embedded-components)
  """

  @typedoc """
  * `account` - The ID of the account the AccountSession was created for Max length: 5000.
  * `client_secret` - The client secret of this AccountSession. Used on the client to set up secure access to the given `account`.

  The client secret can be used to provide access to `account` from your frontend. It should not be stored, logged, or exposed to anyone other than the connected account. Make sure that you have TLS enabled on any page that includes the client secret.

  Refer to our docs to [setup Connect embedded components](https://docs.stripe.com/connect/get-started-connect-embedded-components) and learn about how `client_secret` should be handled. Max length: 5000.
  * `components` - Expandable.
  * `expires_at` - The timestamp at which this AccountSession will expire. Format: Unix timestamp.
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `account_session`.
  """
  @type t :: %__MODULE__{
          account: String.t(),
          client_secret: String.t(),
          components: Stripe.Resources.Components.t(),
          expires_at: integer(),
          livemode: boolean(),
          object: String.t()
        }

  defstruct [:account, :client_secret, :components, :expires_at, :livemode, :object]

  @object_name "account_session"
  def object_name, do: @object_name

  def expandable_fields, do: ["components"]

  def __inner_types__ do
    %{
      "components" => Stripe.Resources.Components
    }
  end
end
