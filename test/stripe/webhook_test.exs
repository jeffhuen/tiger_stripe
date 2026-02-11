defmodule Stripe.WebhookTest do
  use ExUnit.Case, async: true

  alias Stripe.{Error, Webhook}

  @secret "whsec_test_secret"
  @payload ~s({"id": "evt_123", "object": "event", "type": "charge.succeeded"})

  defp generate_header(payload \\ @payload, opts \\ []) do
    secret = Keyword.get(opts, :secret, @secret)
    timestamp = Keyword.get(opts, :timestamp, System.system_time(:second))
    signature = Webhook.compute_signature(timestamp, payload, secret)
    scheme = Keyword.get(opts, :scheme, "v1")
    "t=#{timestamp},#{scheme}=#{signature}"
  end

  describe "construct_event/4" do
    test "constructs event with valid signature" do
      header = generate_header()
      assert {:ok, event} = Webhook.construct_event(@payload, header, @secret)
      assert %Stripe.Resources.Event{} = event
      assert event.id == "evt_123"
      assert event.type == "charge.succeeded"
    end

    test "returns error with invalid signature" do
      header = generate_header(@payload, secret: "whsec_wrong")

      assert {:error, %Error{type: :signature_verification_error}} =
               Webhook.construct_event(@payload, header, @secret)
    end

    test "returns error with tampered payload" do
      header = generate_header()
      tampered = ~s({"id": "evt_HACKED", "object": "event"})

      assert {:error, %Error{type: :signature_verification_error}} =
               Webhook.construct_event(tampered, header, @secret)
    end

    test "returns error with expired timestamp" do
      old_timestamp = System.system_time(:second) - 600
      header = generate_header(@payload, timestamp: old_timestamp)

      assert {:error, %Error{type: :signature_verification_error, message: message}} =
               Webhook.construct_event(@payload, header, @secret, tolerance: 300)

      assert message =~ "Timestamp outside the tolerance zone"
    end

    test "accepts timestamp within tolerance" do
      recent = System.system_time(:second) - 100
      header = generate_header(@payload, timestamp: recent)
      assert {:ok, _event} = Webhook.construct_event(@payload, header, @secret, tolerance: 300)
    end

    test "deserializes event.data.object into typed struct" do
      payload =
        ~s({"id":"evt_1","object":"event","type":"invoice.created","data":{"object":{"id":"inv_1","object":"invoice","amount_due":5000},"previous_attributes":null}})

      header = generate_header(payload)
      assert {:ok, event} = Webhook.construct_event(payload, header, @secret)
      assert %Stripe.Resources.Event{} = event
      assert %Stripe.Resources.EventData{} = event.data
      assert %Stripe.Resources.Invoice{} = event.data.object
      assert event.data.object.id == "inv_1"
      assert event.data.object.amount_due == 5000
    end
  end

  describe "verify_header/4" do
    test "returns :ok with valid header" do
      header = generate_header()
      assert :ok = Webhook.verify_header(@payload, header, @secret)
    end

    test "returns error with nil header" do
      assert {:error, %Error{message: message}} = Webhook.verify_header(@payload, nil, @secret)
      assert message =~ "No Stripe-Signature header"
    end

    test "returns error with empty v1 signatures" do
      header = "t=#{System.system_time(:second)},v0=somesig"
      assert {:error, %Error{message: message}} = Webhook.verify_header(@payload, header, @secret)
      assert message =~ "No v1 signatures"
    end

    test "returns error without timestamp" do
      header = "v1=somesignature"
      assert {:error, %Error{message: message}} = Webhook.verify_header(@payload, header, @secret)
      assert message =~ "Unable to extract timestamp"
    end

    test "handles multiple v1 signatures (one valid)" do
      timestamp = System.system_time(:second)
      good_sig = Webhook.compute_signature(timestamp, @payload, @secret)
      header = "t=#{timestamp},v1=badsig,v1=#{good_sig}"
      assert :ok = Webhook.verify_header(@payload, header, @secret)
    end
  end

  describe "compute_signature/3" do
    test "produces deterministic HMAC-SHA256 hex" do
      sig = Webhook.compute_signature(1_614_556_800, "test", "secret")
      assert is_binary(sig)
      assert byte_size(sig) == 64
      # Same inputs produce same output
      assert sig == Webhook.compute_signature(1_614_556_800, "test", "secret")
    end

    test "different secrets produce different signatures" do
      sig1 = Webhook.compute_signature(12_345, "payload", "secret_a")
      sig2 = Webhook.compute_signature(12_345, "payload", "secret_b")
      refute sig1 == sig2
    end
  end
end
