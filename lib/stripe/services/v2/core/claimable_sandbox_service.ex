# File generated from our OpenAPI spec
defmodule Stripe.Services.V2.Core.ClaimableSandboxService do
  @moduledoc """
  Claimable Sandbox

  A claimable sandbox is a Stripe sandbox that a user can claim into a new or existing Stripe account
  through an onboarding link. You can prefill it with an email address, sandbox name, and country.
  Claimable sandboxes have 60 days to be claimed. After this expiration time has passed,
  if the sandbox is not claimed, it will be deleted.
  """
  alias Stripe.Client

  @doc """
  Create a Claimable Sandbox

  Create a claimable sandbox with prefilled data. The response includes an onboarding link that lets
  a user claim the sandbox into a new or existing Stripe account.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.V2.Core.ClaimableSandbox.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v2/core/claimable_sandboxes",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end

  @doc """
  Renew a Claimable Sandbox Onboarding Link

  Renew the claimable sandbox onboarding link. This invalidates the existing onboarding link.
  The endpoint only works on a claimable sandbox with status `unclaimed` or `claimed`.
  """
  @spec renew_onboarding_link(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.V2.Core.ClaimableSandbox.t()} | {:error, Stripe.Error.t()}
  def renew_onboarding_link(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v2/core/claimable_sandboxes/#{id}/renew_onboarding_link",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end

  @doc """
  Retrieve a Claimable Sandbox

  Retrieves the details of a claimable sandbox that was previously been created.
  Supply the unique claimable sandbox ID that was returned from your creation request,
  and Stripe will return the corresponding sandbox information.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.V2.Core.ClaimableSandbox.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v2/core/claimable_sandboxes/#{id}",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end
end
