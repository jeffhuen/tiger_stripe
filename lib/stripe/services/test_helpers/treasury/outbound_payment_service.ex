# File generated from our OpenAPI spec
defmodule Stripe.Services.TestHelpers.Treasury.OutboundPaymentService do
  @moduledoc """
  OutboundPayment API operations.
  """
  alias Stripe.Client

  @doc """
  Test mode: Fail an OutboundPayment

  Transitions a test mode created OutboundPayment to the `failed` status. The OutboundPayment must already be in the `processing` state.
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
  Test mode: Post an OutboundPayment

  Transitions a test mode created OutboundPayment to the `posted` status. The OutboundPayment must already be in the `processing` state.
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
  Test mode: Return an OutboundPayment

  Transitions a test mode created OutboundPayment to the `returned` status. The OutboundPayment must already be in the `processing` state.
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
  Test mode: Update an OutboundPayment

  Updates a test mode created OutboundPayment with tracking details. The OutboundPayment must not be cancelable, and cannot be in the `canceled` or `failed` states.
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
