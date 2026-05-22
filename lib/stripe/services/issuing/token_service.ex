# File generated from our OpenAPI spec
defmodule Stripe.Services.Issuing.TokenService do
  @moduledoc """
  IssuingNetworkToken

  An issuing token object is created when an issued card is added to a digital wallet. As a [card issuer](https://docs.stripe.com/issuing), you can [view and manage these tokens](https://docs.stripe.com/issuing/controls/token-management) through Stripe.
  """
  alias Stripe.Client

  @doc """
  List all issuing tokens for card

  Lists all Issuing `Token` objects for a given card.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/issuing/tokens", Keyword.merge(opts, params: params))
  end

  @doc """
  Retrieve an issuing token

  Retrieves an Issuing `Token` object.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Issuing.Token.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, token, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/issuing/tokens/#{token}",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Update a token status

  Attempts to update the specified Issuing `Token` object to the status specified.
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Issuing.Token.t()} | {:error, Stripe.Error.t()}
  def update(client, token, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/issuing/tokens/#{token}",
      Keyword.merge(opts, params: params)
    )
  end
end
