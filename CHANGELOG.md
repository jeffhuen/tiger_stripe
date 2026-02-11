# Changelog

## v0.1.1

### Bug Fixes

- Fix `event.data` deserialization: `Webhook.construct_event/4` now returns
  `event.data` as a `%EventData{}` struct with `event.data.object` cast to the
  correct typed resource (e.g. `%Invoice{}`, `%Charge{}`). Previously,
  `event.data` was a raw string-keyed map.

## v0.1.0

Initial release.

### Features

- Full V1 + V2 API coverage (561 endpoints across 190 service modules)
- Auto-generated from the Stripe OpenAPI spec (v2166)
- Typed Elixir structs for 307 resource types with inner type deserialization
- V1 list pagination (`ListObject.auto_paging_stream/3`)
- V1 search pagination (`SearchResult.auto_paging_stream/3`)
- V2 URL-based pagination (`V2.ListObject.auto_paging_stream/3`)
- Webhook signature verification (`Webhook.construct_event/4`)
- `WebhookPlug` for Plug/Phoenix integration
- OAuth support (`authorize_url`, `token`, `deauthorize`)
- Multipart file uploads
- Streaming response support (`Client.stream_request/6`)
- Raw request support (`Client.raw_request/4`)
- Per-event typed modules (21 event types with nested data structs)
- Ownership-based test stubs (`Stripe.Test`)
- Retry with exponential backoff and jitter
- Telemetry events for request lifecycle
- Finch HTTP client (Mint + NimblePool)
- Zero-dep JSON via native `JSON` module (Elixir 1.18+)
