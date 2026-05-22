# Migrating from 0.2.x to 0.3.0

TigerStripe 0.3.0 is a breaking release focused on following Elixir library
guidelines more closely. Libraries should not own your application
configuration or start long-running processes without your supervision tree
choosing to run them.

The module namespace and service-call shape are unchanged: calls still go
through `Stripe.Services.*Service` modules and take a client as the first
argument.

## Version Requirement

Update your dependency requirement explicitly:

```elixir
def deps do
  [
    {:tiger_stripe, "~> 0.3.0"}
  ]
end
```

Existing `~> 0.2.0` requirements do not opt into 0.3.0 automatically. That is
intentional: 0.3.0 contains runtime breaks and should be an explicit upgrade.

Then run:

```bash
mix deps.unlock tiger_stripe
mix deps.get
mix compile --warnings-as-errors
mix test
```

## Breaking Changes

### Application Config Was Removed

0.2.x allowed this:

```elixir
# config/runtime.exs
config :tiger_stripe,
  api_key: System.fetch_env!("STRIPE_SECRET_KEY"),
  webhook_secret: System.fetch_env!("STRIPE_WEBHOOK_SECRET")

client = Stripe.client()
```

0.3.0 requires your application to read its own config and pass values
explicitly:

```elixir
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

`Stripe.client/0` now raises. Use `Stripe.client("sk_test_...")`,
`Stripe.client(api_key: "sk_test_...")`, or an application-owned wrapper like
`MyApp.Stripe.client/0`.

### Finch Must Be Supervised by Your App

0.2.x started `Stripe.Finch` automatically through TigerStripe's application
callback.

0.3.0 exposes a child spec instead. Add `Stripe` to your supervision tree:

```elixir
# lib/my_app/application.ex
def start(_type, _args) do
  children = [
    Stripe,
    MyAppWeb.Endpoint
  ]

  Supervisor.start_link(children, strategy: :one_for_one, name: MyApp.Supervisor)
end
```

This starts the default `Stripe.Finch` pool used by `%Stripe.Client{}`.

If your application already has a Finch pool, keep using that and pass it to
the client:

```elixir
children = [
  {Finch, name: MyApp.Finch}
]

client = Stripe.client("sk_test_...", finch: MyApp.Finch)
```

### WebhookPlug Requires an Explicit Secret

0.2.x could read the secret from `config :tiger_stripe`.

0.3.0 requires a `:secret` option:

```elixir
plug Stripe.WebhookPlug,
  secret: {MyApp.Stripe, :webhook_secret, []},
  path: "/webhook/stripe"
```

You can also pass a binary directly when appropriate:

```elixir
plug Stripe.WebhookPlug,
  secret: "whsec_...",
  path: "/webhook/stripe"
```

### Test Stubs Require a Test Client

0.2.x checked `Stripe.Test` ownership on every production request, so this
worked in tests:

```elixir
Stripe.Test.stub(fn _request ->
  {200, [], ~s({"id": "ch_123", "object": "charge"})}
end)

client = Stripe.client("sk_test_123")
```

0.3.0 moves stubbing into explicit client data:

```elixir
Stripe.Test.stub(fn _request ->
  {200, [], ~s({"id": "ch_123", "object": "charge"})}
end)

client = Stripe.Test.client("sk_test_123")
```

If you build clients through your own helper, pass the test transport:

```elixir
client =
  Stripe.client("sk_test_123",
    transport: Stripe.Test.transport()
  )
```

## Audit Commands

Find removed config usage:

```bash
rg "config :tiger_stripe|Stripe\\.client\\(\\)"
```

Find webhook plugs that need `:secret`:

```bash
rg "plug Stripe\\.WebhookPlug" lib config
```

Find tests that register stubs but still build regular clients:

```bash
rg -n "Stripe\\.Test\\.stub|Stripe\\.client\\(" test
```

## What Did Not Change

- `Stripe.Services.*Service` modules and function names
- top-level `Stripe.Resources.*` structs
- top-level `Stripe.Params.*Params` structs
- top-level `Stripe.Events.*Event` structs
- `Stripe.Webhook.construct_event/4`
- pagination modules and auto-paging streams
- string-key request maps passed to service calls
- atom-key fields on deserialized response structs

## Other Improvements

0.3.0 also includes non-breaking correctness and performance improvements:

- Malformed webhook signature timestamps now return
  `{:error, %Stripe.Error{}}` instead of raising.
- The client user-agent no longer shells out to `uname` on every request.
- Deserializer resource metadata is cached across casts.
- Generated service specs expose concrete success types instead of `term()`.
