# File generated from our OpenAPI spec
defmodule Stripe.Services.V2.MoneyManagement.OutboundSetupIntentService do
  @moduledoc """
  Outbound Setup Intent

  Use the OutboundSetupIntent API to create and setup usable payout methods.
  """
  alias Stripe.Client

  @doc """
  Cancel an Outbound Setup Intent

  Cancel an OutboundSetupIntent object.
  """
  @spec cancel(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.V2.MoneyManagement.OutboundSetupIntent.t()}
          | {:error, Stripe.Error.t()}
  def cancel(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v2/money_management/outbound_setup_intents/#{id}/cancel",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end

  @doc """
  Create an Outbound Setup Intent

  Create an OutboundSetupIntent object.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.V2.MoneyManagement.OutboundSetupIntent.t()}
          | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v2/money_management/outbound_setup_intents",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end

  @doc """
  List Outbound Setup Intents

  List the OutboundSetupIntent objects.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.V2.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v2/money_management/outbound_setup_intents",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end

  @doc """
  Retrieve an Outbound Setup Intent

  Retrieve an OutboundSetupIntent object.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.V2.MoneyManagement.OutboundSetupIntent.t()}
          | {:error, Stripe.Error.t()}
  def retrieve(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v2/money_management/outbound_setup_intents/#{id}",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end

  @doc """
  Update an Outbound Setup Intent

  Update an OutboundSetupIntent object.
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.V2.MoneyManagement.OutboundSetupIntent.t()}
          | {:error, Stripe.Error.t()}
  def update(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v2/money_management/outbound_setup_intents/#{id}",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end
end
