# File generated from our OpenAPI spec
defmodule Stripe.Services.V2.MoneyManagement.RecipientVerificationService do
  @moduledoc """
  Recipient Verification

  RecipientVerification represents a verification of recipient you intend to send funds to.
  """
  alias Stripe.Client

  @doc """
  Acknowledge a Recipient Verification

  Acknowledges an existing RecipientVerification in the `awaiting_acknowledgement` state.
  """
  @spec acknowledge(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.V2.MoneyManagement.RecipientVerification.t()}
          | {:error, Stripe.Error.t()}
  def acknowledge(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v2/money_management/recipient_verifications/#{id}/acknowledge",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end

  @doc """
  Create a Recipient Verification

  Creates a RecipientVerification to verify the recipient you intend to send funds to.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.V2.MoneyManagement.RecipientVerification.t()}
          | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v2/money_management/recipient_verifications",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end

  @doc """
  Retrieve a Recipient Verification

  Retrieves the details of an existing RecipientVerification by passing the unique RecipientVerification ID.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.V2.MoneyManagement.RecipientVerification.t()}
          | {:error, Stripe.Error.t()}
  def retrieve(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v2/money_management/recipient_verifications/#{id}",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end
end
