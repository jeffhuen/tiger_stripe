# File generated from our OpenAPI spec
defmodule Stripe.Services.TokenService do
  @moduledoc """
  Token

  Tokenization is the process Stripe uses to collect sensitive card or bank
  account details, or personally identifiable information (PII), directly from
  your customers in a secure manner. A token representing this information is
  returned to your server to use. Use our
  [recommended payments integrations](https://docs.stripe.com/payments) to perform this process
  on the client-side. This guarantees that no sensitive card data touches your server,
  and allows your integration to operate in a PCI-compliant way.

  If you can't use client-side tokenization, you can also create tokens using
  the API with either your publishable or secret API key. If
  your integration uses this method, you're responsible for any PCI compliance
  that it might require, and you must keep your secret API key safe. Unlike with
  client-side tokenization, your customer's information isn't sent directly to
  Stripe, so we can't determine how it's handled or stored.

  You can't store or use tokens more than once. To store card or bank account
  information for later use, create [Customer](https://docs.stripe.com/api#customers)
  objects or [External accounts](https://stripe.com/api#external_accounts).
  [Radar](https://docs.stripe.com/radar), our integrated solution for automatic fraud protection,
  performs best with integrations that use client-side tokenization.
  """
  alias Stripe.Client

  @doc """
  Create a bank account token

  Creates a single-use token that represents a bank account’s details.
  You can use this token with any v1 API method in place of a bank account dictionary. You can only use this token once. To do so, attach it to a [connected account](#accounts) where [controller.requirement_collection](https://docs.stripe.com/api/accounts/object#account_object-controller-requirement_collection) is `application`, which includes Custom accounts.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Token.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v1/tokens", Keyword.merge(opts, params: params))
  end

  @doc """
  Retrieve a token

  Retrieves the token with the given ID.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Token.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, token, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/tokens/#{token}", Keyword.merge(opts, params: params))
  end
end
