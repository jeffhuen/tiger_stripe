# File generated from our OpenAPI spec
defmodule Stripe.Services.ApplePayDomainService do
  @moduledoc """
  ApplePayDomain
  """
  alias Stripe.Client

  @doc """
  Create an apple pay domain.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.ApplePayDomain.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v1/apple_pay/domains", Keyword.merge(opts, params: params))
  end

  @doc """
  Delete an apple pay domain.
  """
  @spec delete(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.ApplePayDomain.t()} | {:error, Stripe.Error.t()}
  def delete(client, domain, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :delete,
      "/v1/apple_pay/domains/#{domain}",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  List apple pay domains.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/apple_pay/domains", Keyword.merge(opts, params: params))
  end

  @doc """
  Retrieve an apple pay domain.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.ApplePayDomain.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, domain, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/apple_pay/domains/#{domain}",
      Keyword.merge(opts, params: params)
    )
  end
end
