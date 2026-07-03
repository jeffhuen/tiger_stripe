# Changelog

All notable changes to this project are documented in this file.

The format is based on [Common Changelog](https://common-changelog.org/).

## [0.4.0] - 2026-07-03

### Changed

- **Breaking:** flatten generated resource and params public types. `Stripe.Resources.*.t()` and `Stripe.Params.*Params.t()` remain, but now expand to `%__MODULE__{}` instead of recursive field maps.
- **Breaking:** remove generated nested helper type aliases from resource and params modules, such as `Stripe.Resources.Invoice.lines()` and `Stripe.Params.PaymentIntentCreateParams.payment_method_data()`.
- Preserve generated `@moduledoc`, top-level `@typedoc`, `defstruct`, service `@spec`s, `object_name/0`, `expandable_fields/0`, and resource `__nested_fields__/0` deserialization metadata.
- Reduce Dialyzer and compile-time analysis load from recursive generated typespec graphs while keeping runtime response casting unchanged.

### Added

- Add a migration guide: [`guides/migrating-0.3-to-0.4.md`](guides/migrating-0.3-to-0.4.md).

### Fixed

- Include the generator's `:rustyjson` dependency in the Dialyzer PLT config so `mix dialyzer` can analyze the local generator modules.

## [0.3.0] - 2026-05-22

### Changed

- **Breaking:** remove library application configuration as public API. `Stripe.client/0` no longer reads `config :tiger_stripe`; construct clients with `Stripe.client(api_key)` or read credentials from your own application before calling TigerStripe.
- **Breaking:** stop auto-starting `Stripe.Finch`. Add `Stripe` to your application's supervision tree, or pass `finch: MyApp.Finch` when using an existing Finch pool.
- **Breaking:** move test stubbing to an explicit client transport. Tests that use `Stripe.Test.stub/1` should construct clients with `Stripe.Test.client/2` or pass `transport: Stripe.Test.transport()`.
- Compute `uname` once at compile time for the client user-agent instead of shelling out on every request.
- Generate concrete service success specs from each operation's actual response object — e.g. `Stripe.Resources.PaymentMethod.t()`, `Stripe.ListObject.t()`, `Stripe.SearchResult.t()` — instead of `term()`. Operations with a polymorphic union or non-JSON response keep `term()`.
- Update the Igniter installer to generate an application-owned Stripe wrapper module and add the default Finch pool to the supervision tree.

### Added

- Add a migration guide: [`guides/migrating-0.2-to-0.3.md`](guides/migrating-0.2-to-0.3.md).

### Fixed

- Return `{:error, %Stripe.Error{}}` for malformed webhook signature timestamps instead of raising on hostile input.

## [0.2.0] - 2026-04-25

### Changed

- **Breaking:** remove generated child modules for nested Stripe response, params, and event data shapes. Top-level resources, params, services, and event modules remain public; nested shapes are now local `@type` aliases and deserialize to atom-key maps.
- **Breaking:** replace generated `__inner_types__/0` metadata with internal `__nested_fields__/0` metadata used by the deserializer.
- **Breaking:** remove stale preview resources that are no longer emitted by the current vendored Stripe OpenAPI spec and Ruby SDK fixture: `Stripe.Resources.Reserve.Hold`, `Stripe.Resources.Reserve.Plan`, `Stripe.Resources.Reserve.Release`, `Stripe.Resources.UPI`, `Stripe.Resources.UPIHandleRedirectOrDisplayQrCode`, and `Stripe.Resources.UPIQRCode`.
- Reduce the generated public module surface so clean compiles in consuming apps do not pay for thousands of nested JSON-shape modules.
- Preserve top-level resource structs and recursively cast known nested response shapes to atom-key maps while preserving unknown Stripe fields as string keys.

### Added

- Add a migration guide: [`guides/migrating-0.1-to-0.2.md`](guides/migrating-0.1-to-0.2.md).

## [0.1.11] - 2026-04-16

### Added

- Add `Stripe.Resources.Reserve.Hold`, `Stripe.Resources.Reserve.Plan`, and `Stripe.Resources.Reserve.Release` resources, plus their event types (`reserve.hold.created`, `reserve.hold.updated`, `reserve.plan.created`, `reserve.plan.disabled`, `reserve.plan.expired`, `reserve.plan.updated`, `reserve.release.created`)
- Add `Stripe.Resources.UPI`, `Stripe.Resources.UPIHandleRedirectOrDisplayQrCode`, and `Stripe.Resources.UPIQRCode` resources

### Changed

- Sync OpenAPI spec to v2239 — field and parameter updates across V1 and V2 APIs (229 files, +2117/-466)

## [0.1.10] - 2026-03-03

### Changed

- Sync OpenAPI spec to v2186 (API version `2026-01-28.clover`) — spec content unchanged from v2169, no generated code differences

## [0.1.9] - 2026-02-17

### Changed

- Exclude code generator and `mix stripe.generate` task from hex package — the package is regenerated weekly from the latest Stripe OpenAPI spec, so end users only need the generated output; contributors who need immediate regeneration can use `mix stripe.generate` from the repo. This also drops the `rustyjson` transitive dependency

## [0.1.8] - 2026-02-16

### Changed

- Bump RustyJSON to 0.3.9
- Eliminate dynamic atom creation in code generator to follow Elixir best practices

### Fixed

- Fix generated typespecs for deeply nested parameter modules — previously only first-level children were emitted, leaving ~960 Dialyzer warnings for missing types
- Normalize error returns in `WebhookPlug` so the `with` chain handles a single consistent shape

## [0.1.7] - 2026-02-12

### Fixed

- Fix generator to produce strongly typed maps for `additionalProperties` fields (e.g., `Price.currency_options` now resolves to `%{String.t() => CurrencyOptions.t()}` instead of `map()`)
- Fix parameter generator to produce strongly typed maps for nested request parameters (e.g. `Coupon.create` `currency_options` now resolves to `%{String.t() => CurrencyOptions.t()}` instead of `map()`)
- Fix generator to support `oneOf` unions (polymorphism), enabling future support for disjoint types in V2 events

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

[0.4.0]: https://github.com/jeffhuen/tiger_stripe/compare/v0.3.0...v0.4.0
[0.3.0]: https://github.com/jeffhuen/tiger_stripe/compare/v0.2.0...v0.3.0
[0.2.0]: https://github.com/jeffhuen/tiger_stripe/compare/v0.1.11...v0.2.0
[0.1.11]: https://github.com/jeffhuen/tiger_stripe/compare/v0.1.10...v0.1.11
[0.1.10]: https://github.com/jeffhuen/tiger_stripe/compare/v0.1.9...v0.1.10
[0.1.9]: https://github.com/jeffhuen/tiger_stripe/compare/v0.1.8...v0.1.9
[0.1.8]: https://github.com/jeffhuen/tiger_stripe/compare/v0.1.7...v0.1.8
[0.1.7]: https://github.com/jeffhuen/tiger_stripe/compare/v0.1.6...v0.1.7
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
