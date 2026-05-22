# File generated from our OpenAPI spec
defmodule Stripe.Services.TaxCodeService do
  @moduledoc """
  TaxProductResourceTaxCode

  [Tax codes](https://stripe.com/docs/tax/tax-categories) classify goods and services for tax purposes.
  """
  alias Stripe.Client

  @doc """
  List all tax codes

  A list of [all tax codes available](https://stripe.com/docs/tax/tax-categories) to add to Products in order to allow specific tax calculations.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/tax_codes", Keyword.merge(opts, params: params))
  end

  @doc """
  Retrieve a tax code

  Retrieves the details of an existing tax code. Supply the unique tax code ID and Stripe will return the corresponding tax code information.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.TaxCode.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, id, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/tax_codes/#{id}", Keyword.merge(opts, params: params))
  end
end
