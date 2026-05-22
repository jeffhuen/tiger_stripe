if Code.ensure_loaded?(Igniter.Mix.Task) do
  defmodule Mix.Tasks.TigerStripe.Install do
    @moduledoc """
    Installs and configures tiger_stripe in a Phoenix application.

        $ mix tiger_stripe.install

    This installer:

    1. Adds a small Stripe wrapper module that reads env vars
    2. Adds the default `Stripe.Finch` pool to your supervision tree
    3. Adds `Stripe.WebhookPlug` to the Phoenix endpoint (before `Plug.Parsers`)
    4. Scaffolds a `StripeWebhookController` with event handler skeleton
    5. Adds the webhook route to the router
    """

    use Igniter.Mix.Task

    @impl Igniter.Mix.Task
    def info(_argv, _composing_task) do
      %Igniter.Mix.Task.Info{
        example: "mix tiger_stripe.install"
      }
    end

    @impl Igniter.Mix.Task
    def igniter(igniter) do
      igniter
      |> add_stripe_wrapper()
      |> add_finch_child()
      |> add_webhook_plug_to_endpoint()
      |> scaffold_webhook_controller()
      |> add_webhook_route()
      |> add_next_steps()
    end

    # -- Step 1: Stripe wrapper --------------------------------------------------

    defp add_stripe_wrapper(igniter) do
      case Igniter.Project.Application.app_module(igniter) do
        nil ->
          Igniter.add_notice(igniter, """
          Could not determine your application module. Add a helper manually:

              defmodule MyApp.Stripe do
                def client do
                  Stripe.client(System.fetch_env!("STRIPE_SECRET_KEY"))
                end

                def webhook_secret do
                  System.fetch_env!("STRIPE_WEBHOOK_SECRET")
                end
              end
          """)

        app_module ->
          stripe_module = Module.concat(app_module, Stripe)

          Igniter.Project.Module.create_module(igniter, stripe_module, """
            @moduledoc \"\"\"
            Builds Stripe clients and resolves Stripe runtime secrets.
            \"\"\"

            def client do
              Stripe.client(secret_key())
            end

            def client(opts) do
              secret_key()
              |> Stripe.client(opts)
            end

            def webhook_secret do
              System.fetch_env!("STRIPE_WEBHOOK_SECRET")
            end

            defp secret_key do
              System.fetch_env!("STRIPE_SECRET_KEY")
            end
          """)
      end
    end

    # -- Step 2: Finch child -----------------------------------------------------

    defp add_finch_child(igniter) do
      Igniter.Project.Application.add_new_child(igniter, Stripe)
    end

    # -- Step 3: Endpoint plug ---------------------------------------------------

    defp add_webhook_plug_to_endpoint(igniter) do
      case Igniter.Libs.Phoenix.select_endpoint(igniter) do
        {igniter, nil} ->
          Igniter.add_notice(igniter, """
          No Phoenix endpoint found. Add Stripe.WebhookPlug to your endpoint
          manually, before Plug.Parsers:

              plug Stripe.WebhookPlug,
                secret: {MyApp.Stripe, :webhook_secret, []},
                path: "/webhook/stripe"
          """)

        {igniter, endpoint} ->
          secret_module =
            igniter
            |> Igniter.Project.Application.app_module()
            |> case do
              nil -> MyApp.Stripe
              app_module -> Module.concat(app_module, Stripe)
            end

          Igniter.Project.Module.find_and_update_module!(igniter, endpoint, fn zipper ->
            plug_code =
              ~s(plug Stripe.WebhookPlug, secret: {#{inspect(secret_module)}, :webhook_secret, []}, path: "/webhook/stripe")

            with :error <-
                   insert_before_plug_parsers(zipper, plug_code, 2),
                 :error <-
                   insert_before_plug_parsers(zipper, plug_code, 1) do
              {:warning,
               """
               Could not find `plug Plug.Parsers` in #{inspect(endpoint)}.
               Add Stripe.WebhookPlug manually before Plug.Parsers:

                   plug Stripe.WebhookPlug,
                     secret: {#{inspect(secret_module)}, :webhook_secret, []},
                     path: "/webhook/stripe"
               """}
            end
          end)
      end
    end

    defp insert_before_plug_parsers(zipper, plug_code, arity) do
      case Igniter.Code.Function.move_to_function_call(zipper, :plug, arity, fn call_zipper ->
             Igniter.Code.Function.argument_equals?(call_zipper, 0, Plug.Parsers)
           end) do
        {:ok, zipper} ->
          {:ok, Igniter.Code.Common.add_code(zipper, plug_code, placement: :before)}

        :error ->
          :error
      end
    end

    # -- Step 4: Webhook controller ----------------------------------------------

    defp scaffold_webhook_controller(igniter) do
      case Igniter.Libs.Phoenix.select_endpoint(igniter) do
        {igniter, nil} ->
          igniter

        {igniter, _endpoint} ->
          web_module = Igniter.Libs.Phoenix.web_module(igniter)
          controller_module = Module.concat(web_module, StripeWebhookController)

          Igniter.Project.Module.create_module(igniter, controller_module, """
            @moduledoc \"\"\"
            Handles incoming Stripe webhook events.

            Events are verified by `Stripe.WebhookPlug` in the endpoint and
            available via `conn.assigns.stripe_event`.
            \"\"\"

            use #{inspect(web_module)}, :controller

            require Logger

            def handle(conn, _params) do
              event = conn.assigns.stripe_event

              case event.type do
                "checkout.session.completed" ->
                  handle_checkout_completed(event)

                "invoice.payment_succeeded" ->
                  handle_invoice_paid(event)

                "invoice.payment_failed" ->
                  handle_invoice_failed(event)

                "customer.subscription.deleted" ->
                  handle_subscription_deleted(event)

                unhandled ->
                  Logger.info("Unhandled Stripe event: \#{unhandled}")
              end

              send_resp(conn, 200, "ok")
            end

            # -- Event handlers -------------------------------------------------------
            # Replace these stubs with your business logic.

            defp handle_checkout_completed(event) do
              Logger.info("Checkout completed: \#{event.id}")
              :ok
            end

            defp handle_invoice_paid(event) do
              Logger.info("Invoice paid: \#{event.id}")
              :ok
            end

            defp handle_invoice_failed(event) do
              Logger.info("Invoice payment failed: \#{event.id}")
              :ok
            end

            defp handle_subscription_deleted(event) do
              Logger.info("Subscription deleted: \#{event.id}")
              :ok
            end
          """)
      end
    end

    # -- Step 5: Webhook route ---------------------------------------------------

    defp add_webhook_route(igniter) do
      case Igniter.Libs.Phoenix.select_router(igniter) do
        {igniter, nil} ->
          Igniter.add_notice(igniter, """
          No Phoenix router found. Add the webhook route manually:

              scope "/webhook" do
                post "/stripe", YourAppWeb.StripeWebhookController, :handle
              end
          """)

        {igniter, router} ->
          web_module = Igniter.Libs.Phoenix.web_module(igniter)
          controller = Module.concat(web_module, StripeWebhookController)

          Igniter.Libs.Phoenix.add_scope(
            igniter,
            "/webhook",
            """
            post "/stripe", #{inspect(controller)}, :handle
            """,
            router: router
          )
      end
    end

    # -- Step 6: Next steps notice -----------------------------------------------

    defp add_next_steps(igniter) do
      Igniter.add_notice(igniter, """
      tiger_stripe has been installed! Next steps:

      1. Set environment variables for the app:

             STRIPE_SECRET_KEY=sk_test_... or sk_live_...
             STRIPE_WEBHOOK_SECRET=whsec_...

      2. Create a webhook endpoint in the Stripe Dashboard:
         https://dashboard.stripe.com/webhooks
         Point it to: https://your-domain.com/webhook/stripe

      3. Customize event handlers in your StripeWebhookController.

      4. For local testing, use the Stripe CLI:

             stripe listen --forward-to localhost:4000/webhook/stripe
      """)
    end
  end
end
