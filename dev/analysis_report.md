# Analysis of TigerStripe Generated Shape Coverage

## Executive Summary

TigerStripe 0.2.0 keeps top-level Stripe resources, params, services, and event
modules public, while nested JSON shapes are represented as local `@type`
aliases and `__nested_fields__/0` metadata.

This preserves useful type documentation and recursive response casting without
forcing consumer applications to compile a public module for every nested
Stripe object.

## Findings

### 1. Nested Shape Generation Is Compact

Top-level modules now include nested type aliases directly:

```elixir
defmodule Stripe.Resources.Price do
  @type currency_options :: %{
          optional(:custom_unit_amount) => custom_unit_amount() | nil,
          optional(:tax_behavior) => String.t() | nil,
          optional(:tiers) => [tiers()] | nil,
          optional(:unit_amount) => integer() | nil,
          optional(:unit_amount_decimal) => String.t() | nil,
          optional(String.t()) => term()
        }
end
```

No public child module is emitted for `Stripe.Resources.Price.CurrencyOptions`.

### 2. Deserialization Uses Metadata

Generated resources and events expose nested-shape metadata for the
deserializer:

```elixir
def __nested_fields__ do
  %{
    "currency_options" => %{
      fields: %{
        "custom_unit_amount" => %{fields: %{...}},
        "tiers" => {:list, %{fields: %{...}}}
      }
    }
  }
end
```

Known nested fields deserialize to atom-key maps. Expanded Stripe resources
continue to deserialize to their top-level structs.

### 3. Additional Properties Stay Typed

Map-like fields defined with `additionalProperties` still carry their value
shape. For example, `Price.currency_options` is typed as a string-key map whose
values are `currency_options()` typed maps, rather than a generic `map()`.

## Impact

- Clean compiles in consumer apps avoid thousands of nested modules.
- Top-level resource pattern matching remains unchanged.
- Nested response pattern matching changes from struct names to field shapes.
- Unknown nested Stripe fields are preserved as string keys.

## Recommendation

Keep the compact generated shape as the 0.2.0 public contract:

1. Public modules only for top-level Stripe resources, params, services, and
   events.
2. Local `@type` aliases for nested shapes.
3. Internal `__nested_fields__/0` metadata for recursive deserialization.
4. Migration docs for users who matched on 0.1.x nested struct modules.
