# File generated from our OpenAPI spec
defmodule Stripe.Services.EphemeralKeyService do
  @moduledoc """
  Ephemeral Key

  Ephemeral keys give the SDKs (like Stripe's mobile SDKs and Issuing Elements) temporary, scoped access to a specific
  resource, such as a Customer, Issuing Card, or Identity VerificationSession, without exposing your secret API key.

  Related guides: [Using Issuing Elements](https://docs.stripe.com/issuing/elements).
  """
  alias Stripe.Client

  @doc """
  Create an ephemeral key

  Creates a short-lived API key for a given resource.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.EphemeralKey.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v1/ephemeral_keys", Keyword.merge(opts, params: params))
  end

  @doc """
  Immediately invalidate an ephemeral key

  Invalidates a short-lived API key for a given resource.
  """
  @spec delete(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.EphemeralKey.t()} | {:error, Stripe.Error.t()}
  def delete(client, key, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :delete,
      "/v1/ephemeral_keys/#{key}",
      Keyword.merge(opts, params: params)
    )
  end
end
