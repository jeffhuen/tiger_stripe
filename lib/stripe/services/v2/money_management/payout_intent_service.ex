# File generated from our OpenAPI spec
defmodule Stripe.Services.V2.MoneyManagement.PayoutIntentService do
  @moduledoc """
  Payout Intent

  PayoutIntent represents an intent to send funds from a Financial Account to a payout method.
  """
  alias Stripe.Client

  @doc """
  Cancel a Payout Intent

  Cancels a PayoutIntent in the `pending` or `requires_action` state, or a `processing` PayoutIntent with a cancelable OutboundPayment.
  """
  @spec cancel(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.V2.MoneyManagement.PayoutIntent.t()} | {:error, Stripe.Error.t()}
  def cancel(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v2/money_management/payout_intents/#{id}/cancel",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end

  @doc """
  Confirm a Payout Intent

  Confirms a PayoutIntent in the `requires_action` state, transitioning it to `pending`.
  """
  @spec confirm(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.V2.MoneyManagement.PayoutIntent.t()} | {:error, Stripe.Error.t()}
  def confirm(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v2/money_management/payout_intents/#{id}/confirm",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end

  @doc """
  Create a Payout Intent

  Creates a PayoutIntent.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.V2.MoneyManagement.PayoutIntent.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v2/money_management/payout_intents",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end

  @doc """
  List Payout Intents

  Returns a list of PayoutIntents.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.V2.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v2/money_management/payout_intents",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end

  @doc """
  Refresh a PayoutIntent’s FX quote

  Refreshes the FX quote for a PayoutIntent.
  """
  @spec refresh_fx_quote(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.V2.MoneyManagement.PayoutIntent.t()} | {:error, Stripe.Error.t()}
  def refresh_fx_quote(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v2/money_management/payout_intents/#{id}/refresh_fx_quote",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end

  @doc """
  Refresh a Payout Intent's recipient verification

  Refreshes the recipient verification for a PayoutIntent.
  """
  @spec refresh_recipient_verification(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.V2.MoneyManagement.PayoutIntent.t()} | {:error, Stripe.Error.t()}
  def refresh_recipient_verification(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v2/money_management/payout_intents/#{id}/refresh_recipient_verification",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end

  @doc """
  Retrieve a Payout Intent

  Retrieves the details of an existing PayoutIntent by passing the unique PayoutIntent ID.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.V2.MoneyManagement.PayoutIntent.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v2/money_management/payout_intents/#{id}",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end

  @doc """
  Update a Payout Intent

  Updates an editable PayoutIntent in the `pending` or `requires_action` state.
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.V2.MoneyManagement.PayoutIntent.t()} | {:error, Stripe.Error.t()}
  def update(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v2/money_management/payout_intents/#{id}",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end
end
