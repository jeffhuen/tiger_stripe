# File generated from our OpenAPI spec
defmodule Stripe.Resources.SourceMandateNotification do
  @moduledoc """
  SourceMandateNotification

  Source mandate notifications should be created when a notification related to
  a source mandate must be sent to the payer. They will trigger a webhook or
  deliver an email to the customer.
  """

  @typedoc """
  * `acss_debit` - Expandable.
  * `amount` - A positive integer in the smallest currency unit (that is, 100 cents for $1.00, or 1 for ¥1, Japanese Yen being a zero-decimal currency) representing the amount associated with the mandate notification. The amount is expressed in the currency of the underlying source. Required if the notification type is `debit_initiated`. Nullable.
  * `bacs_debit` - Expandable.
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `source_mandate_notification`.
  * `reason` - The reason of the mandate notification. Valid reasons are `mandate_confirmed` or `debit_initiated`. Max length: 5000.
  * `sepa_debit` - Expandable.
  * `source` - Expandable.
  * `status` - The status of the mandate notification. Valid statuses are `pending` or `submitted`. Max length: 5000.
  * `type` - The type of source this mandate notification is attached to. Should be the source type identifier code for the payment method, such as `three_d_secure`. Max length: 5000.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :acss_debit,
    :amount,
    :bacs_debit,
    :created,
    :id,
    :livemode,
    :object,
    :reason,
    :sepa_debit,
    :source,
    :status,
    :type
  ]

  @object_name "source_mandate_notification"
  def object_name, do: @object_name

  def expandable_fields, do: ["acss_debit", "bacs_debit", "sepa_debit", "source"]

  def __nested_fields__ do
    %{
      "acss_debit" => %{
        fields: %{
          "statement_descriptor" => :scalar
        }
      },
      "bacs_debit" => %{
        fields: %{
          "last4" => :scalar
        }
      },
      "sepa_debit" => %{
        fields: %{
          "creditor_identifier" => :scalar,
          "last4" => :scalar,
          "mandate_reference" => :scalar
        }
      },
      "source" => {:resource, Stripe.Resources.Source}
    }
  end
end
