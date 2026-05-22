# File generated from our OpenAPI spec
defmodule Stripe.Services.TaxIdService do
  @moduledoc """
  tax_id

  You can add one or multiple tax IDs to a [customer](https://docs.stripe.com/api/customers) or account.
  Customer and account tax IDs get displayed on related invoices and credit notes.

  Related guides: [Customer tax identification numbers](https://docs.stripe.com/billing/taxes/tax-ids), [Account tax IDs](https://docs.stripe.com/invoicing/connect#account-tax-ids)
  """
  alias Stripe.Client

  @doc """
  Create a tax ID

  Creates a new account or customer `tax_id` object.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.TaxId.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v1/tax_ids", Keyword.merge(opts, params: params))
  end

  @doc """
  Delete a tax ID

  Deletes an existing account or customer `tax_id` object.
  """
  @spec delete(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.TaxId.t()} | {:error, Stripe.Error.t()}
  def delete(client, id, params \\ %{}, opts \\ []) do
    Client.request(client, :delete, "/v1/tax_ids/#{id}", Keyword.merge(opts, params: params))
  end

  @doc """
  List all tax IDs

  Returns a list of tax IDs.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/tax_ids", Keyword.merge(opts, params: params))
  end

  @doc """
  Retrieve a tax ID

  Retrieves an account or customer `tax_id` object.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.TaxId.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, id, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/tax_ids/#{id}", Keyword.merge(opts, params: params))
  end
end
