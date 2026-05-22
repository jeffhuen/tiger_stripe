# File generated from our OpenAPI spec
defmodule Stripe.Services.TestHelpers.ConfirmationTokenService do
  @moduledoc """
  ConfirmationToken API operations.
  """
  alias Stripe.Client

  @doc """
  Create a test Confirmation Token

  Creates a test mode Confirmation Token server side for your integration tests.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.ConfirmationToken.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/test_helpers/confirmation_tokens",
      Keyword.merge(opts, params: params)
    )
  end
end
