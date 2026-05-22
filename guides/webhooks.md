# Webhooks

Stripe sends webhook events to your application when things happen in your
account — charges succeed, subscriptions renew, disputes are opened, etc.
This guide covers receiving, verifying, and handling those events.

## Signature Verification

Every webhook request includes a `Stripe-Signature` header. Always verify it
before trusting the payload:

```elixir
case Stripe.Webhook.construct_event(payload, sig_header, "whsec_...") do
  {:ok, event} -> handle_event(event)
  {:error, error} -> send_resp(conn, 400, error.message)
end
```

`construct_event/4` verifies the HMAC-SHA256 signature using constant-time
comparison and checks the timestamp is within the tolerance window (default:
300 seconds).

## WebhookPlug

`Stripe.WebhookPlug` handles the full lifecycle — reading the raw body,
verifying the signature, deserializing the event, and assigning it to
`conn.assigns.stripe_event`.

### Setup

First, expose your webhook secret from your application:

```elixir
# lib/my_app/stripe.ex
defmodule MyApp.Stripe do
  def webhook_secret do
    System.fetch_env!("STRIPE_WEBHOOK_SECRET")
  end
end
```

Then add the plug to your endpoint **before** `Plug.Parsers` (which consumes
the raw body):

```elixir
# lib/my_app_web/endpoint.ex

plug Stripe.WebhookPlug,
  secret: {MyApp.Stripe, :webhook_secret, []},
  path: "/webhook/stripe"

# This must come AFTER WebhookPlug
plug Plug.Parsers,
  parsers: [:urlencoded, :multipart, :json],
  json_decoder: JSON
```

### Per-Plug Secret Override

If you have multiple webhook endpoints with different secrets, override
per-plug:

```elixir
plug Stripe.WebhookPlug,
  secret: "whsec_other",
  path: "/webhook/stripe/connect"
```

Or use an MFA tuple for runtime resolution:

```elixir
plug Stripe.WebhookPlug,
  secret: {MyApp.Config, :connect_webhook_secret, []},
  path: "/webhook/stripe/connect"
```

### Options

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `:secret` | `String.t()` or `{mod, fun, args}` | required | Webhook signing secret |
| `:path` | `String.t()` | required | Request path to match |
| `:tolerance` | `integer()` | `300` | Maximum event age in seconds |

### Handling Events

On successful verification, the event is available at
`conn.assigns.stripe_event`. Route to a controller or plug pipeline to
handle it:

```elixir
# lib/my_app_web/router.ex
scope "/webhook" do
  post "/stripe", MyAppWeb.StripeWebhookController, :handle
end
```

```elixir
# lib/my_app_web/controllers/stripe_webhook_controller.ex
defmodule MyAppWeb.StripeWebhookController do
  use MyAppWeb, :controller

  def handle(conn, _params) do
    event = conn.assigns.stripe_event

    case event.type do
      "checkout.session.completed" ->
        fulfill_order(event.data.object)

      "invoice.payment_failed" ->
        notify_customer(event.data.object)

      "customer.subscription.deleted" ->
        cancel_subscription(event.data.object)

      _ ->
        :ok
    end

    send_resp(conn, 200, "ok")
  end
end
```

### Verification Failures

If the signature is invalid or the timestamp is stale, `WebhookPlug` responds
with `400 Bad Request` and halts the connection. Your downstream plugs and
controllers are never invoked.

## Typed Event Modules

V2 events and thin V1 events have dedicated modules with typed data maps:

```elixir
alias Stripe.Events.V1BillingMeterErrorReportTriggeredEvent

# Each event module exposes the Stripe event type string
V1BillingMeterErrorReportTriggeredEvent.lookup_type()
#=> "billing.meter.error_report_triggered"

# Events have typed nested data maps
%V1BillingMeterErrorReportTriggeredEvent{
  data: %{reason: %{error_count: 3}}
}

# V2 events support fetching related objects
{:ok, meter} = V2BillingMeterNoMeterFoundEvent.fetch_related_object(event, client)
```

## Tips

- **Always return 200 quickly.** Process events asynchronously (e.g. via
  `Task.Supervisor` or an Oban job) to avoid Stripe's 20-second timeout.
- **Handle duplicates.** Stripe may send the same event more than once. Use
  `event.id` as an idempotency key.
- **Use the webhook signing secret from the Stripe Dashboard**, not your API
  key. Each webhook endpoint has its own secret.
