defmodule Stripe.OAuthTest do
  use ExUnit.Case, async: true

  alias Stripe.OAuth
  alias Stripe.Services.OAuthService

  describe "authorize_url/3" do
    test "builds standard authorize URL" do
      client = Stripe.client("sk_test_123", client_id: "ca_test_abc")
      {:ok, url} = OAuth.authorize_url(client)

      assert url =~ "https://connect.stripe.com/oauth/authorize"
      assert url =~ "client_id=ca_test_abc"
      assert url =~ "response_type=code"
    end

    test "builds express authorize URL" do
      client = Stripe.client("sk_test_123", client_id: "ca_test_abc")
      {:ok, url} = OAuth.authorize_url(client, %{}, express: true)

      assert url =~ "/express/oauth/authorize"
    end

    test "allows overriding client_id in params" do
      client = Stripe.client("sk_test_123", client_id: "ca_default")
      {:ok, url} = OAuth.authorize_url(client, %{"client_id" => "ca_override"})

      assert url =~ "client_id=ca_override"
    end

    test "raises when no client_id available" do
      client = Stripe.client("sk_test_123")

      assert_raise ArgumentError, ~r/No client_id provided/, fn ->
        OAuth.authorize_url(client)
      end
    end

    test "includes custom params in URL" do
      client = Stripe.client("sk_test_123", client_id: "ca_test")
      {:ok, url} = OAuth.authorize_url(client, %{"scope" => "read_write", "state" => "xyz"})

      assert url =~ "scope=read_write"
      assert url =~ "state=xyz"
    end
  end

  describe "token/3" do
    test "exchanges authorization code" do
      Stripe.Test.stub(fn %{method: :post, url: url, body: body} ->
        assert url =~ "connect.stripe.com/oauth/token"
        assert body =~ "grant_type=authorization_code"
        assert body =~ "code=ac_test"

        {200, [],
         ~s({"access_token": "sk_live_xxx", "stripe_user_id": "acct_123", "token_type": "bearer"})}
      end)

      client = Stripe.Test.client("sk_test_123")

      {:ok, data} =
        OAuth.token(client, %{
          "grant_type" => "authorization_code",
          "code" => "ac_test"
        })

      assert data["access_token"] == "sk_live_xxx"
    end
  end

  describe "deauthorize/3" do
    test "revokes connected account access" do
      Stripe.Test.stub(fn %{method: :post, url: url, body: body} ->
        assert url =~ "connect.stripe.com/oauth/deauthorize"
        assert body =~ "client_id=ca_test"
        assert body =~ "stripe_user_id=acct_123"

        {200, [], ~s({"stripe_user_id": "acct_123"})}
      end)

      client = Stripe.Test.client("sk_test_123", client_id: "ca_test")

      {:ok, data} = OAuth.deauthorize(client, %{"stripe_user_id" => "acct_123"})
      assert data["stripe_user_id"] == "acct_123"
    end
  end

  describe "token/3 api_key override" do
    test "uses client_secret as Authorization header when provided" do
      Stripe.Test.stub(fn %{method: :post, url: url, headers: headers, body: body} ->
        assert url =~ "connect.stripe.com/oauth/token"
        assert body =~ "client_secret=cs_override"

        auth =
          Enum.find_value(headers, fn
            {"authorization", v} -> v
            _ -> nil
          end)

        # Must use the client_secret, not the original api_key
        assert auth == "Bearer cs_override"

        {200, [], ~s({"access_token": "sk_live_xxx", "token_type": "bearer"})}
      end)

      client = Stripe.Test.client("sk_test_original_key")

      {:ok, _data} =
        OAuth.token(client, %{
          "grant_type" => "authorization_code",
          "code" => "ac_test",
          "client_secret" => "cs_override"
        })
    end

    test "uses default api_key when no client_secret" do
      Stripe.Test.stub(fn %{headers: headers} ->
        auth =
          Enum.find_value(headers, fn
            {"authorization", v} -> v
            _ -> nil
          end)

        assert auth == "Bearer sk_test_123"

        {200, [], ~s({"access_token": "sk_live_xxx", "token_type": "bearer"})}
      end)

      client = Stripe.Test.client("sk_test_123")

      {:ok, _} =
        OAuth.token(client, %{
          "grant_type" => "authorization_code",
          "code" => "ac_test"
        })
    end
  end

  describe "delegation" do
    test "OAuth delegates to OAuthService" do
      client = Stripe.client("sk_test_123", client_id: "ca_test")
      {:ok, url1} = OAuth.authorize_url(client)
      {:ok, url2} = OAuthService.authorize_url(client)
      assert url1 == url2
    end
  end
end
