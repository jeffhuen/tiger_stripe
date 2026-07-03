# File generated from our OpenAPI spec
defmodule Stripe.Services.Tax.CalculationLineItemService do
  @moduledoc """
  TaxProductResourceTaxCalculationLineItem
  """
  alias Stripe.Client

  @doc """
  Retrieve a Calculation's line items

  Retrieves the line items of a tax calculation as a collection, if the calculation hasn’t expired.
  """
  @spec list_line_items(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list_line_items(client, calculation, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/tax/calculations/#{calculation}/line_items",
      Keyword.merge(opts, params: params)
    )
  end
end
