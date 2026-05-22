# File generated from our OpenAPI spec
defmodule Stripe.Services.PaymentMethodConfigurationService do
  @moduledoc """
  PaymentMethodConfigResourcePaymentMethodConfiguration

  PaymentMethodConfigurations control which payment methods are displayed to your customers when you don't explicitly specify payment method types. You can have multiple configurations with different sets of payment methods for different scenarios.

  There are two types of PaymentMethodConfigurations. Which is used depends on the [charge type](https://docs.stripe.com/connect/charges):

  **Direct** configurations apply to payments created on your account, including Connect destination charges, Connect separate charges and transfers, and payments not involving Connect.

  **Child** configurations apply to payments created on your connected accounts using direct charges, and charges with the on_behalf_of parameter.

  Child configurations have a `parent` that sets default values and controls which settings connected accounts may override. You can specify a parent ID at payment time, and Stripe will automatically resolve the connected account’s associated child configuration. Parent configurations are [managed in the dashboard](https://dashboard.stripe.com/settings/payment_methods/connected_accounts) and are not available in this API.

  Related guides:
  - [Payment Method Configurations API](https://docs.stripe.com/connect/payment-method-configurations)
  - [Multiple configurations on dynamic payment methods](https://docs.stripe.com/payments/multiple-payment-method-configs)
  - [Multiple configurations for your Connect accounts](https://docs.stripe.com/connect/multiple-payment-method-configurations)
  """
  alias Stripe.Client

  @doc """
  Create a payment method configuration

  Creates a payment method configuration
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.PaymentMethodConfiguration.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/payment_method_configurations",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  List payment method configurations

  List payment method configurations
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/payment_method_configurations",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Retrieve payment method configuration

  Retrieve payment method configuration
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.PaymentMethodConfiguration.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, configuration, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/payment_method_configurations/#{configuration}",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Update payment method configuration

  Update payment method configuration
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.PaymentMethodConfiguration.t()} | {:error, Stripe.Error.t()}
  def update(client, configuration, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/payment_method_configurations/#{configuration}",
      Keyword.merge(opts, params: params)
    )
  end
end
