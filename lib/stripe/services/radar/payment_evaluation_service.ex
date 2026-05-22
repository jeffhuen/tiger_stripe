# File generated from our OpenAPI spec
defmodule Stripe.Services.Radar.PaymentEvaluationService do
  @moduledoc """
  InsightsResourcesPaymentEvaluation

  Payment Evaluations represent the risk lifecycle of an externally processed payment. It includes the Radar risk score from Stripe, payment outcome taken by the merchant or processor, and any post transaction events, such as refunds or disputes. See the [Radar API guide](https://stripe.com/radar/multiprocessor) for integration steps.
  """
  alias Stripe.Client

  @doc """
  Create a Payment Evaluation

  Request a Radar API fraud risk score from Stripe for a payment before sending it for external processor authorization.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Radar.PaymentEvaluation.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/radar/payment_evaluations",
      Keyword.merge(opts, params: params)
    )
  end
end
