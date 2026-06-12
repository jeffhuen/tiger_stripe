# File generated from our OpenAPI spec
defmodule Stripe.Events.V1BillingMeterNoMeterFoundEvent do
  @moduledoc """
  Occurs when a Meter's id is missing or invalid in async usage events.
  """

  @typedoc """
  * `identifier` - The request idempotency key.
  """
  @type data_reason_error_types_sample_errors_request :: %{
          optional(:identifier) => term() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `error_message` - The error message.
  * `request` - The request causes the error.
  """
  @type data_reason_error_types_sample_errors :: %{
          optional(:error_message) => term() | nil,
          optional(:request) => data_reason_error_types_sample_errors_request() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `code` - Open Enum.
  * `error_count` - The number of errors of this type.
  * `sample_errors` - A list of sample errors of this type.
  """
  @type data_reason_error_types :: %{
          optional(:code) => term() | nil,
          optional(:error_count) => term() | nil,
          optional(:sample_errors) => data_reason_error_types_sample_errors() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `error_count` - The total error count within this window.
  * `error_types` - The error details.
  """
  @type data_reason :: %{
          optional(:error_count) => term() | nil,
          optional(:error_types) => data_reason_error_types() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `developer_message_summary` - Extra field included in the event's `data` when fetched from /v2/events.
  * `reason` - This contains information about why meter error happens.
  * `validation_end` - The end of the window that is encapsulated by this summary.
  * `validation_start` - The start of the window that is encapsulated by this summary.
  """
  @type data :: %{
          optional(:developer_message_summary) => term() | nil,
          optional(:reason) => data_reason() | nil,
          optional(:validation_end) => term() | nil,
          optional(:validation_start) => term() | nil,
          optional(String.t()) => term()
        }

  defstruct [:changes, :context, :created, :data, :id, :livemode, :object, :reason, :type]

  def lookup_type, do: "v1.billing.meter.no_meter_found"

  def __nested_fields__ do
    %{
      "data" => %{
        fields: %{
          "developer_message_summary" => :scalar,
          "reason" => %{
            fields: %{
              "error_count" => :scalar,
              "error_types" => %{
                fields: %{
                  "code" => :scalar,
                  "error_count" => :scalar,
                  "sample_errors" => %{
                    fields: %{
                      "error_message" => :scalar,
                      "request" => %{
                        fields: %{
                          "identifier" => :scalar
                        }
                      }
                    }
                  }
                }
              }
            }
          },
          "validation_end" => :scalar,
          "validation_start" => :scalar
        }
      }
    }
  end
end
