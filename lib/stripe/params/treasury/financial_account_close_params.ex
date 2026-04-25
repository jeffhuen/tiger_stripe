# File generated from our OpenAPI spec
defmodule Stripe.Params.Treasury.FinancialAccountCloseParams do
  @moduledoc "Parameters for financial account close."

  @typedoc """
  * `expand` - Specifies which fields in the response should be expanded.
  * `forwarding_settings` - A different bank account where funds can be deposited/debited in order to get the closing FA's balance to $0
  """
  @type t :: %__MODULE__{
          expand: [String.t()] | nil,
          forwarding_settings: forwarding_settings() | nil
        }

  defstruct [:expand, :forwarding_settings]

  @typedoc """
  * `financial_account` - The financial_account id
  * `payment_method` - The payment_method or bank account id. This needs to be a verified bank account. Max length: 5000.
  * `type` - The type of the bank account provided. This can be either "financial_account" or "payment_method" Possible values: `financial_account`, `payment_method`.
  """
  @type forwarding_settings :: %{
          optional(:financial_account) => String.t() | nil,
          optional(:payment_method) => String.t() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }
end
