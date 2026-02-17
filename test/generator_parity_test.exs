defmodule Stripe.Generator.ParityTest do
  use ExUnit.Case
  alias Stripe.Generator.OpenAPI

  @spec_path "priv/openapi/spec3.sdk.json"

  setup_all do
    spec = OpenAPI.parse(@spec_path)
    {:ok, spec: spec}
  end

  test "parses currency_options as a typed map in Price", %{spec: spec} do
    price_resource = Enum.find(spec.resources, fn r -> r.schema_id == "price" end)
    assert price_resource, "Price resource not found"

    currency_options =
      Enum.find(price_resource.properties, fn p -> p.name == "currency_options" end)

    assert currency_options, "currency_options property not found in Price"

    # Current behavior (failing expectation): {:map, %{}}
    # Desired behavior: {:map, {:ref, "currency_option"}}

    # It resolves to an inner type because the schema defines it inline
    assert {:map, {:inner, "CurrencyOptions"}} = currency_options.type
  end
end
