# Changelog

All notable changes to this project are documented in this file.

The format is based on [Common Changelog](https://common-changelog.org/).

## [0.1.6] - 2026-02-11

### Fixed

- Remove dead `resolve_params_class/1` override lookup — `params_overrides()` is empty, so the pattern match was flagged as unreachable by both Dialyzer and Elixir's type checker ([d07dbf5])

## [0.1.5] - 2026-02-11

### Fixed

- Add missing `:context` field to all thin event structs — `fetch_related_object/2` references `Map.get(event, :context)` but the field was absent from the generated struct, producing 18 compiler warnings on Elixir 1.18+ and silently dropping authentication context ([0305b53])

## [0.1.4] - 2026-02-11

### Fixed

- Fix inner type deserialization for modules not yet loaded by the BEAM — `function_exported?/3` does not trigger auto-loading, so `__inner_types__` was silently skipped for nested structs like `InvoiceLineItem.Parent.SubscriptionItemDetails`, returning raw string-keyed maps instead of typed structs ([`Code.ensure_loaded!/1`](https://hexdocs.pm/elixir/Code.html#ensure_loaded!/1) is now called before the check)

## [0.1.3] - 2026-02-10

*Typespecs across all 307 resource modules now reference actual struct types instead of `map()`, improving Dialyzer coverage, IDE autocomplete, and LLM-generated code accuracy.*

### Changed

- Generate precise typespecs for resource structs — inner types now show `Period.t()` instead of `map()`, cross-resource refs resolve to `Stripe.Resources.Invoice.t()` ([9c2c859])
- Document string-key vs atom-key convention in `usage-rules.md` — request params use string keys, response structs use atom keys ([9c2c859])

### Fixed

- Fix 36 expandable fields typed as `map()` instead of `String.t() | Resource.t()` — unions like `anyOf: [string, customer, deleted_customer]` now resolve correctly ([9c2c859])

## [0.1.2] - 2026-02-10

### Added

- Add `Stripe.Deserializer.from_json/1` for decoding JSON strings into typed structs ([b0b2acf])
- Add 500 typed inner modules for nested API objects (e.g. `Charge.BillingDetails`, `Price.Recurring`, `InvoiceLineItem.Period`) replacing untyped `map()` ([a81f7bf])
- Add field override mechanism for API fields missing from the OpenAPI spec ([a81f7bf])
- Add integration test suite against stripe-mock for field coverage validation ([a81f7bf])

### Fixed

- Fix `Charge.invoice` returning `nil` — field was absent from generated struct because the OpenAPI spec omits it ([a81f7bf])
- Fix nested object deserialization losing type information — inner types now recurse through `__inner_types__` at all nesting depths ([a81f7bf])

## [0.1.1] - 2025-02-07

### Fixed

- Fix `event.data` deserialization: `Webhook.construct_event/4` now returns `event.data` as a typed `%EventData{}` struct instead of a raw string-keyed map ([1d30ea8])

## [0.1.0] - 2025-02-06

*Initial release.*

### Added

- Add full V1 + V2 API coverage (561 endpoints across 190 service modules)
- Add typed Elixir structs for 307 resource types with inner type deserialization
- Add auto-paging pagination for V1 lists, search results, and V2 lists
- Add webhook signature verification via `Webhook.construct_event/4`
- Add `WebhookPlug` for Plug/Phoenix integration
- Add OAuth support (`authorize_url`, `token`, `deauthorize`)
- Add multipart file uploads and streaming response support
- Add per-event typed modules (21 event types with nested data structs)
- Add process-scoped test stubs via `Stripe.Test`
- Add retry with exponential backoff, jitter, and idempotency keys
- Add telemetry events for request lifecycle observability
- Add Finch HTTP client with connection pooling (Mint + NimblePool)

[0.1.6]: https://github.com/jeffhuen/tiger_stripe/compare/v0.1.5...v0.1.6
[0.1.5]: https://github.com/jeffhuen/tiger_stripe/compare/v0.1.4...v0.1.5
[d07dbf5]: https://github.com/jeffhuen/tiger_stripe/commit/d07dbf5
[0.1.4]: https://github.com/jeffhuen/tiger_stripe/compare/v0.1.3...v0.1.4
[0305b53]: https://github.com/jeffhuen/tiger_stripe/commit/0305b53
[0.1.3]: https://github.com/jeffhuen/tiger_stripe/compare/v0.1.2...v0.1.3
[0.1.2]: https://github.com/jeffhuen/tiger_stripe/compare/v0.1.1...v0.1.2
[0.1.1]: https://github.com/jeffhuen/tiger_stripe/compare/v0.1.0...v0.1.1
[0.1.0]: https://github.com/jeffhuen/tiger_stripe/releases/tag/v0.1.0
[9c2c859]: https://github.com/jeffhuen/tiger_stripe/commit/9c2c859
[b0b2acf]: https://github.com/jeffhuen/tiger_stripe/commit/b0b2acf
[a81f7bf]: https://github.com/jeffhuen/tiger_stripe/commit/a81f7bf
[1d30ea8]: https://github.com/jeffhuen/tiger_stripe/commit/1d30ea8
