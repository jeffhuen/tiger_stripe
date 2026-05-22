# File generated from our OpenAPI spec
defmodule Stripe.Services.Sigma.ScheduledQueryRunService do
  @moduledoc """
  ScheduledQueryRun

  If you have [scheduled a Sigma query](https://docs.stripe.com/sigma/scheduled-queries), you'll
  receive a `sigma.scheduled_query_run.created` webhook each time the query
  runs. The webhook contains a `ScheduledQueryRun` object, which you can use to
  retrieve the query results.
  """
  alias Stripe.Client

  @doc """
  List all scheduled query runs

  Returns a list of scheduled query runs.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/sigma/scheduled_query_runs",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Retrieve a scheduled query run

  Retrieves the details of an scheduled query run.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Sigma.ScheduledQueryRun.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, scheduled_query_run, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/sigma/scheduled_query_runs/#{scheduled_query_run}",
      Keyword.merge(opts, params: params)
    )
  end
end
