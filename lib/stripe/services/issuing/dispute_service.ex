# File generated from our OpenAPI spec
defmodule Stripe.Services.Issuing.DisputeService do
  @moduledoc """
  IssuingDispute

  As a [card issuer](https://docs.stripe.com/issuing), you can dispute transactions that the cardholder does not recognize, suspects to be fraudulent, or has other issues with.

  Related guide: [Issuing disputes](https://docs.stripe.com/issuing/purchases/disputes)
  """
  alias Stripe.Client

  @doc """
  Create a dispute

  Creates an Issuing `Dispute` object. Individual pieces of evidence within the `evidence` object are optional at this point. Stripe only validates that required evidence is present during submission. Refer to [Dispute reasons and evidence](https://docs.stripe.com/docs/issuing/purchases/disputes#dispute-reasons-and-evidence) for more details about evidence requirements.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Issuing.Dispute.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v1/issuing/disputes", Keyword.merge(opts, params: params))
  end

  @doc """
  List all disputes

  Returns a list of Issuing `Dispute` objects. The objects are sorted in descending order by creation date, with the most recently created object appearing first.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/issuing/disputes", Keyword.merge(opts, params: params))
  end

  @doc """
  Retrieve a dispute

  Retrieves an Issuing `Dispute` object.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Issuing.Dispute.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, dispute, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/issuing/disputes/#{dispute}",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Submit a dispute

  Submits an Issuing `Dispute` to the card network. Stripe validates that all evidence fields required for the dispute’s reason are present. For more details, see [Dispute reasons and evidence](https://docs.stripe.com/docs/issuing/purchases/disputes#dispute-reasons-and-evidence).
  """
  @spec submit(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Issuing.Dispute.t()} | {:error, Stripe.Error.t()}
  def submit(client, dispute, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/issuing/disputes/#{dispute}/submit",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Update a dispute

  Updates the specified Issuing `Dispute` object by setting the values of the parameters passed. Any parameters not provided will be left unchanged. Properties on the `evidence` object can be unset by passing in an empty string.
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Issuing.Dispute.t()} | {:error, Stripe.Error.t()}
  def update(client, dispute, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/issuing/disputes/#{dispute}",
      Keyword.merge(opts, params: params)
    )
  end
end
