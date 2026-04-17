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
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
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
          network_data: __MODULE__.NetworkData.t() | nil,
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

  defmodule NetworkData do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `device`
    * `mastercard`
    * `type` - The network that the token is associated with. An additional hash is included with a name matching this value, containing tokenization data specific to the card network. Possible values: `mastercard`, `visa`.
    * `visa`
    * `wallet_provider`
    """
    @type t :: %__MODULE__{
            device: __MODULE__.Device.t() | nil,
            mastercard: __MODULE__.Mastercard.t() | nil,
            type: String.t() | nil,
            visa: __MODULE__.Visa.t() | nil,
            wallet_provider: __MODULE__.WalletProvider.t() | nil
          }
    defstruct [:device, :mastercard, :type, :visa, :wallet_provider]

    defmodule Device do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `device_fingerprint` - An obfuscated ID derived from the device ID. Max length: 5000.
      * `ip_address` - The IP address of the device at provisioning time. Max length: 5000.
      * `location` - The geographic latitude/longitude coordinates of the device at provisioning time. The format is [+-]decimal/[+-]decimal. Max length: 5000.
      * `name` - The name of the device used for tokenization. Max length: 5000.
      * `phone_number` - The phone number of the device used for tokenization. Max length: 5000.
      * `type` - The type of device used for tokenization. Possible values: `other`, `phone`, `watch`.
      """
      @type t :: %__MODULE__{
              device_fingerprint: String.t() | nil,
              ip_address: String.t() | nil,
              location: String.t() | nil,
              name: String.t() | nil,
              phone_number: String.t() | nil,
              type: String.t() | nil
            }
      defstruct [:device_fingerprint, :ip_address, :location, :name, :phone_number, :type]
    end

    defmodule Mastercard do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `card_reference_id` - A unique reference ID from MasterCard to represent the card account number. Max length: 5000.
      * `token_reference_id` - The network-unique identifier for the token. Max length: 5000.
      * `token_requestor_id` - The ID of the entity requesting tokenization, specific to MasterCard. Max length: 5000.
      * `token_requestor_name` - The name of the entity requesting tokenization, if known. This is directly provided from MasterCard. Max length: 5000.
      """
      @type t :: %__MODULE__{
              card_reference_id: String.t() | nil,
              token_reference_id: String.t() | nil,
              token_requestor_id: String.t() | nil,
              token_requestor_name: String.t() | nil
            }
      defstruct [
        :card_reference_id,
        :token_reference_id,
        :token_requestor_id,
        :token_requestor_name
      ]
    end

    defmodule Visa do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `card_reference_id` - A unique reference ID from Visa to represent the card account number. Max length: 5000. Nullable.
      * `token_reference_id` - The network-unique identifier for the token. Max length: 5000.
      * `token_requestor_id` - The ID of the entity requesting tokenization, specific to Visa. Max length: 5000.
      * `token_risk_score` - Degree of risk associated with the token between `01` and `99`, with higher number indicating higher risk. A `00` value indicates the token was not scored by Visa. Max length: 5000.
      """
      @type t :: %__MODULE__{
              card_reference_id: String.t() | nil,
              token_reference_id: String.t() | nil,
              token_requestor_id: String.t() | nil,
              token_risk_score: String.t() | nil
            }
      defstruct [:card_reference_id, :token_reference_id, :token_requestor_id, :token_risk_score]
    end

    defmodule WalletProvider do
      @moduledoc "Nested struct within the parent resource."

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
      @type t :: %__MODULE__{
              account_id: String.t() | nil,
              account_trust_score: integer() | nil,
              card_number_source: String.t() | nil,
              cardholder_address: __MODULE__.CardholderAddress.t() | nil,
              cardholder_name: String.t() | nil,
              device_trust_score: integer() | nil,
              hashed_account_email_address: String.t() | nil,
              reason_codes: [String.t()] | nil,
              suggested_decision: String.t() | nil,
              suggested_decision_version: String.t() | nil
            }
      defstruct [
        :account_id,
        :account_trust_score,
        :card_number_source,
        :cardholder_address,
        :cardholder_name,
        :device_trust_score,
        :hashed_account_email_address,
        :reason_codes,
        :suggested_decision,
        :suggested_decision_version
      ]

      defmodule CardholderAddress do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `line1` - The street address of the cardholder tokenizing the card. Max length: 5000.
        * `postal_code` - The postal code of the cardholder tokenizing the card. Max length: 5000.
        """
        @type t :: %__MODULE__{
                line1: String.t() | nil,
                postal_code: String.t() | nil
              }
        defstruct [:line1, :postal_code]
      end

      def __inner_types__ do
        %{
          "cardholder_address" => __MODULE__.CardholderAddress
        }
      end
    end

    def __inner_types__ do
      %{
        "device" => __MODULE__.Device,
        "mastercard" => __MODULE__.Mastercard,
        "visa" => __MODULE__.Visa,
        "wallet_provider" => __MODULE__.WalletProvider
      }
    end
  end

  def __inner_types__ do
    %{
      "network_data" => __MODULE__.NetworkData
    }
  end
end
