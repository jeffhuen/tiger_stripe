# File generated from our OpenAPI spec
defmodule Stripe.Services.Reporting.ReportTypeService do
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
  alias Stripe.Client

  @doc """
  List all Report Types

  Returns a full list of Report Types.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/reporting/report_types",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Retrieve a Report Type

  Retrieves the details of a Report Type. (Certain report types require a [live-mode API key](https://stripe.com/docs/keys#test-live-modes).)
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Reporting.ReportType.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, report_type, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/reporting/report_types/#{report_type}",
      Keyword.merge(opts, params: params)
    )
  end
end
