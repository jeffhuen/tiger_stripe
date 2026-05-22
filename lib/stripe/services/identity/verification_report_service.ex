# File generated from our OpenAPI spec
defmodule Stripe.Services.Identity.VerificationReportService do
  @moduledoc """
  GelatoVerificationReport

  A VerificationReport is the result of an attempt to collect and verify data from a user.
  The collection of verification checks performed is determined from the `type` and `options`
  parameters used. You can find the result of each verification check performed in the
  appropriate sub-resource: `document`, `id_number`, `selfie`.

  Each VerificationReport contains a copy of any data collected by the user as well as
  reference IDs which can be used to access collected images through the [FileUpload](https://docs.stripe.com/api/files)
  API. To configure and create VerificationReports, use the
  [VerificationSession](https://docs.stripe.com/api/identity/verification_sessions) API.

  Related guide: [Accessing verification results](https://docs.stripe.com/identity/verification-sessions#results).
  """
  alias Stripe.Client

  @doc """
  List VerificationReports

  List all verification reports.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/identity/verification_reports",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Retrieve a VerificationReport

  Retrieves an existing VerificationReport
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Identity.VerificationReport.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, report, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/identity/verification_reports/#{report}",
      Keyword.merge(opts, params: params)
    )
  end
end
