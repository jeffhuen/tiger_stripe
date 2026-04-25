defmodule Stripe.CompactGeneratedSurfaceTest do
  use ExUnit.Case, async: true

  alias Stripe.Events.V1BillingMeterErrorReportTriggeredEvent
  alias Stripe.Params.ChargeCreateParams
  alias Stripe.Resources.Charge

  test "resource nested JSON shapes are not compiled as public modules" do
    assert Code.ensure_loaded?(Charge)
    assert function_exported?(Charge, :__struct__, 0)

    refute Code.ensure_loaded?(Charge.BillingDetails)
    refute Code.ensure_loaded?(Charge.PaymentMethodDetails.Card.Checks)

    assert function_exported?(Charge, :__nested_fields__, 0)
    assert %{"billing_details" => %{fields: fields}} = Charge.__nested_fields__()
    assert Map.has_key?(fields, "email")
  end

  test "params nested JSON shapes are local types, not public modules" do
    assert Code.ensure_loaded?(ChargeCreateParams)
    assert function_exported?(ChargeCreateParams, :__struct__, 0)

    refute Code.ensure_loaded?(ChargeCreateParams.Shipping)
    refute Code.ensure_loaded?(ChargeCreateParams.Shipping.Address)
  end

  test "event data shapes are metadata, not public nested modules" do
    assert Code.ensure_loaded?(V1BillingMeterErrorReportTriggeredEvent)

    refute Code.ensure_loaded?(V1BillingMeterErrorReportTriggeredEvent.Data)
    refute Code.ensure_loaded?(V1BillingMeterErrorReportTriggeredEvent.Data.Reason)

    assert function_exported?(V1BillingMeterErrorReportTriggeredEvent, :__nested_fields__, 0)

    assert %{"data" => %{fields: fields}} =
             V1BillingMeterErrorReportTriggeredEvent.__nested_fields__()

    assert Map.has_key?(fields, "reason")
  end

  test "representative generated files contain only their public module" do
    assert defmodule_count("lib/stripe/resources/charge.ex") == 1
    assert defmodule_count("lib/stripe/params/charge_create_params.ex") == 1

    assert defmodule_count("lib/stripe/events/v1_billing_meter_error_report_triggered_event.ex") ==
             1
  end

  defp defmodule_count(path) do
    path
    |> File.read!()
    |> then(&Regex.scan(~r/^\s*defmodule\s+/m, &1))
    |> length()
  end
end
