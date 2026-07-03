# Migrating from 0.3.x to 0.4.0

TigerStripe 0.4.0 removes deep generated resource and params typespec graphs.
Runtime behavior is unchanged.

## What Changed

- `Stripe.Resources.*.t()` still exists, but is now shallow:
  `@type t :: %__MODULE__{}`.
- `Stripe.Params.*Params.t()` still exists, but is now shallow:
  `@type t :: %__MODULE__{}`.
- Generated nested helper type aliases such as
  `Stripe.Resources.Invoice.lines()` or
  `Stripe.Params.PaymentIntentCreateParams.payment_method_data()` are gone.
- `@moduledoc`, top-level `@typedoc`, `defstruct`, service `@spec`s,
  `object_name/0`, `expandable_fields/0`, and resource `__nested_fields__/0`
  remain.

## Why

The previous generated specs created thousands of recursive local map aliases and
remote `.t()` references. They were expensive for Dialyzer and compile-time
analysis while providing little safety for Stripe's changing API payloads.

Response structs remain the public API. Deep generated type graphs do not.

## Required Code Changes

Most applications need no runtime changes.

Search for references to nested generated helper types:

```bash
rg "Stripe\.(Resources|Params)\.[A-Za-z0-9_.]+\.[a-z][a-z0-9_]*\(\)" lib test
```

If any exist, replace them with one of:

- the top-level resource type, such as `Stripe.Resources.Event.t()`
- `map()` for nested Stripe response or request shapes
- an application-owned struct/type if the shape is part of your own domain

Do not replace normal service calls, params maps, top-level resource structs, or
webhook deserialization.

These are still valid:

```elixir
client = Stripe.client(api_key)
Stripe.Services.Checkout.SessionService.create(client, %{"mode" => "payment"})

@type stripe_event :: Stripe.Resources.Event.t()

%Stripe.Resources.Refund{id: "re_123", amount: 100}

{:ok, event} = Stripe.Deserializer.from_json(json)
```

## sold-by-robots

At the time of this change, `sold-by-robots` used TigerStripe idiomatically:
service calls with params maps, webhook verification/deserialization, top-level
resource structs, and top-level `Stripe.Resources.Event.t()`.

One small cleanup is recommended there but not required by 0.4.0:
route duplicate Stripe client construction through
`Cinderbase.Integrations.PaymentProviders.Stripe.StripeClient.client/1`.
