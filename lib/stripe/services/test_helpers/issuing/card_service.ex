# File generated from our OpenAPI spec
defmodule Stripe.Services.TestHelpers.Issuing.CardService do
  @moduledoc """
  Card API operations.
  """
  alias Stripe.Client

  @doc """
  Deliver a testmode card

  Updates the shipping status of the specified Issuing `Card` object to `delivered`.
  """
  @spec deliver_card(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Issuing.Card.t()} | {:error, Stripe.Error.t()}
  def deliver_card(client, card, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/test_helpers/issuing/cards/#{card}/shipping/deliver",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Fail a testmode card

  Updates the shipping status of the specified Issuing `Card` object to `failure`.
  """
  @spec fail_card(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Issuing.Card.t()} | {:error, Stripe.Error.t()}
  def fail_card(client, card, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/test_helpers/issuing/cards/#{card}/shipping/fail",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Return a testmode card

  Updates the shipping status of the specified Issuing `Card` object to `returned`.
  """
  @spec return_card(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Issuing.Card.t()} | {:error, Stripe.Error.t()}
  def return_card(client, card, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/test_helpers/issuing/cards/#{card}/shipping/return",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Ship a testmode card

  Updates the shipping status of the specified Issuing `Card` object to `shipped`.
  """
  @spec ship_card(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Issuing.Card.t()} | {:error, Stripe.Error.t()}
  def ship_card(client, card, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/test_helpers/issuing/cards/#{card}/shipping/ship",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Submit a testmode card

  Updates the shipping status of the specified Issuing `Card` object to `submitted`. This method requires Stripe Version ‘2024-09-30.acacia’ or later.
  """
  @spec submit_card(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Issuing.Card.t()} | {:error, Stripe.Error.t()}
  def submit_card(client, card, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/test_helpers/issuing/cards/#{card}/shipping/submit",
      Keyword.merge(opts, params: params)
    )
  end
end
