# File generated from our OpenAPI spec
defmodule Stripe.Services.Issuing.CardService do
  @moduledoc """
  IssuingCard

  You can [create physical or virtual cards](https://docs.stripe.com/issuing) that are issued to cardholders.
  """
  alias Stripe.Client

  @doc """
  Create a card

  Creates an Issuing `Card` object.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Issuing.Card.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v1/issuing/cards", Keyword.merge(opts, params: params))
  end

  @doc """
  List all cards

  Returns a list of Issuing `Card` objects. The objects are sorted in descending order by creation date, with the most recently created object appearing first.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/issuing/cards", Keyword.merge(opts, params: params))
  end

  @doc """
  Retrieve a card

  Retrieves an Issuing `Card` object.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Issuing.Card.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, card, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/issuing/cards/#{card}", Keyword.merge(opts, params: params))
  end

  @doc """
  Update a card

  Updates the specified Issuing `Card` object by setting the values of the parameters passed. Any parameters not provided will be left unchanged.
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Issuing.Card.t()} | {:error, Stripe.Error.t()}
  def update(client, card, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/issuing/cards/#{card}",
      Keyword.merge(opts, params: params)
    )
  end
end
