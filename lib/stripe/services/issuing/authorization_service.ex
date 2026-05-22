# File generated from our OpenAPI spec
defmodule Stripe.Services.Issuing.AuthorizationService do
  @moduledoc """
  IssuingAuthorization

  When an [issued card](https://docs.stripe.com/issuing) is used to make a purchase, an Issuing `Authorization`
  object is created. [Authorizations](https://docs.stripe.com/issuing/purchases/authorizations) must be approved for the
  purchase to be completed successfully.

  Related guide: [Issued card authorizations](https://docs.stripe.com/issuing/purchases/authorizations)
  """
  alias Stripe.Client

  @doc """
  Approve an authorization

  [Deprecated] Approves a pending Issuing `Authorization` object. This request should be made within the timeout window of the [real-time authorization](https://docs.stripe.com/docs/issuing/controls/real-time-authorizations) flow. 
  This method is deprecated. Instead, [respond directly to the webhook request to approve an authorization](https://docs.stripe.com/docs/issuing/controls/real-time-authorizations#authorization-handling).
  """
  @deprecated "This endpoint is deprecated by Stripe."
  @spec approve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Issuing.Authorization.t()} | {:error, Stripe.Error.t()}
  def approve(client, authorization, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/issuing/authorizations/#{authorization}/approve",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Decline an authorization

  [Deprecated] Declines a pending Issuing `Authorization` object. This request should be made within the timeout window of the [real time authorization](https://docs.stripe.com/docs/issuing/controls/real-time-authorizations) flow.
  This method is deprecated. Instead, [respond directly to the webhook request to decline an authorization](https://docs.stripe.com/docs/issuing/controls/real-time-authorizations#authorization-handling).
  """
  @deprecated "This endpoint is deprecated by Stripe."
  @spec decline(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Issuing.Authorization.t()} | {:error, Stripe.Error.t()}
  def decline(client, authorization, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/issuing/authorizations/#{authorization}/decline",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  List all authorizations

  Returns a list of Issuing `Authorization` objects. The objects are sorted in descending order by creation date, with the most recently created object appearing first.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/issuing/authorizations",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Retrieve an authorization

  Retrieves an Issuing `Authorization` object.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Issuing.Authorization.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, authorization, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/issuing/authorizations/#{authorization}",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Update an authorization

  Updates the specified Issuing `Authorization` object by setting the values of the parameters passed. Any parameters not provided will be left unchanged.
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Issuing.Authorization.t()} | {:error, Stripe.Error.t()}
  def update(client, authorization, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/issuing/authorizations/#{authorization}",
      Keyword.merge(opts, params: params)
    )
  end
end
