# File generated from our OpenAPI spec
defmodule Stripe.Params.Issuing.DisputeCreateParams do
  @moduledoc "Parameters for dispute create."

  @typedoc """
  * `amount` - The dispute amount in the card's currency and in the [smallest currency unit](https://docs.stripe.com/currencies#zero-decimal). If not set, defaults to the full transaction amount.
  * `evidence` - Evidence provided for the dispute.
  * `expand` - Specifies which fields in the response should be expanded.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `transaction` - The ID of the issuing transaction to create a dispute for. For transaction on Treasury FinancialAccounts, use `treasury.received_debit`. Max length: 5000.
  * `treasury` - Params for disputes related to Treasury FinancialAccounts
  """
  @type t :: %__MODULE__{
          amount: integer() | nil,
          evidence: evidence() | nil,
          expand: [String.t()] | nil,
          metadata: %{String.t() => String.t()} | nil,
          transaction: String.t() | nil,
          treasury: treasury() | nil
        }

  defstruct [:amount, :evidence, :expand, :metadata, :transaction, :treasury]

  @typedoc """
  * `canceled` - Evidence provided when `reason` is 'canceled'.
  * `duplicate` - Evidence provided when `reason` is 'duplicate'.
  * `fraudulent` - Evidence provided when `reason` is 'fraudulent'.
  * `merchandise_not_as_described` - Evidence provided when `reason` is 'merchandise_not_as_described'.
  * `no_valid_authorization` - Evidence provided when `reason` is 'no_valid_authorization'.
  * `not_received` - Evidence provided when `reason` is 'not_received'.
  * `other` - Evidence provided when `reason` is 'other'.
  * `reason` - The reason for filing the dispute. The evidence should be submitted in the field of the same name. Possible values: `canceled`, `duplicate`, `fraudulent`, `merchandise_not_as_described`, `no_valid_authorization`, `not_received`, `other`, `service_not_as_described`.
  * `service_not_as_described` - Evidence provided when `reason` is 'service_not_as_described'.
  """
  @type evidence :: %{
          optional(:canceled) => map() | nil,
          optional(:duplicate) => map() | nil,
          optional(:fraudulent) => map() | nil,
          optional(:merchandise_not_as_described) => map() | nil,
          optional(:no_valid_authorization) => map() | nil,
          optional(:not_received) => map() | nil,
          optional(:other) => map() | nil,
          optional(:reason) => String.t() | nil,
          optional(:service_not_as_described) => map() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `received_debit` - The ID of the ReceivedDebit to initiate an Issuings dispute for. Max length: 5000.
  """
  @type treasury :: %{
          optional(:received_debit) => String.t() | nil,
          optional(String.t()) => term()
        }
end
