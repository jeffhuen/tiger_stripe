defmodule Stripe.WebhookPlugTest do
  use ExUnit.Case, async: false
  import Plug.Test
  import Plug.Conn

  alias Stripe.{Webhook, WebhookPlug}

  @secret "whsec_test_plug_secret"
  @path "/webhook/stripe"
  @payload ~s({"id": "evt_plug", "object": "event", "type": "charge.succeeded"})

  defp signed_conn(secret \\ @secret) do
    timestamp = System.system_time(:second)
    signature = Webhook.compute_signature(timestamp, @payload, secret)
    header = "t=#{timestamp},v1=#{signature}"

    conn(:post, @path, @payload)
    |> put_req_header("stripe-signature", header)
    |> put_req_header("content-type", "application/json")
  end

  # -- init/1 ----------------------------------------------------------------

  describe "init/1" do
    test "requires :path option" do
      assert_raise ArgumentError, ~r/requires :path option/, fn ->
        WebhookPlug.init(secret: "whsec_...")
      end
    end

    test "requires :secret option" do
      assert_raise ArgumentError, ~r/requires :secret option/, fn ->
        WebhookPlug.init(path: @path)
      end
    end

    test "accepts explicit :secret" do
      opts = WebhookPlug.init(secret: "whsec_...", path: @path)
      assert Keyword.get(opts, :secret) == "whsec_..."
    end
  end

  # -- secret resolution -----------------------------------------------------

  describe "explicit secret" do
    test "uses explicit :secret" do
      opts = WebhookPlug.init(secret: @secret, path: @path)
      conn = signed_conn() |> WebhookPlug.call(opts)

      refute conn.halted
      assert conn.assigns.stripe_event.id == "evt_plug"
    end
  end

  describe "MFA secret" do
    test "resolves secret from {mod, fun, args} tuple" do
      opts = WebhookPlug.init(secret: {__MODULE__, :test_secret, []}, path: @path)
      conn = signed_conn() |> WebhookPlug.call(opts)

      refute conn.halted
      assert conn.assigns.stripe_event.id == "evt_plug"
    end
  end

  # -- plug behavior ---------------------------------------------------------

  describe "call/2" do
    test "assigns stripe_event on valid signature" do
      opts = WebhookPlug.init(secret: @secret, path: @path)
      conn = signed_conn() |> WebhookPlug.call(opts)

      refute conn.halted
      assert %Stripe.Resources.Event{} = conn.assigns.stripe_event
      assert conn.assigns.stripe_event.type == "charge.succeeded"
    end

    test "returns 400 on invalid signature" do
      opts = WebhookPlug.init(secret: @secret, path: @path)
      conn = signed_conn("whsec_wrong") |> WebhookPlug.call(opts)

      assert conn.halted
      assert conn.status == 400
    end

    test "returns 400 on missing signature header" do
      opts = WebhookPlug.init(secret: @secret, path: @path)

      conn =
        conn(:post, @path, @payload)
        |> put_req_header("content-type", "application/json")
        |> WebhookPlug.call(opts)

      assert conn.halted
      assert conn.status == 400
      assert conn.resp_body =~ "Missing Stripe-Signature"
    end

    test "passes through non-matching paths" do
      opts = WebhookPlug.init(secret: @secret, path: @path)

      conn =
        conn(:post, "/other/path", "")
        |> WebhookPlug.call(opts)

      refute conn.halted
      refute Map.has_key?(conn.assigns, :stripe_event)
    end
  end

  # Helper for MFA secret tests
  def test_secret, do: @secret
end
