if Code.ensure_loaded?(Plug.Conn) do
  defmodule Stripe.WebhookPlug do
    @moduledoc """
    Plug for verifying Stripe webhook signatures.

    Reads the raw request body, verifies the `Stripe-Signature` header,
    deserializes the event, and assigns it to `conn.assigns.stripe_event`.

    Returns 400 on verification failure.

    ## Setup

    Add to your endpoint *before* `Plug.Parsers` (which consumes the body):

        plug Stripe.WebhookPlug,
          path: "/webhook/stripe"

    The signing secret is read from `config :tiger_stripe, :webhook_secret`.

    To override the secret per-plug (e.g. multiple webhook endpoints):

        plug Stripe.WebhookPlug,
          secret: "whsec_other",
          path: "/webhook/stripe"

    Or use a runtime MFA tuple:

        plug Stripe.WebhookPlug,
          secret: {MyApp.Config, :stripe_webhook_secret, []},
          path: "/webhook/stripe"

    ## Options

      * `:secret` - Signing secret (string or `{mod, fun, args}` MFA tuple).
        Defaults to `Application.get_env(:tiger_stripe, :webhook_secret)`.
      * `:path` - Request path to match (string). Required.
      * `:tolerance` - Maximum event age in seconds (default: 300).
    """

    @behaviour Plug

    import Plug.Conn

    @impl true
    def init(opts) do
      unless Keyword.has_key?(opts, :path),
        do: raise(ArgumentError, "Stripe.WebhookPlug requires :path option")

      opts
    end

    @impl true
    def call(%Plug.Conn{request_path: path} = conn, opts) do
      if path == Keyword.fetch!(opts, :path) do
        verify_and_assign(conn, opts)
      else
        conn
      end
    end

    defp verify_and_assign(conn, opts) do
      secret = resolve_secret(opts)
      tolerance = Keyword.get(opts, :tolerance, 300)

      with {:ok, body, conn} <- read_body(conn),
           sig_header when is_binary(sig_header) <- get_sig_header(conn),
           {:ok, event} <-
             Stripe.Webhook.construct_event(body, sig_header, secret, tolerance: tolerance) do
        assign(conn, :stripe_event, event)
      else
        {:error, %Stripe.Error{message: message}} ->
          conn
          |> put_resp_content_type("text/plain")
          |> send_resp(400, message || "Webhook verification failed")
          |> halt()

        nil ->
          conn
          |> put_resp_content_type("text/plain")
          |> send_resp(400, "Missing Stripe-Signature header")
          |> halt()
      end
    end

    defp get_sig_header(conn) do
      case get_req_header(conn, "stripe-signature") do
        [header | _] -> header
        [] -> nil
      end
    end

    defp resolve_secret(opts) do
      case Keyword.get(opts, :secret) do
        nil ->
          case Application.get_env(:tiger_stripe, :webhook_secret) do
            nil ->
              raise ArgumentError, """
              Stripe webhook secret not configured. Either:

                  config :tiger_stripe, webhook_secret: "whsec_..."

              Or pass it explicitly:

                  plug Stripe.WebhookPlug, secret: "whsec_...", path: "/webhook/stripe"
              """

            secret ->
              resolve_secret_value(secret)
          end

        secret ->
          resolve_secret_value(secret)
      end
    end

    defp resolve_secret_value({mod, fun, args}), do: apply(mod, fun, args)
    defp resolve_secret_value(secret) when is_binary(secret), do: secret
  end
end
