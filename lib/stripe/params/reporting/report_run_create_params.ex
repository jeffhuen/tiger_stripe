# File generated from our OpenAPI spec
defmodule Stripe.Params.Reporting.ReportRunCreateParams do
  @moduledoc "Parameters for report run create."

  @typedoc """
  * `expand` - Specifies which fields in the response should be expanded.
  * `parameters` - Parameters specifying how the report should be run. Different Report Types have different required and optional parameters, listed in the [API Access to Reports](https://docs.stripe.com/reporting/statements/api) documentation.
  * `report_type` - The ID of the [report type](https://docs.stripe.com/reporting/statements/api#report-types) to run, such as `"balance.summary.1"`.
  """
  @type t :: %__MODULE__{}

  defstruct [:expand, :parameters, :report_type]
end
