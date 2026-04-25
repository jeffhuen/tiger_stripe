# File generated from our OpenAPI spec
defmodule Stripe.Resources.Issuing.Token do
  @moduledoc """
  IssuingNetworkToken

  An issuing token object is created when an issued card is added to a digital wallet. As a [card issuer](https://docs.stripe.com/issuing), you can [view and manage these tokens](https://docs.stripe.com/issuing/controls/token-management) through Stripe.
  """

  @typedoc """
  * `card` - Card associated with this token. Expandable.
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `device_fingerprint` - The hashed ID derived from the device ID from the card network associated with the token. Max length: 5000. Nullable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `last4` - The last four digits of the token. Max length: 5000.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `network` - The token service provider / card network associated with the token. Possible values: `mastercard`, `visa`.
  * `network_data` - Expandable.
  * `network_updated_at` - Time at which the token was last updated by the card network. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `issuing.token`.
  * `status` - The usage state of the token. Possible values: `active`, `deleted`, `requested`, `suspended`.
  * `wallet_provider` - The digital wallet for this token, if one was used. Possible values: `apple_pay`, `google_pay`, `samsung_pay`.
  """
  @type t :: %__MODULE__{
          card: String.t() | Stripe.Resources.Issuing.Card.t(),
          created: integer(),
          device_fingerprint: String.t(),
          id: String.t(),
          last4: String.t() | nil,
          livemode: boolean(),
          network: String.t(),
          network_data: network_data() | nil,
          network_updated_at: integer(),
          object: String.t(),
          status: String.t(),
          wallet_provider: String.t() | nil
        }

  defstruct [
    :card,
    :created,
    :device_fingerprint,
    :id,
    :last4,
    :livemode,
    :network,
    :network_data,
    :network_updated_at,
    :object,
    :status,
    :wallet_provider
  ]

  @object_name "issuing.token"
  def object_name, do: @object_name

  def expandable_fields, do: ["card", "network_data"]

  @typedoc """
  * `device`
  * `mastercard`
  * `type` - The network that the token is associated with. An additional hash is included with a name matching this value, containing tokenization data specific to the card network. Possible values: `mastercard`, `visa`.
  * `visa`
  * `wallet_provider`
  """
  @type network_data :: %{
          optional(:device) => network_data_device() | nil,
          optional(:mastercard) => network_data_mastercard() | nil,
          optional(:type) => String.t() | nil,
          optional(:visa) => network_data_visa() | nil,
          optional(:wallet_provider) => network_data_wallet_provider() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `device_fingerprint` - An obfuscated ID derived from the device ID. Max length: 5000.
  * `ip_address` - The IP address of the device at provisioning time. Max length: 5000.
  * `location` - The geographic latitude/longitude coordinates of the device at provisioning time. The format is [+-]decimal/[+-]decimal. Max length: 5000.
  * `name` - The name of the device used for tokenization. Max length: 5000.
  * `phone_number` - The phone number of the device used for tokenization. Max length: 5000.
  * `type` - The type of device used for tokenization. Possible values: `other`, `phone`, `watch`.
  """
  @type network_data_device :: %{
          optional(:device_fingerprint) => String.t() | nil,
          optional(:ip_address) => String.t() | nil,
          optional(:location) => String.t() | nil,
          optional(:name) => String.t() | nil,
          optional(:phone_number) => String.t() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `card_reference_id` - A unique reference ID from MasterCard to represent the card account number. Max length: 5000.
  * `token_reference_id` - The network-unique identifier for the token. Max length: 5000.
  * `token_requestor_id` - The ID of the entity requesting tokenization, specific to MasterCard. Max length: 5000.
  * `token_requestor_name` - The name of the entity requesting tokenization, if known. This is directly provided from MasterCard. Max length: 5000.
  """
  @type network_data_mastercard :: %{
          optional(:card_reference_id) => String.t() | nil,
          optional(:token_reference_id) => String.t() | nil,
          optional(:token_requestor_id) => String.t() | nil,
          optional(:token_requestor_name) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `card_reference_id` - A unique reference ID from Visa to represent the card account number. Max length: 5000.
  * `token_reference_id` - The network-unique identifier for the token. Max length: 5000.
  * `token_requestor_id` - The ID of the entity requesting tokenization, specific to Visa. Max length: 5000.
  * `token_risk_score` - Degree of risk associated with the token between `01` and `99`, with higher number indicating higher risk. A `00` value indicates the token was not scored by Visa. Max length: 5000.
  """
  @type network_data_visa :: %{
          optional(:card_reference_id) => String.t() | nil,
          optional(:token_reference_id) => String.t() | nil,
          optional(:token_requestor_id) => String.t() | nil,
          optional(:token_risk_score) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `account_id` - The wallet provider-given account ID of the digital wallet the token belongs to. Max length: 5000.
  * `account_trust_score` - An evaluation on the trustworthiness of the wallet account between 1 and 5. A higher score indicates more trustworthy.
  * `card_number_source` - The method used for tokenizing a card. Possible values: `app`, `manual`, `on_file`, `other`.
  * `cardholder_address`
  * `cardholder_name` - The name of the cardholder tokenizing the card. Max length: 5000.
  * `device_trust_score` - An evaluation on the trustworthiness of the device. A higher score indicates more trustworthy.
  * `hashed_account_email_address` - The hashed email address of the cardholder's account with the wallet provider. Max length: 5000.
  * `reason_codes` - The reasons for suggested tokenization given by the card network.
  * `suggested_decision` - The recommendation on responding to the tokenization request. Possible values: `approve`, `decline`, `require_auth`.
  * `suggested_decision_version` - The version of the standard for mapping reason codes followed by the wallet provider. Max length: 5000.
  """
  @type network_data_wallet_provider :: %{
          optional(:account_id) => String.t() | nil,
          optional(:account_trust_score) => integer() | nil,
          optional(:card_number_source) => String.t() | nil,
          optional(:cardholder_address) =>
            network_data_wallet_provider_cardholder_address() | nil,
          optional(:cardholder_name) => String.t() | nil,
          optional(:device_trust_score) => integer() | nil,
          optional(:hashed_account_email_address) => String.t() | nil,
          optional(:reason_codes) => [String.t()] | nil,
          optional(:suggested_decision) => String.t() | nil,
          optional(:suggested_decision_version) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `line1` - The street address of the cardholder tokenizing the card. Max length: 5000.
  * `postal_code` - The postal code of the cardholder tokenizing the card. Max length: 5000.
  """
  @type network_data_wallet_provider_cardholder_address :: %{
          optional(:line1) => String.t() | nil,
          optional(:postal_code) => String.t() | nil,
          optional(String.t()) => term()
        }

  def __nested_fields__ do
    %{
      "network_data" => %{
        fields: %{
          "device" => %{
            fields: %{
              "device_fingerprint" => :scalar,
              "ip_address" => :scalar,
              "location" => :scalar,
              "name" => :scalar,
              "phone_number" => :scalar,
              "type" => :scalar
            }
          },
          "mastercard" => %{
            fields: %{
              "card_reference_id" => :scalar,
              "token_reference_id" => :scalar,
              "token_requestor_id" => :scalar,
              "token_requestor_name" => :scalar
            }
          },
          "type" => :scalar,
          "visa" => %{
            fields: %{
              "card_reference_id" => :scalar,
              "token_reference_id" => :scalar,
              "token_requestor_id" => :scalar,
              "token_risk_score" => :scalar
            }
          },
          "wallet_provider" => %{
            fields: %{
              "account_id" => :scalar,
              "account_trust_score" => :scalar,
              "card_number_source" => :scalar,
              "cardholder_address" => %{
                fields: %{
                  "line1" => :scalar,
                  "postal_code" => :scalar
                }
              },
              "cardholder_name" => :scalar,
              "device_trust_score" => :scalar,
              "hashed_account_email_address" => :scalar,
              "reason_codes" => {:list, :scalar},
              "suggested_decision" => :scalar,
              "suggested_decision_version" => :scalar
            }
          }
        }
      }
    }
  end
end
