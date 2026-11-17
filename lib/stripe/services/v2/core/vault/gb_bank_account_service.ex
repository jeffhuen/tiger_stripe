# File generated from our OpenAPI spec
defmodule Stripe.Services.V2.Core.Vault.GbBankAccountService do
  @moduledoc """
  GB Bank Account

  Use the GBBankAccounts API to create and manage GB bank account objects
  """
  alias Stripe.Client

  @doc """
  Archive a GB Bank Account

  Archive a GBBankAccount object. Archived GBBankAccount objects cannot be used as outbound destinations
  and will not appear in the outbound destination list.
  """
  @spec archive(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.V2.Core.Vault.GbBankAccount.t()} | {:error, Stripe.Error.t()}
  def archive(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v2/core/vault/gb_bank_accounts/#{id}/archive",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end

  @doc """
  Create a GB Bank Account

  Create a GB bank account.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.V2.Core.Vault.GbBankAccount.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v2/core/vault/gb_bank_accounts",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end

  @doc """
  List GB Bank Accounts

  List objects that can be used as destinations for outbound money movement via OutboundPayment.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.V2.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v2/core/vault/gb_bank_accounts",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end

  @doc """
  Retrieve a GB Bank Account

  Retrieve a GB bank account.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.V2.Core.Vault.GbBankAccount.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v2/core/vault/gb_bank_accounts/#{id}",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end

  @doc """
  Unarchive a GB Bank Account

  Unarchive a GBBankAccount object.
  """
  @spec unarchive(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.V2.Core.Vault.GbBankAccount.t()} | {:error, Stripe.Error.t()}
  def unarchive(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v2/core/vault/gb_bank_accounts/#{id}/unarchive",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end
end
