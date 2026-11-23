# File generated from our OpenAPI spec
defmodule Stripe.Services.TestHelpers.Treasury.OutboundPaymentService do
  @moduledoc """
  OutboundPayment API operations.
  """
  alias Stripe.Client

  @doc """
  Test helper: Fail an OutboundPayment

  Transitions a test `OutboundPayment` to the `failed` status. The `OutboundPayment` must already be in the `processing` state.
  """
  @spec fail(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Treasury.OutboundPayment.t()} | {:error, Stripe.Error.t()}
  def fail(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/test_helpers/treasury/outbound_payments/#{id}/fail",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Test helper: Post an OutboundPayment

  Transitions a test `OutboundPayment` to the `posted` status. The `OutboundPayment` must already be in the `processing` state.
  """
  @spec post(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Treasury.OutboundPayment.t()} | {:error, Stripe.Error.t()}
  def post(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/test_helpers/treasury/outbound_payments/#{id}/post",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Test helper: Return an OutboundPayment

  Transitions a test `OutboundPayment` to the `returned` status. The `OutboundPayment` must already be in the `posted` state.
  """
  @spec return_outbound_payment(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Treasury.OutboundPayment.t()} | {:error, Stripe.Error.t()}
  def return_outbound_payment(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/test_helpers/treasury/outbound_payments/#{id}/return",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Test helper: Update an OutboundPayment

  Updates a test `OutboundPayment` with tracking details. The `OutboundPayment` must not be cancelable, and can’t be in the `canceled` or `failed` states.
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Treasury.OutboundPayment.t()} | {:error, Stripe.Error.t()}
  def update(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/test_helpers/treasury/outbound_payments/#{id}",
      Keyword.merge(opts, params: params)
    )
  end
end
