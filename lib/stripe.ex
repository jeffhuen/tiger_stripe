defmodule Stripe do
  @moduledoc """
  Elixir SDK and client for the Stripe API.

  ## Configuration

  Add your Stripe credentials to your application config:

      # config/runtime.exs
      config :tiger_stripe,
        api_key: System.fetch_env!("STRIPE_SECRET_KEY"),
        webhook_secret: System.fetch_env!("STRIPE_WEBHOOK_SECRET")

  Then create a client — it picks up your config automatically:

      client = Stripe.client()

      {:ok, customer} = Stripe.Services.CustomerService.create(client, %{
        email: "jane@example.com"
      })

  ## Per-Client Overrides

  Override any config option when creating a client:

      # Connect: act on behalf of a connected account
      client = Stripe.client(stripe_account: "acct_...")

      # Explicit key (ignores config)
      client = Stripe.client("sk_test_other", max_retries: 5)

  ## Config Precedence

  Options are resolved in this order (highest wins):

    1. Explicit arguments to `client/1` or `client/2`
    2. Application config (`config :tiger_stripe, ...`)
    3. Struct defaults (e.g. `max_retries: 2`)

  ## Supported Config Keys

  Client options (used by `Stripe.client/0,1,2`):

    * `:api_key` - Stripe secret key (required)
    * `:api_version` - Pin a specific Stripe API version
    * `:stripe_account` - Default connected account ID (Stripe Connect)
    * `:client_id` - OAuth client ID
    * `:max_retries` - Maximum retry attempts (default: 2)
    * `:open_timeout` - Connection timeout in ms (default: 30_000)
    * `:read_timeout` - Read timeout in ms (default: 80_000)
    * `:finch` - Custom Finch instance name (default: `Stripe.Finch`)

  Non-client options (used by other modules):

    * `:webhook_secret` - Webhook signing secret (used by `Stripe.WebhookPlug`)
  """

  @version Mix.Project.config()[:version]

  # Fields that are valid on %Stripe.Client{}
  @client_keys Map.keys(%Stripe.Client{}) -- [:__struct__]

  @doc "Returns the library version."
  @spec version() :: String.t()
  def version, do: @version

  @doc """
  Create a new Stripe client from application config.

  Reads `:api_key` and other options from `config :tiger_stripe`.
  Raises if `:api_key` is not configured.

  ## Example

      # config/runtime.exs
      config :tiger_stripe, api_key: System.fetch_env!("STRIPE_SECRET_KEY")

      # Then in your code:
      client = Stripe.client()
  """
  @spec client() :: Stripe.Client.t()
  def client do
    config = config_defaults()

    case Keyword.fetch(config, :api_key) do
      {:ok, api_key} when is_binary(api_key) and api_key != "" ->
        struct!(Stripe.Client, config)

      _ ->
        raise ArgumentError, """
        Stripe API key not configured. Add to your config:

            config :tiger_stripe, api_key: "sk_test_..."

        Or pass it explicitly:

            Stripe.client("sk_test_...")
        """
    end
  end

  @doc """
  Create a new Stripe client with an explicit API key.

  Application config provides defaults for all other options.

  ## Examples

      client = Stripe.client("sk_test_...")
      client = Stripe.client("sk_test_...", stripe_account: "acct_...", max_retries: 5)
  """
  @spec client(String.t(), keyword()) :: Stripe.Client.t()
  def client(api_key, opts) when is_binary(api_key) do
    config = config_defaults()
    merged = Keyword.merge(config, opts) |> Keyword.put(:api_key, api_key)
    struct!(Stripe.Client, merged)
  end

  @doc """
  Create a new Stripe client with overrides.

  When given a string, treated as an explicit API key.
  When given a keyword list, merges with application config.

  ## Examples

      # Explicit API key
      client = Stripe.client("sk_test_...")

      # Config defaults + overrides
      client = Stripe.client(stripe_account: "acct_...", max_retries: 5)
  """
  @spec client(String.t() | keyword()) :: Stripe.Client.t()
  def client(api_key) when is_binary(api_key) do
    client(api_key, [])
  end

  def client(opts) when is_list(opts) do
    config = config_defaults()
    merged = Keyword.merge(config, opts)

    case Keyword.fetch(merged, :api_key) do
      {:ok, api_key} when is_binary(api_key) and api_key != "" ->
        struct!(Stripe.Client, merged)

      _ ->
        raise ArgumentError, """
        Stripe API key not configured. Add to your config:

            config :tiger_stripe, api_key: "sk_test_..."

        Or pass it explicitly:

            Stripe.client("sk_test_...")
        """
    end
  end

  # Read application config and filter to valid Client struct fields.
  defp config_defaults do
    Application.get_all_env(:tiger_stripe)
    |> Keyword.take(@client_keys)
  end
end
