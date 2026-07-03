# File generated from our OpenAPI spec
defmodule Stripe.Resources.Token do
  @moduledoc """
  Token

  Tokenization is the process Stripe uses to collect sensitive card or bank
  account details, or personally identifiable information (PII), directly from
  your customers in a secure manner. A token representing this information is
  returned to your server to use. Use our
  [recommended payments integrations](https://docs.stripe.com/payments) to perform this process
  on the client-side. This guarantees that no sensitive card data touches your server,
  and allows your integration to operate in a PCI-compliant way.

  If you can't use client-side tokenization, you can also create tokens using
  the API with either your publishable or secret API key. If
  your integration uses this method, you're responsible for any PCI compliance
  that it might require, and you must keep your secret API key safe. Unlike with
  client-side tokenization, your customer's information isn't sent directly to
  Stripe, so we can't determine how it's handled or stored.

  You can't store or use tokens more than once. To store card or bank account
  information for later use, create [Customer](https://docs.stripe.com/api#customers)
  objects or [External accounts](https://stripe.com/api#external_accounts).
  [Radar](https://docs.stripe.com/radar), our integrated solution for automatic fraud protection,
  performs best with integrations that use client-side tokenization.
  """

  @typedoc """
  * `bank_account` - Expandable.
  * `card` - Expandable.
  * `client_ip` - IP address of the client that generates the token. Max length: 5000. Nullable.
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `token`.
  * `type` - Type of the token: `account`, `bank_account`, `card`, or `pii`. Max length: 5000.
  * `used` - Determines if you have already used this token (you can only use tokens once).
  """
  @type t :: %__MODULE__{}

  defstruct [:bank_account, :card, :client_ip, :created, :id, :livemode, :object, :type, :used]

  @object_name "token"
  def object_name, do: @object_name

  def expandable_fields, do: ["bank_account", "card"]

  def __nested_fields__ do
    %{
      "bank_account" => {:resource, Stripe.Resources.BankAccount},
      "card" => {:resource, Stripe.Resources.Card}
    }
  end
end
