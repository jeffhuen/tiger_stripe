# File generated from our OpenAPI spec
defmodule Stripe.Services.TestHelpers.TestClockService do
  @moduledoc """
  TestClock

  A test clock enables deterministic control over objects in testmode. With a test clock, you can create
  objects at a frozen time in the past or future, and advance to a specific future time to observe webhooks and state changes. After the clock advances,
  you can either validate the current state of your scenario (and test your assumptions), change the current state of your scenario (and test more complex scenarios), or keep advancing forward in time.
  """
  alias Stripe.Client

  @doc """
  Advance a test clock

  Starts advancing a test clock to a specified time in the future. Advancement is done when status changes to `Ready`.
  """
  @spec advance(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.TestHelpers.TestClock.t()} | {:error, Stripe.Error.t()}
  def advance(client, test_clock, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/test_helpers/test_clocks/#{test_clock}/advance",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Create a test clock

  Creates a new test clock that can be attached to new customers and quotes.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.TestHelpers.TestClock.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/test_helpers/test_clocks",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Delete a test clock

  Deletes a test clock.
  """
  @spec delete(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.TestHelpers.TestClock.t()} | {:error, Stripe.Error.t()}
  def delete(client, test_clock, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :delete,
      "/v1/test_helpers/test_clocks/#{test_clock}",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  List all test clocks

  Returns a list of your test clocks.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/test_helpers/test_clocks",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Retrieve a test clock

  Retrieves a test clock.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.TestHelpers.TestClock.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, test_clock, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/test_helpers/test_clocks/#{test_clock}",
      Keyword.merge(opts, params: params)
    )
  end
end
