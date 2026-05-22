defmodule Stripe.MultipartTest do
  use ExUnit.Case, async: true

  alias Stripe.Multipart

  describe "has_file?/1" do
    test "returns true for params with path-based file" do
      assert Multipart.has_file?(%{"file" => %{path: "/tmp/test.pdf"}, "purpose" => "id_doc"})
    end

    test "returns true for params with content-based file" do
      assert Multipart.has_file?(%{"file" => %{content: "data", filename: "test.pdf"}})
    end

    test "returns false for params without files" do
      refute Multipart.has_file?(%{"purpose" => "identity_document", "amount" => 100})
    end

    test "returns false for empty params" do
      refute Multipart.has_file?(%{})
    end
  end

  describe "encode/1" do
    test "encodes scalar fields" do
      {content_type, body} = Multipart.encode(%{"purpose" => "identity_document"})

      assert content_type =~ "multipart/form-data; boundary="
      assert body =~ "Content-Disposition: form-data; name=\"purpose\""
      assert body =~ "identity_document"
      assert body =~ "--"
    end

    test "encodes content-based file" do
      file_content = "fake pdf content"

      {content_type, body} =
        Multipart.encode(%{
          "file" => %{content: file_content, filename: "test.pdf"},
          "purpose" => "identity_document"
        })

      assert content_type =~ "multipart/form-data; boundary="
      assert body =~ "filename=\"test.pdf\""
      assert body =~ "Content-Type: application/octet-stream"
      assert body =~ file_content
      assert body =~ "purpose"
    end

    test "encodes path-based file" do
      # Create a temp file
      tmp_path = Path.join(System.tmp_dir!(), "stripe_test_#{:rand.uniform(999_999)}.txt")
      File.write!(tmp_path, "test file data")

      try do
        {content_type, body} =
          Multipart.encode(%{
            "file" => %{path: tmp_path},
            "purpose" => "identity_document"
          })

        assert content_type =~ "multipart/form-data; boundary="
        assert body =~ "test file data"
        assert body =~ "filename="
      after
        File.rm(tmp_path)
      end
    end

    test "uses custom content type when provided" do
      {_ct, body} =
        Multipart.encode(%{
          "file" => %{content: "data", filename: "test.csv", content_type: "text/csv"}
        })

      assert body =~ "Content-Type: text/csv"
    end

    test "encodes list values with indexed brackets" do
      {_ct, body} =
        Multipart.encode(%{
          "file" => %{content: "data", filename: "f.pdf"},
          "file_link_data" => %{"create" => true, "expires_at" => 1_700_000_000}
        })

      assert body =~ "name=\"file_link_data[create]\""
      assert body =~ "true"
      assert body =~ "name=\"file_link_data[expires_at]\""
    end

    test "encodes boolean values as strings" do
      {_ct, body} = Multipart.encode(%{"active" => true, "disabled" => false})

      assert body =~ "true"
      assert body =~ "false"
    end

    test "encodes array params with indices" do
      {_ct, body} = Multipart.encode(%{"items" => ["a", "b", "c"]})

      assert body =~ "name=\"items[0]\""
      assert body =~ "name=\"items[1]\""
      assert body =~ "name=\"items[2]\""
    end

    test "body ends with closing boundary" do
      {_ct, body} = Multipart.encode(%{"key" => "value"})
      assert body =~ ~r/--[a-f0-9]+--\r\n$/
    end
  end

  describe "multipart in client" do
    test "file upload uses multipart encoding" do
      Stripe.Test.stub(fn %{method: :post, url: url, headers: headers, body: body} ->
        assert url =~ "/v1/files"

        content_type =
          Enum.find_value(headers, fn
            {"content-type", ct} -> ct
            _ -> nil
          end)

        assert content_type =~ "multipart/form-data"
        assert body =~ "identity_document"
        assert body =~ "fake file bytes"

        {200, [], ~s({"id": "file_123", "object": "file", "purpose": "identity_document"})}
      end)

      client = Stripe.Test.client("sk_test_123")

      {:ok, data} =
        Stripe.Client.request(client, :post, "/v1/files",
          params: %{
            "file" => %{content: "fake file bytes", filename: "doc.pdf"},
            "purpose" => "identity_document"
          },
          base_address: :files
        )

      assert data.id == "file_123"
    end

    test "regular params still use form encoding" do
      Stripe.Test.stub(fn %{headers: headers, body: body} ->
        content_type =
          Enum.find_value(headers, fn
            {"content-type", ct} -> ct
            _ -> nil
          end)

        assert content_type == "application/x-www-form-urlencoded"
        assert body =~ "amount=2000"
        {200, [], ~s({"id": "ch_123", "object": "charge"})}
      end)

      client = Stripe.Test.client("sk_test_123")

      {:ok, _} =
        Stripe.Client.request(client, :post, "/v1/charges",
          params: %{"amount" => 2000, "currency" => "usd"}
        )
    end
  end
end
