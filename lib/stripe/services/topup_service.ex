# File generated from our OpenAPI spec
defmodule Stripe.Services.TopupService do
  @moduledoc """
  Topup

  To top up your Stripe balance, you create a top-up object. You can retrieve
  individual top-ups, as well as list all top-ups. Top-ups are identified by a
  unique, random ID.

  Related guide: [Topping up your platform account](https://docs.stripe.com/connect/top-ups)
  """
  alias Stripe.Client

  @doc """
  Cancel a top-up

  Cancels a top-up. Only pending top-ups can be canceled.
  """
  @spec cancel(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Topup.t()} | {:error, Stripe.Error.t()}
  def cancel(client, topup, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/topups/#{topup}/cancel",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Create a top-up

  Top up the balance of an account
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Topup.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v1/topups", Keyword.merge(opts, params: params))
  end

  @doc """
  List all top-ups

  Returns a list of top-ups.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/topups", Keyword.merge(opts, params: params))
  end

  @doc """
  Retrieve a top-up

  Retrieves the details of a top-up that has previously been created. Supply the unique top-up ID that was returned from your previous request, and Stripe will return the corresponding top-up information.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Topup.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, topup, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/topups/#{topup}", Keyword.merge(opts, params: params))
  end

  @doc """
  Update a top-up

  Updates the metadata of a top-up. Other top-up details are not editable by design.
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Topup.t()} | {:error, Stripe.Error.t()}
  def update(client, topup, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v1/topups/#{topup}", Keyword.merge(opts, params: params))
  end
end
