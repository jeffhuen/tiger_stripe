# tiger_stripe

Elixir SDK for the Stripe API, auto-generated from the official OpenAPI spec.

## Client pattern

Always create a client first. Every API call takes the client as the first argument.

```elixir
client = Stripe.client("sk_test_...")
{:ok, customer} = Stripe.Services.CustomerService.create(client, %{email: "jane@example.com"})
```

TigerStripe does not read library application config. Read credentials in your
own app and pass them explicitly:

```elixir
client = Stripe.client(System.fetch_env!("STRIPE_SECRET_KEY"))
client = Stripe.client("sk_test_...", stripe_account: "acct_connected", max_retries: 5)
```

Clients are plain structs — no global state, safe for concurrent use.

## Module layout

- `Stripe.Services.*Service` — one module per API resource, methods map 1:1 to endpoints
- `Stripe.Resources.*` — typed response structs with shallow `@type t`
- `Stripe.Params.*Params` — documented request parameter structs with shallow `@type t`
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
plug Stripe.WebhookPlug,
  secret: {MyApp.Stripe, :webhook_secret, []},
  path: "/webhook/stripe"

plug Plug.Parsers, ...
```

The secret is explicit and may be a binary or an MFA tuple.

For manual verification without the plug:

```elixir
{:ok, event} = Stripe.Webhook.construct_event(payload, sig_header, secret)
```

## Supervision

```elixir
# lib/my_app/application.ex
children = [
  Stripe
]
```

This starts the default `Stripe.Finch` pool. If your app already starts its
own Finch pool, pass `finch: MyApp.Finch` when building the client.

## Testing

Use `Stripe.Test` for process-scoped HTTP stubs compatible with `async: true`:

```elixir
setup do
  Stripe.Test.stub(fn req -> {200, [], ~s({"id": "ch_1", "object": "charge"})} end)
  %{client: Stripe.Test.client("sk_test_123")}
end
```

The stub callback receives a `%{method, url, headers, body}` map and returns
`{status, headers, body}`. Stubs are isolated per test process and are used
only by clients built with `Stripe.Test.client/2` or
`transport: Stripe.Test.transport()`.

## String keys vs atom keys

Request params and response structs use **different key formats**:

- **Request params → string keys.** Pass `%{"amount" => 100}`, not `%{amount: 100}`.
- **Response structs → atom keys.** The deserializer converts JSON into typed Elixir structs. Access fields with atoms: `charge.amount`, `invoice_line.period.start`.

Nested objects are deserialized into atom-key maps:

```elixir
# WRONG — pattern matching with string keys on a deserialized struct
case invoice_line.period do
  %{"start" => start_unix} -> DateTime.from_unix!(start_unix)
end

# RIGHT — nested response maps have atom keys
case invoice_line.period do
  %{start: start_unix} -> DateTime.from_unix!(start_unix)
end
```

Top-level Stripe resources still deserialize into structs. Fields that remain
as **string-key maps**:

- `metadata` — arbitrary user key-value pairs
- `previous_attributes` on v1 events
- `related_object` on thin v2 events
- unknown keys preserved on nested response maps

When in doubt, check the struct definition in `Stripe.Resources.*` — every
top-level `defstruct` field is an atom key.

## Common mistakes

- **Forgetting the client argument.** Every service call needs a client as the first arg.
- **Using string keys on response structs.** Response data is deserialized into structs with atom keys. Use `charge.amount` or `%{start: unix}`, not `charge["amount"]` or `%{"start" => unix}`. See "String keys vs atom keys" above.
- **Using atom keys in request params.** Params maps use string keys: `%{"amount" => 100}`, not `%{amount: 100}`.
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
