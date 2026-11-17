# File generated from our OpenAPI spec
defmodule Stripe.Services.V2.MoneyManagement.PayoutMethodService do
  @moduledoc """
  Payout Method

  Use the PayoutMethods API to list and interact with PayoutMethod objects.
  """
  alias Stripe.Client

  @doc """
  Archive a Payout Method

  Archive a `PayoutMethod`. Archiving prevents the Payout Method from being used for outbound payments
  or transfers and omits it from normal list results. To restore list visibility, use the
  [unarchive endpoint](https://docs.stripe.com/api/v2/money-management/payout-methods/unarchive).
  """
  @spec archive(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.V2.MoneyManagement.PayoutMethod.t()} | {:error, Stripe.Error.t()}
  def archive(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v2/money_management/payout_methods/#{id}/archive",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end

  @doc """
  List Payout Methods

  List objects that adhere to the PayoutMethod interface.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.V2.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v2/money_management/payout_methods",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end

  @doc """
  Retrieve a Payout Method

  Retrieve a PayoutMethod object.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.V2.MoneyManagement.PayoutMethod.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v2/money_management/payout_methods/#{id}",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end

  @doc """
  Unarchive a Payout Method

  Unarchive a `PayoutMethod`. Unarchiving restores the Payout Method to normal list results and clears
  only its archived state. It doesn't guarantee that the Payout Method can be used.
  """
  @spec unarchive(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.V2.MoneyManagement.PayoutMethod.t()} | {:error, Stripe.Error.t()}
  def unarchive(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v2/money_management/payout_methods/#{id}/unarchive",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end
end
