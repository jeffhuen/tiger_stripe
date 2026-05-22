# File generated from our OpenAPI spec
defmodule Stripe.Services.Radar.EarlyFraudWarningService do
  @moduledoc """
  RadarEarlyFraudWarning

  An early fraud warning indicates that the card issuer has notified us that a
  charge may be fraudulent.

  Related guide: [Early fraud warnings](https://docs.stripe.com/disputes/measuring#early-fraud-warnings)
  """
  alias Stripe.Client

  @doc """
  List all early fraud warnings

  Returns a list of early fraud warnings.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/radar/early_fraud_warnings",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Retrieve an early fraud warning

  Retrieves the details of an early fraud warning that has previously been created. 

  Please refer to the [early fraud warning](#early_fraud_warning_object) object reference for more details.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Radar.EarlyFraudWarning.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, early_fraud_warning, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/radar/early_fraud_warnings/#{early_fraud_warning}",
      Keyword.merge(opts, params: params)
    )
  end
end
