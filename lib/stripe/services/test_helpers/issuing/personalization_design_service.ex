# File generated from our OpenAPI spec
defmodule Stripe.Services.TestHelpers.Issuing.PersonalizationDesignService do
  @moduledoc """
  PersonalizationDesign API operations.
  """
  alias Stripe.Client

  @doc """
  Activate a testmode personalization design

  Updates the `status` of the specified testmode personalization design object to `active`.
  """
  @spec activate(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Issuing.PersonalizationDesign.t()} | {:error, Stripe.Error.t()}
  def activate(client, personalization_design, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/test_helpers/issuing/personalization_designs/#{personalization_design}/activate",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Deactivate a testmode personalization design

  Updates the `status` of the specified testmode personalization design object to `inactive`.
  """
  @spec deactivate(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Issuing.PersonalizationDesign.t()} | {:error, Stripe.Error.t()}
  def deactivate(client, personalization_design, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/test_helpers/issuing/personalization_designs/#{personalization_design}/deactivate",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Reject a testmode personalization design

  Updates the `status` of the specified testmode personalization design object to `rejected`.
  """
  @spec reject(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Issuing.PersonalizationDesign.t()} | {:error, Stripe.Error.t()}
  def reject(client, personalization_design, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/test_helpers/issuing/personalization_designs/#{personalization_design}/reject",
      Keyword.merge(opts, params: params)
    )
  end
end
