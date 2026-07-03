# File generated from our OpenAPI spec
defmodule Stripe.Resources.Treasury.OutboundTransfer do
  @moduledoc """
  TreasuryOutboundTransfersResourceOutboundTransfer

  Use [OutboundTransfers](https://docs.stripe.com/docs/treasury/moving-money/financial-accounts/out-of/outbound-transfers) to transfer funds from a [FinancialAccount](https://api.stripe.com#financial_accounts) to a PaymentMethod belonging to the same entity. To send funds to a different party, use [OutboundPayments](https://api.stripe.com#outbound_payments) instead. You can send funds over ACH rails or through a domestic wire transfer to a user's own external bank account.

  Simulate OutboundTransfer state changes with the `/v1/test_helpers/treasury/outbound_transfers` endpoints. These methods can only be called on test mode objects.

  Related guide: [Moving money with Treasury using OutboundTransfer objects](https://docs.stripe.com/docs/treasury/moving-money/financial-accounts/out-of/outbound-transfers)
  """

  @typedoc """
  * `amount` - Amount (in cents) transferred.
  * `cancelable` - Returns `true` if the object can be canceled, and `false` otherwise.
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `description` - An arbitrary string attached to the object. Often useful for displaying to users. Max length: 5000. Nullable.
  * `destination_payment_method` - The PaymentMethod used as the payment instrument for an OutboundTransfer. Max length: 5000. Nullable.
  * `destination_payment_method_details` - Expandable.
  * `expected_arrival_date` - The date when funds are expected to arrive in the destination account. Format: Unix timestamp.
  * `financial_account` - The FinancialAccount that funds were pulled from. Max length: 5000.
  * `hosted_regulatory_receipt_url` - A [hosted transaction receipt](https://docs.stripe.com/treasury/moving-money/regulatory-receipts) URL that is provided when money movement is considered regulated under Stripe's money transmission licenses. Max length: 5000. Nullable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `treasury.outbound_transfer`.
  * `returned_details` - Details about a returned OutboundTransfer. Only set when the status is `returned`. Nullable. Expandable.
  * `statement_descriptor` - Information about the OutboundTransfer to be sent to the recipient account. Max length: 5000.
  * `status` - Current status of the OutboundTransfer: `processing`, `failed`, `canceled`, `posted`, `returned`. An OutboundTransfer is `processing` if it has been created and is pending. The status changes to `posted` once the OutboundTransfer has been "confirmed" and funds have left the account, or to `failed` or `canceled`. If an OutboundTransfer fails to arrive at its destination, its status will change to `returned`. Possible values: `canceled`, `failed`, `posted`, `processing`, `returned`.
  * `status_transitions` - Expandable.
  * `tracking_details` - Details about network-specific tracking information if available. Nullable. Expandable.
  * `transaction` - The Transaction associated with this object. Expandable.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :amount,
    :cancelable,
    :created,
    :currency,
    :description,
    :destination_payment_method,
    :destination_payment_method_details,
    :expected_arrival_date,
    :financial_account,
    :hosted_regulatory_receipt_url,
    :id,
    :livemode,
    :metadata,
    :object,
    :returned_details,
    :statement_descriptor,
    :status,
    :status_transitions,
    :tracking_details,
    :transaction
  ]

  @object_name "treasury.outbound_transfer"
  def object_name, do: @object_name

  def expandable_fields,
    do: [
      "destination_payment_method_details",
      "returned_details",
      "status_transitions",
      "tracking_details",
      "transaction"
    ]

  def __nested_fields__ do
    %{
      "tracking_details" => %{
        fields: %{
          "ach" => %{
            fields: %{
              "trace_id" => :scalar
            }
          },
          "type" => :scalar,
          "us_domestic_wire" => %{
            fields: %{
              "chips" => :scalar,
              "imad" => :scalar,
              "omad" => :scalar
            }
          }
        }
      },
      "destination_payment_method_details" =>
        {:resource, Stripe.Resources.DestinationPaymentMethodDetails},
      "returned_details" => {:resource, Stripe.Resources.ReturnedDetails},
      "status_transitions" => {:resource, Stripe.Resources.StatusTransitions}
    }
  end
end
