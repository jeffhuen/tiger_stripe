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
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `source_mandate_notification`.
  * `reason` - The reason of the mandate notification. Valid reasons are `mandate_confirmed` or `debit_initiated`. Max length: 5000.
  * `sepa_debit` - Expandable.
  * `source` - Expandable.
  * `status` - The status of the mandate notification. Valid statuses are `pending` or `submitted`. Max length: 5000.
  * `type` - The type of source this mandate notification is attached to. Should be the source type identifier code for the payment method, such as `three_d_secure`. Max length: 5000.
  """
  @type t :: %__MODULE__{
          acss_debit: __MODULE__.AcssDebit.t() | nil,
          amount: integer(),
          bacs_debit: __MODULE__.BacsDebit.t() | nil,
          created: integer(),
          id: String.t(),
          livemode: boolean(),
          object: String.t(),
          reason: String.t(),
          sepa_debit: __MODULE__.SepaDebit.t() | nil,
          source: Stripe.Resources.Source.t(),
          status: String.t(),
          type: String.t()
        }

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

  defmodule AcssDebit do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `statement_descriptor` - The statement descriptor associate with the debit. Max length: 5000.
    """
    @type t :: %__MODULE__{
            statement_descriptor: String.t() | nil
          }
    defstruct [:statement_descriptor]
  end

  defmodule BacsDebit do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `last4` - Last 4 digits of the account number associated with the debit. Max length: 5000.
    """
    @type t :: %__MODULE__{
            last4: String.t() | nil
          }
    defstruct [:last4]
  end

  defmodule SepaDebit do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `creditor_identifier` - SEPA creditor ID. Max length: 5000.
    * `last4` - Last 4 digits of the account number associated with the debit. Max length: 5000.
    * `mandate_reference` - Mandate reference associated with the debit. Max length: 5000.
    """
    @type t :: %__MODULE__{
            creditor_identifier: String.t() | nil,
            last4: String.t() | nil,
            mandate_reference: String.t() | nil
          }
    defstruct [:creditor_identifier, :last4, :mandate_reference]
  end

  def __inner_types__ do
    %{
      "acss_debit" => __MODULE__.AcssDebit,
      "bacs_debit" => __MODULE__.BacsDebit,
      "sepa_debit" => __MODULE__.SepaDebit,
      "source" => Stripe.Resources.Source
    }
  end
end
