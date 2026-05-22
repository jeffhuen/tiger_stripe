# File generated from our OpenAPI spec
defmodule Stripe.Services.TestHelpers.Issuing.AuthorizationService do
  @moduledoc """
  Authorization API operations.
  """
  alias Stripe.Client

  @doc """
  Capture a test-mode authorization

  Capture a test-mode authorization.
  """
  @spec capture(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Issuing.Authorization.t()} | {:error, Stripe.Error.t()}
  def capture(client, authorization, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/test_helpers/issuing/authorizations/#{authorization}/capture",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Create a test-mode authorization

  Create a test-mode authorization.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Issuing.Authorization.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/test_helpers/issuing/authorizations",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Expire a test-mode authorization

  Expire a test-mode Authorization.
  """
  @spec expire(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Issuing.Authorization.t()} | {:error, Stripe.Error.t()}
  def expire(client, authorization, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/test_helpers/issuing/authorizations/#{authorization}/expire",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Finalize a test-mode authorization's amount

  Finalize the amount on an Authorization prior to capture, when the initial authorization was for an estimated amount.
  """
  @spec finalize_amount(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Issuing.Authorization.t()} | {:error, Stripe.Error.t()}
  def finalize_amount(client, authorization, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/test_helpers/issuing/authorizations/#{authorization}/finalize_amount",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Increment a test-mode authorization

  Increment a test-mode Authorization.
  """
  @spec increment(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Issuing.Authorization.t()} | {:error, Stripe.Error.t()}
  def increment(client, authorization, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/test_helpers/issuing/authorizations/#{authorization}/increment",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Respond to fraud challenge

  Respond to a fraud challenge on a testmode Issuing authorization, simulating either a confirmation of fraud or a correction of legitimacy.
  """
  @spec respond(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Issuing.Authorization.t()} | {:error, Stripe.Error.t()}
  def respond(client, authorization, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/test_helpers/issuing/authorizations/#{authorization}/fraud_challenges/respond",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Reverse a test-mode authorization

  Reverse a test-mode Authorization.
  """
  @spec reverse(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Issuing.Authorization.t()} | {:error, Stripe.Error.t()}
  def reverse(client, authorization, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/test_helpers/issuing/authorizations/#{authorization}/reverse",
      Keyword.merge(opts, params: params)
    )
  end
end
