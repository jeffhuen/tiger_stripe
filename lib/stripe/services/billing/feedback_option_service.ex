# File generated from our OpenAPI spec
defmodule Stripe.Services.Billing.FeedbackOptionService do
  @moduledoc """
  Feedback Option

  A feedback option is a reason you can present to customers when they cancel a
  subscription through the customer portal. Configure the set of options a customer
  can choose from on a [portal configuration](https://docs.stripe.com/api/customer_portal/configuration).

  Related guide: [Customer management](https://stripe.com/customer-management)
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
  List all feedback options

  Returns a list of your feedback options.
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

  Retrieves a feedback option object given an ID.
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
