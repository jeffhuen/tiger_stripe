# Igniter Installer

> **Beta:** The Igniter installer is new and under active testing. If you hit
> an issue, please [open a bug report](https://github.com/jeffhuen/tiger_stripe/issues).
> You can always fall back to [manual installation](getting-started.md).

The Igniter installer configures `tiger_stripe` in a Phoenix project with a
single command. It adds a small runtime wrapper module, starts the Finch pool,
wires up webhook verification, scaffolds a controller, and adds the route.

## Prerequisites

Your project needs [Igniter](https://hex.pm/packages/igniter) installed. If
you don't have it yet:

```elixir
# mix.exs
{:igniter, "~> 0.7"}
```

## Running the Installer

```bash
mix igniter.install tiger_stripe
```

If `tiger_stripe` is already in your deps, run the configuration task
directly:

```bash
mix tiger_stripe.install
```

Both commands do the same thing. The only difference is that
`igniter.install` also adds the dependency to your `mix.exs`.

## What It Does

The installer makes five changes to your project. Igniter shows a unified
diff of every change and asks for confirmation before writing anything.

### 1. Runtime Wrapper

Adds a helper module for constructing clients and resolving webhook secrets:

```elixir
defmodule MyApp.Stripe do
  def client do
    Stripe.client(System.fetch_env!("STRIPE_SECRET_KEY"))
  end

  def webhook_secret do
    System.fetch_env!("STRIPE_WEBHOOK_SECRET")
  end
end
```

### 2. Finch Supervision

Adds the default `Stripe.Finch` pool to your application supervision tree:

```elixir
children = [
  Stripe
]
```

Your deployment environment needs `STRIPE_SECRET_KEY` and
`STRIPE_WEBHOOK_SECRET` set.

### 3. Webhook Plug

Injects `Stripe.WebhookPlug` into your Phoenix endpoint, directly before
`Plug.Parsers`:

```elixir
# lib/my_app_web/endpoint.ex

plug Stripe.WebhookPlug,
  secret: {MyApp.Stripe, :webhook_secret, []},
  path: "/webhook/stripe"

plug Plug.Parsers,
  parsers: [:urlencoded, :multipart, :json],
  ...
```

The plug must come before `Plug.Parsers` because it needs the raw request
body for signature verification. `Plug.Parsers` consumes the body, so
anything after it cannot verify the signature.

If your project has multiple endpoints, Igniter will prompt you to choose
which one to modify.

### 4. Webhook Controller

Scaffolds a controller at `lib/<app>_web/controllers/stripe_webhook_controller.ex`:

```elixir
defmodule MyAppWeb.StripeWebhookController do
  use MyAppWeb, :controller

  def handle(conn, _params) do
    event = conn.assigns.stripe_event

    case event.type do
      "checkout.session.completed" -> ...
      "invoice.payment_succeeded"  -> ...
      "invoice.payment_failed"     -> ...
      "customer.subscription.deleted" -> ...
      unhandled -> Logger.info("Unhandled Stripe event: #{unhandled}")
    end

    send_resp(conn, 200, "ok")
  end
end
```

Each event handler is a stub that logs the event ID. Replace them with your
business logic. See the [Webhooks guide](webhooks.md) for details on event
handling patterns.

### 5. Webhook Route

Adds a route to your Phoenix router:

```elixir
scope "/webhook" do
  post "/stripe", MyAppWeb.StripeWebhookController, :handle
end
```

The path `/webhook/stripe` matches the `:path` option configured on the plug.
If your project has multiple routers, Igniter will prompt you to choose.

## After Installation

1. **Set Stripe environment variables:**

       STRIPE_SECRET_KEY=sk_live_...
       STRIPE_WEBHOOK_SECRET=whsec_...

2. **Create a webhook endpoint** in the
   [Stripe Dashboard](https://dashboard.stripe.com/webhooks) pointed at
   `https://your-domain.com/webhook/stripe`

3. **Customize the controller** event handlers with your business logic

4. **Test locally** with the [Stripe CLI](https://docs.stripe.com/stripe-cli):

       stripe listen --forward-to localhost:4000/webhook/stripe

## Re-running the Installer

The installer is safe to run multiple times:

- The wrapper module is only created if it does not already exist
- The Finch child is only added if it is not already present
- The controller is only created if the module doesn't exist
- The webhook plug is only injected if not already in the endpoint

If you need to reset and re-run, delete the generated controller file and
remove the plug/route/wrapper lines manually, then run the installer again.

## Non-Phoenix Projects

If no Phoenix endpoint or router is found, the installer skips the plug,
controller, and route steps. You still get the wrapper module, plus notices
explaining how to set up webhook handling manually. See the
[Webhooks guide](webhooks.md) for the manual setup instructions.

## Dry Run

Preview changes without writing anything:

```bash
mix tiger_stripe.install --dry-run
```
