# File generated from our OpenAPI spec
defmodule Stripe.Resources.DestinationPaymentMethodDetails do
  @moduledoc """
  OutboundTransfersPaymentMethodDetails
  """

  @typedoc """
  * `billing_details` - Expandable.
  * `financial_account` - Expandable.
  * `type` - The type of the payment method used in the OutboundTransfer. Possible values: `financial_account`, `us_bank_account`.
  * `us_bank_account` - Expandable.
  """
  @type t :: %__MODULE__{}

  defstruct [:billing_details, :financial_account, :type, :us_bank_account]

  @object_name "outbound_transfers_payment_method_details"
  def object_name, do: @object_name

  def expandable_fields, do: ["billing_details", "financial_account", "us_bank_account"]

  def __nested_fields__ do
    %{
      "billing_details" => {:resource, Stripe.Resources.BillingDetails},
      "financial_account" => {:resource, Stripe.Resources.FinancialAccount},
      "us_bank_account" => {:resource, Stripe.Resources.UsBankAccount}
    }
  end
end
