# stripe_elixir

Elixir SDK for the Stripe API, auto-generated from the official OpenAPI spec.

## Client pattern

Always create a client first. Every API call takes the client as the first argument.

```elixir
client = Stripe.client()
{:ok, customer} = Stripe.Services.CustomerService.create(client, %{email: "jane@example.com"})
```

The zero-arity `Stripe.client()` reads from application config. Override per-call:

```elixir
client = Stripe.client("sk_test_other_key")
client = Stripe.client(stripe_account: "acct_connected", max_retries: 5)
```

Clients are plain structs — no global state, safe for concurrent use.

## Module layout

- `Stripe.Services.*Service` — one module per API resource, methods map 1:1 to endpoints
- `Stripe.Resources.*` — typed response structs with `@type t`
- `Stripe.Params.*Params` — typed request parameter structs
- `Stripe.Events.*Event` — per-event typed modules (V2 and thin V1)

Service modules live under `Stripe.Services`. Nested resources use packages:
`Stripe.Services.Billing.MeterService`, `Stripe.Services.Issuing.CardService`.

V2 endpoints are under `Stripe.Services.V2.*`.

## API calls

All service methods return `{:ok, struct}` or `{:error, %Stripe.Error{}}`.

```elixir
case Stripe.Services.ChargeService.create(client, params) do
  {:ok, charge} -> charge
  {:error, %Stripe.Error{type: :card_error} = err} -> handle_error(err)
end
```

Method signatures: `method(client, params \\ %{}, opts \\ [])` or
`method(client, id, params \\ %{}, opts \\ [])` for resource-specific endpoints.

Per-request overrides go in opts: `stripe_account:`, `idempotency_key:`, `api_version:`.

## Pagination

V1 lists return `%Stripe.ListObject{}`. Use `auto_paging_stream/2` for lazy iteration:

```elixir
{:ok, page} = Stripe.Services.CustomerService.list(client, %{"limit" => 100})
page |> Stripe.ListObject.auto_paging_stream(client) |> Enum.take(50)
```

Search results use `Stripe.SearchResult.auto_paging_stream/2`.
V2 lists use `Stripe.V2.ListObject.auto_paging_stream/2`.

## Webhooks

`Stripe.WebhookPlug` is a Plug that verifies signatures and assigns the event.
It must go **before** `Plug.Parsers` in the endpoint (it needs the raw body).

```elixir
# endpoint.ex
plug Stripe.WebhookPlug, path: "/webhook/stripe"
plug Plug.Parsers, ...
```

The secret is read from `config :stripe_elixir, :webhook_secret`.

For manual verification without the plug:

```elixir
{:ok, event} = Stripe.Webhook.construct_event(payload, sig_header, secret)
```

## Configuration

```elixir
# config/runtime.exs
config :stripe_elixir,
  api_key: System.fetch_env!("STRIPE_SECRET_KEY"),
  webhook_secret: System.fetch_env!("STRIPE_WEBHOOK_SECRET")
```

Optional keys: `:api_version`, `:client_id`, `:max_retries` (default 2),
`:open_timeout` (default 30s), `:read_timeout` (default 80s), `:finch`.

## Testing

Use `Stripe.Test` for process-scoped HTTP stubs compatible with `async: true`:

```elixir
setup do
  Stripe.Test.stub(fn req -> {200, [], ~s({"id": "ch_1", "object": "charge"})} end)
  :ok
end
```

The stub callback receives a `%{method, url, headers, body}` map and returns
`{status, headers, body}`. Stubs are isolated per test process.

## Common mistakes

- **Forgetting the client argument.** Every service call needs a client as the first arg.
- **Using string keys vs atom keys in params.** Params maps use string keys: `%{"amount" => 100}`, not `%{amount: 100}`.
- **Placing WebhookPlug after Plug.Parsers.** The plug must come before parsers or signature verification will fail (empty body).
- **Not pattern matching on {:ok, _} / {:error, _}.** All API calls return tagged tuples.

## File uploads

Use `%Stripe.Multipart.FilePath{}` for file params:

```elixir
Stripe.Services.FileService.create(client, %{
  "purpose" => "dispute_evidence",
  "file" => %Stripe.Multipart.FilePath{path: "/path/to/file.pdf"}
})
```

## OAuth (Stripe Connect)

```elixir
url = Stripe.OAuth.authorize_url(client, %{scope: "read_write"})
{:ok, resp} = Stripe.OAuth.token(client, %{code: "ac_...", grant_type: "authorization_code"})
```
