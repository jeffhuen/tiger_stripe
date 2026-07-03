# Getting Started

## Installation

### With Igniter (recommended for Phoenix)

> **Beta:** The Igniter installer is new and under active testing.
> [Report issues here.](https://github.com/jeffhuen/tiger_stripe/issues)

If your project uses [Igniter](https://hex.pm/packages/igniter), one command
adds the dependency and configures everything:

```bash
mix igniter.install tiger_stripe
```

This will:

- Add a small Stripe wrapper module that reads your app's environment
- Add the default `Stripe.Finch` pool to your supervision tree
- Add `Stripe.WebhookPlug` to your endpoint (before `Plug.Parsers`)
- Scaffold a `StripeWebhookController` with event handler stubs
- Add the webhook route to your router

Igniter shows a diff of all changes for your approval before writing anything.
See the [Igniter Installer](igniter-installer.md) guide for a detailed
walkthrough, or the [Webhooks](webhooks.md) guide for customizing the
controller.

### Manual

Add `tiger_stripe` to your dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:tiger_stripe, "~> 0.4.0"}
  ]
end
```

Requires Elixir 1.19+ and OTP 27+.

## Client Setup

TigerStripe does not read library application environment. Start the default Finch pool
in your application supervision tree, then pass credentials explicitly when
constructing a client:

```elixir
# lib/my_app/application.ex
children = [
  Stripe
]
```

```elixir
# lib/my_app/stripe.ex
defmodule MyApp.Stripe do
  def client do
    Stripe.client(secret_key())
  end

  def client(opts) do
    secret_key()
    |> Stripe.client(opts)
  end

  def webhook_secret do
    System.fetch_env!("STRIPE_WEBHOOK_SECRET")
  end

  defp secret_key do
    System.fetch_env!("STRIPE_SECRET_KEY")
  end
end
```

### Client Options

The only required value is the API key. Everything else has sensible defaults:

```elixir
Stripe.client("sk_test_...",
  api_version: "2026-06-24.dahlia",  # pin API version (default: latest)
  client_id: "ca_...",               # OAuth client ID (Connect platforms)
  max_retries: 3,                    # default: 2
  open_timeout: 30_000,              # connection timeout ms (default: 30,000)
  read_timeout: 80_000,              # read timeout ms (default: 80,000)
  finch: MyApp.Finch                 # custom Finch pool (default: Stripe.Finch)
)
```

| Key | Used By | Default | Description |
|-----|---------|---------|-------------|
| API key | `Stripe.client/1,2` | required | Stripe secret key |
| `:api_version` | `Stripe.client/1,2` | latest | Pin a specific API version |
| `:client_id` | `Stripe.client/1,2` | — | OAuth client ID (Connect) |
| `:max_retries` | `Stripe.client/1,2` | `2` | Max retry attempts |
| `:open_timeout` | `Stripe.client/1,2` | `30_000` | Connection timeout in ms |
| `:read_timeout` | `Stripe.client/1,2` | `80_000` | Read timeout in ms |
| `:finch` | `Stripe.client/1,2` | `Stripe.Finch` | Custom Finch pool name |

## Creating a Client

Create a client with an explicit API key:

```elixir
client = Stripe.client("sk_test_...")
```

Or use your own wrapper:

```elixir
client = MyApp.Stripe.client()
```

### Per-Client Options

Pass options for a specific client:

```elixir
# Override just the connected account
client = Stripe.client("sk_test_...", stripe_account: "acct_connected")

# Override retries and timeout
client = Stripe.client("sk_test_...", max_retries: 5, read_timeout: 120_000)
```

### Explicit API Key

Pass a different API key for another account or environment:

```elixir
client = Stripe.client("sk_test_other_key")
client = Stripe.client("sk_test_other_key", max_retries: 5)
```

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
client = Stripe.client("sk_test_...", max_retries: 5)
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
