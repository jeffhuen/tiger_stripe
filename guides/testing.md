# Testing

`Stripe.Test` provides process-scoped HTTP stubs via NimbleOwnership, so
your tests can run with `async: true` without interference.

## Setup

Start the test stub server in your `test/test_helper.exs`:

```elixir
Stripe.Test.start()
ExUnit.start()
```

## Stubbing Requests

Use `Stripe.Test.stub/1` to define how the HTTP layer responds. The stub
function receives a map with `:method`, `:url`, `:headers`, and `:body`,
and returns a `{status, headers, body}` tuple:

```elixir
defmodule MyApp.BillingTest do
  use ExUnit.Case, async: true

  test "creates a charge" do
    Stripe.Test.stub(fn %{method: :post, url: url} ->
      assert url =~ "/v1/charges"
      {200, [], ~s({"id": "ch_123", "object": "charge", "amount": 2000})}
    end)

    client = Stripe.Test.client("sk_test_123")

    {:ok, charge} = Stripe.Services.ChargeService.create(client, %{
      amount: 2000,
      currency: "usd"
    })

    assert charge.id == "ch_123"
  end
end
```

Use `Stripe.Test.client/2` in tests. A regular `Stripe.client/1` uses the
normal Finch transport and does not check test stubs.

## Asserting on Request Parameters

The stub receives the full request, so you can assert on the body, headers,
or URL parameters:

```elixir
test "sends correct params" do
  Stripe.Test.stub(fn %{method: :post, body: body} ->
    params = URI.decode_query(body)
    assert params["amount"] == "2000"
    assert params["currency"] == "usd"
    {200, [], ~s({"id": "ch_123", "object": "charge"})}
  end)

  client = Stripe.Test.client("sk_test_123")
  {:ok, _} = Stripe.Services.ChargeService.create(client, %{amount: 2000, currency: "usd"})
end
```

## Simulating Errors

Return non-200 status codes to test error handling:

```elixir
test "handles card decline" do
  Stripe.Test.stub(fn _ ->
    {402, [],
     ~s({"error": {"type": "card_error", "code": "card_declined", "message": "Your card was declined."}})}
  end)

  client = Stripe.Test.client("sk_test_123")
  {:error, err} = Stripe.Services.ChargeService.create(client, %{amount: 2000, currency: "usd"})

  assert err.type == :card_error
  assert err.message =~ "declined"
end
```

## Process Isolation

Stubs are scoped to the test process that defines them. This means:

- **`async: true` works** — concurrent tests don't interfere with each other
- **No shared state** — each test sets up its own stubs independently
- **Automatic cleanup** — stubs are removed when the test process exits

Under the hood, `Stripe.Test` uses `NimbleOwnership` to associate stubs
with the calling process. `Stripe.Test.client/2` captures the current test
process in the client's transport, so spawned processes can use that client:

```elixir
test "works in spawned processes" do
  Stripe.Test.stub(fn _ ->
    {200, [], ~s({"id": "cus_123", "object": "customer"})}
  end)

  client = Stripe.Test.client("sk_test_123")

  task = Task.async(fn ->
    Stripe.Services.CustomerService.retrieve(client, "cus_123")
  end)

  assert {:ok, customer} = Task.await(task)
  assert customer.id == "cus_123"
end
```

## Tips

- **Keep stubs minimal.** Only include the fields your test actually checks.
  The deserializer handles missing fields gracefully.
- **Use `async: true`.** The ownership model is designed for it.
- **Don't stub the webhook.** Use `Stripe.Webhook.construct_event/4` directly
  in webhook tests — it's a pure function that doesn't make HTTP calls.
