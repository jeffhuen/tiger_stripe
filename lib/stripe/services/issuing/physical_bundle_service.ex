# File generated from our OpenAPI spec
defmodule Stripe.Services.Issuing.PhysicalBundleService do
  @moduledoc """
  IssuingPhysicalBundle

  A Physical Bundle represents the bundle of physical items - card stock, carrier letter, and envelope - that is shipped to a cardholder when you create a physical card.
  """
  alias Stripe.Client

  @doc """
  List all physical bundles

  Returns a list of physical bundle objects. The objects are sorted in descending order by creation date, with the most recently created object appearing first.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/issuing/physical_bundles",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Retrieve a physical bundle

  Retrieves a physical bundle object.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Issuing.PhysicalBundle.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, physical_bundle, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/issuing/physical_bundles/#{physical_bundle}",
      Keyword.merge(opts, params: params)
    )
  end
end
