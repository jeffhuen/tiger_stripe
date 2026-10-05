# File generated from our OpenAPI spec
defmodule Stripe.Services.ProductCatalog.TrialOfferService do
  @moduledoc """
  Trial Offer

  Trial offers let you define free or paid introductory pricing for a subscription item.
  A TrialOffer specifies the price to charge during the trial, how many billing intervals
  the trial lasts, and what price the subscription item transitions to when the trial ends.
  You attach a TrialOffer to a subscription item
  using `items[current_trial][trial_offer]` when creating or updating a subscription.
  """
  alias Stripe.Client

  @doc """
  Create a trial offer

  Creates a trial offer.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.ProductCatalog.TrialOffer.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/product_catalog/trial_offers",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  List trial offers

  Returns a list of trial offers.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/product_catalog/trial_offers",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Retrieve a trial offer

  Retrieves the trial offer with the given ID.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.ProductCatalog.TrialOffer.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/product_catalog/trial_offers/#{id}",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Update a trial offer

  Updates the specified trial offer by setting the values of the parameters passed. Any parameters not provided are left unchanged.
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.ProductCatalog.TrialOffer.t()} | {:error, Stripe.Error.t()}
  def update(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/product_catalog/trial_offers/#{id}",
      Keyword.merge(opts, params: params)
    )
  end
end
