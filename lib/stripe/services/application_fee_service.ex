# File generated from our OpenAPI spec
defmodule Stripe.Services.ApplicationFeeService do
  @moduledoc """
  Application Fee

  When you collect a transaction fee on top of a charge made for your user
  (using [Connect](https://docs.stripe.com/connect)), an `Application Fee` object is created in
  your account. You can list, retrieve, and refund application fees.

  Related guide: [Collecting application fees](https://docs.stripe.com/connect/direct-charges#collect-fees)
  """
  alias Stripe.Client

  @doc """
  List all application fees

  Returns a list of application fees you’ve previously collected. The application fees are returned in sorted order, with the most recent fees appearing first.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/application_fees", Keyword.merge(opts, params: params))
  end

  @doc """
  Retrieve an application fee

  Retrieves the details of an application fee that your account has collected. The same information is returned when refunding the application fee.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.ApplicationFee.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/application_fees/#{id}",
      Keyword.merge(opts, params: params)
    )
  end
end
