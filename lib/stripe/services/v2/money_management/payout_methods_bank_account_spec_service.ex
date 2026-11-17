# File generated from our OpenAPI spec
defmodule Stripe.Services.V2.MoneyManagement.PayoutMethodsBankAccountSpecService do
  @moduledoc """
  Payout Methods Bank Account Spec

  The PayoutMethodsBankAccountSpec object.
  """
  alias Stripe.Client

  @doc """
  Retrieve Bank Account Specification by country

  Fetch the specifications for a set of countries to know which
  credential fields are required, the validations for each fields, and how to translate these
  country-specific fields to the generic fields in the PayoutMethodBankAccount type.
  """
  @spec retrieve(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.V2.MoneyManagement.PayoutMethodsBankAccountSpec.t()}
          | {:error, Stripe.Error.t()}
  def retrieve(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v2/money_management/payout_methods_bank_account_spec",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end
end
