# File generated from our OpenAPI spec
defmodule Stripe.Params.Treasury.FinancialAccountUpdateParams do
  @moduledoc "Parameters for financial account update."

  @typedoc """
  * `expand` - Specifies which fields in the response should be expanded.
  * `features` - Encodes whether a FinancialAccount has access to a particular feature, with a status enum and associated `status_details`. Stripe or the platform may control features via the requested field.
  * `forwarding_settings` - A different bank account where funds can be deposited/debited in order to get the closing FA's balance to $0
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `nickname` - The nickname for the FinancialAccount.
  * `platform_restrictions` - The set of functionalities that the platform can restrict on the FinancialAccount.
  """
  @type t :: %__MODULE__{
          expand: [String.t()] | nil,
          features: __MODULE__.Features.t() | nil,
          forwarding_settings: __MODULE__.ForwardingSettings.t() | nil,
          metadata: %{String.t() => String.t()} | nil,
          nickname: map() | nil,
          platform_restrictions: __MODULE__.PlatformRestrictions.t() | nil
        }

  defstruct [
    :expand,
    :features,
    :forwarding_settings,
    :metadata,
    :nickname,
    :platform_restrictions
  ]

  defmodule Features do
    @moduledoc "Nested parameters."

    @typedoc """
    * `card_issuing` - Encodes the FinancialAccount's ability to be used with the Issuing product, including attaching cards to and drawing funds from the FinancialAccount.
    * `deposit_insurance` - Represents whether this FinancialAccount is eligible for deposit insurance. Various factors determine the insurance amount.
    * `financial_addresses` - Contains Features that add FinancialAddresses to the FinancialAccount.
    * `inbound_transfers` - Contains settings related to adding funds to a FinancialAccount from another Account with the same owner.
    * `intra_stripe_flows` - Represents the ability for the FinancialAccount to send money to, or receive money from other FinancialAccounts (for example, via OutboundPayment).
    * `outbound_payments` - Includes Features related to initiating money movement out of the FinancialAccount to someone else's bucket of money.
    * `outbound_transfers` - Contains a Feature and settings related to moving money out of the FinancialAccount into another Account with the same owner.
    """
    @type t :: %__MODULE__{
            card_issuing: __MODULE__.CardIssuing.t() | nil,
            deposit_insurance: __MODULE__.DepositInsurance.t() | nil,
            financial_addresses: __MODULE__.FinancialAddresses.t() | nil,
            inbound_transfers: __MODULE__.InboundTransfers.t() | nil,
            intra_stripe_flows: __MODULE__.IntraStripeFlows.t() | nil,
            outbound_payments: __MODULE__.OutboundPayments.t() | nil,
            outbound_transfers: __MODULE__.OutboundTransfers.t() | nil
          }
    defstruct [
      :card_issuing,
      :deposit_insurance,
      :financial_addresses,
      :inbound_transfers,
      :intra_stripe_flows,
      :outbound_payments,
      :outbound_transfers
    ]

    defmodule CardIssuing do
      @moduledoc "Nested parameters."

      @typedoc """
      * `requested` - Whether the FinancialAccount should have the Feature.
      """
      @type t :: %__MODULE__{
              requested: boolean() | nil
            }
      defstruct [:requested]
    end

    defmodule DepositInsurance do
      @moduledoc "Nested parameters."

      @typedoc """
      * `requested` - Whether the FinancialAccount should have the Feature.
      """
      @type t :: %__MODULE__{
              requested: boolean() | nil
            }
      defstruct [:requested]
    end

    defmodule FinancialAddresses do
      @moduledoc "Nested parameters."

      @typedoc """
      * `aba` - Adds an ABA FinancialAddress to the FinancialAccount.
      """
      @type t :: %__MODULE__{
              aba: __MODULE__.Aba.t() | nil
            }
      defstruct [:aba]

      defmodule Aba do
        @moduledoc "Nested parameters."

        @typedoc """
        * `requested` - Whether the FinancialAccount should have the Feature.
        """
        @type t :: %__MODULE__{
                requested: boolean() | nil
              }
        defstruct [:requested]
      end
    end

    defmodule InboundTransfers do
      @moduledoc "Nested parameters."

      @typedoc """
      * `ach` - Enables ACH Debits via the InboundTransfers API.
      """
      @type t :: %__MODULE__{
              ach: __MODULE__.Ach.t() | nil
            }
      defstruct [:ach]

      defmodule Ach do
        @moduledoc "Nested parameters."

        @typedoc """
        * `requested` - Whether the FinancialAccount should have the Feature.
        """
        @type t :: %__MODULE__{
                requested: boolean() | nil
              }
        defstruct [:requested]
      end
    end

    defmodule IntraStripeFlows do
      @moduledoc "Nested parameters."

      @typedoc """
      * `requested` - Whether the FinancialAccount should have the Feature.
      """
      @type t :: %__MODULE__{
              requested: boolean() | nil
            }
      defstruct [:requested]
    end

    defmodule OutboundPayments do
      @moduledoc "Nested parameters."

      @typedoc """
      * `ach` - Enables ACH transfers via the OutboundPayments API.
      * `us_domestic_wire` - Enables US domestic wire transfers via the OutboundPayments API.
      """
      @type t :: %__MODULE__{
              ach: __MODULE__.Ach.t() | nil,
              us_domestic_wire: __MODULE__.UsDomesticWire.t() | nil
            }
      defstruct [:ach, :us_domestic_wire]

      defmodule Ach do
        @moduledoc "Nested parameters."

        @typedoc """
        * `requested` - Whether the FinancialAccount should have the Feature.
        """
        @type t :: %__MODULE__{
                requested: boolean() | nil
              }
        defstruct [:requested]
      end

      defmodule UsDomesticWire do
        @moduledoc "Nested parameters."

        @typedoc """
        * `requested` - Whether the FinancialAccount should have the Feature.
        """
        @type t :: %__MODULE__{
                requested: boolean() | nil
              }
        defstruct [:requested]
      end
    end

    defmodule OutboundTransfers do
      @moduledoc "Nested parameters."

      @typedoc """
      * `ach` - Enables ACH transfers via the OutboundTransfers API.
      * `us_domestic_wire` - Enables US domestic wire transfers via the OutboundTransfers API.
      """
      @type t :: %__MODULE__{
              ach: __MODULE__.Ach.t() | nil,
              us_domestic_wire: __MODULE__.UsDomesticWire.t() | nil
            }
      defstruct [:ach, :us_domestic_wire]

      defmodule Ach do
        @moduledoc "Nested parameters."

        @typedoc """
        * `requested` - Whether the FinancialAccount should have the Feature.
        """
        @type t :: %__MODULE__{
                requested: boolean() | nil
              }
        defstruct [:requested]
      end

      defmodule UsDomesticWire do
        @moduledoc "Nested parameters."

        @typedoc """
        * `requested` - Whether the FinancialAccount should have the Feature.
        """
        @type t :: %__MODULE__{
                requested: boolean() | nil
              }
        defstruct [:requested]
      end
    end
  end

  defmodule ForwardingSettings do
    @moduledoc "Nested parameters."

    @typedoc """
    * `financial_account` - The financial_account id
    * `payment_method` - The payment_method or bank account id. This needs to be a verified bank account. Max length: 5000.
    * `type` - The type of the bank account provided. This can be either "financial_account" or "payment_method" Possible values: `financial_account`, `payment_method`.
    """
    @type t :: %__MODULE__{
            financial_account: String.t() | nil,
            payment_method: String.t() | nil,
            type: String.t() | nil
          }
    defstruct [:financial_account, :payment_method, :type]
  end

  defmodule PlatformRestrictions do
    @moduledoc "Nested parameters."

    @typedoc """
    * `inbound_flows` - Restricts all inbound money movement. Possible values: `restricted`, `unrestricted`.
    * `outbound_flows` - Restricts all outbound money movement. Possible values: `restricted`, `unrestricted`.
    """
    @type t :: %__MODULE__{
            inbound_flows: String.t() | nil,
            outbound_flows: String.t() | nil
          }
    defstruct [:inbound_flows, :outbound_flows]
  end
end
