# File generated from our OpenAPI spec
defmodule Stripe.Services.TestHelpers.Issuing.TransactionService do
  @moduledoc """
  Transaction API operations.
  """
  alias Stripe.Client

  @doc """
  Create a test-mode force capture

  Allows the user to capture an arbitrary amount, also known as a forced capture.
  """
  @spec create_force_capture(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Issuing.Transaction.t()} | {:error, Stripe.Error.t()}
  def create_force_capture(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/test_helpers/issuing/transactions/create_force_capture",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Create a test-mode unlinked refund

  Allows the user to refund an arbitrary amount, also known as a unlinked refund.
  """
  @spec create_unlinked_refund(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Issuing.Transaction.t()} | {:error, Stripe.Error.t()}
  def create_unlinked_refund(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/test_helpers/issuing/transactions/create_unlinked_refund",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Refund a test-mode transaction

  Refund a test-mode Transaction.
  """
  @spec refund(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Issuing.Transaction.t()} | {:error, Stripe.Error.t()}
  def refund(client, transaction, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/test_helpers/issuing/transactions/#{transaction}/refund",
      Keyword.merge(opts, params: params)
    )
  end
end
