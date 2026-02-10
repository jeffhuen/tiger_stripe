defmodule Stripe.ParityTest do
  @moduledoc """
  Parity invariants: generated Elixir SDK matches the OpenAPI spec and the
  Ruby SDK reference tree. These tests are CI gates — any regression fails
  the build.
  """
  use ExUnit.Case, async: true

  # Known spec-only endpoints not emitted as services (deduplicated nested resources
  # handled by their parent service).
  @spec_only_endpoints MapSet.new([
                         {"GET", "/v1/charges/{param}/refunds"},
                         {"GET", "/v1/charges/{param}/refunds/{param}"}
                       ])

  describe "endpoint set equality ({method, path})" do
    test "generated services cover all spec endpoints (minus known exclusions)" do
      spec_endpoints = spec_endpoints()
      service_endpoints = service_endpoints()

      missing =
        MapSet.difference(spec_endpoints, service_endpoints)
        |> MapSet.difference(@spec_only_endpoints)
        |> Enum.sort()

      assert missing == [],
             "Endpoints in OpenAPI spec but not in generated services:\n" <>
               Enum.map_join(missing, "\n", fn {m, p} -> "  #{m} #{p}" end)
    end

    test "no unexpected extra endpoints in generated services" do
      spec_endpoints = spec_endpoints()
      service_endpoints = service_endpoints()

      extra =
        MapSet.difference(service_endpoints, spec_endpoints)
        |> Enum.sort()

      assert extra == [],
             "Endpoints in generated services but not in OpenAPI spec:\n" <>
               Enum.map_join(extra, "\n", fn {m, p} -> "  #{m} #{p}" end)
    end

    test "endpoint count floor (regression guard)" do
      spec_count = spec_endpoints() |> MapSet.size()
      service_count = service_endpoints() |> MapSet.size()
      assert service_count >= spec_count - MapSet.size(@spec_only_endpoints)
    end
  end

  describe "service-path parity" do
    test "every Ruby service file has a matching Elixir service file" do
      ruby = ruby_service_paths()
      elixir = elixir_service_paths()

      missing = MapSet.difference(ruby, elixir) |> Enum.sort()

      assert missing == [],
             "Ruby service files missing in Elixir:\n" <>
               Enum.map_join(missing, "\n", &"  #{&1}")
    end

    test "no unexpected extra Elixir service files" do
      ruby = ruby_service_paths()
      elixir = elixir_service_paths()

      extra =
        MapSet.difference(elixir, ruby)
        |> Enum.sort()

      assert extra == [],
             "Extra Elixir service files not in Ruby:\n" <>
               Enum.map_join(extra, "\n", &"  #{&1}")
    end

    test "service file count matches Ruby" do
      ruby_count = ruby_service_paths() |> MapSet.size()
      elixir_count = elixir_service_paths() |> MapSet.size()
      assert ruby_count > 0, "Ruby SDK not synced — no service files found"
      assert elixir_count == ruby_count
    end
  end

  # -- Helpers ----------------------------------------------------------------

  defp spec_endpoints do
    {:ok, json} = File.read("priv/openapi/spec3.sdk.json")
    {:ok, spec} = JSON.decode(json)

    for {path, methods} <- spec["paths"],
        {method, _} <- methods,
        method in ~w(get post delete put patch) do
      norm_path = Regex.replace(~r/\{[^}]+\}/, path, "{param}")
      {String.upcase(method), norm_path}
    end
    |> MapSet.new()
  end

  defp service_endpoints do
    Path.wildcard("lib/stripe/services/**/*_service.ex")
    |> Enum.flat_map(fn file ->
      content = File.read!(file)

      Regex.scan(~r/:(get|post|delete|put|patch),\s*"(\/v[12][^"]*)"/, content)
      |> Enum.map(fn [_, method, path] ->
        norm_path = Regex.replace(~r/#\{[^}]+\}/, path, "{param}")
        {String.upcase(method), norm_path}
      end)
    end)
    |> MapSet.new()
  end

  defp ruby_service_paths do
    Path.wildcard("priv/stripe-ruby-master/lib/stripe/services/**/*_service.rb")
    |> Enum.map(fn path ->
      path
      |> String.replace_prefix("priv/stripe-ruby-master/lib/stripe/services/", "")
      |> String.replace_suffix(".rb", "")
    end)
    |> Enum.reject(&(&1 in ["v1_services", "v2_services"]))
    |> MapSet.new()
  end

  defp elixir_service_paths do
    Path.wildcard("lib/stripe/services/**/*_service.ex")
    |> Enum.map(fn path ->
      path
      |> String.replace_prefix("lib/stripe/services/", "")
      |> String.replace_suffix(".ex", "")
    end)
    |> Enum.reject(&(&1 in ["v1", "v2"]))
    |> MapSet.new()
  end
end
