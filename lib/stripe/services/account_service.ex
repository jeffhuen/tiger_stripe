# File generated from our OpenAPI spec
defmodule Stripe.Services.AccountService do
  @moduledoc """
  Account

  For new integrations, we recommend using the [Accounts v2 API](https://docs.stripe.com/api/v2/core/accounts), in place of /v1/accounts and /v1/customers to represent a user.

  This is an object representing a Stripe account. You can retrieve it to see
  properties on the account like its current requirements or if the account is
  enabled to make live charges or receive payouts.

  For accounts where [controller.requirement_collection](https://docs.stripe.com/api/accounts/object#account_object-controller-requirement_collection)
  is `application`, which includes Custom accounts, the properties below are always
  returned.

  For accounts where [controller.requirement_collection](https://docs.stripe.com/api/accounts/object#account_object-controller-requirement_collection)
  is `stripe`, which includes Standard and Express accounts, some properties are only returned
  until you create an [Account Link](https://docs.stripe.com/api/account_links) or [Account Session](https://docs.stripe.com/api/account_sessions)
  to start Connect Onboarding. Learn about the [differences between accounts](https://stripe.com/connect/accounts).
  """
  alias Stripe.Client

  @doc """
  Create an account

  With [Connect](https://docs.stripe.com/docs/connect), you can create Stripe accounts for your users.
  To do this, you’ll first need to [register your platform](https://dashboard.stripe.com/account/applications/settings).

  If you’ve already collected information for your connected accounts, you [can prefill that information](https://stripe.com/connect/marketplace/tasks/create#prefill-account-information) when
  creating the account. Connect Onboarding won’t ask for the prefilled information during account onboarding.
  You can prefill any information on the account.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Account.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v1/accounts", Keyword.merge(opts, params: params))
  end

  @doc """
  Delete an account

  With [Connect](https://stripe.com/connect), you can delete accounts you manage.

  Test-mode accounts can be deleted at any time.

  Live-mode accounts that have access to the standard dashboard and Stripe is responsible for negative account balances cannot be deleted, which includes Standard accounts. All other Live-mode accounts, can be deleted when all [balances](https://docs.stripe.com/api/balance/balance_object) are zero.

  If you want to delete your own account, use the [account information tab in your account settings](https://dashboard.stripe.com/settings/account) instead.
  """
  @spec delete(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Account.t()} | {:error, Stripe.Error.t()}
  def delete(client, account, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :delete,
      "/v1/accounts/#{account}",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  List all connected accounts

  Returns a list of accounts connected to your platform via [Connect](https://docs.stripe.com/docs/connect). If you’re not a platform, the list is empty.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/accounts", Keyword.merge(opts, params: params))
  end

  @doc """
  Reject an account

  With [Connect](https://stripe.com/connect), you can reject accounts that you have flagged as suspicious.

  Only accounts where your platform is liable for negative account balances, which includes Custom and Express accounts, can be rejected.
  """
  @spec reject(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Account.t()} | {:error, Stripe.Error.t()}
  def reject(client, account, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/accounts/#{account}/reject",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Retrieve account

  Retrieves the details of an account.
  """
  @spec retrieve(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Account.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, params, opts) do
    Client.request(client, :get, "/v1/account", Keyword.merge(opts, params: params))
  end

  @doc """
  Retrieve account

  Retrieves the details of an account.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Account.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, account, params, opts) do
    Client.request(client, :get, "/v1/accounts/#{account}", Keyword.merge(opts, params: params))
  end

  @doc """
  Unreject an account

  With Connect, you can unreject accounts that you have previously rejected.

  Only accounts that were rejected by your platform can be unrejected. This API cannot be used to unreject accounts that were rejected by Stripe.

  Unreject will only enable charges and/or payouts if there are no other restrictions other than those placed by a previous rejection. If you have separately paused charges and/or payouts outside of rejection, those pauses will remain in place after unrejection.
  """
  @spec unreject(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Account.t()} | {:error, Stripe.Error.t()}
  def unreject(client, account, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/accounts/#{account}/unreject",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Update an account

  Updates a [connected account](https://stripe.com/connect/accounts) by setting the values of the parameters passed. Any parameters not provided are
  left unchanged.

  For accounts where [controller.requirement_collection](https://docs.stripe.com/api/accounts/object#account_object-controller-requirement_collection)
  is `application`, which includes Custom accounts, you can update any information on the account.

  For accounts where [controller.requirement_collection](https://docs.stripe.com/api/accounts/object#account_object-controller-requirement_collection)
  is `stripe`, which includes Standard and Express accounts, you can update all information until you create
  an [Account Link](https://docs.stripe.com/api/account_links) or [Account Session](https://docs.stripe.com/api/account_sessions) to start Connect onboarding,
  after which some properties can no longer be updated.

  To update your own account, use the [Dashboard](https://dashboard.stripe.com/settings/account). Refer to our
  [Connect](https://docs.stripe.com/docs/connect/updating-accounts) documentation to learn more about updating accounts.
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Account.t()} | {:error, Stripe.Error.t()}
  def update(client, account, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v1/accounts/#{account}", Keyword.merge(opts, params: params))
  end
end
