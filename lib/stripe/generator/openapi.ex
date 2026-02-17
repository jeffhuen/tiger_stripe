defmodule Stripe.Generator.OpenAPI do
  @moduledoc false

  alias Stripe.Generator.Naming
  alias Stripe.Generator.Overrides

  @doc """
  Parse the Stripe OpenAPI spec into a normalized structure.

  Returns:
    %{
      api_version: String.t(),
      resources: [resource()],
      path_specs: %{String.t() => path_spec()},
      event_types: %{String.t() => event_type_schema()}
    }
  """
  def parse(spec_path \\ "priv/openapi/spec3.sdk.json") do
    raw = File.read!(spec_path) |> RustyJson.decode!()

    schemas = raw["components"]["schemas"] || %{}
    paths = raw["paths"] || %{}

    schema_index = build_schema_index(schemas)

    resources =
      schemas
      |> Enum.filter(fn {_k, v} -> is_map(v) && Map.has_key?(v, "x-stripeResource") end)
      |> Enum.map(fn {schema_id, schema} ->
        parse_resource(schema_id, schema, schema_index)
      end)
      |> mark_primary_resources()
      |> resolve_service_classes()
      |> Enum.sort_by(& &1.schema_id)

    path_specs = parse_paths(paths)

    event_types = parse_event_types(schemas)

    resource_docs =
      resources
      |> Enum.filter(& &1.is_primary)
      |> Map.new(fn r ->
        {{r.package, r.class_name}, %{title: r.title, description: r.description}}
      end)

    %{
      api_version: get_in(raw, ["info", "version"]),
      resources: resources,
      path_specs: path_specs,
      event_types: event_types,
      resource_docs: resource_docs
    }
  end

  # -- Schema Index -----------------------------------------------------------

  defp build_schema_index(schemas) do
    schemas
    |> Enum.filter(fn {_k, v} -> is_map(v) end)
    |> Map.new()
  end

  # -- Resource Parsing -------------------------------------------------------

  defp parse_resource(schema_id, schema, schema_index) do
    resource_meta = schema["x-stripeResource"]
    class_name = resource_meta["class_name"]

    package =
      case resource_meta["in_package"] do
        nil -> ""
        raw -> raw |> String.split(".") |> Enum.map_join(".", &Macro.camelize/1)
      end

    expandable_fields = schema["x-expandableFields"] || []
    resource_id = schema["x-resourceId"]
    object_name = resource_id || schema_id

    {properties, inner_types} =
      extract_properties(schema, schema_index)

    # Merge field overrides (add/replace properties)
    override_fields = Map.get(Overrides.field_overrides(), schema_id, %{})
    properties = merge_field_overrides(properties, override_fields)

    # Identify direct {:ref, name} properties pointing to resource schemas.
    # These need __inner_types__ entries pointing to the standalone resource module.
    resource_inner_refs =
      for p <- properties,
          ref_name = extract_direct_ref_name(p.type),
          ref_name != nil,
          ref_schema = Map.get(schema_index, ref_name, %{}),
          Map.has_key?(ref_schema, "x-stripeResource"),
          into: %{} do
        meta = ref_schema["x-stripeResource"]

        pkg =
          case meta["in_package"] do
            nil -> ""
            raw -> raw |> String.split(".") |> Enum.map_join(".", &Macro.camelize/1)
          end

        {p.name, %{class_name: meta["class_name"], package: pkg}}
      end

    required = schema["required"] || []

    operations =
      (schema["x-stripeOperations"] || [])
      |> Enum.filter(fn op -> op["method_on"] == "service" end)
      |> Enum.map(&parse_operation(&1, class_name))
      |> Enum.sort_by(& &1.method_name)

    has_object_prop = Map.has_key?(schema["properties"] || %{}, "object")

    %{
      schema_id: schema_id,
      resource_id: resource_id,
      class_name: class_name,
      package: package,
      object_name: object_name,
      title: schema["title"],
      description: schema["description"],
      properties: Enum.sort_by(properties, & &1.name),
      required: MapSet.new(required),
      expandable_fields: Enum.sort(expandable_fields),
      has_collection: resource_meta["has_collection_class"] == true,
      has_search_result: resource_meta["has_search_result_class"] == true,
      operations: operations,
      inner_types: inner_types,
      resource_inner_refs: resource_inner_refs,
      has_object_prop: has_object_prop,
      is_primary: false
    }
  end

  # Mark primary resources: for each {class_name, package} group, the primary
  # is the schema where schema_id == x-resourceId (canonical schema).
  # When no schema matches, pick the one with operations or an "object" property.
  # Non-primary schemas are support/inner types that don't get standalone files.
  defp mark_primary_resources(resources) do
    resources
    |> Enum.group_by(fn r -> {r.class_name, r.package} end)
    |> Enum.flat_map(fn {_key, group} ->
      case length(group) do
        1 ->
          [%{hd(group) | is_primary: true}]

        _ ->
          # Prefer: schema_id == resource_id, then has operations, then has object prop
          canonical =
            Enum.find(group, fn r -> r.resource_id != nil && r.schema_id == r.resource_id end) ||
              Enum.find(group, fn r -> r.operations != [] end) ||
              Enum.find(group, fn r -> r.has_object_prop end) ||
              hd(group)

          Enum.map(group, fn r ->
            %{r | is_primary: r.schema_id == canonical.schema_id}
          end)
      end
    end)
  end

  # -- Service Class Resolution -----------------------------------------------
  # Determines the correct service class for each operation based on path analysis.
  # Nested operations (e.g. /v1/accounts/{account}/capabilities) get prefixed
  # with the parent resource name (e.g. AccountCapability).
  # Cross-cutting schemas (operations under multiple parents) are deduped away
  # when a dedicated schema covers the same endpoint.

  defp resolve_service_classes(resources) do
    root_segment_map = build_root_segment_map(resources)

    # Phase 1: Resolve service_class on each operation
    resources =
      Enum.map(resources, fn resource ->
        updated_ops =
          Enum.map(resource.operations, fn op ->
            resolved = resolve_op_service_class(op, resource.class_name, root_segment_map)
            package = resolve_op_service_package(op.path, resource.package)
            %{op | service_class: resolved, service_package: package}
          end)

        %{resource | operations: updated_ops}
      end)

    # Phase 2: Apply explicit overrides
    resources = apply_overrides(resources)

    # Phase 3: Dedup by {http_method, path} — prefer dedicated schemas over cross-cutting
    dedup_operations_across_resources(resources)
  end

  defp apply_overrides(resources) do
    operation_overrides = Overrides.operation_overrides()
    skip_schemas = Overrides.skip_schemas()

    resources
    |> Enum.reject(fn resource -> resource.schema_id in skip_schemas end)
    |> Enum.map(fn resource ->
      updated_operations =
        Enum.map(resource.operations, fn op ->
          key = {to_string(op.http_method), op.path}

          case Map.get(operation_overrides, key) do
            nil -> op
            overrides -> Map.merge(op, overrides)
          end
        end)

      %{resource | operations: updated_operations}
    end)
  end

  # Build a map: path_segment -> class_name for resources that own root-level paths.
  # e.g. "accounts" -> "Account", "customers" -> "Customer"
  defp build_root_segment_map(resources) do
    resources
    |> Enum.flat_map(fn r ->
      r.operations
      |> Enum.filter(fn op ->
        segments = api_path_segments(op.path)
        # Root operation: first segment matches resource class_name
        root_segment = Enum.at(segments, 0, "")
        class_name_matches_segment?(r.class_name, root_segment)
      end)
      |> Enum.map(fn op ->
        root_segment = api_path_segments(op.path) |> Enum.at(0, "")
        {root_segment, r.class_name}
      end)
    end)
    |> Enum.uniq()
    |> Map.new()
  end

  defp resolve_op_service_class(op, schema_class_name, root_segment_map) do
    segments = api_path_segments(op.path)

    case segments do
      [parent_segment, "{" <> _, _child_segment | _rest] ->
        if class_name_matches_segment?(schema_class_name, parent_segment) do
          # Action on root resource (e.g. /v1/charges/{charge}/capture)
          schema_class_name
        else
          # Nested resource (e.g. /v1/accounts/{account}/capabilities)
          parent_class =
            Map.get(root_segment_map, parent_segment, camelize_segment(parent_segment))

          derive_nested_service_class(parent_class, schema_class_name)
        end

      _ ->
        # Root-level operation
        schema_class_name
    end
  end

  defp resolve_op_service_package(path, default_package) do
    case String.trim_leading(path, "/v1/test_helpers/") do
      ^path ->
        default_package

      remainder ->
        case String.split(remainder, "/", trim: true) do
          [segment | _] when segment in ["issuing", "terminal", "treasury"] ->
            "TestHelpers.#{Macro.camelize(segment)}"

          _ ->
            "TestHelpers"
        end
    end
  end

  defp derive_nested_service_class(parent_class, child_class) do
    if String.starts_with?(child_class, parent_class) do
      # Child starts with full parent: CustomerBalanceTransaction starts with Customer
      child_class
    else
      # Child starts with last word of parent: FeeRefund starts with Fee (from ApplicationFee)
      last_word = parent_class |> split_pascal_case() |> List.last()

      if String.starts_with?(child_class, last_word) do
        suffix = String.replace_prefix(child_class, last_word, "")
        parent_class <> suffix
      else
        parent_class <> child_class
      end
    end
  end

  # For each {http_method, path}, keep only one operation across all resources.
  # Prefer the operation from a "dedicated" schema (all ops under one parent)
  # over a "cross-cutting" schema (ops under multiple parents).
  defp dedup_operations_across_resources(resources) do
    # Count distinct parent path prefixes per schema_id
    prefix_counts =
      resources
      |> Enum.map(fn r ->
        prefixes =
          r.operations
          |> Enum.map(fn op -> api_path_segments(op.path) |> Enum.at(0, "") end)
          |> Enum.uniq()
          |> length()

        {r.schema_id, prefixes}
      end)
      |> Map.new()

    # Collect all {op, schema_id} pairs
    all_tagged =
      resources
      |> Enum.flat_map(fn r ->
        Enum.map(r.operations, fn op -> {op, r.schema_id} end)
      end)

    # Pick winner for each endpoint: fewer parent prefixes = more dedicated = preferred
    winners =
      all_tagged
      |> Enum.group_by(fn {op, _sid} -> {op.http_method, op.path} end)
      |> Enum.flat_map(fn {_key, group} ->
        best =
          Enum.min_by(group, fn {_op, sid} ->
            {Map.get(prefix_counts, sid, 1), sid}
          end)

        {_op, winner_sid} = best
        [{{elem(best, 0).http_method, elem(best, 0).path}, winner_sid}]
      end)
      |> Map.new()

    # Filter each resource's operations to only keep winners
    Enum.map(resources, fn r ->
      filtered =
        Enum.filter(r.operations, fn op ->
          Map.get(winners, {op.http_method, op.path}) == r.schema_id
        end)

      %{r | operations: filtered}
    end)
  end

  # Parse path into segments after the version prefix (/v1/ or /v2/)
  defp api_path_segments(path) do
    path
    |> String.split("/")
    |> Enum.reject(&(&1 == ""))
    |> Enum.drop(1)
  end

  defp class_name_matches_segment?(class_name, segment) do
    snake = Naming.to_snake_case(class_name)
    singular = singularize_segment(segment)
    snake == singular || snake == segment
  end

  defp singularize_segment(segment) do
    cond do
      String.ends_with?(segment, "ies") -> String.replace_suffix(segment, "ies", "y")
      String.ends_with?(segment, "ses") -> String.replace_suffix(segment, "ses", "s")
      String.ends_with?(segment, "s") -> String.replace_suffix(segment, "s", "")
      true -> segment
    end
  end

  defp camelize_segment(segment) do
    segment |> singularize_segment() |> Macro.camelize()
  end

  defp split_pascal_case(name) do
    name
    |> String.replace(~r/([A-Z]+)([A-Z][a-z])/, "\\1_\\2")
    |> String.replace(~r/([a-z\d])([A-Z])/, "\\1_\\2")
    |> String.split("_")
  end

  defp extract_properties(schema, schema_index) do
    raw_props = resolve_properties(schema, schema_index)

    {properties, inner_types} =
      Enum.reduce(raw_props, {[], %{}}, fn {name, prop_schema}, {props_acc, inners_acc} ->
        {type, new_inners} = resolve_type(name, prop_schema, schema_index)

        prop = %{
          name: name,
          type: type,
          description: prop_schema["description"],
          enum: prop_schema["enum"],
          format: prop_schema["format"],
          nullable: prop_schema["nullable"] == true,
          max_length: prop_schema["maxLength"],
          deprecated: prop_schema["deprecated"] == true
        }

        {[prop | props_acc], Map.merge(inners_acc, new_inners)}
      end)

    {Enum.reverse(properties), inner_types}
  end

  # Resolve properties, handling allOf by merging all branches
  defp resolve_properties(schema, schema_index) do
    cond do
      Map.has_key?(schema, "allOf") ->
        schema["allOf"]
        |> Enum.flat_map(fn branch ->
          resolved = resolve_ref_or_inline(branch, schema_index)
          Map.to_list(resolved["properties"] || %{})
        end)
        |> Map.new()

      Map.has_key?(schema, "properties") ->
        schema["properties"]

      true ->
        %{}
    end
  end

  # -- Type Resolution --------------------------------------------------------

  defp resolve_type(field_name, schema, schema_index) do
    do_resolve_type(field_name, schema, schema_index)
  end

  defp do_resolve_type(field_name, %{"$ref" => ref}, schema_index) do
    ref_name = ref_to_name(ref)
    schema = Map.get(schema_index, ref_name, %{})

    cond do
      Map.has_key?(schema, "x-stripeResource") ->
        {{:ref, ref_name}, %{}}

      is_map(schema["properties"]) and map_size(schema["properties"]) > 0 ->
        inner_name = Macro.camelize(field_name)

        {inner_props, nested_inners} =
          extract_inner_type_props(schema["properties"], schema_index)

        inner_type = %{
          class_name: inner_name,
          properties: inner_props,
          inner_types: nested_inners
        }

        {{:inner, inner_name}, %{field_name => inner_type}}

      true ->
        {{:ref, ref_name}, %{}}
    end
  end

  defp do_resolve_type(field_name, %{"anyOf" => variants} = schema, schema_index) do
    resolve_union(field_name, variants, schema, schema_index)
  end

  defp do_resolve_type(field_name, %{"oneOf" => variants} = schema, schema_index) do
    resolve_union(field_name, variants, schema, schema_index)
  end

  defp do_resolve_type(field_name, %{"type" => "array", "items" => items}, schema_index) do
    {inner_type, inner_types} = resolve_type(field_name, items, schema_index)
    {{:list, inner_type}, inner_types}
  end

  defp do_resolve_type(field_name, %{"type" => "object", "properties" => props}, schema_index)
       when map_size(props) > 0 do
    inner_name = Macro.camelize(field_name)
    {inner_props, nested_inners} = extract_inner_type_props(props, schema_index)
    inner_type = %{class_name: inner_name, properties: inner_props, inner_types: nested_inners}
    {{:inner, inner_name}, %{field_name => inner_type}}
  end

  defp do_resolve_type(field_name, %{"type" => "object"} = schema, schema_index) do
    if Map.has_key?(schema, "additionalProperties") and schema["additionalProperties"] != false do
      {value_type, inner_types} =
        resolve_type(field_name, schema["additionalProperties"], schema_index)

      {{:map, value_type}, inner_types}
    else
      {:map, %{}}
    end
  end

  defp do_resolve_type(_field_name, %{"type" => "string"}, _schema_index), do: {:string, %{}}
  defp do_resolve_type(_field_name, %{"type" => "integer"}, _schema_index), do: {:integer, %{}}
  defp do_resolve_type(_field_name, %{"type" => "number"}, _schema_index), do: {:float, %{}}
  defp do_resolve_type(_field_name, %{"type" => "boolean"}, _schema_index), do: {:boolean, %{}}

  # Fallback for schemas with no type
  defp do_resolve_type(_field_name, _schema, _schema_index), do: {:map, %{}}

  defp resolve_union(field_name, variants, _schema, schema_index) do
    # Filter out null/empty variants
    non_null = Enum.reject(variants, fn v -> v == %{"enum" => [""]} || v == %{} end)

    case non_null do
      [single] ->
        {type, inners} = resolve_type(field_name, single, schema_index)
        {{:nullable, type}, inners}

      _ ->
        # Check if it's nullable (has a "" enum variant)
        has_null = length(variants) > length(non_null)

        # For unions with refs, use the first ref as the primary type
        refs = Enum.filter(non_null, &Map.has_key?(&1, "$ref"))
        strings = Enum.filter(non_null, &(&1["type"] == "string"))

        cond do
          # Ref(s) + string = expandable field pattern
          # Common cases: string | Customer, string | Customer | DeletedCustomer
          # Use the first non-deleted ref as the primary expanded type.
          refs != [] && strings != [] ->
            primary_ref =
              Enum.find(refs, hd(refs), fn r ->
                name = ref_to_name(r["$ref"])
                not String.starts_with?(name, "deleted_")
              end)

            ref_name = ref_to_name(primary_ref["$ref"])

            type =
              if has_null,
                do: {:nullable, {:expandable_ref, ref_name}},
                else: {:expandable_ref, ref_name}

            {type, %{}}

          # Multiple refs without string (polymorphic union) - treat as Union
          length(refs) > 1 ->
            # Resolve all variants
            {types, all_inners} =
              Enum.map_reduce(non_null, %{}, fn variant, acc ->
                {t, inners} = resolve_type(field_name, variant, schema_index)
                {t, Map.merge(acc, inners)}
              end)

            type = if has_null, do: {:nullable, {:union, types}}, else: {:union, types}
            {type, all_inners}

          # Single non-ref type
          length(non_null) == 1 ->
            {type, inners} = resolve_type(field_name, hd(non_null), schema_index)
            type = if has_null, do: {:nullable, type}, else: type
            {type, inners}

          true ->
            type = if has_null, do: {:nullable, :map}, else: :map
            {type, %{}}
        end
    end
  end

  defp extract_inner_type_props(props, schema_index) do
    Enum.reduce(props, {[], %{}}, fn {name, prop_schema}, {props_acc, inners_acc} ->
      {type, new_inners} = resolve_type(name, prop_schema, schema_index)

      prop = %{
        name: name,
        type: type,
        description: prop_schema["description"],
        enum: prop_schema["enum"],
        format: prop_schema["format"],
        nullable: prop_schema["nullable"] == true,
        max_length: prop_schema["maxLength"],
        deprecated: prop_schema["deprecated"] == true
      }

      {[prop | props_acc], Map.merge(inners_acc, new_inners)}
    end)
    |> then(fn {props, inners} -> {Enum.sort_by(props, & &1.name), inners} end)
  end

  # -- Operation Parsing ------------------------------------------------------

  defp parse_operation(op, default_class) do
    path = op["path"]
    path_params = extract_path_params(path)
    service_class = op["class"] || default_class

    %{
      method_name: op["method_name"],
      method_type: op["method_type"],
      http_method: String.to_existing_atom(op["operation"]),
      path: path,
      path_params: path_params,
      service_class: service_class,
      service_package: nil,
      base_address: op["base_address"],
      api_mode: if(String.starts_with?(path, "/v2"), do: :v2, else: :v1)
    }
  end

  defp extract_path_params(path) do
    ~r/\{(\w+)\}/
    |> Regex.scan(path)
    |> Enum.map(fn [_, param] -> param end)
  end

  # -- Path Spec Parsing (for params generation) ------------------------------

  defp parse_paths(paths) do
    paths
    |> Enum.flat_map(fn {path, methods} ->
      methods
      |> Enum.filter(fn {method, _} -> method in ["get", "post", "delete", "put", "patch"] end)
      |> Enum.map(fn {method, spec} ->
        key = "#{String.upcase(method)} #{path}"
        params_schema = extract_params_schema(method, spec)
        query_params = extract_query_params(spec)

        {key,
         %{
           params_schema: params_schema,
           query_params: query_params,
           path: path,
           method: method,
           summary: spec["summary"],
           description: spec["description"],
           deprecated: spec["deprecated"] == true
         }}
      end)
    end)
    |> Map.new()
  end

  defp extract_params_schema("post", spec) do
    get_in(spec, ["requestBody", "content", "application/x-www-form-urlencoded", "schema"]) ||
      get_in(spec, ["requestBody", "content", "application/json", "schema"])
  end

  defp extract_params_schema("put", spec), do: extract_params_schema("post", spec)
  defp extract_params_schema("patch", spec), do: extract_params_schema("post", spec)
  defp extract_params_schema(_, _spec), do: nil

  defp extract_query_params(spec) do
    (spec["parameters"] || [])
    |> Enum.filter(fn p -> p["in"] == "query" end)
  end

  # -- Event Type Parsing -----------------------------------------------------

  defp parse_event_types(schemas) do
    schemas
    |> Enum.filter(fn {_k, v} -> is_map(v) && Map.has_key?(v, "x-stripeEvent") end)
    |> Enum.map(fn {_k, v} ->
      event_type = get_in(v, ["x-stripeEvent", "type"])
      kind = get_in(v, ["x-stripeEvent", "kind"])
      data_schema_raw = v["properties"]["object"] || %{}
      props = v["properties"] || %{}

      {event_type,
       %{
         data_ref: data_schema_raw["$ref"],
         kind: kind,
         description: v["description"],
         data_schema: props["data"],
         has_related_object: Map.has_key?(props, "related_object"),
         schema_fields: props |> Map.keys() |> Enum.sort()
       }}
    end)
    |> Enum.filter(fn {type, _} -> type != nil end)
    |> Map.new()
  end

  # -- Helpers ----------------------------------------------------------------

  defp ref_to_name("#/components/schemas/" <> name), do: name
  defp ref_to_name(ref), do: ref

  defp resolve_ref_or_inline(%{"$ref" => ref}, schema_index) do
    name = ref_to_name(ref)
    Map.get(schema_index, name, %{})
  end

  defp resolve_ref_or_inline(schema, _schema_index), do: schema

  # Extract the ref name from a type tag (for resource_inner_refs computation)
  defp extract_direct_ref_name({:ref, name}), do: name
  defp extract_direct_ref_name({:nullable, inner}), do: extract_direct_ref_name(inner)
  defp extract_direct_ref_name(_), do: nil

  # Merge field overrides into the properties list
  defp merge_field_overrides(properties, overrides) when map_size(overrides) == 0, do: properties

  defp merge_field_overrides(properties, overrides) do
    existing_names = MapSet.new(properties, & &1.name)

    # Update existing properties
    updated =
      Enum.map(properties, fn prop ->
        case Map.get(overrides, prop.name) do
          nil -> prop
          override -> Map.merge(prop, Map.take(override, [:type, :description, :nullable]))
        end
      end)

    # Add new properties from overrides
    new_props =
      overrides
      |> Enum.reject(fn {name, _} -> MapSet.member?(existing_names, name) end)
      |> Enum.map(fn {name, override} ->
        %{
          name: name,
          type: override.type,
          description: override[:description],
          enum: nil,
          format: nil,
          nullable: override[:nullable] == true,
          max_length: nil,
          deprecated: false
        }
      end)

    updated ++ new_props
  end
end
