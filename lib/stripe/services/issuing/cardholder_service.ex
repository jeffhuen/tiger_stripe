# File generated from our OpenAPI spec
defmodule Stripe.Services.Issuing.CardholderService do
  @moduledoc """
  IssuingCardholder

  An Issuing `Cardholder` object represents an individual or business entity who is [issued](https://docs.stripe.com/issuing) cards.

  Related guide: [How to create a cardholder](https://docs.stripe.com/issuing/cards/virtual/issue-cards#create-cardholder)
  """
  alias Stripe.Client

  @doc """
  Create a cardholder

  Creates a new Issuing `Cardholder` object that can be issued cards.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Issuing.Cardholder.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v1/issuing/cardholders", Keyword.merge(opts, params: params))
  end

  @doc """
  List all cardholders

  Returns a list of Issuing `Cardholder` objects. The objects are sorted in descending order by creation date, with the most recently created object appearing first.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/issuing/cardholders", Keyword.merge(opts, params: params))
  end

  @doc """
  Retrieve a cardholder

  Retrieves an Issuing `Cardholder` object.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Issuing.Cardholder.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, cardholder, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/issuing/cardholders/#{cardholder}",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Update a cardholder

  Updates the specified Issuing `Cardholder` object by setting the values of the parameters passed. Any parameters not provided will be left unchanged.
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Issuing.Cardholder.t()} | {:error, Stripe.Error.t()}
  def update(client, cardholder, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/issuing/cardholders/#{cardholder}",
      Keyword.merge(opts, params: params)
    )
  end
end
