# File generated from our OpenAPI spec
defmodule Stripe.Services.Reporting.ReportRunService do
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
  alias Stripe.Client

  @doc """
  Create a Report Run

  Creates a new object and begin running the report. (Certain report types require a [live-mode API key](https://stripe.com/docs/keys#test-live-modes).)
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Reporting.ReportRun.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/reporting/report_runs",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  List all Report Runs

  Returns a list of Report Runs, with the most recent appearing first.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/reporting/report_runs", Keyword.merge(opts, params: params))
  end

  @doc """
  Retrieve a Report Run

  Retrieves the details of an existing Report Run.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Reporting.ReportRun.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, report_run, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/reporting/report_runs/#{report_run}",
      Keyword.merge(opts, params: params)
    )
  end
end
