defmodule Stripe.Generator.DocFormatterTest do
  use ExUnit.Case, async: true

  alias Stripe.Generator.DocFormatter

  describe "html_to_markdown/1" do
    test "returns nil for nil" do
      assert DocFormatter.html_to_markdown(nil) == nil
    end

    test "returns nil for empty string" do
      assert DocFormatter.html_to_markdown("") == nil
    end

    test "returns nil for whitespace-only" do
      assert DocFormatter.html_to_markdown("   ") == nil
    end

    test "passes through plain text" do
      assert DocFormatter.html_to_markdown("Hello world") == "Hello world"
    end

    test "converts <p> tags to paragraphs" do
      input = "<p>First paragraph.</p><p>Second paragraph.</p>"
      result = DocFormatter.html_to_markdown(input)
      assert result == "First paragraph.\n\nSecond paragraph."
    end

    test "converts <a> tags to markdown links" do
      input = ~s(<a href="https://example.com">click here</a>)
      assert DocFormatter.html_to_markdown(input) == "[click here](https://example.com)"
    end

    test "converts <code> tags to backticks" do
      input = "Use the <code>create</code> method."
      assert DocFormatter.html_to_markdown(input) == "Use the `create` method."
    end

    test "converts <strong> tags to bold" do
      input = "This is <strong>important</strong>."
      assert DocFormatter.html_to_markdown(input) == "This is **important**."
    end

    test "converts <em> tags to italic" do
      input = "This is <em>emphasized</em>."
      assert DocFormatter.html_to_markdown(input) == "This is *emphasized*."
    end

    test "converts <br> to newline" do
      input = "Line one.<br>Line two."
      assert DocFormatter.html_to_markdown(input) == "Line one.\nLine two."
    end

    test "converts <br /> to newline" do
      input = "Line one.<br />Line two."
      assert DocFormatter.html_to_markdown(input) == "Line one.\nLine two."
    end

    test "converts <ul>/<li> to bullet list" do
      input = "<ul><li>First</li><li>Second</li></ul>"
      result = DocFormatter.html_to_markdown(input)
      assert result =~ "* First"
      assert result =~ "* Second"
    end

    test "converts <ol>/<li> to numbered list" do
      input = "<ol><li>First</li><li>Second</li></ol>"
      result = DocFormatter.html_to_markdown(input)
      assert result =~ "1. First"
      assert result =~ "2. Second"
    end

    test "handles nested inline tags" do
      input = "<p>Use <code>create</code> with <strong>required</strong> params.</p>"
      result = DocFormatter.html_to_markdown(input)
      assert result == "Use `create` with **required** params."
    end

    test "strips unknown tags via fallback" do
      input = "<div>Some <span>text</span></div>"
      result = DocFormatter.html_to_markdown(input)
      assert result == "Some text"
      refute result =~ "<"
    end

    test "handles complex mixed HTML" do
      input =
        "<p>Creates a new <code>charge</code>. See the <a href=\"/docs\">docs</a> for details.</p>"

      result = DocFormatter.html_to_markdown(input)

      assert result ==
               "Creates a new `charge`. See the [docs](https://stripe.com/docs) for details."
    end

    test "resolves relative /docs/ URLs" do
      input = "<p>See <a href=\"/docs/connect\">Connect</a>.</p>"

      assert DocFormatter.html_to_markdown(input) ==
               "See [Connect](https://docs.stripe.com/docs/connect)."
    end

    test "resolves relative /api/ URLs" do
      input = "<p>See <a href=\"/api/charges\">Charges</a>.</p>"

      assert DocFormatter.html_to_markdown(input) ==
               "See [Charges](https://docs.stripe.com/api/charges)."
    end

    test "resolves relative non-docs URLs" do
      input = "<p>See <a href=\"/connect\">Connect</a>.</p>"
      assert DocFormatter.html_to_markdown(input) == "See [Connect](https://stripe.com/connect)."
    end

    test "preserves absolute URLs" do
      input = "<p>See <a href=\"https://example.com\">Example</a>.</p>"
      assert DocFormatter.html_to_markdown(input) == "See [Example](https://example.com)."
    end

    test "fixes stray double backticks" do
      input = "The `rate_type`` field"
      assert DocFormatter.html_to_markdown(input) == "The `rate_type` field"
    end

    test "preserves triple-backtick fences" do
      input = "```elixir\ncode\n```"
      result = DocFormatter.html_to_markdown(input)
      assert result =~ "```"
    end

    test "escapes backslash-backtick sequences" do
      input = "may not include `\\` characters"
      result = DocFormatter.html_to_markdown(input)
      assert result == "may not include `\\\\` characters"
    end
  end

  describe "resolve_relative_urls/1" do
    test "resolves bare api/ URLs without leading slash" do
      text = "[type=invoiceitem](api/invoices/line_item#type)"

      assert DocFormatter.resolve_relative_urls(text) ==
               "[type=invoiceitem](https://docs.stripe.com/api/invoices/line_item#type)"
    end

    test "returns nil for nil" do
      assert DocFormatter.resolve_relative_urls(nil) == nil
    end
  end

  describe "format_property_doc/1" do
    test "returns nil for empty property" do
      assert DocFormatter.format_property_doc(%{name: "foo"}) == nil
    end

    test "returns description only" do
      prop = %{name: "amount", description: "Amount in cents."}
      assert DocFormatter.format_property_doc(prop) == "Amount in cents."
    end

    test "includes format label" do
      prop = %{name: "created", description: "Creation time.", format: "unix-time"}
      result = DocFormatter.format_property_doc(prop)
      assert result =~ "Creation time."
      assert result =~ "Format: Unix timestamp."
    end

    test "includes enum values" do
      prop = %{name: "status", description: "Status.", enum: ["active", "inactive"]}
      result = DocFormatter.format_property_doc(prop)
      assert result =~ "Status."
      assert result =~ "Possible values: `active`, `inactive`."
    end

    test "filters empty string enum values" do
      prop = %{name: "type", description: "The type.", enum: ["", "company", "individual"]}
      result = DocFormatter.format_property_doc(prop)
      assert result =~ "Possible values: `company`, `individual`."
      refute result =~ "``"
    end

    test "includes max_length" do
      prop = %{name: "name", description: "The name.", max_length: 5000}
      result = DocFormatter.format_property_doc(prop)
      assert result =~ "Max length: 5000."
    end

    test "includes nullable" do
      prop = %{name: "email", description: "Email address.", nullable: true}
      result = DocFormatter.format_property_doc(prop)
      assert result =~ "Nullable."
    end

    test "includes expandable" do
      prop = %{name: "customer", description: "The customer.", expandable: true}
      result = DocFormatter.format_property_doc(prop)
      assert result =~ "Expandable."
    end

    test "includes deprecated" do
      prop = %{name: "old_field", description: "Old field.", deprecated: true}
      result = DocFormatter.format_property_doc(prop)
      assert result =~ "**Deprecated.**"
    end

    test "combines all annotations" do
      prop = %{
        name: "status",
        description: "Status.",
        format: "unix-time",
        enum: ["a", "b"],
        max_length: 100,
        nullable: true,
        expandable: true,
        deprecated: true
      }

      result = DocFormatter.format_property_doc(prop)
      assert result =~ "Status."
      assert result =~ "Format: Unix timestamp."
      assert result =~ "Possible values: `a`, `b`."
      assert result =~ "Max length: 100."
      assert result =~ "Nullable."
      assert result =~ "Expandable."
      assert result =~ "**Deprecated.**"
    end

    test "handles HTML in description" do
      prop = %{name: "foo", description: "<p>A <strong>bold</strong> description.</p>"}
      result = DocFormatter.format_property_doc(prop)
      assert result =~ "A **bold** description."
    end
  end

  describe "format_label/1" do
    test "unix-time" do
      assert DocFormatter.format_label("unix-time") == "Unix timestamp"
    end

    test "currency" do
      assert DocFormatter.format_label("currency") == "ISO 4217 currency code"
    end

    test "decimal" do
      assert DocFormatter.format_label("decimal") == "decimal string"
    end

    test "unknown format passes through" do
      assert DocFormatter.format_label("custom-thing") == "custom-thing"
    end
  end

  describe "escape_for_heredoc/1" do
    test "returns nil for nil" do
      assert DocFormatter.escape_for_heredoc(nil) == nil
    end

    test "escapes triple quotes" do
      assert DocFormatter.escape_for_heredoc(~S(say """)) == ~S(say \"\"\")
    end

    test "leaves normal text unchanged" do
      assert DocFormatter.escape_for_heredoc("normal text") == "normal text"
    end
  end

  describe "schema_moduledoc/2" do
    test "returns nil when both nil" do
      assert DocFormatter.schema_moduledoc(nil, nil) == nil
    end

    test "returns nil when both empty" do
      assert DocFormatter.schema_moduledoc("", "") == nil
    end

    test "returns title only" do
      assert DocFormatter.schema_moduledoc("Charge", nil) == "Charge"
    end

    test "returns description only when no title" do
      assert DocFormatter.schema_moduledoc(nil, "A charge object.") == "A charge object."
    end

    test "combines title and description" do
      result = DocFormatter.schema_moduledoc("Charge", "A charge object.")
      assert result == "Charge\n\nA charge object."
    end

    test "converts HTML in description" do
      result = DocFormatter.schema_moduledoc("Charge", "<p>A <code>charge</code> object.</p>")
      assert result == "Charge\n\nA `charge` object."
    end
  end

  describe "operation_doc/2" do
    test "returns nil when both nil" do
      assert DocFormatter.operation_doc(nil, nil) == nil
    end

    test "returns summary only" do
      assert DocFormatter.operation_doc("Create a charge", nil) == "Create a charge"
    end

    test "returns description only when no summary" do
      result = DocFormatter.operation_doc(nil, "<p>Creates a new charge.</p>")
      assert result == "Creates a new charge."
    end

    test "combines summary and HTML description" do
      result = DocFormatter.operation_doc("Create a charge", "<p>Creates a new charge.</p>")
      assert result == "Create a charge\n\nCreates a new charge."
    end
  end

  describe "build_typedoc_table/1" do
    test "returns nil for empty list" do
      assert DocFormatter.build_typedoc_table([]) == nil
    end

    test "builds table with descriptions" do
      props = [
        %{name: "amount", description: "Amount in cents."},
        %{name: "currency", description: "Three-letter ISO code.", format: "currency"}
      ]

      result = DocFormatter.build_typedoc_table(props)
      assert result =~ "* `amount` - Amount in cents."
      assert result =~ "* `currency` - Three-letter ISO code. Format: ISO 4217 currency code."
    end

    test "handles properties without descriptions" do
      props = [%{name: "id"}]
      result = DocFormatter.build_typedoc_table(props)
      assert result =~ "* `id`"
    end

    test "sorts by name" do
      props = [
        %{name: "zebra", description: "Last."},
        %{name: "alpha", description: "First."}
      ]

      result = DocFormatter.build_typedoc_table(props)
      lines = String.split(result, "\n")
      assert hd(lines) =~ "alpha"
      assert List.last(lines) =~ "zebra"
    end
  end
end
