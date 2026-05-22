# File generated from our OpenAPI spec
defmodule Stripe.Services.PaymentRecordService do
  @moduledoc """
  PaymentRecord

  A Payment Record is a resource that allows you to represent payments that occur on- or off-Stripe.
  For example, you can create a Payment Record to model a payment made on a different payment processor,
  in order to mark an Invoice as paid and a Subscription as active. Payment Records consist of one or
  more Payment Attempt Records, which represent individual attempts made on a payment network.
  """
  alias Stripe.Client

  @doc """
  Report a payment

  Report a new Payment Record. You may report a Payment Record as it is
  initialized and later report updates through the other report_* methods, or report Payment
  Records in a terminal state directly, through this method.
  """
  @spec report_payment(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.PaymentRecord.t()} | {:error, Stripe.Error.t()}
  def report_payment(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/payment_records/report_payment",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Report a payment attempt

  Report a new payment attempt on the specified Payment Record. A new payment
  attempt can only be specified if all other payment attempts are canceled or failed.
  """
  @spec report_payment_attempt(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.PaymentRecord.t()} | {:error, Stripe.Error.t()}
  def report_payment_attempt(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/payment_records/#{id}/report_payment_attempt",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Report payment attempt canceled

  Report that the most recent payment attempt on the specified Payment Record
  was canceled.
  """
  @spec report_payment_attempt_canceled(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.PaymentRecord.t()} | {:error, Stripe.Error.t()}
  def report_payment_attempt_canceled(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/payment_records/#{id}/report_payment_attempt_canceled",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Report payment attempt failed

  Report that the most recent payment attempt on the specified Payment Record
  failed or errored.
  """
  @spec report_payment_attempt_failed(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.PaymentRecord.t()} | {:error, Stripe.Error.t()}
  def report_payment_attempt_failed(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/payment_records/#{id}/report_payment_attempt_failed",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Report payment attempt guaranteed

  Report that the most recent payment attempt on the specified Payment Record
  was guaranteed.
  """
  @spec report_payment_attempt_guaranteed(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.PaymentRecord.t()} | {:error, Stripe.Error.t()}
  def report_payment_attempt_guaranteed(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/payment_records/#{id}/report_payment_attempt_guaranteed",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Report payment attempt informational

  Report informational updates on the specified Payment Record.
  """
  @spec report_payment_attempt_informational(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.PaymentRecord.t()} | {:error, Stripe.Error.t()}
  def report_payment_attempt_informational(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/payment_records/#{id}/report_payment_attempt_informational",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Report a refund

  Report that the most recent payment attempt on the specified Payment Record
  was refunded.
  """
  @spec report_refund(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.PaymentRecord.t()} | {:error, Stripe.Error.t()}
  def report_refund(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/payment_records/#{id}/report_refund",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Retrieve a Payment Record

  Retrieves a Payment Record with the given ID
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.PaymentRecord.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, id, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/payment_records/#{id}", Keyword.merge(opts, params: params))
  end
end
