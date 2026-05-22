# File generated from our OpenAPI spec
defmodule Stripe.Services.MandateService do
  @moduledoc """
  Mandate

  A Mandate is a record of the permission that your customer gives you to debit their payment method.
  """
  alias Stripe.Client

  @doc """
  Retrieve a Mandate

  Retrieves a Mandate object.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Mandate.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, mandate, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/mandates/#{mandate}", Keyword.merge(opts, params: params))
  end
end
