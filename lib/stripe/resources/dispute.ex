# File generated from our OpenAPI spec
defmodule Stripe.Resources.Dispute do
  @moduledoc """
  Dispute

  A dispute occurs when a customer questions your charge with their card issuer.
  When this happens, you have the opportunity to respond to the dispute with
  evidence that shows that the charge is legitimate.

  Related guide: [Disputes and fraud](https://docs.stripe.com/disputes)
  """

  @typedoc """
  * `amount` - Disputed amount. Usually the amount of the charge, but it can differ (usually because of currency fluctuation or because only part of the order is disputed).
  * `balance_transactions` - List of zero, one, or two balance transactions that show funds withdrawn and reinstated to your Stripe account as a result of this dispute. Expandable.
  * `charge` - ID of the charge that's disputed. Expandable.
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `enhanced_eligibility_types` - List of eligibility types that are included in `enhanced_evidence`.
  * `evidence` - Expandable.
  * `evidence_details` - Expandable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `is_charge_refundable` - If true, it's still possible to refund the disputed payment. After the payment has been fully refunded, no further funds are withdrawn from your Stripe account as a result of this dispute.
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
  * `network_reason_code` - Network-dependent reason code for the dispute. Max length: 5000. Nullable.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `dispute`.
  * `payment_intent` - ID of the PaymentIntent that's disputed. Nullable. Expandable.
  * `payment_method_details` - Expandable.
  * `reason` - Reason given by cardholder for dispute. Possible values are `bank_cannot_process`, `check_returned`, `credit_not_processed`, `customer_initiated`, `debit_not_authorized`, `duplicate`, `fraudulent`, `general`, `incorrect_account_details`, `insufficient_funds`, `noncompliant`, `product_not_received`, `product_unacceptable`, `subscription_canceled`, or `unrecognized`. Learn more about [dispute reasons](https://docs.stripe.com/disputes/categories). Max length: 5000.
  * `status` - The current status of a dispute. Possible values include:`warning_needs_response`, `warning_under_review`, `warning_closed`, `needs_response`, `under_review`, `won`, `lost`, or `prevented`. Possible values: `lost`, `needs_response`, `prevented`, `under_review`, `warning_closed`, `warning_needs_response`, `warning_under_review`, `won`.
  """
  @type t :: %__MODULE__{
          amount: integer(),
          balance_transactions: [Stripe.Resources.BalanceTransaction.t()],
          charge: String.t() | Stripe.Resources.Charge.t(),
          created: integer(),
          currency: String.t(),
          enhanced_eligibility_types: [String.t()],
          evidence: __MODULE__.Evidence.t(),
          evidence_details: __MODULE__.EvidenceDetails.t(),
          id: String.t(),
          is_charge_refundable: boolean(),
          livemode: boolean(),
          metadata: %{String.t() => String.t()},
          network_reason_code: String.t() | nil,
          object: String.t(),
          payment_intent: String.t() | Stripe.Resources.PaymentIntent.t(),
          payment_method_details: __MODULE__.PaymentMethodDetails.t() | nil,
          reason: String.t(),
          status: String.t()
        }

  defstruct [
    :amount,
    :balance_transactions,
    :charge,
    :created,
    :currency,
    :enhanced_eligibility_types,
    :evidence,
    :evidence_details,
    :id,
    :is_charge_refundable,
    :livemode,
    :metadata,
    :network_reason_code,
    :object,
    :payment_intent,
    :payment_method_details,
    :reason,
    :status
  ]

  @object_name "dispute"
  def object_name, do: @object_name

  def expandable_fields,
    do: [
      "balance_transactions",
      "charge",
      "evidence",
      "evidence_details",
      "payment_intent",
      "payment_method_details"
    ]

  defmodule Evidence do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `access_activity_log` - Any server or activity logs showing proof that the customer accessed or downloaded the purchased digital product. This information should include IP addresses, corresponding timestamps, and any detailed recorded activity. Max length: 150000. Nullable.
    * `billing_address` - The billing address provided by the customer. Max length: 5000. Nullable.
    * `cancellation_policy` - (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Your subscription cancellation policy, as shown to the customer. Nullable.
    * `cancellation_policy_disclosure` - An explanation of how and when the customer was shown your refund policy prior to purchase. Max length: 150000. Nullable.
    * `cancellation_rebuttal` - A justification for why the customer's subscription was not canceled. Max length: 150000. Nullable.
    * `customer_communication` - (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Any communication with the customer that you feel is relevant to your case. Examples include emails proving that the customer received the product or service, or demonstrating their use of or satisfaction with the product or service. Nullable.
    * `customer_email_address` - The email address of the customer. Max length: 5000. Nullable.
    * `customer_name` - The name of the customer. Max length: 5000. Nullable.
    * `customer_purchase_ip` - The IP address that the customer used when making the purchase. Max length: 5000. Nullable.
    * `customer_signature` - (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) A relevant document or contract showing the customer's signature. Nullable.
    * `duplicate_charge_documentation` - (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Documentation for the prior charge that can uniquely identify the charge, such as a receipt, shipping label, work order, etc. This document should be paired with a similar document from the disputed payment that proves the two payments are separate. Nullable.
    * `duplicate_charge_explanation` - An explanation of the difference between the disputed charge versus the prior charge that appears to be a duplicate. Max length: 150000. Nullable.
    * `duplicate_charge_id` - The Stripe ID for the prior charge which appears to be a duplicate of the disputed charge. Max length: 5000. Nullable.
    * `enhanced_evidence`
    * `product_description` - A description of the product or service that was sold. Max length: 150000. Nullable.
    * `receipt` - (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Any receipt or message sent to the customer notifying them of the charge. Nullable.
    * `refund_policy` - (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Your refund policy, as shown to the customer. Nullable.
    * `refund_policy_disclosure` - Documentation demonstrating that the customer was shown your refund policy prior to purchase. Max length: 150000. Nullable.
    * `refund_refusal_explanation` - A justification for why the customer is not entitled to a refund. Max length: 150000. Nullable.
    * `service_date` - The date on which the customer received or began receiving the purchased service, in a clear human-readable format. Max length: 5000. Nullable.
    * `service_documentation` - (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Documentation showing proof that a service was provided to the customer. This could include a copy of a signed contract, work order, or other form of written agreement. Nullable.
    * `shipping_address` - The address to which a physical product was shipped. You should try to include as complete address information as possible. Max length: 5000. Nullable.
    * `shipping_carrier` - The delivery service that shipped a physical product, such as Fedex, UPS, USPS, etc. If multiple carriers were used for this purchase, please separate them with commas. Max length: 5000. Nullable.
    * `shipping_date` - The date on which a physical product began its route to the shipping address, in a clear human-readable format. Max length: 5000. Nullable.
    * `shipping_documentation` - (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Documentation showing proof that a product was shipped to the customer at the same address the customer provided to you. This could include a copy of the shipment receipt, shipping label, etc. It should show the customer's full shipping address, if possible. Nullable.
    * `shipping_tracking_number` - The tracking number for a physical product, obtained from the delivery service. If multiple tracking numbers were generated for this purchase, please separate them with commas. Max length: 5000. Nullable.
    * `uncategorized_file` - (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Any additional evidence or statements. Nullable.
    * `uncategorized_text` - Any additional evidence or statements. Max length: 150000. Nullable.
    """
    @type t :: %__MODULE__{
            access_activity_log: String.t() | nil,
            billing_address: String.t() | nil,
            cancellation_policy: String.t() | Stripe.Resources.File.t() | nil,
            cancellation_policy_disclosure: String.t() | nil,
            cancellation_rebuttal: String.t() | nil,
            customer_communication: String.t() | Stripe.Resources.File.t() | nil,
            customer_email_address: String.t() | nil,
            customer_name: String.t() | nil,
            customer_purchase_ip: String.t() | nil,
            customer_signature: String.t() | Stripe.Resources.File.t() | nil,
            duplicate_charge_documentation: String.t() | Stripe.Resources.File.t() | nil,
            duplicate_charge_explanation: String.t() | nil,
            duplicate_charge_id: String.t() | nil,
            enhanced_evidence: __MODULE__.EnhancedEvidence.t() | nil,
            product_description: String.t() | nil,
            receipt: String.t() | Stripe.Resources.File.t() | nil,
            refund_policy: String.t() | Stripe.Resources.File.t() | nil,
            refund_policy_disclosure: String.t() | nil,
            refund_refusal_explanation: String.t() | nil,
            service_date: String.t() | nil,
            service_documentation: String.t() | Stripe.Resources.File.t() | nil,
            shipping_address: String.t() | nil,
            shipping_carrier: String.t() | nil,
            shipping_date: String.t() | nil,
            shipping_documentation: String.t() | Stripe.Resources.File.t() | nil,
            shipping_tracking_number: String.t() | nil,
            uncategorized_file: String.t() | Stripe.Resources.File.t() | nil,
            uncategorized_text: String.t() | nil
          }
    defstruct [
      :access_activity_log,
      :billing_address,
      :cancellation_policy,
      :cancellation_policy_disclosure,
      :cancellation_rebuttal,
      :customer_communication,
      :customer_email_address,
      :customer_name,
      :customer_purchase_ip,
      :customer_signature,
      :duplicate_charge_documentation,
      :duplicate_charge_explanation,
      :duplicate_charge_id,
      :enhanced_evidence,
      :product_description,
      :receipt,
      :refund_policy,
      :refund_policy_disclosure,
      :refund_refusal_explanation,
      :service_date,
      :service_documentation,
      :shipping_address,
      :shipping_carrier,
      :shipping_date,
      :shipping_documentation,
      :shipping_tracking_number,
      :uncategorized_file,
      :uncategorized_text
    ]

    defmodule EnhancedEvidence do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `visa_compelling_evidence_3`
      * `visa_compliance`
      """
      @type t :: %__MODULE__{
              visa_compelling_evidence_3: __MODULE__.VisaCompellingEvidence3.t() | nil,
              visa_compliance: __MODULE__.VisaCompliance.t() | nil
            }
      defstruct [:visa_compelling_evidence_3, :visa_compliance]

      defmodule VisaCompellingEvidence3 do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `disputed_transaction` - Disputed transaction details for Visa Compelling Evidence 3.0 evidence submission. Nullable.
        * `prior_undisputed_transactions` - List of exactly two prior undisputed transaction objects for Visa Compelling Evidence 3.0 evidence submission.
        """
        @type t :: %__MODULE__{
                disputed_transaction: __MODULE__.DisputedTransaction.t() | nil,
                prior_undisputed_transactions: [__MODULE__.PriorUndisputedTransactions.t()] | nil
              }
        defstruct [:disputed_transaction, :prior_undisputed_transactions]

        defmodule DisputedTransaction do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `customer_account_id` - User Account ID used to log into business platform. Must be recognizable by the user. Max length: 5000. Nullable.
          * `customer_device_fingerprint` - Unique identifier of the cardholder’s device derived from a combination of at least two hardware and software attributes. Must be at least 20 characters. Max length: 5000. Nullable.
          * `customer_device_id` - Unique identifier of the cardholder’s device such as a device serial number (e.g., International Mobile Equipment Identity [IMEI]). Must be at least 15 characters. Max length: 5000. Nullable.
          * `customer_email_address` - The email address of the customer. Max length: 5000. Nullable.
          * `customer_purchase_ip` - The IP address that the customer used when making the purchase. Max length: 5000. Nullable.
          * `merchandise_or_services` - Categorization of disputed payment. Possible values: `merchandise`, `services`. Nullable.
          * `product_description` - A description of the product or service that was sold. Max length: 150000. Nullable.
          * `shipping_address` - The address to which a physical product was shipped. All fields are required for Visa Compelling Evidence 3.0 evidence submission. Nullable.
          """
          @type t :: %__MODULE__{
                  customer_account_id: String.t() | nil,
                  customer_device_fingerprint: String.t() | nil,
                  customer_device_id: String.t() | nil,
                  customer_email_address: String.t() | nil,
                  customer_purchase_ip: String.t() | nil,
                  merchandise_or_services: String.t() | nil,
                  product_description: String.t() | nil,
                  shipping_address: __MODULE__.ShippingAddress.t() | nil
                }
          defstruct [
            :customer_account_id,
            :customer_device_fingerprint,
            :customer_device_id,
            :customer_email_address,
            :customer_purchase_ip,
            :merchandise_or_services,
            :product_description,
            :shipping_address
          ]

          defmodule ShippingAddress do
            @moduledoc "Nested struct within the parent resource."

            @typedoc """
            * `city` - City, district, suburb, town, or village. Max length: 5000. Nullable.
            * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)). Max length: 5000. Nullable.
            * `line1` - Address line 1, such as the street, PO Box, or company name. Max length: 5000. Nullable.
            * `line2` - Address line 2, such as the apartment, suite, unit, or building. Max length: 5000. Nullable.
            * `postal_code` - ZIP or postal code. Max length: 5000. Nullable.
            * `state` - State, county, province, or region ([ISO 3166-2](https://en.wikipedia.org/wiki/ISO_3166-2)). Max length: 5000. Nullable.
            """
            @type t :: %__MODULE__{
                    city: String.t() | nil,
                    country: String.t() | nil,
                    line1: String.t() | nil,
                    line2: String.t() | nil,
                    postal_code: String.t() | nil,
                    state: String.t() | nil
                  }
            defstruct [:city, :country, :line1, :line2, :postal_code, :state]
          end

          def __inner_types__ do
            %{
              "shipping_address" => __MODULE__.ShippingAddress
            }
          end
        end

        defmodule PriorUndisputedTransactions do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `charge` - Stripe charge ID for the Visa Compelling Evidence 3.0 eligible prior charge. Max length: 5000.
          * `customer_account_id` - User Account ID used to log into business platform. Must be recognizable by the user. Max length: 5000. Nullable.
          * `customer_device_fingerprint` - Unique identifier of the cardholder’s device derived from a combination of at least two hardware and software attributes. Must be at least 20 characters. Max length: 5000. Nullable.
          * `customer_device_id` - Unique identifier of the cardholder’s device such as a device serial number (e.g., International Mobile Equipment Identity [IMEI]). Must be at least 15 characters. Max length: 5000. Nullable.
          * `customer_email_address` - The email address of the customer. Max length: 5000. Nullable.
          * `customer_purchase_ip` - The IP address that the customer used when making the purchase. Max length: 5000. Nullable.
          * `product_description` - A description of the product or service that was sold. Max length: 150000. Nullable.
          * `shipping_address` - The address to which a physical product was shipped. All fields are required for Visa Compelling Evidence 3.0 evidence submission. Nullable.
          """
          @type t :: %__MODULE__{
                  charge: String.t() | nil,
                  customer_account_id: String.t() | nil,
                  customer_device_fingerprint: String.t() | nil,
                  customer_device_id: String.t() | nil,
                  customer_email_address: String.t() | nil,
                  customer_purchase_ip: String.t() | nil,
                  product_description: String.t() | nil,
                  shipping_address: __MODULE__.ShippingAddress.t() | nil
                }
          defstruct [
            :charge,
            :customer_account_id,
            :customer_device_fingerprint,
            :customer_device_id,
            :customer_email_address,
            :customer_purchase_ip,
            :product_description,
            :shipping_address
          ]

          defmodule ShippingAddress do
            @moduledoc "Nested struct within the parent resource."

            @typedoc """
            * `city` - City, district, suburb, town, or village. Max length: 5000. Nullable.
            * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)). Max length: 5000. Nullable.
            * `line1` - Address line 1, such as the street, PO Box, or company name. Max length: 5000. Nullable.
            * `line2` - Address line 2, such as the apartment, suite, unit, or building. Max length: 5000. Nullable.
            * `postal_code` - ZIP or postal code. Max length: 5000. Nullable.
            * `state` - State, county, province, or region ([ISO 3166-2](https://en.wikipedia.org/wiki/ISO_3166-2)). Max length: 5000. Nullable.
            """
            @type t :: %__MODULE__{
                    city: String.t() | nil,
                    country: String.t() | nil,
                    line1: String.t() | nil,
                    line2: String.t() | nil,
                    postal_code: String.t() | nil,
                    state: String.t() | nil
                  }
            defstruct [:city, :country, :line1, :line2, :postal_code, :state]
          end

          def __inner_types__ do
            %{
              "shipping_address" => __MODULE__.ShippingAddress
            }
          end
        end

        def __inner_types__ do
          %{
            "disputed_transaction" => __MODULE__.DisputedTransaction,
            "prior_undisputed_transactions" => __MODULE__.PriorUndisputedTransactions
          }
        end
      end

      defmodule VisaCompliance do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `fee_acknowledged` - A field acknowledging the fee incurred when countering a Visa compliance dispute. If this field is set to true, evidence can be submitted for the compliance dispute. Stripe collects a 500 USD (or local equivalent) amount to cover the network costs associated with resolving compliance disputes. Stripe refunds the 500 USD network fee if you win the dispute.
        """
        @type t :: %__MODULE__{
                fee_acknowledged: boolean() | nil
              }
        defstruct [:fee_acknowledged]
      end

      def __inner_types__ do
        %{
          "visa_compelling_evidence_3" => __MODULE__.VisaCompellingEvidence3,
          "visa_compliance" => __MODULE__.VisaCompliance
        }
      end
    end

    def __inner_types__ do
      %{
        "enhanced_evidence" => __MODULE__.EnhancedEvidence
      }
    end
  end

  defmodule EvidenceDetails do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `due_by` - Date by which evidence must be submitted in order to successfully challenge dispute. Will be 0 if the customer's bank or credit card company doesn't allow a response for this particular dispute. Format: Unix timestamp. Nullable.
    * `enhanced_eligibility`
    * `has_evidence` - Whether evidence has been staged for this dispute.
    * `past_due` - Whether the last evidence submission was submitted past the due date. Defaults to `false` if no evidence submissions have occurred. If `true`, then delivery of the latest evidence is *not* guaranteed.
    * `submission_count` - The number of times evidence has been submitted. Typically, you may only submit evidence once.
    """
    @type t :: %__MODULE__{
            due_by: integer() | nil,
            enhanced_eligibility: __MODULE__.EnhancedEligibility.t() | nil,
            has_evidence: boolean() | nil,
            past_due: boolean() | nil,
            submission_count: integer() | nil
          }
    defstruct [:due_by, :enhanced_eligibility, :has_evidence, :past_due, :submission_count]

    defmodule EnhancedEligibility do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `visa_compelling_evidence_3`
      * `visa_compliance`
      """
      @type t :: %__MODULE__{
              visa_compelling_evidence_3: __MODULE__.VisaCompellingEvidence3.t() | nil,
              visa_compliance: __MODULE__.VisaCompliance.t() | nil
            }
      defstruct [:visa_compelling_evidence_3, :visa_compliance]

      defmodule VisaCompellingEvidence3 do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `required_actions` - List of actions required to qualify dispute for Visa Compelling Evidence 3.0 evidence submission.
        * `status` - Visa Compelling Evidence 3.0 eligibility status. Possible values: `not_qualified`, `qualified`, `requires_action`.
        """
        @type t :: %__MODULE__{
                required_actions: [String.t()] | nil,
                status: String.t() | nil
              }
        defstruct [:required_actions, :status]
      end

      defmodule VisaCompliance do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `status` - Visa compliance eligibility status. Possible values: `fee_acknowledged`, `requires_fee_acknowledgement`.
        """
        @type t :: %__MODULE__{
                status: String.t() | nil
              }
        defstruct [:status]
      end

      def __inner_types__ do
        %{
          "visa_compelling_evidence_3" => __MODULE__.VisaCompellingEvidence3,
          "visa_compliance" => __MODULE__.VisaCompliance
        }
      end
    end

    def __inner_types__ do
      %{
        "enhanced_eligibility" => __MODULE__.EnhancedEligibility
      }
    end
  end

  defmodule PaymentMethodDetails do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `amazon_pay`
    * `card`
    * `klarna`
    * `paypal`
    * `type` - Payment method type. Possible values: `amazon_pay`, `card`, `klarna`, `paypal`.
    """
    @type t :: %__MODULE__{
            amazon_pay: __MODULE__.AmazonPay.t() | nil,
            card: __MODULE__.Card.t() | nil,
            klarna: __MODULE__.Klarna.t() | nil,
            paypal: __MODULE__.Paypal.t() | nil,
            type: String.t() | nil
          }
    defstruct [:amazon_pay, :card, :klarna, :paypal, :type]

    defmodule AmazonPay do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `dispute_type` - The AmazonPay dispute type, chargeback or claim Possible values: `chargeback`, `claim`. Nullable.
      """
      @type t :: %__MODULE__{
              dispute_type: String.t() | nil
            }
      defstruct [:dispute_type]
    end

    defmodule Card do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `brand` - Card brand. Can be `amex`, `cartes_bancaires`, `diners`, `discover`, `eftpos_au`, `jcb`, `link`, `mastercard`, `unionpay`, `visa` or `unknown`. Max length: 5000.
      * `case_type` - The type of dispute opened. Different case types may have varying fees and financial impact. Possible values: `block`, `chargeback`, `compliance`, `inquiry`, `resolution`.
      * `network_reason_code` - The card network's specific dispute reason code, which maps to one of Stripe's primary dispute categories to simplify response guidance. The [Network code map](https://stripe.com/docs/disputes/categories#network-code-map) lists all available dispute reason codes by network. Max length: 5000. Nullable.
      """
      @type t :: %__MODULE__{
              brand: String.t() | nil,
              case_type: String.t() | nil,
              network_reason_code: String.t() | nil
            }
      defstruct [:brand, :case_type, :network_reason_code]
    end

    defmodule Klarna do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `chargeback_loss_reason_code` - Chargeback loss reason mapped by Stripe from Klarna's chargeback loss reason Max length: 5000.
      * `reason_code` - The reason for the dispute as defined by Klarna Max length: 5000. Nullable.
      """
      @type t :: %__MODULE__{
              chargeback_loss_reason_code: String.t() | nil,
              reason_code: String.t() | nil
            }
      defstruct [:chargeback_loss_reason_code, :reason_code]
    end

    defmodule Paypal do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `case_id` - The ID of the dispute in PayPal. Max length: 5000. Nullable.
      * `reason_code` - The reason for the dispute as defined by PayPal Max length: 5000. Nullable.
      """
      @type t :: %__MODULE__{
              case_id: String.t() | nil,
              reason_code: String.t() | nil
            }
      defstruct [:case_id, :reason_code]
    end

    def __inner_types__ do
      %{
        "amazon_pay" => __MODULE__.AmazonPay,
        "card" => __MODULE__.Card,
        "klarna" => __MODULE__.Klarna,
        "paypal" => __MODULE__.Paypal
      }
    end
  end

  def __inner_types__ do
    %{
      "evidence" => __MODULE__.Evidence,
      "evidence_details" => __MODULE__.EvidenceDetails,
      "payment_method_details" => __MODULE__.PaymentMethodDetails
    }
  end
end
