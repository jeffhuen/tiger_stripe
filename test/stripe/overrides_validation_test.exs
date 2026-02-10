defmodule Stripe.OverridesValidationTest do
  @moduledoc """
  Mirrors the safety guards from Mix.Tasks.Stripe.Generate in the test
  suite so stale overrides and duplicate paths are caught by `mix test` without
  needing a full CI codegen run.
  """
  use ExUnit.Case, async: true

  alias Stripe.Generator.EventGenerator
  alias Stripe.Generator.OpenAPI
  alias Stripe.Generator.Overrides
  alias Stripe.Generator.ParamsGenerator
  alias Stripe.Generator.RegistryGenerator
  alias Stripe.Generator.ResourceGenerator
  alias Stripe.Generator.ServiceGenerator

  describe "override key freshness" do
    setup do
      %{spec_endpoints: spec_endpoints()}
    end

    test "all operation_overrides keys reference live spec endpoints", %{
      spec_endpoints: endpoints
    } do
      stale =
        Overrides.operation_overrides()
        |> Map.keys()
        |> Enum.reject(&MapSet.member?(endpoints, &1))
        |> Enum.sort()

      assert stale == [],
             "Stale operation override keys (endpoint removed from spec):\n" <>
               Enum.map_join(stale, "\n", fn {m, p} -> "  #{m} #{p}" end)
    end

    test "all params_overrides keys reference live spec endpoints", %{
      spec_endpoints: endpoints
    } do
      stale =
        Overrides.params_overrides()
        |> Map.keys()
        |> Enum.reject(&MapSet.member?(endpoints, &1))
        |> Enum.sort()

      assert stale == [],
             "Stale params override keys (endpoint removed from spec):\n" <>
               Enum.map_join(stale, "\n", fn {m, p} -> "  #{m} #{p}" end)
    end

    test "operation override values all contain :service_class" do
      missing =
        Overrides.operation_overrides()
        |> Enum.reject(fn {_key, value} -> Map.has_key?(value, :service_class) end)
        |> Enum.map(fn {key, _} -> key end)
        |> Enum.sort()

      assert missing == [],
             "Operation overrides missing :service_class:\n" <>
               Enum.map_join(missing, "\n", fn {m, p} -> "  #{m} #{p}" end)
    end

    test "every operation override has a :reason" do
      missing =
        Overrides.operation_overrides()
        |> Enum.reject(fn {_key, value} ->
          is_binary(value[:reason]) and value[:reason] != ""
        end)
        |> Enum.map(fn {key, _} -> key end)
        |> Enum.sort()

      assert missing == [],
             "Operation overrides missing :reason:\n" <>
               Enum.map_join(missing, "\n", fn {m, p} -> "  #{m} #{p}" end)
    end

    test "every operation override has a :ruby reference" do
      missing =
        Overrides.operation_overrides()
        |> Enum.reject(fn {_key, value} ->
          is_binary(value[:ruby]) and value[:ruby] != ""
        end)
        |> Enum.map(fn {key, _} -> key end)
        |> Enum.sort()

      assert missing == [],
             "Operation overrides missing :ruby reference:\n" <>
               Enum.map_join(missing, "\n", fn {m, p} -> "  #{m} #{p}" end)
    end

    test "every params override has a :reason" do
      missing =
        Overrides.params_overrides()
        |> Enum.reject(fn {_key, value} ->
          is_binary(value[:reason]) and value[:reason] != ""
        end)
        |> Enum.map(fn {key, _} -> key end)
        |> Enum.sort()

      assert missing == [],
             "Params overrides missing :reason:\n" <>
               Enum.map_join(missing, "\n", fn {m, p} -> "  #{m} #{p}" end)
    end

    test "every params override has a :ruby reference" do
      missing =
        Overrides.params_overrides()
        |> Enum.reject(fn {_key, value} ->
          is_binary(value[:ruby]) and value[:ruby] != ""
        end)
        |> Enum.map(fn {key, _} -> key end)
        |> Enum.sort()

      assert missing == [],
             "Params overrides missing :ruby reference:\n" <>
               Enum.map_join(missing, "\n", fn {m, p} -> "  #{m} #{p}" end)
    end
  end

  describe "generated file integrity (tuple-level, pre-write)" do
    setup do
      spec = OpenAPI.parse("priv/openapi/spec3.sdk.json")

      services = ServiceGenerator.generate(spec)
      resources = ResourceGenerator.generate(spec)
      params = ParamsGenerator.generate(spec)
      registries = RegistryGenerator.generate(spec)
      events = EventGenerator.generate(spec)

      %{
        services: services,
        resources: resources,
        params: params,
        registries: registries,
        events: events,
        all_files: services ++ resources ++ params ++ registries ++ events
      }
    end

    test "no duplicate service file paths", %{services: files} do
      assert_no_tuple_path_collisions(files, "service")
    end

    test "no duplicate resource file paths", %{resources: files} do
      assert_no_tuple_path_collisions(files, "resource")
    end

    test "no duplicate params file paths", %{params: files} do
      assert_no_tuple_path_collisions(files, "params")
    end

    test "no duplicate event file paths", %{events: files} do
      assert_no_tuple_path_collisions(files, "event")
    end

    test "no cross-generator path collisions", %{all_files: all_files} do
      assert_no_tuple_path_collisions(all_files, "generated")
    end
  end

  # -- Helpers ----------------------------------------------------------------

  defp assert_no_tuple_path_collisions(file_tuples, label) do
    duplicates =
      file_tuples
      |> Enum.frequencies_by(fn {path, _content} -> path end)
      |> Enum.filter(fn {_path, count} -> count > 1 end)

    assert duplicates == [],
           "Duplicate #{label} file paths in generated tuples:\n" <>
             Enum.map_join(duplicates, "\n", fn {path, count} -> "  #{path} (#{count}x)" end)
  end

  defp spec_endpoints do
    {:ok, json} = File.read("priv/openapi/spec3.sdk.json")
    {:ok, spec} = JSON.decode(json)

    for {path, methods} <- spec["paths"],
        {method, _} <- methods,
        method in ~w(get post delete put patch) do
      {method, path}
    end
    |> MapSet.new()
  end
end
