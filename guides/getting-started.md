# Getting Started

## Installation

### With Igniter (recommended for Phoenix)

> **Beta:** The Igniter installer is new and under active testing.
> [Report issues here.](https://github.com/jeffhuen/stripe_elixir/issues)

If your project uses [Igniter](https://hex.pm/packages/igniter), one command
adds the dependency and configures everything:

```bash
mix igniter.install stripe_elixir
```

This will:

- Add API key config to `config/dev.exs`
- Add runtime env var config to `config/runtime.exs`
- Add `Stripe.WebhookPlug` to your endpoint (before `Plug.Parsers`)
- Scaffold a `StripeWebhookController` with event handler stubs
- Add the webhook route to your router

Igniter shows a diff of all changes for your approval before writing anything.
See the [Igniter Installer](igniter-installer.md) guide for a detailed
walkthrough, or the [Webhooks](webhooks.md) guide for customizing the
controller.

### Manual

Add `stripe_elixir` to your dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:stripe_elixir, "~> 0.1.0"}
  ]
end
```

Requires Elixir 1.19+ and OTP 27+.

## Configuration

Add your Stripe credentials to your application config. The recommended
pattern is to use `config/dev.exs` for sandbox keys and `config/runtime.exs`
for production:

```elixir
# config/dev.exs
import Config

config :stripe_elixir,
  api_key: "sk_test_...",
  webhook_secret: "whsec_test_..."
```

```elixir
# config/runtime.exs
import Config

if config_env() == :prod do
  config :stripe_elixir,
    api_key: System.fetch_env!("STRIPE_SECRET_KEY"),
    webhook_secret: System.fetch_env!("STRIPE_WEBHOOK_SECRET")
end
```

### All Config Options

The only required key is `:api_key`. Everything else has sensible defaults:

```elixir
config :stripe_elixir,
  # Required
  api_key: "sk_test_...",

  # Webhooks (required if using WebhookPlug)
  webhook_secret: "whsec_...",

  # Optional — all have defaults if omitted
  api_version: "2026-01-28.clover",  # pin API version (default: latest)
  client_id: "ca_...",               # OAuth client ID (Connect platforms)
  max_retries: 3,                    # default: 2
  open_timeout: 30_000,              # connection timeout ms (default: 30,000)
  read_timeout: 80_000,              # read timeout ms (default: 80,000)
  finch: MyApp.Finch                 # custom Finch pool (default: Stripe.Finch)
```

| Key | Used By | Default | Description |
|-----|---------|---------|-------------|
| `:api_key` | `Stripe.client/0,1,2` | required | Stripe secret key |
| `:webhook_secret` | `Stripe.WebhookPlug` | — | Webhook signing secret |
| `:api_version` | `Stripe.client/0,1,2` | latest | Pin a specific API version |
| `:client_id` | `Stripe.client/0,1,2` | — | OAuth client ID (Connect) |
| `:max_retries` | `Stripe.client/0,1,2` | `2` | Max retry attempts |
| `:open_timeout` | `Stripe.client/0,1,2` | `30_000` | Connection timeout in ms |
| `:read_timeout` | `Stripe.client/0,1,2` | `80_000` | Read timeout in ms |
| `:finch` | `Stripe.client/0,1,2` | `Stripe.Finch` | Custom Finch pool name |

## Creating a Client

Once configured, create a client with no arguments — it reads from your config
automatically:

```elixir
client = Stripe.client()
```

### Overriding Config

Pass options to override any config value for a specific client:

```elixir
# Override just the connected account
client = Stripe.client(stripe_account: "acct_connected")

# Override retries and timeout
client = Stripe.client(max_retries: 5, read_timeout: 120_000)
```

### Explicit API Key

Pass a string to use a different API key (config defaults still apply for
other options):

```elixir
client = Stripe.client("sk_test_other_key")
client = Stripe.client("sk_test_other_key", max_retries: 5)
```

### Config Precedence

Options are resolved in this order (highest wins):

1. Explicit arguments to `client/1` or `client/2`
2. Application config (`config :stripe_elixir, ...`)
3. Struct defaults (e.g. `max_retries: 2`)

Clients are plain structs with no global state — safe for concurrent use
with multiple API keys or connected accounts.

## Making API Calls

Service modules map 1:1 to Stripe's API resources. Each method takes the
client as the first argument:

```elixir
# Create a customer
{:ok, customer} = Stripe.Services.CustomerService.create(client, %{
  email: "jane@example.com"
})

# Retrieve a payment intent
{:ok, intent} = Stripe.Services.PaymentIntentService.retrieve(client, "pi_123")

# List charges
{:ok, charges} = Stripe.Services.ChargeService.list(client, %{"limit" => 10})
```

## Typed Responses

API responses are automatically deserialized into typed Elixir structs:

```elixir
customer.id        #=> "cus_abc123"
customer.email     #=> "jane@example.com"
customer.__struct__ #=> Stripe.Resources.Customer
```

Every resource struct has `@type t` definitions, so Dialyzer catches field
access errors at compile time.

## Error Handling

All API errors return `{:error, %Stripe.Error{}}`:

```elixir
case Stripe.Services.ChargeService.create(client, params) do
  {:ok, charge} ->
    charge

  {:error, %Stripe.Error{type: :card_error} = err} ->
    Logger.warning("Card declined: #{err.message}")

  {:error, %Stripe.Error{type: :rate_limit_error}} ->
    Process.sleep(1_000)
    retry()

  {:error, err} ->
    Logger.error("Stripe error: #{err.message}")
end
```

## Per-Request Overrides

Options can be overridden per-request for Connect or multi-tenant scenarios:

```elixir
Stripe.Services.ChargeService.list(client, %{},
  stripe_account: "acct_connected",
  api_version: "2025-12-18.acacia",
  idempotency_key: "my-key-123"
)
```

## Pagination

### V1 Lists

V1 list endpoints return `%Stripe.ListObject{}` with lazy auto-paging:

```elixir
{:ok, page} = Stripe.Services.CustomerService.list(client, %{"limit" => 100})

page
|> Stripe.ListObject.auto_paging_stream(client)
|> Stream.filter(& &1.email)
|> Enum.take(50)
```

### Search Results

Search endpoints use token-based pagination via `%Stripe.SearchResult{}`:

```elixir
{:ok, result} = Stripe.Services.ChargeService.search(client, %{
  "query" => "amount>1000"
})

result
|> Stripe.SearchResult.auto_paging_stream(client)
|> Enum.to_list()
```

### V2 Lists

V2 endpoints return `%Stripe.V2.ListObject{}` with URL-based pagination:

```elixir
{:ok, page} = Stripe.Services.V2.Core.AccountService.list(client)

page
|> Stripe.V2.ListObject.auto_paging_stream(client)
|> Enum.to_list()
```

## File Uploads

File params are automatically detected and encoded as multipart:

```elixir
{:ok, file} = Stripe.Services.FileService.create(client, %{
  "purpose" => "dispute_evidence",
  "file" => %Stripe.Multipart.FilePath{path: "/path/to/receipt.pdf"}
})
```

## Streaming Responses

For large responses or server-sent events:

```elixir
{:ok, chunks} =
  Stripe.Client.stream_request(client, :get, "/v1/files/file_123/contents",
    fn
      {:data, chunk}, acc -> [chunk | acc]
      _other, acc -> acc
    end,
    []
  )

body = chunks |> Enum.reverse() |> IO.iodata_to_binary()
```

## Raw Requests

Access the raw HTTP response without deserialization:

```elixir
{:ok, resp} = Stripe.Client.raw_request(client, :get, "/v1/charges/ch_123")
resp.status   #=> 200
resp.headers  #=> [{"content-type", "application/json"}, ...]
resp.body     #=> "{\"id\":\"ch_123\",...}"
```

## Retries

Failed requests (network errors, 409, 429, 500, 503) are automatically retried
with exponential backoff and jitter. The library respects Stripe's
`stripe-should-retry` response header.

```elixir
# Via config
config :stripe_elixir, max_retries: 5

# Or per-client
client = Stripe.client(max_retries: 5)
```

Idempotency keys are auto-generated for V2 POST/DELETE requests. For V1, pass
them explicitly:

```elixir
Stripe.Services.ChargeService.create(client, params,
  idempotency_key: "order_123"
)
```

## Next Steps

- [Webhooks](webhooks.md) — receive and verify Stripe events
- [Connect & OAuth](connect-and-oauth.md) — multi-tenant and platform setups
- [Testing](testing.md) — stub HTTP requests in your test suite
- [Telemetry](telemetry.md) — observability and metrics
