# File generated from our OpenAPI spec
defmodule Stripe.Services.Terminal.ReaderService do
  @moduledoc """
  TerminalReaderReader

  A Reader represents a physical device for accepting payment details.

  Related guide: [Connecting to a reader](https://docs.stripe.com/terminal/payments/connect-reader)
  """
  alias Stripe.Client

  @doc """
  Cancel the current reader action

  Cancels the current reader action. See [Programmatic Cancellation](https://docs.stripe.com/docs/terminal/payments/collect-card-payment?terminal-sdk-platform=server-driven#programmatic-cancellation) for more details.
  """
  @spec cancel_action(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Terminal.Reader.t()} | {:error, Stripe.Error.t()}
  def cancel_action(client, reader, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/terminal/readers/#{reader}/cancel_action",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Collect inputs using a Reader

  Initiates an [input collection flow](https://docs.stripe.com/docs/terminal/features/collect-inputs) on a Reader to display input forms and collect information from your customers.
  """
  @spec collect_inputs(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Terminal.Reader.t()} | {:error, Stripe.Error.t()}
  def collect_inputs(client, reader, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/terminal/readers/#{reader}/collect_inputs",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Hand off a PaymentIntent to a Reader and collect card details

  Initiates a payment flow on a Reader and updates the PaymentIntent with card details before manual confirmation. See [Collecting a Payment method](https://docs.stripe.com/docs/terminal/payments/collect-card-payment?terminal-sdk-platform=server-driven&process=inspect#collect-a-paymentmethod) for more details.
  """
  @spec collect_payment_method(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Terminal.Reader.t()} | {:error, Stripe.Error.t()}
  def collect_payment_method(client, reader, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/terminal/readers/#{reader}/collect_payment_method",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Confirm a PaymentIntent on the Reader

  Finalizes a payment on a Reader. See [Confirming a Payment](https://docs.stripe.com/docs/terminal/payments/collect-card-payment?terminal-sdk-platform=server-driven&process=inspect#confirm-the-paymentintent) for more details.
  """
  @spec confirm_payment_intent(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Terminal.Reader.t()} | {:error, Stripe.Error.t()}
  def confirm_payment_intent(client, reader, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/terminal/readers/#{reader}/confirm_payment_intent",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Create a Reader

  Creates a new `Reader` object.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Terminal.Reader.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v1/terminal/readers", Keyword.merge(opts, params: params))
  end

  @doc """
  Delete a Reader

  Deletes a `Reader` object.
  """
  @spec delete(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Terminal.Reader.t()} | {:error, Stripe.Error.t()}
  def delete(client, reader, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :delete,
      "/v1/terminal/readers/#{reader}",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  List all Readers

  Returns a list of `Reader` objects.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/terminal/readers", Keyword.merge(opts, params: params))
  end

  @doc """
  Hand-off a PaymentIntent to a Reader

  Initiates a payment flow on a Reader. See [process the payment](https://docs.stripe.com/docs/terminal/payments/collect-card-payment?terminal-sdk-platform=server-driven&process=immediately#process-payment) for more details.
  """
  @spec process_payment_intent(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Terminal.Reader.t()} | {:error, Stripe.Error.t()}
  def process_payment_intent(client, reader, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/terminal/readers/#{reader}/process_payment_intent",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Hand-off a SetupIntent to a Reader

  Initiates a SetupIntent flow on a Reader. See [Save directly without charging](https://docs.stripe.com/docs/terminal/features/saving-payment-details/save-directly) for more details.
  """
  @spec process_setup_intent(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Terminal.Reader.t()} | {:error, Stripe.Error.t()}
  def process_setup_intent(client, reader, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/terminal/readers/#{reader}/process_setup_intent",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Refund a Charge or a PaymentIntent in-person

  Initiates an in-person refund on a Reader. See [Refund an Interac Payment](https://docs.stripe.com/docs/terminal/payments/regional?integration-country=CA#refund-an-interac-payment) for more details.
  """
  @spec refund_payment(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Terminal.Reader.t()} | {:error, Stripe.Error.t()}
  def refund_payment(client, reader, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/terminal/readers/#{reader}/refund_payment",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Retrieve a Reader

  Retrieves a `Reader` object.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Terminal.Reader.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, reader, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/terminal/readers/#{reader}",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Set reader display

  Sets the reader display to show [cart details](https://docs.stripe.com/docs/terminal/features/display).
  """
  @spec set_reader_display(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Terminal.Reader.t()} | {:error, Stripe.Error.t()}
  def set_reader_display(client, reader, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/terminal/readers/#{reader}/set_reader_display",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Update a Reader

  Updates a `Reader` object by setting the values of the parameters passed. Any parameters not provided will be left unchanged.
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Terminal.Reader.t()} | {:error, Stripe.Error.t()}
  def update(client, reader, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/terminal/readers/#{reader}",
      Keyword.merge(opts, params: params)
    )
  end
end
