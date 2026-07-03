# File generated from our OpenAPI spec
defmodule Stripe.Services.Tax.CalculationService do
  @moduledoc """
  TaxProductResourceTaxCalculation

  A Tax Calculation allows you to calculate the tax to collect from your customer.

  Related guide: [Calculate tax in your custom payment flow](https://docs.stripe.com/tax/custom)
  """
  alias Stripe.Client

  @doc """
  Create a Calculation

  Calculates tax based on the input and returns a Tax `Calculation` object.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Tax.Calculation.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v1/tax/calculations", Keyword.merge(opts, params: params))
  end

  @doc """
  Retrieve a Calculation

  Retrieves a Tax `Calculation` object, if the calculation hasn’t expired.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Tax.Calculation.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, calculation, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/tax/calculations/#{calculation}",
      Keyword.merge(opts, params: params)
    )
  end
end
