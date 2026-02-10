# TODO

## DX / Onboarding

- [ ] **Igniter installer** — `mix ignite.install stripe_elixir` should one-stop add the dep and configure everything:
  - Add `config :stripe_elixir, api_key: "sk_test_..."` to `config/dev.exs`
  - Add `config :stripe_elixir, api_key: System.fetch_env!("STRIPE_SECRET_KEY"), webhook_secret: System.fetch_env!("STRIPE_WEBHOOK_SECRET")` to `config/runtime.exs`
  - Add `Stripe.WebhookPlug` to the endpoint (before `Plug.Parsers`)
  - Scaffold a `StripeWebhookController` with event handler skeleton
  - Add the webhook route to the router
  - Print next-steps instructions
