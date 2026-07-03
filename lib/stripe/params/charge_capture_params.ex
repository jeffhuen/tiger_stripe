# File generated from our OpenAPI spec
defmodule Stripe.Params.ChargeCaptureParams do
  @moduledoc "Parameters for charge capture."

  @typedoc """
  * `amount` - The amount to capture, which must be less than or equal to the original amount.
  * `application_fee` - An application fee to add on to this charge.
  * `application_fee_amount` - An application fee amount to add on to this charge, which must be less than or equal to the original amount.
  * `expand` - Specifies which fields in the response should be expanded.
  * `receipt_email` - The email address to send this charge's receipt to. This will override the previously-specified email address for this charge, if one was set. Receipts will not be sent in test mode.
  * `statement_descriptor` - For a non-card charge, text that appears on the customer's statement as the statement descriptor. This value overrides the account's default statement descriptor. For information about requirements, including the 22-character limit, see [the Statement Descriptor docs](https://docs.stripe.com/get-started/account/statement-descriptors).

  For a card charge, this value is ignored unless you don't specify a `statement_descriptor_suffix`, in which case this value is used as the suffix. Max length: 22.
  * `statement_descriptor_suffix` - Provides information about a card charge. Concatenated to the account's [statement descriptor prefix](https://docs.stripe.com/get-started/account/statement-descriptors#static) to form the complete statement descriptor that appears on the customer's statement. If the account has no prefix value, the suffix is concatenated to the account's statement descriptor. Max length: 22.
  * `transfer_data` - An optional dictionary including the account to automatically transfer to as part of a destination charge. [See the Connect documentation](https://docs.stripe.com/connect/destination-charges) for details.
  * `transfer_group` - A string that identifies this transaction as part of a group. `transfer_group` may only be provided if it has not been set. See the [Connect documentation](https://docs.stripe.com/connect/separate-charges-and-transfers#transfer-options) for details.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :amount,
    :application_fee,
    :application_fee_amount,
    :expand,
    :receipt_email,
    :statement_descriptor,
    :statement_descriptor_suffix,
    :transfer_data,
    :transfer_group
  ]
end
