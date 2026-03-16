# File generated from our OpenAPI spec
defmodule Stripe.Events.V1BillingMeterErrorReportTriggeredEvent do
  @moduledoc """
  Occurs when a Meter has invalid async usage events.
  """

  defmodule Data do
    @moduledoc false
    defmodule Reason do
      @moduledoc false
      defmodule ErrorTypes do
        @moduledoc false
        defmodule SampleErrors do
          @moduledoc false
          defmodule Request do
            @moduledoc false

            @typedoc """
            * `identifier` - The request idempotency key.
            """
            @type t :: %__MODULE__{
                    identifier: term()
                  }

            defstruct [:identifier]
          end

          @typedoc """
          * `error_message` - The error message.
          * `request` - The request causes the error.
          """
          @type t :: %__MODULE__{
                  error_message: term(),
                  request: term()
                }

          defstruct [:error_message, :request]
          def __inner_types__, do: %{"request" => Request}
        end

        @typedoc """
        * `code` - Open Enum.
        * `error_count` - The number of errors of this type.
        * `sample_errors` - A list of sample errors of this type.
        """
        @type t :: %__MODULE__{
                code: term(),
                error_count: term(),
                sample_errors: term()
              }

        defstruct [:code, :error_count, :sample_errors]
        def __inner_types__, do: %{"sample_errors" => SampleErrors}
      end

      @typedoc """
      * `error_count` - The total error count within this window.
      * `error_types` - The error details.
      """
      @type t :: %__MODULE__{
              error_count: term(),
              error_types: term()
            }

      defstruct [:error_count, :error_types]
      def __inner_types__, do: %{"error_types" => ErrorTypes}
    end

    @typedoc """
    * `developer_message_summary` - Extra field included in the event's `data` when fetched from /v2/events.
    * `reason` - This contains information about why meter error happens.
    * `validation_end` - The end of the window that is encapsulated by this summary.
    * `validation_start` - The start of the window that is encapsulated by this summary.
    """
    @type t :: %__MODULE__{
            developer_message_summary: term(),
            reason: term(),
            validation_end: term(),
            validation_start: term()
          }

    defstruct [:developer_message_summary, :reason, :validation_end, :validation_start]
    def __inner_types__, do: %{"reason" => Reason}
  end

  defstruct [
    :changes,
    :context,
    :created,
    :data,
    :id,
    :livemode,
    :object,
    :reason,
    :related_object,
    :type
  ]

  def lookup_type, do: "v1.billing.meter.error_report_triggered"

  def __inner_types__, do: %{"data" => Data}

  def fetch_related_object(%__MODULE__{related_object: %{"url" => url}} = event, client) do
    opts =
      case Map.get(event, :context) do
        nil -> []
        ctx -> [stripe_context: ctx]
      end

    Stripe.Client.request(client, :get, url, opts)
  end
end
