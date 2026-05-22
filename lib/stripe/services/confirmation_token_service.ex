# File generated from our OpenAPI spec
defmodule Stripe.Services.ConfirmationTokenService do
  @moduledoc """
  ConfirmationTokensResourceConfirmationToken

  ConfirmationTokens help transport client side data collected by Stripe JS over
  to your server for confirming a PaymentIntent or SetupIntent. If the confirmation
  is successful, values present on the ConfirmationToken are written onto the Intent.

  To learn more about how to use ConfirmationToken, visit the related guides:
  - [Finalize payments on the server](https://docs.stripe.com/payments/finalize-payments-on-the-server)
  - [Build two-step confirmation](https://docs.stripe.com/payments/build-a-two-step-confirmation).
  """
  alias Stripe.Client

  @doc """
  Retrieve a ConfirmationToken

  Retrieves an existing ConfirmationToken object
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.ConfirmationToken.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, confirmation_token, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/confirmation_tokens/#{confirmation_token}",
      Keyword.merge(opts, params: params)
    )
  end
end
