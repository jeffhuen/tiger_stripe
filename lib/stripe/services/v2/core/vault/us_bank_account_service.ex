# File generated from our OpenAPI spec
defmodule Stripe.Services.V2.Core.Vault.UsBankAccountService do
  @moduledoc """
  US Bank Account

  Use the USBankAccounts API to create and manage US bank accounts objects that you can use to receive funds. Note that these are not interchangeable with v1 Tokens.
  """
  alias Stripe.Client

  @doc """
  Archive a US Bank Account

  Archive a USBankAccount object. USBankAccount objects will not be automatically archived by Stripe.
  Archived USBankAccount objects cannot be used as outbound destinations
  and will not appear in the outbound destination list.
  """
  @spec archive(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.V2.Core.Vault.UsBankAccount.t()} | {:error, Stripe.Error.t()}
  def archive(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v2/core/vault/us_bank_accounts/#{id}/archive",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end

  @doc """
  Confirm Microdeposits for verification

  Confirm microdeposits amounts or descriptor code that you have received from the Send Microdeposits request. Once you correctly confirm this, this US Bank Account will be verified and eligible to transfer funds with.
  """
  @spec confirm_microdeposits(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.V2.Core.Vault.UsBankAccount.t()} | {:error, Stripe.Error.t()}
  def confirm_microdeposits(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v2/core/vault/us_bank_accounts/#{id}/confirm_microdeposits",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end

  @doc """
  Create a US Bank Account

  Create a USBankAccount object.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.V2.Core.Vault.UsBankAccount.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v2/core/vault/us_bank_accounts",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end

  @doc """
  List US Bank Accounts

  List USBankAccount objects. Optionally filter by verification status.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.V2.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v2/core/vault/us_bank_accounts",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end

  @doc """
  Retrieve a US Bank Account

  Retrieve a USBankAccount object.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.V2.Core.Vault.UsBankAccount.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v2/core/vault/us_bank_accounts/#{id}",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end

  @doc """
  Send Microdeposits for verification

  Send microdeposits in order to verify your US Bank Account so it is eligible to transfer funds. This will start the verification process and you must Confirm Microdeposits to successfully verify your US Bank Account.
  """
  @spec send_microdeposits(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.V2.Core.Vault.UsBankAccount.t()} | {:error, Stripe.Error.t()}
  def send_microdeposits(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v2/core/vault/us_bank_accounts/#{id}/send_microdeposits",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end

  @doc """
  Unarchive a US Bank Account

  Unarchive a USBankAccount object.
  """
  @spec unarchive(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.V2.Core.Vault.UsBankAccount.t()} | {:error, Stripe.Error.t()}
  def unarchive(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v2/core/vault/us_bank_accounts/#{id}/unarchive",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end

  @doc """
  Update a US Bank Account

  Update a USBankAccount object. This is limited to supplying a previously empty routing_number field.
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.V2.Core.Vault.UsBankAccount.t()} | {:error, Stripe.Error.t()}
  def update(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v2/core/vault/us_bank_accounts/#{id}",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end
end
