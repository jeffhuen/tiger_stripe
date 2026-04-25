# File generated from our OpenAPI spec
defmodule Stripe.Params.DisputeUpdateParams do
  @moduledoc "Parameters for dispute update."

  @typedoc """
  * `evidence` - Evidence to upload, to respond to a dispute. Updating any field in the hash will submit all fields in the hash for review. The combined character count of all fields is limited to 150,000.
  * `expand` - Specifies which fields in the response should be expanded.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `submit` - Whether to immediately submit evidence to the bank. If `false`, evidence is staged on the dispute. Staged evidence is visible in the API and Dashboard, and can be submitted to the bank by making another request with this attribute set to `true` (the default).
  """
  @type t :: %__MODULE__{
          evidence: evidence() | nil,
          expand: [String.t()] | nil,
          metadata: map() | nil,
          submit: boolean() | nil
        }

  defstruct [:evidence, :expand, :metadata, :submit]

  @typedoc """
  * `access_activity_log` - Any server or activity logs showing proof that the customer accessed or downloaded the purchased digital product. This information should include IP addresses, corresponding timestamps, and any detailed recorded activity. Has a maximum character count of 20,000. Max length: 20000.
  * `billing_address` - The billing address provided by the customer. Max length: 5000.
  * `cancellation_policy` - (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Your subscription cancellation policy, as shown to the customer.
  * `cancellation_policy_disclosure` - An explanation of how and when the customer was shown your refund policy prior to purchase. Has a maximum character count of 20,000. Max length: 20000.
  * `cancellation_rebuttal` - A justification for why the customer's subscription was not canceled. Has a maximum character count of 20,000. Max length: 20000.
  * `customer_communication` - (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Any communication with the customer that you feel is relevant to your case. Examples include emails proving that the customer received the product or service, or demonstrating their use of or satisfaction with the product or service.
  * `customer_email_address` - The email address of the customer. Max length: 5000.
  * `customer_name` - The name of the customer. Max length: 5000.
  * `customer_purchase_ip` - The IP address that the customer used when making the purchase. Max length: 5000.
  * `customer_signature` - (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) A relevant document or contract showing the customer's signature.
  * `duplicate_charge_documentation` - (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Documentation for the prior charge that can uniquely identify the charge, such as a receipt, shipping label, work order, etc. This document should be paired with a similar document from the disputed payment that proves the two payments are separate.
  * `duplicate_charge_explanation` - An explanation of the difference between the disputed charge versus the prior charge that appears to be a duplicate. Has a maximum character count of 20,000. Max length: 20000.
  * `duplicate_charge_id` - The Stripe ID for the prior charge which appears to be a duplicate of the disputed charge. Max length: 5000.
  * `enhanced_evidence` - Additional evidence for qualifying evidence programs.
  * `product_description` - A description of the product or service that was sold. Has a maximum character count of 20,000. Max length: 20000.
  * `receipt` - (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Any receipt or message sent to the customer notifying them of the charge.
  * `refund_policy` - (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Your refund policy, as shown to the customer.
  * `refund_policy_disclosure` - Documentation demonstrating that the customer was shown your refund policy prior to purchase. Has a maximum character count of 20,000. Max length: 20000.
  * `refund_refusal_explanation` - A justification for why the customer is not entitled to a refund. Has a maximum character count of 20,000. Max length: 20000.
  * `service_date` - The date on which the customer received or began receiving the purchased service, in a clear human-readable format. Max length: 5000.
  * `service_documentation` - (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Documentation showing proof that a service was provided to the customer. This could include a copy of a signed contract, work order, or other form of written agreement.
  * `shipping_address` - The address to which a physical product was shipped. You should try to include as complete address information as possible. Max length: 5000.
  * `shipping_carrier` - The delivery service that shipped a physical product, such as Fedex, UPS, USPS, etc. If multiple carriers were used for this purchase, please separate them with commas. Max length: 5000.
  * `shipping_date` - The date on which a physical product began its route to the shipping address, in a clear human-readable format. Max length: 5000.
  * `shipping_documentation` - (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Documentation showing proof that a product was shipped to the customer at the same address the customer provided to you. This could include a copy of the shipment receipt, shipping label, etc. It should show the customer's full shipping address, if possible.
  * `shipping_tracking_number` - The tracking number for a physical product, obtained from the delivery service. If multiple tracking numbers were generated for this purchase, please separate them with commas. Max length: 5000.
  * `uncategorized_file` - (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Any additional evidence or statements.
  * `uncategorized_text` - Any additional evidence or statements. Has a maximum character count of 20,000. Max length: 20000.
  """
  @type evidence :: %{
          optional(:access_activity_log) => String.t() | nil,
          optional(:billing_address) => String.t() | nil,
          optional(:cancellation_policy) => String.t() | nil,
          optional(:cancellation_policy_disclosure) => String.t() | nil,
          optional(:cancellation_rebuttal) => String.t() | nil,
          optional(:customer_communication) => String.t() | nil,
          optional(:customer_email_address) => String.t() | nil,
          optional(:customer_name) => String.t() | nil,
          optional(:customer_purchase_ip) => String.t() | nil,
          optional(:customer_signature) => String.t() | nil,
          optional(:duplicate_charge_documentation) => String.t() | nil,
          optional(:duplicate_charge_explanation) => String.t() | nil,
          optional(:duplicate_charge_id) => String.t() | nil,
          optional(:enhanced_evidence) => map() | nil,
          optional(:product_description) => String.t() | nil,
          optional(:receipt) => String.t() | nil,
          optional(:refund_policy) => String.t() | nil,
          optional(:refund_policy_disclosure) => String.t() | nil,
          optional(:refund_refusal_explanation) => String.t() | nil,
          optional(:service_date) => String.t() | nil,
          optional(:service_documentation) => String.t() | nil,
          optional(:shipping_address) => String.t() | nil,
          optional(:shipping_carrier) => String.t() | nil,
          optional(:shipping_date) => String.t() | nil,
          optional(:shipping_documentation) => String.t() | nil,
          optional(:shipping_tracking_number) => String.t() | nil,
          optional(:uncategorized_file) => String.t() | nil,
          optional(:uncategorized_text) => String.t() | nil,
          optional(String.t()) => term()
        }
end
