# File generated from our OpenAPI spec
defmodule Stripe.Services.TaxRateService do
  @moduledoc """
  TaxRate

  Tax rates can be applied to [invoices](https://stripe.com/invoicing/taxes/tax-rates), [subscriptions](https://stripe.com/billing/taxes/tax-rates) and [Checkout Sessions](https://stripe.com/payments/checkout/use-manual-tax-rates) to collect tax.

  Related guide: [Tax rates](https://stripe.com/billing/taxes/tax-rates)
  """
  alias Stripe.Client

  @doc """
  Create a tax rate

  Creates a new tax rate.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.TaxRate.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v1/tax_rates", Keyword.merge(opts, params: params))
  end

  @doc """
  List all tax rates

  Returns a list of your tax rates. Tax rates are returned sorted by creation date, with the most recently created tax rates appearing first.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/tax_rates", Keyword.merge(opts, params: params))
  end

  @doc """
  Retrieve a tax rate

  Retrieves a tax rate with the given ID
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.TaxRate.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, tax_rate, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/tax_rates/#{tax_rate}", Keyword.merge(opts, params: params))
  end

  @doc """
  Update a tax rate

  Updates an existing tax rate.
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.TaxRate.t()} | {:error, Stripe.Error.t()}
  def update(client, tax_rate, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/tax_rates/#{tax_rate}",
      Keyword.merge(opts, params: params)
    )
  end
end
