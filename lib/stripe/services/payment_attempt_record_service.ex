# File generated from our OpenAPI spec
defmodule Stripe.Services.PaymentAttemptRecordService do
  @moduledoc """
  PaymentAttemptRecord

  A Payment Attempt Record represents an individual attempt at making a payment, on or off Stripe.
  Each payment attempt tries to collect a fixed amount of money from a fixed customer and payment
  method. Payment Attempt Records are attached to Payment Records. Only one attempt per Payment Record
  can have guaranteed funds.
  """
  alias Stripe.Client

  @doc """
  List Payment Attempt Records

  List all the Payment Attempt Records attached to the specified Payment Record.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/payment_attempt_records",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Retrieve a Payment Attempt Record

  Retrieves a Payment Attempt Record with the given ID
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.PaymentAttemptRecord.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/payment_attempt_records/#{id}",
      Keyword.merge(opts, params: params)
    )
  end
end
