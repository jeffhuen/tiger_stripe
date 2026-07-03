# File generated from our OpenAPI spec
defmodule Stripe.Resources.Sigma.ScheduledQueryRun do
  @moduledoc """
  ScheduledQueryRun

  If you have [scheduled a Sigma query](https://docs.stripe.com/sigma/scheduled-queries), you'll
  receive a `sigma.scheduled_query_run.created` webhook each time the query
  runs. The webhook contains a `ScheduledQueryRun` object, which you can use to
  retrieve the query results.
  """

  @typedoc """
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `data_load_time` - When the query was run, Sigma contained a snapshot of your Stripe data at this time. Format: Unix timestamp.
  * `error` - Expandable.
  * `file` - The file object representing the results of the query. Nullable. Expandable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `scheduled_query_run`.
  * `result_available_until` - Time at which the result expires and is no longer available for download. Format: Unix timestamp.
  * `sql` - SQL for the query. Max length: 100000.
  * `status` - The query's execution status, which will be `completed` for successful runs, and `canceled`, `failed`, or `timed_out` otherwise. Max length: 5000.
  * `title` - Title of the query. Max length: 5000.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :created,
    :data_load_time,
    :error,
    :file,
    :id,
    :livemode,
    :object,
    :result_available_until,
    :sql,
    :status,
    :title
  ]

  @object_name "scheduled_query_run"
  def object_name, do: @object_name

  def expandable_fields, do: ["error", "file"]

  def __nested_fields__ do
    %{
      "error" => %{
        fields: %{
          "message" => :scalar
        }
      },
      "file" => {:resource, Stripe.Resources.File}
    }
  end
end
