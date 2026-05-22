# File generated from our OpenAPI spec
defmodule Stripe.Services.TestHelpers.Treasury.InboundTransferService do
  @moduledoc """
  InboundTransfer API operations.
  """
  alias Stripe.Client

  @doc """
  Test mode: Fail an InboundTransfer

  Transitions a test mode created InboundTransfer to the `failed` status. The InboundTransfer must already be in the `processing` state.
  """
  @spec fail(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Treasury.InboundTransfer.t()} | {:error, Stripe.Error.t()}
  def fail(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/test_helpers/treasury/inbound_transfers/#{id}/fail",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Test mode: Return an InboundTransfer

  Marks the test mode InboundTransfer object as returned and links the InboundTransfer to a ReceivedDebit. The InboundTransfer must already be in the `succeeded` state.
  """
  @spec return_inbound_transfer(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Treasury.InboundTransfer.t()} | {:error, Stripe.Error.t()}
  def return_inbound_transfer(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/test_helpers/treasury/inbound_transfers/#{id}/return",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Test mode: Succeed an InboundTransfer

  Transitions a test mode created InboundTransfer to the `succeeded` status. The InboundTransfer must already be in the `processing` state.
  """
  @spec succeed(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Treasury.InboundTransfer.t()} | {:error, Stripe.Error.t()}
  def succeed(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/test_helpers/treasury/inbound_transfers/#{id}/succeed",
      Keyword.merge(opts, params: params)
    )
  end
end
