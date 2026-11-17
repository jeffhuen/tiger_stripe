# File generated from our OpenAPI spec
defmodule Stripe.Services.V2.MoneyManagement.AdjustmentService do
  @moduledoc """
  Adjustment

  An Adjustment records a credit or debit that Stripe makes to your Financial Account balance,
  for example to correct technical or operational errors.
  """
  alias Stripe.Client

  @doc """
  List Adjustments

  Returns a list of Adjustments that match the provided filters.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.V2.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v2/money_management/adjustments",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end

  @doc """
  Retrieve an Adjustment

  Retrieves the details of an Adjustment by ID.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.V2.MoneyManagement.Adjustment.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v2/money_management/adjustments/#{id}",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end
end
