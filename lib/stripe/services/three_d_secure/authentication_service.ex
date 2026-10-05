# File generated from our OpenAPI spec
defmodule Stripe.Services.ThreeDSecure.AuthenticationService do
  @moduledoc """
  3DS Authentication

  The Standalone 3DS API allows you to run EMV 3D Secure (3DS) authentication using Stripe while authorizing the payment with any PSP.

  Related guide: [Standalone 3DS](https://stripe.com/payments/3d-secure/standalone-3d-secure)
  """
  alias Stripe.Client

  @doc """
  Cancel a 3DS Authentication

  This endpoint cancels a 3DS Authentication. You can cancel a 3DS Authentication object when it’s in a non-final status:
  `requires_submission` or `requires_challenge`.
  """
  @spec cancel(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.ThreeDSecure.Authentication.t()} | {:error, Stripe.Error.t()}
  def cancel(client, authentication, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/three_d_secure/authentications/#{authentication}/cancel",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Create a 3DS Authentication

  This endpoint creates a 3DS Authentication. Refer to the [Create a 3DS Authentication object section of the Standalone 3DS guide](https://stripe.com/payments/3d-secure/standalone-3d-secure#create-a-3ds-authentication-object) for more information.

  You can pass the submit parameter to automatically submit the 3DS Authentication object when you create it. Refer to the [Submit at creation section of the Standalone 3DS guide](https://stripe.com/payments/3d-secure/standalone-3d-secure#submit-at-creation) for more information.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.ThreeDSecure.Authentication.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/three_d_secure/authentications",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  List all 3D Secure Authentications

  Returns a list of 3D Secure Authentications.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/three_d_secure/authentications",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Retrieve a 3DS Authentication

  This endpoint retrieves a 3DS Authentication.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.ThreeDSecure.Authentication.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, authentication, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/three_d_secure/authentications/#{authentication}",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Submit a 3DS Authentication

  This endpoint submits a 3DS Authentication. You can submit a 3DS Authentication object when it has status `requires_submission`. Refer to the [Submit the 3DS Authentication object section of the Standalone 3DS guide](https://stripe.com/payments/3d-secure/standalone-3d-secure#submit-the-3ds-authentication-object) for more information.
  """
  @spec submit(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.ThreeDSecure.Authentication.t()} | {:error, Stripe.Error.t()}
  def submit(client, authentication, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/three_d_secure/authentications/#{authentication}/submit",
      Keyword.merge(opts, params: params)
    )
  end
end
