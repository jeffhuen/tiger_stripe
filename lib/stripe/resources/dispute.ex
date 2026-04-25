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
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
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
          evidence: evidence(),
          evidence_details: evidence_details(),
          id: String.t(),
          is_charge_refundable: boolean(),
          livemode: boolean(),
          metadata: %{String.t() => String.t()},
          network_reason_code: String.t() | nil,
          object: String.t(),
          payment_intent: String.t() | Stripe.Resources.PaymentIntent.t(),
          payment_method_details: payment_method_details() | nil,
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
  @type evidence :: %{
          optional(:access_activity_log) => String.t() | nil,
          optional(:billing_address) => String.t() | nil,
          optional(:cancellation_policy) => String.t() | Stripe.Resources.File.t() | nil,
          optional(:cancellation_policy_disclosure) => String.t() | nil,
          optional(:cancellation_rebuttal) => String.t() | nil,
          optional(:customer_communication) => String.t() | Stripe.Resources.File.t() | nil,
          optional(:customer_email_address) => String.t() | nil,
          optional(:customer_name) => String.t() | nil,
          optional(:customer_purchase_ip) => String.t() | nil,
          optional(:customer_signature) => String.t() | Stripe.Resources.File.t() | nil,
          optional(:duplicate_charge_documentation) =>
            String.t() | Stripe.Resources.File.t() | nil,
          optional(:duplicate_charge_explanation) => String.t() | nil,
          optional(:duplicate_charge_id) => String.t() | nil,
          optional(:enhanced_evidence) => evidence_enhanced_evidence() | nil,
          optional(:product_description) => String.t() | nil,
          optional(:receipt) => String.t() | Stripe.Resources.File.t() | nil,
          optional(:refund_policy) => String.t() | Stripe.Resources.File.t() | nil,
          optional(:refund_policy_disclosure) => String.t() | nil,
          optional(:refund_refusal_explanation) => String.t() | nil,
          optional(:service_date) => String.t() | nil,
          optional(:service_documentation) => String.t() | Stripe.Resources.File.t() | nil,
          optional(:shipping_address) => String.t() | nil,
          optional(:shipping_carrier) => String.t() | nil,
          optional(:shipping_date) => String.t() | nil,
          optional(:shipping_documentation) => String.t() | Stripe.Resources.File.t() | nil,
          optional(:shipping_tracking_number) => String.t() | nil,
          optional(:uncategorized_file) => String.t() | Stripe.Resources.File.t() | nil,
          optional(:uncategorized_text) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `visa_compelling_evidence_3`
  * `visa_compliance`
  """
  @type evidence_enhanced_evidence :: %{
          optional(:visa_compelling_evidence_3) =>
            evidence_enhanced_evidence_visa_compelling_evidence_3() | nil,
          optional(:visa_compliance) => evidence_enhanced_evidence_visa_compliance() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `disputed_transaction` - Disputed transaction details for Visa Compelling Evidence 3.0 evidence submission. Nullable.
  * `prior_undisputed_transactions` - List of exactly two prior undisputed transaction objects for Visa Compelling Evidence 3.0 evidence submission.
  """
  @type evidence_enhanced_evidence_visa_compelling_evidence_3 :: %{
          optional(:disputed_transaction) =>
            evidence_enhanced_evidence_visa_compelling_evidence_3_disputed_transaction() | nil,
          optional(:prior_undisputed_transactions) =>
            [
              evidence_enhanced_evidence_visa_compelling_evidence_3_prior_undisputed_transactions()
            ]
            | nil,
          optional(String.t()) => term()
        }

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
  @type evidence_enhanced_evidence_visa_compelling_evidence_3_disputed_transaction :: %{
          optional(:customer_account_id) => String.t() | nil,
          optional(:customer_device_fingerprint) => String.t() | nil,
          optional(:customer_device_id) => String.t() | nil,
          optional(:customer_email_address) => String.t() | nil,
          optional(:customer_purchase_ip) => String.t() | nil,
          optional(:merchandise_or_services) => String.t() | nil,
          optional(:product_description) => String.t() | nil,
          optional(:shipping_address) =>
            evidence_enhanced_evidence_visa_compelling_evidence_3_disputed_transaction_shipping_address()
            | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `city` - City, district, suburb, town, or village. Max length: 5000. Nullable.
  * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)). Max length: 5000. Nullable.
  * `line1` - Address line 1, such as the street, PO Box, or company name. Max length: 5000. Nullable.
  * `line2` - Address line 2, such as the apartment, suite, unit, or building. Max length: 5000. Nullable.
  * `postal_code` - ZIP or postal code. Max length: 5000. Nullable.
  * `state` - State, county, province, or region ([ISO 3166-2](https://en.wikipedia.org/wiki/ISO_3166-2)). Max length: 5000. Nullable.
  """
  @type evidence_enhanced_evidence_visa_compelling_evidence_3_disputed_transaction_shipping_address ::
          %{
            optional(:city) => String.t() | nil,
            optional(:country) => String.t() | nil,
            optional(:line1) => String.t() | nil,
            optional(:line2) => String.t() | nil,
            optional(:postal_code) => String.t() | nil,
            optional(:state) => String.t() | nil,
            optional(String.t()) => term()
          }

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
  @type evidence_enhanced_evidence_visa_compelling_evidence_3_prior_undisputed_transactions :: %{
          optional(:charge) => String.t() | nil,
          optional(:customer_account_id) => String.t() | nil,
          optional(:customer_device_fingerprint) => String.t() | nil,
          optional(:customer_device_id) => String.t() | nil,
          optional(:customer_email_address) => String.t() | nil,
          optional(:customer_purchase_ip) => String.t() | nil,
          optional(:product_description) => String.t() | nil,
          optional(:shipping_address) =>
            evidence_enhanced_evidence_visa_compelling_evidence_3_prior_undisputed_transactions_shipping_address()
            | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `city` - City, district, suburb, town, or village. Max length: 5000. Nullable.
  * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)). Max length: 5000. Nullable.
  * `line1` - Address line 1, such as the street, PO Box, or company name. Max length: 5000. Nullable.
  * `line2` - Address line 2, such as the apartment, suite, unit, or building. Max length: 5000. Nullable.
  * `postal_code` - ZIP or postal code. Max length: 5000. Nullable.
  * `state` - State, county, province, or region ([ISO 3166-2](https://en.wikipedia.org/wiki/ISO_3166-2)). Max length: 5000. Nullable.
  """
  @type evidence_enhanced_evidence_visa_compelling_evidence_3_prior_undisputed_transactions_shipping_address ::
          %{
            optional(:city) => String.t() | nil,
            optional(:country) => String.t() | nil,
            optional(:line1) => String.t() | nil,
            optional(:line2) => String.t() | nil,
            optional(:postal_code) => String.t() | nil,
            optional(:state) => String.t() | nil,
            optional(String.t()) => term()
          }

  @typedoc """
  * `fee_acknowledged` - A field acknowledging the fee incurred when countering a Visa compliance dispute. If this field is set to true, evidence can be submitted for the compliance dispute. Stripe collects a 500 USD (or local equivalent) amount to cover the network costs associated with resolving compliance disputes. Stripe refunds the 500 USD network fee if you win the dispute.
  """
  @type evidence_enhanced_evidence_visa_compliance :: %{
          optional(:fee_acknowledged) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `due_by` - Date by which evidence must be submitted in order to successfully challenge dispute. Will be 0 if the customer's bank or credit card company doesn't allow a response for this particular dispute. Format: Unix timestamp. Nullable.
  * `enhanced_eligibility`
  * `has_evidence` - Whether evidence has been staged for this dispute.
  * `past_due` - Whether the last evidence submission was submitted past the due date. Defaults to `false` if no evidence submissions have occurred. If `true`, then delivery of the latest evidence is *not* guaranteed.
  * `submission_count` - The number of times evidence has been submitted. Typically, you may only submit evidence once.
  """
  @type evidence_details :: %{
          optional(:due_by) => integer() | nil,
          optional(:enhanced_eligibility) => evidence_details_enhanced_eligibility() | nil,
          optional(:has_evidence) => boolean() | nil,
          optional(:past_due) => boolean() | nil,
          optional(:submission_count) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `visa_compelling_evidence_3`
  * `visa_compliance`
  """
  @type evidence_details_enhanced_eligibility :: %{
          optional(:visa_compelling_evidence_3) =>
            evidence_details_enhanced_eligibility_visa_compelling_evidence_3() | nil,
          optional(:visa_compliance) =>
            evidence_details_enhanced_eligibility_visa_compliance() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `required_actions` - List of actions required to qualify dispute for Visa Compelling Evidence 3.0 evidence submission.
  * `status` - Visa Compelling Evidence 3.0 eligibility status. Possible values: `not_qualified`, `qualified`, `requires_action`.
  """
  @type evidence_details_enhanced_eligibility_visa_compelling_evidence_3 :: %{
          optional(:required_actions) => [String.t()] | nil,
          optional(:status) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `status` - Visa compliance eligibility status. Possible values: `fee_acknowledged`, `requires_fee_acknowledgement`.
  """
  @type evidence_details_enhanced_eligibility_visa_compliance :: %{
          optional(:status) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `amazon_pay`
  * `card`
  * `klarna`
  * `paypal`
  * `type` - Payment method type. Possible values: `amazon_pay`, `card`, `klarna`, `paypal`.
  """
  @type payment_method_details :: %{
          optional(:amazon_pay) => payment_method_details_amazon_pay() | nil,
          optional(:card) => payment_method_details_card() | nil,
          optional(:klarna) => payment_method_details_klarna() | nil,
          optional(:paypal) => payment_method_details_paypal() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `dispute_type` - The AmazonPay dispute type, chargeback or claim Possible values: `chargeback`, `claim`. Nullable.
  """
  @type payment_method_details_amazon_pay :: %{
          optional(:dispute_type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `brand` - Card brand. Can be `amex`, `cartes_bancaires`, `diners`, `discover`, `eftpos_au`, `jcb`, `link`, `mastercard`, `unionpay`, `visa` or `unknown`. Max length: 5000.
  * `case_type` - The type of dispute opened. Different case types may have varying fees and financial impact. Possible values: `block`, `chargeback`, `compliance`, `inquiry`, `resolution`.
  * `network_reason_code` - The card network's specific dispute reason code, which maps to one of Stripe's primary dispute categories to simplify response guidance. The [Network code map](https://stripe.com/docs/disputes/categories#network-code-map) lists all available dispute reason codes by network. Max length: 5000. Nullable.
  """
  @type payment_method_details_card :: %{
          optional(:brand) => String.t() | nil,
          optional(:case_type) => String.t() | nil,
          optional(:network_reason_code) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `chargeback_loss_reason_code` - Chargeback loss reason mapped by Stripe from Klarna's chargeback loss reason Max length: 5000.
  * `reason_code` - The reason for the dispute as defined by Klarna Max length: 5000. Nullable.
  """
  @type payment_method_details_klarna :: %{
          optional(:chargeback_loss_reason_code) => String.t() | nil,
          optional(:reason_code) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `case_id` - The ID of the dispute in PayPal. Max length: 5000. Nullable.
  * `reason_code` - The reason for the dispute as defined by PayPal Max length: 5000. Nullable.
  """
  @type payment_method_details_paypal :: %{
          optional(:case_id) => String.t() | nil,
          optional(:reason_code) => String.t() | nil,
          optional(String.t()) => term()
        }

  def __nested_fields__ do
    %{
      "evidence" => %{
        fields: %{
          "access_activity_log" => :scalar,
          "billing_address" => :scalar,
          "cancellation_policy" => {:resource, Stripe.Resources.File},
          "cancellation_policy_disclosure" => :scalar,
          "cancellation_rebuttal" => :scalar,
          "customer_communication" => {:resource, Stripe.Resources.File},
          "customer_email_address" => :scalar,
          "customer_name" => :scalar,
          "customer_purchase_ip" => :scalar,
          "customer_signature" => {:resource, Stripe.Resources.File},
          "duplicate_charge_documentation" => {:resource, Stripe.Resources.File},
          "duplicate_charge_explanation" => :scalar,
          "duplicate_charge_id" => :scalar,
          "enhanced_evidence" => %{
            fields: %{
              "visa_compelling_evidence_3" => %{
                fields: %{
                  "disputed_transaction" => %{
                    fields: %{
                      "customer_account_id" => :scalar,
                      "customer_device_fingerprint" => :scalar,
                      "customer_device_id" => :scalar,
                      "customer_email_address" => :scalar,
                      "customer_purchase_ip" => :scalar,
                      "merchandise_or_services" => :scalar,
                      "product_description" => :scalar,
                      "shipping_address" => %{
                        fields: %{
                          "city" => :scalar,
                          "country" => :scalar,
                          "line1" => :scalar,
                          "line2" => :scalar,
                          "postal_code" => :scalar,
                          "state" => :scalar
                        }
                      }
                    }
                  },
                  "prior_undisputed_transactions" =>
                    {:list,
                     %{
                       fields: %{
                         "charge" => :scalar,
                         "customer_account_id" => :scalar,
                         "customer_device_fingerprint" => :scalar,
                         "customer_device_id" => :scalar,
                         "customer_email_address" => :scalar,
                         "customer_purchase_ip" => :scalar,
                         "product_description" => :scalar,
                         "shipping_address" => %{
                           fields: %{
                             "city" => :scalar,
                             "country" => :scalar,
                             "line1" => :scalar,
                             "line2" => :scalar,
                             "postal_code" => :scalar,
                             "state" => :scalar
                           }
                         }
                       }
                     }}
                }
              },
              "visa_compliance" => %{
                fields: %{
                  "fee_acknowledged" => :scalar
                }
              }
            }
          },
          "product_description" => :scalar,
          "receipt" => {:resource, Stripe.Resources.File},
          "refund_policy" => {:resource, Stripe.Resources.File},
          "refund_policy_disclosure" => :scalar,
          "refund_refusal_explanation" => :scalar,
          "service_date" => :scalar,
          "service_documentation" => {:resource, Stripe.Resources.File},
          "shipping_address" => :scalar,
          "shipping_carrier" => :scalar,
          "shipping_date" => :scalar,
          "shipping_documentation" => {:resource, Stripe.Resources.File},
          "shipping_tracking_number" => :scalar,
          "uncategorized_file" => {:resource, Stripe.Resources.File},
          "uncategorized_text" => :scalar
        }
      },
      "evidence_details" => %{
        fields: %{
          "due_by" => :scalar,
          "enhanced_eligibility" => %{
            fields: %{
              "visa_compelling_evidence_3" => %{
                fields: %{
                  "required_actions" => {:list, :scalar},
                  "status" => :scalar
                }
              },
              "visa_compliance" => %{
                fields: %{
                  "status" => :scalar
                }
              }
            }
          },
          "has_evidence" => :scalar,
          "past_due" => :scalar,
          "submission_count" => :scalar
        }
      },
      "payment_method_details" => %{
        fields: %{
          "amazon_pay" => %{
            fields: %{
              "dispute_type" => :scalar
            }
          },
          "card" => %{
            fields: %{
              "brand" => :scalar,
              "case_type" => :scalar,
              "network_reason_code" => :scalar
            }
          },
          "klarna" => %{
            fields: %{
              "chargeback_loss_reason_code" => :scalar,
              "reason_code" => :scalar
            }
          },
          "paypal" => %{
            fields: %{
              "case_id" => :scalar,
              "reason_code" => :scalar
            }
          },
          "type" => :scalar
        }
      }
    }
  end
end
