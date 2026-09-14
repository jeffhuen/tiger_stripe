# File generated from our OpenAPI spec
defmodule Stripe.Services.Billing.FeedbackOptionService do
  @moduledoc """
  FeedbackOptionsFeedbackOptions

  A resource for the feedback options model (for custom cancellation reasons)
  """
  alias Stripe.Client

  @doc """
  Create a feedback option

  Creates a new feedback option.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Billing.FeedbackOption.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/billing/feedback_options",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Deactivate a feedback option

  Deactivates a feedback option. Deactivated feedback options cannot be used in portal configurations.
  """
  @spec deactivate(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Billing.FeedbackOption.t()} | {:error, Stripe.Error.t()}
  def deactivate(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/billing/feedback_options/#{id}/deactivate",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Feedback Options List API Method

  An API method for listing the feedback options model
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/billing/feedback_options",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Retrieve a feedback option

  Retrieves a feedback options object given an ID.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Billing.FeedbackOption.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/billing/feedback_options/#{id}",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Update a feedback option

  Updates the description of an existing feedback option.
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Billing.FeedbackOption.t()} | {:error, Stripe.Error.t()}
  def update(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/billing/feedback_options/#{id}",
      Keyword.merge(opts, params: params)
    )
  end
end
