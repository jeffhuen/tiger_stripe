defmodule Stripe.MixProject do
  use Mix.Project

  @source_url "https://github.com/jeffhuen/tiger_stripe"
  @version "0.1.8"

  def project do
    [
      app: :tiger_stripe,
      version: @version,
      elixir: "~> 1.19",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      docs: docs(),
      package: package(),
      elixirc_paths: elixirc_paths(Mix.env()),
      test_coverage: [
        threshold: 50,
        ignore_modules: [
          ~r/^Stripe\.Services\./,
          ~r/^Stripe\.Resources\./,
          ~r/^Stripe\.Params\./,
          ~r/^Stripe\.Generator\./
        ]
      ],
      dialyzer: [
        plt_file: {:no_warn, "priv/plts/dialyzer.plt"},
        flags: [:unmatched_returns, :error_handling, :extra_return, :missing_return],
        plt_add_apps: [:mix, :ex_unit]
      ]
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {Stripe.Application, []}
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      # HTTP
      {:finch, "~> 0.21"},

      # Test stub ownership (allows SDK consumers to use Stripe.Test)
      {:nimble_ownership, "~> 1.0"},

      # JSON (heavy payloads — Rust NIF, 2-3x faster than Jason)
      {:rustyjson, "~> 0.3"},

      # Installer
      {:igniter, "~> 0.7", optional: true},

      # Dev/Test
      {:plug, "~> 1.16", only: :test},
      {:mox, "~> 1.1", only: :test},
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.4", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.34", only: :dev, runtime: false}
    ]
  end

  defp package do
    [
      name: "tiger_stripe",
      description:
        "Complete Stripe SDK for Elixir with 1:1 parity to the official " <>
          "Ruby SDK. V1+V2 API coverage (190 services, 307 resources, 523 typed params). " <>
          "Fully typed per-event modules. Modern stack: Finch HTTP/2, RustyJSON, " <>
          "automatic retries, OAuth, webhooks, telemetry, per-client config, streaming pagination.",
      maintainers: ["Jeff Huen"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => @source_url,
        "Changelog" => "#{@source_url}/blob/main/CHANGELOG.md"
      },
      files:
        ~w(lib guides .formatter.exs mix.exs README.md LICENSE CHANGELOG.md OPENAPI_VERSION usage-rules.md)
    ]
  end

  defp docs do
    [
      main: "readme",
      source_url: @source_url,
      extras: [
        "README.md",
        "guides/getting-started.md",
        "guides/igniter-installer.md",
        "guides/webhooks.md",
        "guides/connect-and-oauth.md",
        "guides/testing.md",
        "guides/telemetry.md",
        "CHANGELOG.md"
      ],
      groups_for_extras: [
        Guides: [
          "guides/getting-started.md",
          "guides/igniter-installer.md",
          "guides/webhooks.md",
          "guides/connect-and-oauth.md",
          "guides/testing.md",
          "guides/telemetry.md"
        ]
      ],
      groups_for_modules: [
        Core: [Stripe, Stripe.Client, Stripe.Config],
        "Error Handling": [Stripe.Error],
        Pagination: [Stripe.ListObject, Stripe.SearchResult],
        Webhooks: [Stripe.Webhook, Stripe.WebhookPlug],
        OAuth: [Stripe.OAuth],
        "V1 Services": ~r/Stripe\.Services\.(?!V2)/,
        "V2 Services": ~r/Stripe\.Services\.V2/,
        Resources: ~r/Stripe\.Resources\./,
        Params: ~r/Stripe\.Params\./
      ]
    ]
  end
end
