# File generated from our OpenAPI spec
defmodule Stripe.Resources.InvoicePayment do
  @moduledoc """
  InvoicesInvoicePayment

  Invoice Payments represent payments made against invoices. Invoice Payments can
  be accessed in two ways:
  1. By expanding the `payments` field on the [Invoice](https://api.stripe.com#invoice) resource.
  2. By using the Invoice Payment retrieve and list endpoints.

  Invoice Payments include the mapping between payment objects, such as Payment Intent, and Invoices.
  This resource and its endpoints allows you to easily track if a payment is associated with a specific invoice and
  monitor the allocation details of the payments.
  """

  @typedoc """
  * `amount_paid` - Amount that was actually paid for this invoice, in cents (or local equivalent). This field is null until the payment is `paid`. This amount can be less than the `amount_requested` if the PaymentIntent’s `amount_received` is not sufficient to pay all of the invoices that it is attached to. Nullable.
  * `amount_requested` - Amount intended to be paid toward this invoice, in cents (or local equivalent)
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Max length: 5000.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `invoice` - The invoice that was paid. Expandable.
  * `is_default` - Stripe automatically creates a default InvoicePayment when the invoice is finalized, and keeps it synchronized with the invoice’s `amount_remaining`. The PaymentIntent associated with the default payment can’t be edited or canceled directly.
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `invoice_payment`.
  * `payment` - Expandable.
  * `status` - The status of the payment, one of `open`, `paid`, or `canceled`. Max length: 5000.
  * `status_transitions` - Expandable.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :amount_paid,
    :amount_requested,
    :created,
    :currency,
    :id,
    :invoice,
    :is_default,
    :livemode,
    :object,
    :payment,
    :status,
    :status_transitions
  ]

  @object_name "invoice_payment"
  def object_name, do: @object_name

  def expandable_fields, do: ["invoice", "payment", "status_transitions"]

  def __nested_fields__ do
    %{
      "payment" => %{
        fields: %{
          "charge" => {:resource, Stripe.Resources.Charge},
          "payment_intent" => {:resource, Stripe.Resources.PaymentIntent},
          "payment_record" => {:resource, Stripe.Resources.PaymentRecord},
          "type" => :scalar
        }
      },
      "status_transitions" => %{
        fields: %{
          "canceled_at" => :scalar,
          "paid_at" => :scalar
        }
      }
    }
  end
end
