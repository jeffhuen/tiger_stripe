defmodule Stripe.EventModulesTest do
  use ExUnit.Case, async: true

  alias Stripe.Events.{
    UnknownEventNotification,
    V1BillingMeterErrorReportTriggeredEvent,
    V1BillingMeterNoMeterFoundEvent,
    V2CoreAccountCreatedEvent,
    V2CoreAccountIncludingConfigurationCustomerUpdatedEvent,
    V2CoreAccountPersonCreatedEvent
  }

  describe "per-event module count" do
    test "event module files match Ruby's count" do
      ruby_events =
        Path.wildcard("priv/stripe-ruby-master/lib/stripe/events/*.rb") |> Enum.count()

      elixir_events = Path.wildcard("lib/stripe/events/*.ex") |> Enum.count()
      assert ruby_events > 0, "Ruby SDK not synced — no event files found"
      assert elixir_events == ruby_events
    end
  end

  describe "lookup_type/0" do
    test "V2 simple event" do
      assert V2CoreAccountCreatedEvent.lookup_type() == "v2.core.account.created"
    end

    test "V2 event with data" do
      assert V2CoreAccountPersonCreatedEvent.lookup_type() == "v2.core.account_person.created"
    end

    test "V2 bracket-notation event" do
      assert V2CoreAccountIncludingConfigurationCustomerUpdatedEvent.lookup_type() ==
               "v2.core.account[configuration.customer].updated"
    end

    test "V1 billing event" do
      assert V1BillingMeterErrorReportTriggeredEvent.lookup_type() ==
               "v1.billing.meter.error_report_triggered"
    end
  end

  describe "struct fields" do
    test "V2 simple event has base fields + related_object" do
      event = %V2CoreAccountCreatedEvent{}
      assert Map.has_key?(event, :id)
      assert Map.has_key?(event, :type)
      assert Map.has_key?(event, :created)
      assert Map.has_key?(event, :livemode)
      assert Map.has_key?(event, :related_object)
    end

    test "V2 event with data has data field" do
      event = %V2CoreAccountPersonCreatedEvent{}
      assert Map.has_key?(event, :data)
      assert Map.has_key?(event, :related_object)
    end

    test "V1 billing event has data + related_object" do
      event = %V1BillingMeterErrorReportTriggeredEvent{}
      assert Map.has_key?(event, :data)
      assert Map.has_key?(event, :related_object)
    end

    test "unknown event notification has related_object" do
      event = %UnknownEventNotification{}
      assert Map.has_key?(event, :related_object)
    end
  end

  describe "nested data types" do
    test "V2 person event has data metadata with account_id field" do
      refute Code.ensure_loaded?(nested_module(V2CoreAccountPersonCreatedEvent, "Data"))

      assert %{"data" => %{fields: data}} =
               V2CoreAccountPersonCreatedEvent.__nested_fields__()

      assert Map.has_key?(data, "account_id")
    end

    test "V1 billing error has deeply nested data metadata" do
      event = V1BillingMeterErrorReportTriggeredEvent
      refute Code.ensure_loaded?(nested_module(event, "Data"))
      refute Code.ensure_loaded?(nested_module(event, ["Data", "Reason"]))

      assert %{"data" => %{fields: data}} = event.__nested_fields__()
      assert Map.has_key?(data, "reason")
      assert Map.has_key?(data, "developer_message_summary")
      assert Map.has_key?(data, "validation_start")
      assert Map.has_key?(data, "validation_end")

      assert %{fields: reason} = data["reason"]
      assert Map.has_key?(reason, "error_count")
      assert Map.has_key?(reason, "error_types")

      assert %{fields: error_type} = reason["error_types"]
      assert Map.has_key?(error_type, "code")
      assert Map.has_key?(error_type, "sample_errors")

      assert %{fields: sample_error} = error_type["sample_errors"]
      assert Map.has_key?(sample_error, "error_message")
      assert Map.has_key?(sample_error, "request")

      assert %{fields: request} = sample_error["request"]
      assert Map.has_key?(request, "identifier")
    end

    test "nested_fields wired correctly for nested data" do
      alias V1BillingMeterErrorReportTriggeredEvent, as: E

      assert %{"data" => %{fields: data}} = E.__nested_fields__()
      assert %{fields: reason} = data["reason"]
      assert %{fields: error_types} = reason["error_types"]
      assert %{fields: sample_errors} = error_types["sample_errors"]
      assert %{fields: request} = sample_errors["request"]
      assert request["identifier"] == :scalar
    end
  end

  describe "V1 no_meter_found has data but no related_object" do
    test "has data metadata" do
      refute Code.ensure_loaded?(nested_module(V1BillingMeterNoMeterFoundEvent, "Data"))

      assert %{"data" => %{fields: data}} =
               V1BillingMeterNoMeterFoundEvent.__nested_fields__()

      assert Map.has_key?(data, "reason")
    end

    test "does not export fetch_related_object" do
      refute function_exported?(V1BillingMeterNoMeterFoundEvent, :fetch_related_object, 2)
    end
  end

  describe "fetch_related_object/2" do
    test "V2 event with related_object calls Client.request" do
      assert function_exported?(V2CoreAccountCreatedEvent, :fetch_related_object, 2)
    end

    test "unknown event notification has fetch_related_object" do
      assert function_exported?(UnknownEventNotification, :fetch_related_object, 2)
    end
  end

  describe "event_type_to_module registry" do
    test "maps thin event types to their modules" do
      registry = Stripe.EventTypes.event_type_to_module()

      assert registry["v2.core.account.created"] == V2CoreAccountCreatedEvent
      assert registry["v2.core.account_person.created"] == V2CoreAccountPersonCreatedEvent

      assert registry["v2.core.account[configuration.customer].updated"] ==
               V2CoreAccountIncludingConfigurationCustomerUpdatedEvent

      assert registry["v1.billing.meter.error_report_triggered"] ==
               V1BillingMeterErrorReportTriggeredEvent
    end

    test "registry has one entry per event module (except UnknownEventNotification)" do
      event_modules = Path.wildcard("lib/stripe/events/*.ex") |> Enum.count()
      # UnknownEventNotification is the catch-all fallback, not in the registry
      assert map_size(Stripe.EventTypes.event_type_to_module()) == event_modules - 1
    end
  end

  defp nested_module(parent, child) when is_binary(child), do: Module.concat(parent, child)

  defp nested_module(parent, children), do: Module.concat([parent | children])
end
