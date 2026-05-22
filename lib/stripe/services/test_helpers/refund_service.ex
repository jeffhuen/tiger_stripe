# File generated from our OpenAPI spec
defmodule Stripe.Services.TestHelpers.RefundService do
  @moduledoc """
  Refund API operations.
  """
  alias Stripe.Client

  @doc """
  Expire a pending refund.

  Expire a refund with a status of `requires_action`.
  """
  @spec expire(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Refund.t()} | {:error, Stripe.Error.t()}
  def expire(client, refund, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/test_helpers/refunds/#{refund}/expire",
      Keyword.merge(opts, params: params)
    )
  end
end
