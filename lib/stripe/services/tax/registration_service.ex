# File generated from our OpenAPI spec
defmodule Stripe.Services.Tax.RegistrationService do
  @moduledoc """
  TaxProductRegistrationsResourceTaxRegistration

  A Tax `Registration` lets us know that your business is registered to collect tax on payments within a region, enabling you to [automatically collect tax](https://docs.stripe.com/tax).

  Stripe doesn't register on your behalf with the relevant authorities when you create a Tax `Registration` object. For more information on how to register to collect tax, see [our guide](https://docs.stripe.com/tax/registering).

  Related guide: [Using the Registrations API](https://docs.stripe.com/tax/registrations-api)
  """
  alias Stripe.Client

  @doc """
  Create a registration

  Creates a new Tax `Registration` object.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Tax.Registration.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v1/tax/registrations", Keyword.merge(opts, params: params))
  end

  @doc """
  List registrations

  Returns a list of Tax `Registration` objects.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/tax/registrations", Keyword.merge(opts, params: params))
  end

  @doc """
  Retrieve a registration

  Returns a Tax `Registration` object.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Tax.Registration.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/tax/registrations/#{id}",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Update a registration

  Updates an existing Tax `Registration` object.

  A registration cannot be deleted after it has been created. If you wish to end a registration you may do so by setting `expires_at`.
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Tax.Registration.t()} | {:error, Stripe.Error.t()}
  def update(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/tax/registrations/#{id}",
      Keyword.merge(opts, params: params)
    )
  end
end
