# File generated from our OpenAPI spec
defmodule Stripe.Services.CountrySpecService do
  @moduledoc """
  CountrySpec

  Stripe needs to collect certain pieces of information about each account
  created. These requirements can differ depending on the account's country. The
  Country Specs API makes these rules available to your integration.

  You can also view the information from this API call as [an online
  guide](https://docs.stripe.com/docs/connect/required-verification-information).
  """
  alias Stripe.Client

  @doc """
  List Country Specs

  Lists all Country Spec objects available in the API.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/country_specs", Keyword.merge(opts, params: params))
  end

  @doc """
  Retrieve a Country Spec

  Returns a Country Spec for a given Country code.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.CountrySpec.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, country, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/country_specs/#{country}",
      Keyword.merge(opts, params: params)
    )
  end
end
