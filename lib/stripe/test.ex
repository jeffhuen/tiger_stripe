defmodule Stripe.Test do
  @moduledoc """
  Test helpers for stubbing Stripe HTTP requests.

  Uses ownership-based stubs (via NimbleOwnership) so stubs are scoped to
  the test process and work correctly with `async: true` tests.

  ## Setup

  In your `test/test_helper.exs`:

      Stripe.Test.start()
      ExUnit.start()

  ## Stubbing Requests

      test "creates a charge" do
        Stripe.Test.stub(fn %{method: :post, url: url} ->
          assert url =~ "/v1/charges"
          {200, [], ~s({"id": "ch_123", "object": "charge"})}
        end)

        client = Stripe.client("sk_test_123")

        {:ok, data} =
          Stripe.Client.request(client, :post, "/v1/charges",
            params: %{amount: 2000, currency: "usd"}
          )

        assert data["id"] == "ch_123"
      end

  ## Async Tests

  Stubs are automatically scoped to the calling process. For async tests that
  spawn processes (Tasks, GenServers), use `allow/2` to grant access:

      test "works from a spawned task" do
        Stripe.Test.stub(fn _req -> {200, [], ~s({"ok": true})} end)
        test_pid = self()

        Task.async(fn ->
          Stripe.Test.allow(test_pid, self())
          Stripe.Client.request(client, :get, "/v1/balance")
        end)
        |> Task.await()
      end

  ## Stub Function

  The stub function receives a map with:

    * `:method` - HTTP method atom (`:get`, `:post`, etc.)
    * `:url` - Full URL string
    * `:headers` - List of `{name, value}` tuples
    * `:body` - Request body (string or nil)

  And must return a `{status, headers, body}` tuple:

    * `status` - HTTP status code (integer)
    * `headers` - Response headers as `[{name, value}]`
    * `body` - Response body (string)
  """

  @ownership __MODULE__.Ownership

  @doc "Start the test stub server. Call this in `test/test_helper.exs`."
  @spec start() :: {:ok, pid()}
  def start do
    case NimbleOwnership.start_link(name: @ownership) do
      {:ok, pid} -> {:ok, pid}
      {:error, {:already_started, pid}} -> {:ok, pid}
    end
  end

  @doc """
  Register an HTTP stub for the current test process.

  The stub function will be called instead of making real HTTP requests
  for any `Stripe.Client.request/4` call from this process.

  Ownership is automatically cleaned up when the test exits.
  """
  @spec stub((map() -> {integer(), list(), binary()})) :: :ok
  def stub(fun) when is_function(fun, 1) do
    pid = self()

    case NimbleOwnership.get_and_update(@ownership, pid, :http, fn _prev -> {:ok, fun} end) do
      {:ok, _prev} -> :ok
      {:error, reason} -> raise "Failed to register stub: #{inspect(reason)}"
    end

    ExUnit.Callbacks.on_exit({__MODULE__, :http}, fn ->
      NimbleOwnership.cleanup_owner(@ownership, pid)
    end)

    :ok
  end

  @doc """
  Allow `child_pid` to use the stub registered by `owner_pid`.

  Use this when your test spawns processes that make Stripe API calls.
  """
  @spec allow(pid(), pid()) :: :ok
  def allow(owner_pid \\ self(), child_pid) do
    case NimbleOwnership.allow(@ownership, owner_pid, child_pid, :http) do
      :ok -> :ok
      {:error, reason} -> raise "Failed to allow stub access: #{inspect(reason)}"
    end
  end

  @doc false
  @spec fetch_stub() :: {:ok, function()} | :error
  def fetch_stub do
    callers = [self()] ++ (Process.get(:"$callers") || [])

    with pid when is_pid(pid) <- GenServer.whereis(@ownership),
         owner when is_pid(owner) <- find_owner(callers),
         %{http: fun} when is_function(fun) <- NimbleOwnership.get_owned(@ownership, owner) do
      {:ok, fun}
    else
      _ -> :error
    end
  end

  defp find_owner(callers) do
    case NimbleOwnership.fetch_owner(@ownership, callers, :http) do
      {:ok, pid} -> pid
      {:shared_owner, pid} -> pid
      :error -> nil
    end
  end
end
