# File generated from our OpenAPI spec
defmodule Stripe.Services.Entitlements.ActiveEntitlementService do
  @moduledoc """
  ActiveEntitlement

  An active entitlement describes access to a feature for a customer.
  """
  alias Stripe.Client

  @doc """
  List all active entitlements

  Retrieve a list of active entitlements for a customer
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/entitlements/active_entitlements",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Retrieve an active entitlement

  Retrieve an active entitlement
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Entitlements.ActiveEntitlement.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/entitlements/active_entitlements/#{id}",
      Keyword.merge(opts, params: params)
    )
  end
end
