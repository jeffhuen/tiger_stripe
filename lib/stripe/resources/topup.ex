# File generated from our OpenAPI spec
defmodule Stripe.Resources.Topup do
  @moduledoc """
  Topup

  To top up your Stripe balance, you create a top-up object. You can retrieve
  individual top-ups, as well as list all top-ups. Top-ups are identified by a
  unique, random ID.

  Related guide: [Topping up your platform account](https://docs.stripe.com/connect/top-ups)
  """

  @typedoc """
  * `amount` - Amount transferred.
  * `balance_transaction` - ID of the balance transaction that describes the impact of this top-up on your account balance. May not be specified depending on status of top-up. Nullable. Expandable.
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Max length: 5000.
  * `description` - An arbitrary string attached to the object. Often useful for displaying to users. Max length: 5000. Nullable.
  * `expected_availability_date` - Date the funds are expected to arrive in your Stripe account for payouts. This factors in delays like weekends or bank holidays. May not be specified depending on status of top-up. Nullable.
  * `failure_code` - Error code explaining reason for top-up failure if available (see [the errors section](https://docs.stripe.com/api/errors) for a list of codes). Max length: 5000. Nullable.
  * `failure_message` - Message to user further explaining reason for top-up failure if available. Max length: 5000. Nullable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `initiated_by` - Indicates whether the top-up was initiated by Stripe or by the user. Possible values: `stripe`, `user`. Nullable.
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `topup`.
  * `payment_method` - The ID of a PaymentMethod representing the payment method used for the top-up. A PaymentMethod of type `us_bank_account` can be used. Nullable. Expandable.
  * `payment_method_options` - Payment-method-specific configuration for this top-up. Nullable. Expandable.
  * `source` - The source field is deprecated. It might not always be present in the API response. Nullable. Expandable.
  * `statement_descriptor` - Extra information about a top-up. This will appear on your source's bank statement. It must contain at least one letter. Max length: 5000. Nullable.
  * `status` - The status of the top-up is either `canceled`, `failed`, `pending`, `reversed`, or `succeeded`. Possible values: `canceled`, `failed`, `pending`, `reversed`, `succeeded`.
  * `transfer_group` - A string that identifies this top-up as part of a group. Max length: 5000. Nullable.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :amount,
    :balance_transaction,
    :created,
    :currency,
    :description,
    :expected_availability_date,
    :failure_code,
    :failure_message,
    :id,
    :initiated_by,
    :livemode,
    :metadata,
    :object,
    :payment_method,
    :payment_method_options,
    :source,
    :statement_descriptor,
    :status,
    :transfer_group
  ]

  @object_name "topup"
  def object_name, do: @object_name

  def expandable_fields,
    do: ["balance_transaction", "payment_method", "payment_method_options", "source"]

  def __nested_fields__ do
    %{
      "payment_method_options" => %{
        fields: %{
          "us_bank_account" => %{
            fields: %{
              "network" => :scalar
            }
          }
        }
      },
      "source" => {:resource, Stripe.Resources.Source}
    }
  end
end
