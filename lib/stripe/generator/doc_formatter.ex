defmodule Stripe.Generator.DocFormatter do
  @moduledoc false

  @doc """
  Convert HTML from OpenAPI operation descriptions to ExDoc-compatible markdown.

  Handles: `<p>`, `<a href>`, `<code>`, `<strong>`, `<em>`, `<ul>/<li>`,
  `<ol>/<li>`, `<br>`, `<h1>`–`<h6>`.

  Falls back to stripping all remaining tags if any `<` survives conversion.
  Returns `nil` for empty/whitespace-only results.
  """
  def html_to_markdown(nil), do: nil
  def html_to_markdown(""), do: nil

  def html_to_markdown(html) when is_binary(html) do
    result =
      html
      # Block-level elements: paragraphs, headings
      |> String.replace(~r/<\/p>\s*/i, "\n\n")
      |> String.replace(~r/<p[^>]*>/i, "")
      |> then(fn text ->
        Regex.replace(~r/<h([1-6])[^>]*>(.*?)<\/h\1>/is, text, fn _, level, inner ->
          prefix = String.duplicate("#", String.to_integer(level))
          "#{prefix} #{inner}\n\n"
        end)
      end)
      # Line breaks
      |> String.replace(~r/<br\s*\/?\s*>/i, "\n")
      # Inline elements — resolve relative Stripe URLs
      |> then(fn text ->
        Regex.replace(~r/<a\s+href="([^"]*)"[^>]*>(.*?)<\/a>/is, text, fn _, href, label ->
          url =
            cond do
              String.starts_with?(href, "/docs/") -> "https://docs.stripe.com#{href}"
              String.starts_with?(href, "/api/") -> "https://docs.stripe.com#{href}"
              String.starts_with?(href, "/") -> "https://stripe.com#{href}"
              true -> href
            end

          "[#{label}](#{url})"
        end)
      end)
      |> String.replace(~r/<code>(.*?)<\/code>/is, "`\\1`")
      |> String.replace(~r/<strong>(.*?)<\/strong>/is, "**\\1**")
      |> String.replace(~r/<em>(.*?)<\/em>/is, "*\\1*")
      # Lists
      |> convert_lists()
      # Fallback: strip any remaining HTML tags
      |> strip_remaining_tags()
      # Clean up whitespace
      |> String.replace(~r/[ \t]+/, " ")
      |> String.replace(~r/\n{3,}/, "\n\n")
      |> String.trim()
      |> resolve_relative_urls()
      # Fix stray trailing backtick from spec typos (e.g. `rate_type`` → `rate_type`)
      # Only targets exactly `` (two backticks) not preceded/followed by more backticks
      |> String.replace(~r/(?<!`)``(?!`)/, "`")
      # Escape backslash-backtick sequences that confuse ExDoc markdown parser
      |> String.replace("\\`", "\\\\`")

    if result == "", do: nil, else: result
  end

  defp convert_lists(html) do
    # Unordered lists
    html =
      Regex.replace(~r/<ul[^>]*>(.*?)<\/ul>/is, html, fn _, inner ->
        items =
          Regex.scan(~r/<li[^>]*>(.*?)<\/li>/is, inner)
          |> Enum.map_join("\n", fn [_, text] -> "  * #{String.trim(text)}" end)

        "\n#{items}\n"
      end)

    # Ordered lists
    Regex.replace(~r/<ol[^>]*>(.*?)<\/ol>/is, html, fn _, inner ->
      items =
        Regex.scan(~r/<li[^>]*>(.*?)<\/li>/is, inner)
        |> Enum.with_index(1)
        |> Enum.map_join("\n", fn {[_, text], idx} -> "  #{idx}. #{String.trim(text)}" end)

      "\n#{items}\n"
    end)
  end

  defp strip_remaining_tags(text) do
    if String.contains?(text, "<") do
      Regex.replace(~r/<[^>]*>/, text, "")
    else
      text
    end
  end

  @doc false
  def resolve_relative_urls(nil), do: nil

  def resolve_relative_urls(text) when is_binary(text) do
    # Resolve /path relative URLs
    text =
      Regex.replace(~r/\]\(\/([^)]*)\)/, text, fn _, path ->
        if String.starts_with?(path, "docs/") or String.starts_with?(path, "api/") do
          "](https://docs.stripe.com/#{path})"
        else
          "](https://stripe.com/#{path})"
        end
      end)

    # Resolve bare api/ relative URLs (missing leading slash)
    Regex.replace(~r/\]\(api\/([^)]*)\)/, text, fn _, path ->
      "](https://docs.stripe.com/api/#{path})"
    end)
  end

  @doc """
  Format a property map into an annotated documentation line for `@typedoc` tables.

  Input: map with keys `:name`, `:description`, `:enum`, `:format`, `:nullable`,
         `:max_length`, `:deprecated`, `:expandable`.
  Output: `"description. Format: label. Possible values: \\`a\\`, \\`b\\`. Nullable."`
  """
  def format_property_doc(prop) when is_map(prop) do
    parts = []

    # Base description
    parts =
      case prop[:description] do
        nil -> parts
        "" -> parts
        desc -> [html_to_markdown(desc) || "" | parts]
      end

    # Format label
    parts =
      case prop[:format] do
        nil -> parts
        "" -> parts
        fmt -> ["Format: #{format_label(fmt)}." | parts]
      end

    # Enum values
    parts =
      case prop[:enum] do
        nil ->
          parts

        [] ->
          parts

        values when is_list(values) ->
          non_empty = Enum.reject(values, &(&1 == "" || &1 == nil))

          if non_empty != [] do
            formatted = Enum.map_join(non_empty, ", ", &"`#{&1}`")
            ["Possible values: #{formatted}." | parts]
          else
            parts
          end
      end

    # Max length
    parts =
      case prop[:max_length] do
        nil -> parts
        n when is_integer(n) -> ["Max length: #{n}." | parts]
        _ -> parts
      end

    # Nullable
    parts = if prop[:nullable] == true, do: ["Nullable." | parts], else: parts

    # Expandable
    parts = if prop[:expandable] == true, do: ["Expandable." | parts], else: parts

    # Deprecated
    parts = if prop[:deprecated] == true, do: ["**Deprecated.**" | parts], else: parts

    case Enum.reverse(parts) do
      [] -> nil
      items -> Enum.join(items, " ")
    end
  end

  @doc """
  Map OpenAPI format strings to human-readable labels.
  """
  def format_label("unix-time"), do: "Unix timestamp"
  def format_label("currency"), do: "ISO 4217 currency code"
  def format_label("decimal"), do: "decimal string"
  def format_label(other), do: other

  @doc """
  Escape triple-quote sequences that would break heredoc syntax.
  """
  def escape_for_heredoc(nil), do: nil

  def escape_for_heredoc(text) when is_binary(text) do
    String.replace(text, ~S("""), ~S(\"\"\"))
  end

  @doc """
  Combine schema title and description into `@moduledoc` content.
  Returns `nil` when both are nil/empty.
  """
  def schema_moduledoc(nil, nil), do: nil
  def schema_moduledoc("", nil), do: nil
  def schema_moduledoc(nil, ""), do: nil
  def schema_moduledoc("", ""), do: nil

  def schema_moduledoc(title, nil), do: escape_for_heredoc(title)
  def schema_moduledoc(title, ""), do: escape_for_heredoc(title)

  def schema_moduledoc(nil, description) do
    case html_to_markdown(description) do
      nil -> nil
      md -> escape_for_heredoc(md)
    end
  end

  def schema_moduledoc("", description), do: schema_moduledoc(nil, description)

  def schema_moduledoc(title, description) do
    case html_to_markdown(description) do
      nil -> escape_for_heredoc(title)
      md -> escape_for_heredoc("#{title}\n\n#{md}")
    end
  end

  @doc """
  Combine operation summary and description into `@doc` content.
  Description is HTML-converted to markdown. Returns `nil` when both are nil/empty.
  """
  def operation_doc(nil, nil), do: nil
  def operation_doc("", nil), do: nil
  def operation_doc(nil, ""), do: nil
  def operation_doc("", ""), do: nil

  def operation_doc(summary, nil), do: escape_for_heredoc(summary)
  def operation_doc(summary, ""), do: escape_for_heredoc(summary)

  def operation_doc(nil, description) do
    case html_to_markdown(description) do
      nil -> nil
      md -> escape_for_heredoc(md)
    end
  end

  def operation_doc("", description), do: operation_doc(nil, description)

  def operation_doc(summary, description) do
    case html_to_markdown(description) do
      nil -> escape_for_heredoc(summary)
      md -> escape_for_heredoc("#{summary}\n\n#{md}")
    end
  end

  @doc """
  Build a `@typedoc` field table from a list of property maps.
  Each property should have at least `:name` and optionally `:description`,
  `:enum`, `:format`, `:nullable`, `:max_length`, `:expandable`, `:deprecated`.
  Returns `nil` if no properties have documentation.
  """
  def build_typedoc_table(properties) when is_list(properties) do
    lines =
      properties
      |> Enum.sort_by(& &1[:name])
      |> Enum.map(fn prop ->
        doc = format_property_doc(prop)

        case doc do
          nil -> "  * `#{prop[:name]}`"
          text -> "  * `#{prop[:name]}` - #{text}"
        end
      end)

    case lines do
      [] -> nil
      lines -> escape_for_heredoc(Enum.join(lines, "\n"))
    end
  end
end
