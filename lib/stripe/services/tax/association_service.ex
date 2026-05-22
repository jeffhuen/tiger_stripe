# File generated from our OpenAPI spec
defmodule Stripe.Services.Tax.AssociationService do
  @moduledoc """
  TaxProductResourceTaxAssociation

  A Tax Association exposes the Tax Transactions that Stripe attempted to create on your behalf based on the PaymentIntent input
  """
  alias Stripe.Client

  @doc """
  Find a Tax Association

  Finds a tax association object by PaymentIntent id.
  """
  @spec find(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Tax.Association.t()} | {:error, Stripe.Error.t()}
  def find(client, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/tax/associations/find", Keyword.merge(opts, params: params))
  end
end
