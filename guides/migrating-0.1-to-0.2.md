# Migrating from 0.1.x to 0.2.0

TigerStripe 0.2.0 is a breaking release focused on compile-time performance.
It removes thousands of generated nested modules and replaces them with local
types plus runtime metadata.

The service-call API is unchanged. The breaking changes only affect code that
directly references nested generated modules such as
`Stripe.Resources.Charge.BillingDetails`,
`Stripe.Params.ChargeCreateParams.Shipping`, or
`Stripe.Events.V1BillingMeterErrorReportTriggeredEvent.Data`.

## Why This Changed

TigerStripe 0.1.x generated a public Elixir module for nearly every nested
Stripe response, params, and event shape. That made the SDK very precise, but
it pushed the BEAM compiler through thousands of modules in every consumer app
after a clean `_build`.

0.2.0 collapses nested-shape modules into local types:

- Top-level Stripe resources, params, services, and events remain public
  modules.
- Nested JSON shapes become local `@type` declarations inside the parent
  module.
- Response deserialization still converts known nested JSON objects to
  atom-key maps.
- Expanded Stripe resources still deserialize to their top-level resource
  structs.

There is no runtime-only mode, no compile-time resource selector, and no split
package set. The package emits one generated public module per top-level
Stripe surface instead of one public module per nested object shape.

## Version Requirement

Update your dependency requirement explicitly:

```elixir
def deps do
  [
    {:tiger_stripe, "~> 0.2.0"}
  ]
end
```

Existing `~> 0.1.x` requirements do not opt into 0.2.0 automatically. That is
intentional: 0.2.0 contains public API breaks and should be an explicit upgrade.

Then run:

```bash
mix deps.unlock tiger_stripe
mix deps.get
mix compile --warnings-as-errors
mix test
```

## What Did Not Change

Most applications only need the dependency bump.

These APIs keep the same shape:

- `Stripe.client/0,1,2`
- `Stripe.Services.*Service` modules and function names
- top-level `Stripe.Resources.*` structs
- top-level `Stripe.Params.*Params` structs
- top-level `Stripe.Events.*Event` structs
- `Stripe.Webhook.construct_event/4`
- `Stripe.WebhookPlug`
- `Stripe.ListObject`, `Stripe.SearchResult`, and `Stripe.V2.ListObject`
- string-key request maps passed to service calls
- atom-key fields on deserialized top-level response structs

Expanded resources still deserialize to top-level structs:

```elixir
%Stripe.Resources.Charge{
  customer: %Stripe.Resources.Customer{}
}
```

List items that are Stripe resources still deserialize to top-level structs:

```elixir
%Stripe.Resources.Charge{
  refunds: %{
    data: [%Stripe.Resources.Refund{}],
    has_more: false
  }
}
```

## Breaking Changes

### Nested Resource Struct Modules Were Removed

0.1.x:

```elixir
case charge.billing_details do
  %Stripe.Resources.Charge.BillingDetails{email: email} ->
    email
end
```

0.2.0:

```elixir
case charge.billing_details do
  %{email: email} ->
    email
end
```

Nested response shapes are now atom-key maps. Unknown keys from Stripe are
preserved as string keys so preview or newly added fields are not lost:

```elixir
%{
  email: "buyer@example.com",
  name: "Buyer",
  "private_preview_field" => "kept"
}
```

Deeply nested response shapes follow the same pattern:

```elixir
# 0.1.x
%Stripe.Resources.InvoiceLineItem.Parent.SubscriptionItemDetails{
  proration_details:
    %Stripe.Resources.InvoiceLineItem.Parent.SubscriptionItemDetails.ProrationDetails{
      credited_items: credited_items
    }
}

# 0.2.0
%{
  proration_details: %{
    credited_items: credited_items
  }
}
```

### Nested Params Modules Were Removed

0.1.x exposed nested params modules for generated documentation and specs:

```elixir
%Stripe.Params.ChargeCreateParams.Shipping{
  name: "Jane Doe",
  address: %Stripe.Params.ChargeCreateParams.Shipping.Address{
    line1: "123 Market St",
    city: "San Francisco"
  }
}
```

0.2.0 keeps nested params as local types inside the top-level params module.
For service calls, prefer the same string-key request maps TigerStripe has
always accepted:

```elixir
Stripe.Services.ChargeService.create(client, %{
  "amount" => 2_000,
  "currency" => "usd",
  "shipping" => %{
    "name" => "Jane Doe",
    "address" => %{
      "line1" => "123 Market St",
      "city" => "San Francisco"
    }
  }
})
```

If you use top-level params structs directly, keep nested values as plain maps:

```elixir
%Stripe.Params.ChargeCreateParams{
  amount: 2_000,
  currency: "usd",
  shipping: %{
    name: "Jane Doe",
    address: %{line1: "123 Market St", city: "San Francisco"}
  }
}
```

### Event Data Child Modules Were Removed

Top-level event modules remain:

```elixir
%Stripe.Events.V1BillingMeterErrorReportTriggeredEvent{}
```

Their nested `Data` modules do not:

```elixir
# 0.1.x
%Stripe.Events.V1BillingMeterErrorReportTriggeredEvent{
  data: %Stripe.Events.V1BillingMeterErrorReportTriggeredEvent.Data{}
}

# 0.2.0
%Stripe.Events.V1BillingMeterErrorReportTriggeredEvent{
  data: %{reason: %{error_count: count}}
}
```

Generic V1 webhook events still deserialize through
`%Stripe.Resources.EventData{}`:

```elixir
%Stripe.Resources.Event{
  data: %Stripe.Resources.EventData{
    object: %Stripe.Resources.Invoice{}
  }
}
```

### Stale Preview Resources Were Removed by Clean Generation

0.2.0 regenerates the SDK from the current vendored Stripe OpenAPI spec and
Ruby SDK fixture with a clean generated tree. The following stale 0.1.11 files
are no longer emitted by that source data:

- `Stripe.Resources.Reserve.Hold`
- `Stripe.Resources.Reserve.Plan`
- `Stripe.Resources.Reserve.Release`
- `Stripe.Resources.UPI`
- `Stripe.Resources.UPIHandleRedirectOrDisplayQrCode`
- `Stripe.Resources.UPIQRCode`

If your application references any of these modules, pin `tiger_stripe` to
`~> 0.1.11` until the corresponding objects are present in the vendored Stripe
spec again.

## Audit Your Codebase

Search for nested generated module references before upgrading:

```bash
rg "Stripe\\.Resources\\.[A-Za-z0-9_.]+\\.[A-Z]" lib test
rg "Stripe\\.Params\\.[A-Za-z0-9_.]+Params\\.[A-Z]" lib test
rg "Stripe\\.Events\\.[A-Za-z0-9_]+Event\\.Data" lib test
rg "__inner_types__" lib test
```

Common fixes:

| 0.1.x pattern | 0.2.0 pattern |
|---------------|---------------|
| `%Stripe.Resources.Charge.BillingDetails{}` | `%{}` with atom keys |
| `%Stripe.Resources.Charge.Refunds{}` | `%{data: refunds, has_more: has_more}` |
| `%Stripe.Params.ChargeCreateParams.Shipping{}` | request map or plain nested map |
| `%Stripe.Events.SomeEvent.Data{}` | `%{}` with atom keys |
| `SomeResource.__inner_types__()` | no public replacement; nested metadata is internal |

## Library Author Guidance

If your library exposes TigerStripe data in its own public API:

- Accept top-level resource structs when the value is a Stripe resource.
- Accept `map()` for nested JSON shapes.
- Do not expose nested TigerStripe module names in your public typespecs.
- Prefer field-based pattern matching over struct-name pattern matching for
  nested Stripe response data.

Good:

```elixir
@spec handle_charge(Stripe.Resources.Charge.t()) :: :ok
def handle_charge(%Stripe.Resources.Charge{billing_details: %{email: email}}) do
  notify(email)
end
```

Avoid:

```elixir
@spec handle_billing_details(Stripe.Resources.Charge.BillingDetails.t()) :: :ok
```

## Rollback

If you cannot migrate immediately, pin to the last 0.1.x release:

```elixir
{:tiger_stripe, "~> 0.1.11"}
```

That keeps the nested generated modules, but also keeps the 0.1.x compile-time
cost.
