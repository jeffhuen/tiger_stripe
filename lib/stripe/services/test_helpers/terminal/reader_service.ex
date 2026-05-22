# File generated from our OpenAPI spec
defmodule Stripe.Services.TestHelpers.Terminal.ReaderService do
  @moduledoc """
  Reader API operations.
  """
  alias Stripe.Client

  @doc """
  Simulate presenting a payment method

  Presents a payment method on a simulated reader. Can be used to simulate accepting a payment, saving a card or refunding a transaction.
  """
  @spec present_payment_method(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Terminal.Reader.t()} | {:error, Stripe.Error.t()}
  def present_payment_method(client, reader, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/test_helpers/terminal/readers/#{reader}/present_payment_method",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Simulate a successful input collection

  Use this endpoint to trigger a successful input collection on a simulated reader.
  """
  @spec succeed_input_collection(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Terminal.Reader.t()} | {:error, Stripe.Error.t()}
  def succeed_input_collection(client, reader, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/test_helpers/terminal/readers/#{reader}/succeed_input_collection",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Simulate an input collection timeout

  Use this endpoint to complete an input collection with a timeout error on a simulated reader.
  """
  @spec timeout_input_collection(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Terminal.Reader.t()} | {:error, Stripe.Error.t()}
  def timeout_input_collection(client, reader, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/test_helpers/terminal/readers/#{reader}/timeout_input_collection",
      Keyword.merge(opts, params: params)
    )
  end
end
