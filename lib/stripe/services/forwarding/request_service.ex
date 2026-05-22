# File generated from our OpenAPI spec
defmodule Stripe.Services.Forwarding.RequestService do
  @moduledoc """
  ForwardingRequest

  Instructs Stripe to make a request on your behalf using the destination URL. The destination URL
  is activated by Stripe at the time of onboarding. Stripe verifies requests with your credentials
  provided during onboarding, and injects card details from the payment_method into the request.

  Stripe redacts all sensitive fields and headers, including authentication credentials and card numbers,
  before storing the request and response data in the forwarding Request object, which are subject to a
  30-day retention period.

  You can provide a Stripe idempotency key to make sure that requests with the same key result in only one
  outbound request. The Stripe idempotency key provided should be unique and different from any idempotency
  keys provided on the underlying third-party request.

  Forwarding Requests are synchronous requests that return a response or time out according to
  Stripe’s limits.

  Related guide: [Forward card details to third-party API endpoints](https://docs.stripe.com/payments/forwarding).
  """
  alias Stripe.Client

  @doc """
  Create a ForwardingRequest

  Creates a ForwardingRequest object.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Forwarding.Request.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v1/forwarding/requests", Keyword.merge(opts, params: params))
  end

  @doc """
  List all ForwardingRequests

  Lists all ForwardingRequest objects.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/forwarding/requests", Keyword.merge(opts, params: params))
  end

  @doc """
  Retrieve a ForwardingRequest

  Retrieves a ForwardingRequest object.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Forwarding.Request.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/forwarding/requests/#{id}",
      Keyword.merge(opts, params: params)
    )
  end
end
