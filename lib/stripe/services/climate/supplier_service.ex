# File generated from our OpenAPI spec
defmodule Stripe.Services.Climate.SupplierService do
  @moduledoc """
  ClimateRemovalsSuppliers

  A supplier of carbon removal.
  """
  alias Stripe.Client

  @doc """
  List suppliers

  Lists all available Climate supplier objects.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/climate/suppliers", Keyword.merge(opts, params: params))
  end

  @doc """
  Retrieve a supplier

  Retrieves a Climate supplier object.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Climate.Supplier.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, supplier, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/climate/suppliers/#{supplier}",
      Keyword.merge(opts, params: params)
    )
  end
end
