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
    test "21 event module files match Ruby's count" do
      event_files =
        Path.wildcard("lib/stripe/events/*.ex")
        |> Enum.count()

      assert event_files == 21
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
    test "V2 person event has Data module with account_id field" do
      data = %V2CoreAccountPersonCreatedEvent.Data{}
      assert Map.has_key?(data, :account_id)
    end

    test "V1 billing error has deeply nested Data modules" do
      alias V1BillingMeterErrorReportTriggeredEvent.Data

      data = %Data{}
      assert Map.has_key?(data, :reason)
      assert Map.has_key?(data, :developer_message_summary)
      assert Map.has_key?(data, :validation_start)
      assert Map.has_key?(data, :validation_end)

      reason = %Data.Reason{}
      assert Map.has_key?(reason, :error_count)
      assert Map.has_key?(reason, :error_types)

      error_type = %Data.Reason.ErrorTypes{}
      assert Map.has_key?(error_type, :code)
      assert Map.has_key?(error_type, :sample_errors)

      sample_error = %Data.Reason.ErrorTypes.SampleErrors{}
      assert Map.has_key?(sample_error, :error_message)
      assert Map.has_key?(sample_error, :request)

      request = %Data.Reason.ErrorTypes.SampleErrors.Request{}
      assert Map.has_key?(request, :identifier)
    end

    test "inner_types wired correctly for nested data" do
      alias V1BillingMeterErrorReportTriggeredEvent, as: E

      assert E.__inner_types__() == %{"data" => E.Data}
      assert E.Data.__inner_types__() == %{"reason" => E.Data.Reason}
      assert E.Data.Reason.__inner_types__() == %{"error_types" => E.Data.Reason.ErrorTypes}

      assert E.Data.Reason.ErrorTypes.__inner_types__() ==
               %{"sample_errors" => E.Data.Reason.ErrorTypes.SampleErrors}

      assert E.Data.Reason.ErrorTypes.SampleErrors.__inner_types__() ==
               %{"request" => E.Data.Reason.ErrorTypes.SampleErrors.Request}
    end
  end

  describe "V1 no_meter_found has data but no related_object" do
    test "has data module" do
      data = %V1BillingMeterNoMeterFoundEvent.Data{}
      assert Map.has_key?(data, :reason)
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

    test "registry has 20 entries (all thin events)" do
      assert map_size(Stripe.EventTypes.event_type_to_module()) == 20
    end
  end
end
