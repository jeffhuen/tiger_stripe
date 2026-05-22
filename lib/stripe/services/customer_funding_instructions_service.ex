# File generated from our OpenAPI spec
defmodule Stripe.Services.CustomerFundingInstructionsService do
  @moduledoc """
  CustomerFundingInstructions API operations.
  """
  alias Stripe.Client

  @doc """
  Create or retrieve funding instructions for a customer cash balance

  Retrieve funding instructions for a customer cash balance. If funding instructions do not yet exist for the customer, new
  funding instructions will be created. If funding instructions have already been created for a given customer, the same
  funding instructions will be retrieved. In other words, we will return the same funding instructions each time.
  """
  @spec create_funding_instructions(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.FundingInstructions.t()} | {:error, Stripe.Error.t()}
  def create_funding_instructions(client, customer, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/customers/#{customer}/funding_instructions",
      Keyword.merge(opts, params: params)
    )
  end
end
