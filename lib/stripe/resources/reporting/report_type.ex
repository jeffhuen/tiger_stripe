# File generated from our OpenAPI spec
defmodule Stripe.Resources.Reporting.ReportType do
  @moduledoc """
  reporting_report_type

  The Report Type resource corresponds to a particular type of report, such as
  the "Activity summary" or "Itemized payouts" reports. These objects are
  identified by an ID belonging to a set of enumerated values. See
  [API Access to Reports documentation](https://docs.stripe.com/reporting/statements/api)
  for those Report Type IDs, along with required and optional parameters.

  Note that certain report types can only be run based on your live-mode data (not test-mode
  data), and will error when queried without a [live-mode API key](https://docs.stripe.com/keys#test-live-modes).
  """

  @typedoc """
  * `data_available_end` - Most recent time for which this Report Type is available. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `data_available_start` - Earliest time for which this Report Type is available. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `default_columns` - List of column names that are included by default when this Report Type gets run. (If the Report Type doesn't support the `columns` parameter, this will be null.) Nullable.
  * `id` - The [ID of the Report Type](https://docs.stripe.com/reporting/statements/api#available-report-types), such as `balance.summary.1`. Max length: 5000.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `name` - Human-readable name of the Report Type Max length: 5000.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `reporting.report_type`.
  * `updated` - When this Report Type was latest updated. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `version` - Version of the Report Type. Different versions report with the same ID will have the same purpose, but may take different run parameters or have different result schemas.
  """
  @type t :: %__MODULE__{
          data_available_end: integer(),
          data_available_start: integer(),
          default_columns: [String.t()],
          id: String.t(),
          livemode: boolean(),
          name: String.t(),
          object: String.t(),
          updated: integer(),
          version: integer()
        }

  defstruct [
    :data_available_end,
    :data_available_start,
    :default_columns,
    :id,
    :livemode,
    :name,
    :object,
    :updated,
    :version
  ]

  @object_name "reporting.report_type"
  def object_name, do: @object_name
end
