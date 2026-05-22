# File generated from our OpenAPI spec
defmodule Stripe.Services.ReviewService do
  @moduledoc """
  RadarReview

  Reviews can be used to supplement automated fraud detection with human expertise.

  Learn more about [Radar](https://stripe.com/radar) and reviewing payments
  [here](https://docs.stripe.com/radar/reviews).
  """
  alias Stripe.Client

  @doc """
  Approve a review

  Approves a `Review` object, closing it and removing it from the list of reviews.
  """
  @spec approve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Review.t()} | {:error, Stripe.Error.t()}
  def approve(client, review, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/reviews/#{review}/approve",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  List all open reviews

  Returns a list of `Review` objects that have `open` set to `true`. The objects are sorted in descending order by creation date, with the most recently created object appearing first.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/reviews", Keyword.merge(opts, params: params))
  end

  @doc """
  Retrieve a review

  Retrieves a `Review` object.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Review.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, review, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/reviews/#{review}", Keyword.merge(opts, params: params))
  end
end
