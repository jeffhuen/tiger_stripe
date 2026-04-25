# File generated from our OpenAPI spec
defmodule Stripe.Params.WebhookEndpointCreateParams do
  @moduledoc "Parameters for webhook endpoint create."

  @typedoc """
  * `api_version` - Events sent to this endpoint will be generated with this Stripe Version instead of your account's default Stripe Version. Possible values: `2011-01-01`, `2011-06-21`, `2011-06-28`, `2011-08-01`, `2011-09-15`, `2011-11-17`, `2012-02-23`, `2012-03-25`, `2012-06-18`, `2012-06-28`, `2012-07-09`, `2012-09-24`, `2012-10-26`, `2012-11-07`, `2013-02-11`, `2013-02-13`, `2013-07-05`, `2013-08-12`, `2013-08-13`, `2013-10-29`, `2013-12-03`, `2014-01-31`, `2014-03-13`, `2014-03-28`, `2014-05-19`, `2014-06-13`, `2014-06-17`, `2014-07-22`, `2014-07-26`, `2014-08-04`, `2014-08-20`, `2014-09-08`, `2014-10-07`, `2014-11-05`, `2014-11-20`, `2014-12-08`, `2014-12-17`, `2014-12-22`, `2015-01-11`, `2015-01-26`, `2015-02-10`, `2015-02-16`, `2015-02-18`, `2015-03-24`, `2015-04-07`, `2015-06-15`, `2015-07-07`, `2015-07-13`, `2015-07-28`, `2015-08-07`, `2015-08-19`, `2015-09-03`, `2015-09-08`, `2015-09-23`, `2015-10-01`, `2015-10-12`, `2015-10-16`, `2016-02-03`, `2016-02-19`, `2016-02-22`, `2016-02-23`, `2016-02-29`, `2016-03-07`, `2016-06-15`, `2016-07-06`, `2016-10-19`, `2017-01-27`, `2017-02-14`, `2017-04-06`, `2017-05-25`, `2017-06-05`, `2017-08-15`, `2017-12-14`, `2018-01-23`, `2018-02-05`, `2018-02-06`, `2018-02-28`, `2018-05-21`, `2018-07-27`, `2018-08-23`, `2018-09-06`, `2018-09-24`, `2018-10-31`, `2018-11-08`, `2019-02-11`, `2019-02-19`, `2019-03-14`, `2019-05-16`, `2019-08-14`, `2019-09-09`, `2019-10-08`, `2019-10-17`, `2019-11-05`, `2019-12-03`, `2020-03-02`, `2020-08-27`, `2022-08-01`, `2022-11-15`, `2023-08-16`, `2023-10-16`, `2024-04-10`, `2024-06-20`, `2024-09-30.acacia`, `2024-10-28.acacia`, `2024-11-20.acacia`, `2024-12-18.acacia`, `2025-01-27.acacia`, `2025-02-24.acacia`, `2025-03-01.dashboard`, `2025-03-31.basil`, `2025-04-30.basil`, `2025-05-28.basil`, `2025-06-30.basil`, `2025-07-30.basil`, `2025-08-27.basil`, `2025-09-30.clover`, `2025-10-29.clover`, `2025-11-17.clover`, `2025-12-15.clover`, `2026-01-28.clover`. Max length: 5000.
  * `connect` - Whether this endpoint should receive events from connected accounts (`true`), or from your account (`false`). Defaults to `false`.
  * `description` - An optional description of what the webhook is used for.
  * `enabled_events` - The list of events to enable for this endpoint. You may specify `['*']` to enable all events, except those that require explicit selection.
  * `expand` - Specifies which fields in the response should be expanded.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `url` - The URL of the webhook endpoint.
  """
  @type t :: %__MODULE__{
          api_version: String.t() | nil,
          connect: boolean() | nil,
          description: map() | nil,
          enabled_events: [String.t()],
          expand: [String.t()] | nil,
          metadata: map() | nil,
          url: String.t()
        }

  defstruct [:api_version, :connect, :description, :enabled_events, :expand, :metadata, :url]
end
