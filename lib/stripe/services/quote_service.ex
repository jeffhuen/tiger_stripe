# File generated from our OpenAPI spec
defmodule Stripe.Services.QuoteService do
  @moduledoc """
  Quote

  A Quote is a way to model prices that you'd like to provide to a customer.
  Once accepted, it will automatically create an invoice, subscription or subscription schedule.
  """
  alias Stripe.Client

  @doc """
  Accept a quote

  Accepts the specified quote.
  """
  @spec accept(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Quote.t()} | {:error, Stripe.Error.t()}
  def accept(client, quote, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/quotes/#{quote}/accept",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Cancel a quote

  Cancels the quote.
  """
  @spec cancel(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Quote.t()} | {:error, Stripe.Error.t()}
  def cancel(client, quote, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/quotes/#{quote}/cancel",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Create a quote

  A quote models prices and services for a customer. Default options for `header`, `description`, `footer`, and `expires_at` can be set in the dashboard via the [quote template](https://dashboard.stripe.com/settings/billing/quote).
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Quote.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v1/quotes", Keyword.merge(opts, params: params))
  end

  @doc """
  Finalize a quote

  Finalizes the quote.
  """
  @spec finalize_quote(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Quote.t()} | {:error, Stripe.Error.t()}
  def finalize_quote(client, quote, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/quotes/#{quote}/finalize",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  List all quotes

  Returns a list of your quotes.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/quotes", Keyword.merge(opts, params: params))
  end

  @doc """
  Download quote PDF

  Download the PDF for a finalized quote. Explanation for special handling can be found [here](https://docs.stripe.com/quotes/overview#quote_pdf)
  """
  @spec pdf(Client.t(), String.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
  def pdf(client, quote, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/quotes/#{quote}/pdf", Keyword.merge(opts, params: params))
  end

  @doc """
  Retrieve a quote

  Retrieves the quote with the given ID.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Quote.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, quote, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/quotes/#{quote}", Keyword.merge(opts, params: params))
  end

  @doc """
  Update a quote

  A quote models prices and services for a customer.
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Quote.t()} | {:error, Stripe.Error.t()}
  def update(client, quote, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v1/quotes/#{quote}", Keyword.merge(opts, params: params))
  end
end
