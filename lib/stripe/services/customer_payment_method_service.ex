# File generated from our OpenAPI spec
defmodule Stripe.Services.CustomerPaymentMethodService do
  @moduledoc """
  CustomerPaymentMethod API operations.
  """
  alias Stripe.Client

  @doc """
  List a Customer's PaymentMethods

  Returns a list of PaymentMethods for a given Customer
  """
  @spec list_payment_methods(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list_payment_methods(client, customer, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/customers/#{customer}/payment_methods",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Retrieve a Customer's PaymentMethod

  Retrieves a PaymentMethod object for a given Customer.
  """
  @spec retrieve_payment_method(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.PaymentMethod.t()} | {:error, Stripe.Error.t()}
  def retrieve_payment_method(client, customer, payment_method, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/customers/#{customer}/payment_methods/#{payment_method}",
      Keyword.merge(opts, params: params)
    )
  end
end
