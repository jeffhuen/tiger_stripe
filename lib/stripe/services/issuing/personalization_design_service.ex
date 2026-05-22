# File generated from our OpenAPI spec
defmodule Stripe.Services.Issuing.PersonalizationDesignService do
  @moduledoc """
  IssuingPersonalizationDesign

  A Personalization Design is a logical grouping of a Physical Bundle, card logo, and carrier text that represents a product line.
  """
  alias Stripe.Client

  @doc """
  Create a personalization design

  Creates a personalization design object.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Issuing.PersonalizationDesign.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/issuing/personalization_designs",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  List all personalization designs

  Returns a list of personalization design objects. The objects are sorted in descending order by creation date, with the most recently created object appearing first.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/issuing/personalization_designs",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Retrieve a personalization design

  Retrieves a personalization design object.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Issuing.PersonalizationDesign.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, personalization_design, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/issuing/personalization_designs/#{personalization_design}",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Update a personalization design

  Updates a card personalization object.
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Issuing.PersonalizationDesign.t()} | {:error, Stripe.Error.t()}
  def update(client, personalization_design, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/issuing/personalization_designs/#{personalization_design}",
      Keyword.merge(opts, params: params)
    )
  end
end
