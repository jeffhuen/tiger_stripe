# Audit generated nested-shape coverage vs the OpenAPI spec.
#
# Usage: mix run scripts/audit_nested_shapes.exs

alias Stripe.Generator.OpenAPI

raw = File.read!("priv/openapi/spec3.sdk.json") |> RustyJson.decode!()
schemas = raw["components"]["schemas"] || %{}

resource_ids =
  schemas
  |> Enum.filter(fn {_key, schema} -> is_map(schema) and Map.has_key?(schema, "x-stripeResource") end)
  |> MapSet.new(fn {key, _schema} -> key end)

IO.puts("=== Spec overview ===")
IO.puts("Total schemas: #{map_size(schemas)}")
IO.puts("Resource schemas: #{MapSet.size(resource_ids)}")
IO.puts("")

ref_to_name = fn "#/components/schemas/" <> name -> name; ref -> ref end

collect_property_refs = fn props ->
  for {_field, prop} <- props || %{},
      ref = prop["$ref"],
      ref != nil do
    ref_to_name.(ref)
  end
end

collect_variant_refs = fn props ->
  for {_field, prop} <- props || %{},
      variants = prop["anyOf"] || prop["oneOf"] || [],
      variant <- variants,
      ref = variant["$ref"],
      ref != nil do
    ref_to_name.(ref)
  end
end

all_direct_refs =
  schemas
  |> Enum.filter(fn {_key, schema} -> is_map(schema) and Map.has_key?(schema, "x-stripeResource") end)
  |> Enum.flat_map(fn {_key, schema} ->
    collect_property_refs.(schema["properties"]) ++ collect_variant_refs.(schema["properties"])
  end)
  |> Enum.uniq()
  |> Enum.sort()

non_resource_refs =
  Enum.reject(all_direct_refs, &MapSet.member?(resource_ids, &1))

categorized =
  Enum.group_by(non_resource_refs, fn name ->
    schema = Map.get(schemas, name, %{})

    cond do
      is_map(schema["properties"]) and map_size(schema["properties"]) > 0 -> :has_props
      is_list(schema["allOf"]) -> :allof_only
      is_map(schema["properties"]) and map_size(schema["properties"]) == 0 -> :empty_props
      schema == %{} -> :missing_schema
      true -> :other
    end
  end)

IO.puts("=== Non-resource $ref targets from resource properties ===")
IO.puts("Total unique: #{length(non_resource_refs)}")

for {category, items} <- Enum.sort(categorized) do
  IO.puts("  #{category}: #{length(items)}")
end

IO.puts("")

for category <- [:allof_only, :empty_props, :missing_schema, :other],
    items = Map.get(categorized, category, []),
    items != [] do
  IO.puts("  #{category} schemas:")

  for name <- items do
    schema = Map.get(schemas, name, %{})
    keys = schema |> Map.keys() |> Enum.sort() |> Enum.join(", ")
    IO.puts("    #{name} (keys: #{keys})")
  end
end

IO.puts("=== Parsed nested shape counts ===")
spec = OpenAPI.parse("priv/openapi/spec3.sdk.json")

primary_resources = Enum.filter(spec.resources, & &1.is_primary)

resources_with_local_shapes =
  Enum.filter(primary_resources, fn resource -> map_size(resource.inner_types) > 0 end)

resources_with_resource_refs =
  Enum.filter(primary_resources, fn resource -> map_size(resource.resource_inner_refs) > 0 end)

total_local_shapes =
  primary_resources
  |> Enum.map(fn resource -> map_size(resource.inner_types) end)
  |> Enum.sum()

total_resource_refs =
  primary_resources
  |> Enum.map(fn resource -> map_size(resource.resource_inner_refs) end)
  |> Enum.sum()

IO.puts("Resources with local nested shapes: #{length(resources_with_local_shapes)}")
IO.puts("Resources with nested resource refs: #{length(resources_with_resource_refs)}")
IO.puts("Top-level local nested shape entries: #{total_local_shapes}")
IO.puts("Top-level nested resource ref entries: #{total_resource_refs}")
IO.puts("")

IO.puts("=== Spot checks ===")

spot_checks = [
  {"charge", ["billing_details", "fraud_details", "outcome", "payment_method_details", "refunds", "transfer_data"]},
  {"price", ["recurring", "custom_unit_amount", "transform_quantity", "tiers"]},
  {"line_item", ["period", "parent", "pricing", "taxes"]},
  {"invoice", ["parent", "status_transitions", "lines", "payments", "automatic_tax", "payment_settings", "rendering"]},
  {"event", ["request"]},
  {"payment_intent", ["amount_details", "automatic_payment_methods", "next_action", "payment_method_options"]},
  {"subscription", ["automatic_tax", "cancellation_details", "invoice_settings", "pause_collection", "payment_settings", "pending_update"]},
  {"checkout.session", ["after_expiration", "consent", "custom_text", "invoice_creation", "payment_method_options", "phone_number_collection", "shipping_cost", "shipping_options", "tax_id_collection", "total_details"]},
  {"customer", ["invoice_settings", "tax"]},
  {"payment_method", ["card", "us_bank_account"]},
  {"setup_intent", ["next_action", "payment_method_options"]},
  {"refund", ["destination_details", "next_action"]}
]

for {schema_id, expected_shapes} <- spot_checks do
  resource = Enum.find(primary_resources, fn resource -> resource.schema_id == schema_id end)

  if resource do
    all_keys = Map.keys(resource.inner_types) ++ Map.keys(resource.resource_inner_refs)
    fields = MapSet.new(resource.properties, & &1.name)
    missing_shapes = Enum.filter(expected_shapes, fn name -> name not in all_keys end)
    missing_fields = Enum.filter(expected_shapes, fn name -> not MapSet.member?(fields, name) end)

    status = if missing_shapes == [] and missing_fields == [], do: "OK", else: "MISSING"

    IO.puts(
      "#{status} #{schema_id}: #{map_size(resource.inner_types)} local shapes + #{map_size(resource.resource_inner_refs)} refs"
    )

    if missing_shapes != [] do
      IO.puts("  Missing nested shapes: #{Enum.join(missing_shapes, ", ")}")
    end

    if missing_fields != [] do
      IO.puts("  Missing fields: #{Enum.join(missing_fields, ", ")}")
    end
  else
    IO.puts("SKIP #{schema_id}: not found as primary resource")
  end
end

IO.puts("")
IO.puts("=== Resources with 5+ properties but 0 nested shapes ===")

primary_resources
|> Enum.filter(fn resource ->
  map_size(resource.inner_types) == 0 and
    map_size(resource.resource_inner_refs) == 0 and
    length(resource.properties) >= 5
end)
|> Enum.sort_by(fn resource -> -length(resource.properties) end)
|> Enum.take(15)
|> Enum.each(fn resource ->
  IO.puts("  #{resource.schema_id} (#{length(resource.properties)} fields)")
end)
