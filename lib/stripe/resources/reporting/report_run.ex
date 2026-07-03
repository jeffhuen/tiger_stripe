# File generated from our OpenAPI spec
defmodule Stripe.Resources.Reporting.ReportRun do
  @moduledoc """
  reporting_report_run

  The Report Run object represents an instance of a report type generated with
  specific run parameters. Once the object is created, Stripe begins processing the report.
  When the report has finished running, it will give you a reference to a file
  where you can retrieve your results. For an overview, see
  [API Access to Reports](https://docs.stripe.com/reporting/statements/api).

  Note that certain report types can only be run based on your live-mode data (not test-mode
  data), and will error when queried without a [live-mode API key](https://docs.stripe.com/keys#test-live-modes).
  """

  @typedoc """
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `error` - If something should go wrong during the run, a message about the failure (populated when
  `status=failed`). Max length: 5000. Nullable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `livemode` - `true` if the report is run on live mode data and `false` if it is run on test mode data.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `reporting.report_run`.
  * `parameters` - Expandable.
  * `report_type` - The ID of the [report type](https://docs.stripe.com/reports/report-types) to run, such as `"balance.summary.1"`. Max length: 5000.
  * `result` - The file object representing the result of the report run (populated when
  `status=succeeded`). Nullable. Expandable.
  * `status` - Status of this report run. This will be `pending` when the run is initially created.
  When the run finishes, this will be set to `succeeded` and the `result` field will be populated.
  Rarely, we may encounter an error, at which point this will be set to `failed` and the `error` field will be populated. Max length: 5000.
  * `succeeded_at` - Timestamp at which this run successfully finished (populated when
  `status=succeeded`). Measured in seconds since the Unix epoch. Format: Unix timestamp. Nullable.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :created,
    :error,
    :id,
    :livemode,
    :object,
    :parameters,
    :report_type,
    :result,
    :status,
    :succeeded_at
  ]

  @object_name "reporting.report_run"
  def object_name, do: @object_name

  def expandable_fields, do: ["parameters", "result"]

  def __nested_fields__ do
    %{
      "parameters" => %{
        fields: %{
          "columns" => {:list, :scalar},
          "connected_account" => :scalar,
          "currency" => :scalar,
          "interval_end" => :scalar,
          "interval_start" => :scalar,
          "payout" => :scalar,
          "reporting_category" => :scalar,
          "timezone" => :scalar
        }
      },
      "result" => {:resource, Stripe.Resources.File}
    }
  end
end
