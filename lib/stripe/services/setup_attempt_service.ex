# File generated from our OpenAPI spec
defmodule Stripe.Services.SetupAttemptService do
  @moduledoc """
  PaymentFlowsSetupIntentSetupAttempt

  A SetupAttempt describes one attempted confirmation of a SetupIntent,
  whether that confirmation is successful or unsuccessful. You can use
  SetupAttempts to inspect details of a specific attempt at setting up a
  payment method using a SetupIntent.
  """
  alias Stripe.Client

  @doc """
  List all SetupAttempts

  Returns a list of SetupAttempts that associate with a provided SetupIntent.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/setup_attempts", Keyword.merge(opts, params: params))
  end
end
