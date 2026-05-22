defmodule Stripe do
  @moduledoc """
  Elixir SDK and client for the Stripe API.

  ## Client Configuration

  Create a client with explicit options:

      client = Stripe.client("sk_test_...")

      {:ok, customer} = Stripe.Services.CustomerService.create(client, %{
        email: "jane@example.com"
      })

  ## Per-Client Options

      # Connect: act on behalf of a connected account
      client = Stripe.client("sk_test_...", stripe_account: "acct_...")

      # Explicit key with retry policy
      client = Stripe.client("sk_test_other", max_retries: 5)

  ## Supported Client Options

    * `:api_key` - Stripe secret key (required)
    * `:api_version` - Pin a specific Stripe API version
    * `:stripe_account` - Default connected account ID (Stripe Connect)
    * `:client_id` - OAuth client ID
    * `:max_retries` - Maximum retry attempts (default: 2)
    * `:open_timeout` - Connection timeout in ms (default: 30_000)
    * `:read_timeout` - Read timeout in ms (default: 80_000)
    * `:finch` - Custom Finch instance name (default: `Stripe.Finch`)
    * `:transport` - Custom HTTP transport for tests or advanced integrations
  """

  @version Mix.Project.config()[:version]

  @doc "Returns the library version."
  @spec version() :: String.t()
  def version, do: @version

  @doc """
  Returns a child spec for the default Finch pool.

  Add this to your application's supervision tree when using the default
  `Stripe.Finch` pool:

      children = [
        Stripe
      ]

  Pass `finch: MyApp.Finch` to `Stripe.client/2` when using your own Finch
  pool instead.
  """
  @spec child_spec(keyword()) :: Supervisor.child_spec()
  def child_spec(opts \\ []) when is_list(opts) do
    opts
    |> Keyword.put_new(:name, Stripe.Finch)
    |> Finch.child_spec()
  end

  @doc """
  Raises because libraries should not read application configuration.

  Pass an API key explicitly with `Stripe.client/1`, or read credentials from
  your own application's configuration before constructing a client.
  """
  @spec client() :: no_return()
  def client do
    raise ArgumentError, """
    Stripe.client/0 does not read application configuration.

    Pass an API key explicitly:

        Stripe.client("sk_test_...")

    Or read from your own application and pass the value:

        Stripe.client(MyApp.Config.stripe_api_key())
    """
  end

  @doc """
  Create a new Stripe client with an explicit API key.

  ## Examples

      client = Stripe.client("sk_test_...")
      client = Stripe.client("sk_test_...", stripe_account: "acct_...", max_retries: 5)
  """
  @spec client(String.t(), keyword()) :: Stripe.Client.t()
  def client(api_key, opts) when is_binary(api_key) and is_list(opts) do
    opts
    |> Keyword.put(:api_key, api_key)
    |> build_client()
  end

  @doc """
  Create a new Stripe client.

  When given a string, treated as an explicit API key.
  When given a keyword list, the list must include `:api_key`.

  ## Examples

      client = Stripe.client("sk_test_...")
      client = Stripe.client(api_key: "sk_test_...", max_retries: 5)
  """
  @spec client(String.t() | keyword()) :: Stripe.Client.t()
  def client(api_key) when is_binary(api_key), do: client(api_key, [])

  def client(opts) when is_list(opts), do: build_client(opts)

  defp build_client(opts) do
    case Keyword.fetch(opts, :api_key) do
      {:ok, api_key} when is_binary(api_key) and api_key != "" ->
        struct!(Stripe.Client, opts)

      _ ->
        raise ArgumentError, """
        Stripe API key not configured. Pass an API key explicitly:

            Stripe.client("sk_test_...")

        Or with keyword options:

            Stripe.client(api_key: "sk_test_...")
        """
    end
  end
end
