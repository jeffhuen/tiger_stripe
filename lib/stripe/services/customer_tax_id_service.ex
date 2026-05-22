# File generated from our OpenAPI spec
defmodule Stripe.Services.CustomerTaxIdService do
  @moduledoc """
  CustomerTaxId API operations.
  """
  alias Stripe.Client

  @doc """
  Create a Customer tax ID

  Creates a new `tax_id` object for a customer.
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.TaxId.t()} | {:error, Stripe.Error.t()}
  def create(client, customer, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/customers/#{customer}/tax_ids",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Delete a Customer tax ID

  Deletes an existing `tax_id` object.
  """
  @spec delete(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.TaxId.t()} | {:error, Stripe.Error.t()}
  def delete(client, customer, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :delete,
      "/v1/customers/#{customer}/tax_ids/#{id}",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  List all Customer tax IDs

  Returns a list of tax IDs for a customer.
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, customer, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/customers/#{customer}/tax_ids",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Retrieve a Customer tax ID

  Retrieves the `tax_id` object with the given identifier.
  """
  @spec retrieve(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.TaxId.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, customer, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/customers/#{customer}/tax_ids/#{id}",
      Keyword.merge(opts, params: params)
    )
  end
end
