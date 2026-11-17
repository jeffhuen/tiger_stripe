# File generated from our OpenAPI spec
defmodule Stripe.Services.V2.TestHelpers.MoneyManagementService do
  @moduledoc """
  MoneyManagement API operations.
  """
  alias Stripe.Client

  @doc """
  Create a test recipient verification

  Creates a RecipientVerification with a specified match result for testing purposes in a Sandbox environment.
  """
  @spec recipient_verifications(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.V2.MoneyManagement.RecipientVerification.t()}
          | {:error, Stripe.Error.t()}
  def recipient_verifications(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v2/test_helpers/money_management/recipient_verifications",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end
end
