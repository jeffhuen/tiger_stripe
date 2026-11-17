# File generated from our OpenAPI spec
defmodule Stripe.Services.V2.MoneyManagement.ReceivedCreditService do
  @moduledoc """
  Received Credit

  Use ReceivedCredits API to retrieve information on when, where, and how funds are sent into your FinancialAccount.
  """
  alias Stripe.Client

  @doc """
  List Received Credits

  Retrieves a list of ReceivedCredits.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.V2.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v2/money_management/received_credits",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end

  @doc """
  Retrieve a Received Credit

  Retrieve a ReceivedCredit by ID.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.V2.MoneyManagement.ReceivedCredit.t()}
          | {:error, Stripe.Error.t()}
  def retrieve(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v2/money_management/received_credits/#{id}",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end
end
