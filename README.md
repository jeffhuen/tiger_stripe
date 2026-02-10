# StripeElixir

Elixir SDK and client for the [Stripe API](https://stripe.com/docs/api),
auto-generated from the official [OpenAPI spec](https://github.com/stripe/openapi).

> **Note:** This is not an official Stripe SDK, but it's built the way one
> would be. Stripe does not publish a first-party Elixir library. This
> project is generated from the same
> [OpenAPI spec](https://github.com/stripe/openapi) that Stripe uses to
> build their official SDKs, follows the same service architecture, and is
> tested for 1:1 parity against the official
> [Ruby SDK](https://github.com/stripe/stripe-ruby) (188/188 service files,
> 561/561 endpoints). If Stripe were to ship an Elixir SDK, it would look
> like this — with idiomatic Elixir conventions.

### What's Included

The **SDK layer** provides typed resource structs, typed request params, per-event
modules, and auto-paging pagination — all generated from the spec with full
documentation. The **client layer** handles HTTP execution via Finch with
connection pooling, automatic retries, request encoding, response
deserialization, and telemetry.

Together, the full V1 + V2 API surface is covered: 190 service modules,
307 typed resource structs, 523 typed params modules, webhook signature
verification, OAuth, file uploads, streaming responses, and per-event typed
modules.

## Installation

### With Igniter (recommended for Phoenix)

> **Beta:** The Igniter installer is new and under active testing.
> [Report issues here.](https://github.com/jeffhuen/stripe_elixir/issues)

If your project uses [Igniter](https://hex.pm/packages/igniter), one command
sets up everything — config, webhook plug, controller, and route:

```bash
mix igniter.install stripe_elixir
```

See the [Igniter Installer](guides/igniter-installer.md) guide for a detailed
walkthrough of what the installer does.

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

```elixir
# config/dev.exs — sandbox credentials
config :stripe_elixir,
  api_key: "sk_test_...",
  webhook_secret: "whsec_test_..."

# config/runtime.exs — production credentials
if config_env() == :prod do
  config :stripe_elixir,
    api_key: System.fetch_env!("STRIPE_SECRET_KEY"),
    webhook_secret: System.fetch_env!("STRIPE_WEBHOOK_SECRET")
end
```

Optional global defaults (all have sensible defaults if omitted):

```elixir
config :stripe_elixir,
  api_key: "sk_test_...",
  webhook_secret: "whsec_...",
  api_version: "2026-01-28.clover",  # pin API version
  client_id: "ca_...",               # OAuth client ID (Connect platforms)
  max_retries: 3,                    # default: 2
  open_timeout: 30_000,              # connection timeout in ms
  read_timeout: 80_000               # read timeout in ms
```

See the [Getting Started](guides/getting-started.md) guide for all config
options and precedence rules.

## Quick Start

```elixir
client = Stripe.client()

# Create a customer
{:ok, customer} = Stripe.Services.CustomerService.create(client, %{
  email: "jane@example.com"
})

# Retrieve a payment intent
{:ok, intent} = Stripe.Services.PaymentIntentService.retrieve(client, "pi_123")

# List charges (returns a typed ListObject)
{:ok, charges} = Stripe.Services.ChargeService.list(client, %{"limit" => 10})
```

Responses are automatically deserialized into typed structs:

```elixir
customer.id        #=> "cus_abc123"
customer.email     #=> "jane@example.com"
customer.__struct__ #=> Stripe.Resources.Customer
```

Override config per-client for Connect or multi-key scenarios:

```elixir
client = Stripe.client(stripe_account: "acct_connected")
client = Stripe.client("sk_test_other_key", max_retries: 5)
```

## Features

### SDK

- **Full API coverage** — every V1 and V2 endpoint from the OpenAPI spec, with
  dedicated service modules matching the official SDK layout
- **Typed resources** — API responses are deserialized into typed Elixir structs
  with `@type t` definitions, expandable field support, and inner types
- **Typed params** — request parameters have dedicated struct modules with
  `@typedoc` annotations sourced from the OpenAPI spec
- **Per-event typed modules** — V2 and thin V1 events get dedicated modules
  with typed data structs and `fetch_related_object/2`
- **Auto-paging pagination** — lazy `Stream`-based iteration for V1 lists,
  search results, and V2 lists
- **Webhook verification** — HMAC-SHA256 signature verification with
  constant-time comparison and timestamp tolerance
- **OAuth** — `authorize_url`, `token`, and `deauthorize` for Stripe Connect
- **Documentation** — `@moduledoc`, `@doc`, `@typedoc`, `@spec`, and
  `@deprecated` on all generated modules, sourced from the OpenAPI spec

### Client

- **Finch HTTP client** — modern HTTP/2-capable client with connection pooling
  via NimblePool (replaces legacy Hackney)
- **Automatic retries** — exponential backoff with jitter, respects
  `stripe-should-retry` header, auto-generated idempotency keys for V2
- **Request encoding** — V1 form-encoded, V2 JSON, automatic multipart for
  file uploads
- **Response deserialization** — JSON to typed structs via object type registry
- **Streaming** — chunked response streaming for large payloads and SSE
- **Telemetry** — `:telemetry` events for request lifecycle observability
- **Per-client configuration** — explicit struct with no global state, safe for
  concurrent use with multiple API keys or connected accounts
- **Test stubs** — process-scoped HTTP stubs via NimbleOwnership for
  `async: true` tests

## Guides

- [Getting Started](guides/getting-started.md) — installation, configuration, first API call, pagination, error handling
- [Igniter Installer](guides/igniter-installer.md) — one-command Phoenix setup (beta)
- [Webhooks](guides/webhooks.md) — signature verification, WebhookPlug setup, typed event modules
- [Connect & OAuth](guides/connect-and-oauth.md) — connected accounts, OAuth flow, multi-tenant patterns
- [Testing](guides/testing.md) — process-scoped HTTP stubs with `async: true` support
- [Telemetry](guides/telemetry.md) — request lifecycle events, logging, metrics

## Development

```bash
# Sync the OpenAPI spec
bash scripts/sync_openapi.sh

# Generate the SDK
mix stripe.generate --clean --stats

# Verify
mix compile --warnings-as-errors
mix test
mix docs --warnings-as-errors
bash scripts/diff_ruby.sh
```

### Code Generation

The SDK is auto-generated from Stripe's unified OpenAPI spec (`spec3.sdk.json`)
via `mix stripe.generate`. The generator produces 1,044 files:

- **190 service modules** (189 generated + 1 hand-written `OAuthService`)
- **307 resource structs** with `@type t`, expandable fields, and inner types
- **523 params modules** with `@typedoc` field annotations
- **2 registries** (object types and event types)
- **22 event modules** (20 per-event typed + 1 constants + 1 unknown fallback)

A small set of [overrides](lib/stripe/generator/overrides.ex) handle
cases where the spec's metadata doesn't match the Ruby SDK's service layout.
Each override is documented with a reason and a reference to the corresponding
Ruby service file, enforced by tests.

### Parity Testing

Ruby SDK parity is a hard invariant. CI runs `scripts/diff_ruby.sh` to verify
1:1 service file and endpoint coverage. The test suite includes dedicated
parity assertions comparing the generated endpoint set against both the OpenAPI
spec and the Ruby SDK fixture tree.

## License

MIT License. See `LICENSE` for details.
