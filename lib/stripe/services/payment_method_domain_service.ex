# File generated from our OpenAPI spec
defmodule Stripe.Services.PaymentMethodDomainService do
  @moduledoc """
  PaymentMethodDomainResourcePaymentMethodDomain

  A payment method domain represents a web domain that you have registered with Stripe.
  Stripe Elements use registered payment method domains to control where certain payment methods are shown.

  Related guide: [Payment method domains](https://docs.stripe.com/payments/payment-methods/pmd-registration).
  """
  alias Stripe.Client

  @doc """
  Create a payment method domain

  Creates a payment method domain.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.PaymentMethodDomain.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/payment_method_domains",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  List payment method domains

  Lists the details of existing payment method domains.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/payment_method_domains",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Retrieve a payment method domain

  Retrieves the details of an existing payment method domain.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.PaymentMethodDomain.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, payment_method_domain, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/payment_method_domains/#{payment_method_domain}",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Update a payment method domain

  Updates an existing payment method domain.
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.PaymentMethodDomain.t()} | {:error, Stripe.Error.t()}
  def update(client, payment_method_domain, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/payment_method_domains/#{payment_method_domain}",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Validate an existing payment method domain

  Some payment methods might require additional steps to register a domain. If the requirements weren’t satisfied when the domain was created, the payment method will be inactive on the domain.
  The payment method doesn’t appear in Elements or Embedded Checkout for this domain until it is active.

  To activate a payment method on an existing payment method domain, complete the required registration steps specific to the payment method, and then validate the payment method domain with this endpoint.

  Related guides: [Payment method domains](https://docs.stripe.com/docs/payments/payment-methods/pmd-registration).
  """
  @spec validate(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.PaymentMethodDomain.t()} | {:error, Stripe.Error.t()}
  def validate(client, payment_method_domain, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/payment_method_domains/#{payment_method_domain}/validate",
      Keyword.merge(opts, params: params)
    )
  end
end
