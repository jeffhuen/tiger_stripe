# File generated from our OpenAPI spec
defmodule Stripe.Services.TestHelpers.Treasury.OutboundTransferService do
  @moduledoc """
  OutboundTransfer API operations.
  """
  alias Stripe.Client

  @doc """
  Test helper: Fail an OutboundTransfer

  Transitions a test `OutboundTransfer` to the `failed` status. The `OutboundTransfer` must already be in the `processing` state.
  """
  @spec fail(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Treasury.OutboundTransfer.t()} | {:error, Stripe.Error.t()}
  def fail(client, outbound_transfer, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/test_helpers/treasury/outbound_transfers/#{outbound_transfer}/fail",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Test helper: Post an OutboundTransfer

  Transitions a test `OutboundTransfer` to the `posted` status. The `OutboundTransfer` must already be in the `processing` state.
  """
  @spec post(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Treasury.OutboundTransfer.t()} | {:error, Stripe.Error.t()}
  def post(client, outbound_transfer, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/test_helpers/treasury/outbound_transfers/#{outbound_transfer}/post",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Test helper: Return an OutboundTransfer

  Transitions a test `OutboundTransfer` to the `returned` status. The `OutboundTransfer` must already be in the `posted` state.
  """
  @spec return_outbound_transfer(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Treasury.OutboundTransfer.t()} | {:error, Stripe.Error.t()}
  def return_outbound_transfer(client, outbound_transfer, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/test_helpers/treasury/outbound_transfers/#{outbound_transfer}/return",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Test helper: Update an OutboundTransfer

  Updates a test `OutboundTransfer` with tracking details. The `OutboundTransfer` must not be cancelable, and can’t be in the `canceled` or `failed` states.
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Treasury.OutboundTransfer.t()} | {:error, Stripe.Error.t()}
  def update(client, outbound_transfer, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/test_helpers/treasury/outbound_transfers/#{outbound_transfer}",
      Keyword.merge(opts, params: params)
    )
  end
end
