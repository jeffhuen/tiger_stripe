# File generated from our OpenAPI spec
defmodule Stripe.Resources.StripeError do
  @moduledoc """
  APIErrors
  """

  @typedoc """
  * `advice_code` - For card errors resulting from a card issuer decline, a short string indicating [how to proceed with an error](https://docs.stripe.com/declines#retrying-issuer-declines) if they provide one. Max length: 5000.
  * `charge` - For card errors, the ID of the failed charge. Max length: 5000.
  * `code` - For some errors that could be handled programmatically, a short string indicating the [error code](https://docs.stripe.com/error-codes) reported. Possible values: `account_closed`, `account_country_invalid_address`, `account_error_country_change_requires_additional_steps`, `account_information_mismatch`, `account_invalid`, `account_number_invalid`, `account_token_required_for_v2_account`, `acss_debit_session_incomplete`, `alipay_upgrade_required`, `amount_too_large`, `amount_too_small`, `api_key_expired`, `application_fees_not_allowed`, `authentication_required`, `balance_insufficient`, `balance_invalid_parameter`, `bank_account_bad_routing_numbers`, `bank_account_declined`, `bank_account_exists`, `bank_account_restricted`, `bank_account_unusable`, `bank_account_unverified`, `bank_account_verification_failed`, `billing_invalid_mandate`, `bitcoin_upgrade_required`, `capture_charge_authorization_expired`, `capture_unauthorized_payment`, `card_decline_rate_limit_exceeded`, `card_declined`, `cardholder_phone_number_required`, `charge_already_captured`, `charge_already_refunded`, `charge_disputed`, `charge_exceeds_source_limit`, `charge_exceeds_transaction_limit`, `charge_expired_for_capture`, `charge_invalid_parameter`, `charge_not_refundable`, `clearing_code_unsupported`, `country_code_invalid`, `country_unsupported`, `coupon_expired`, `customer_max_payment_methods`, `customer_max_subscriptions`, `customer_session_expired`, `customer_tax_location_invalid`, `debit_not_authorized`, `email_invalid`, `expired_card`, `financial_connections_account_inactive`, `financial_connections_account_pending_account_numbers`, `financial_connections_account_unavailable_account_numbers`, `financial_connections_no_successful_transaction_refresh`, `forwarding_api_inactive`, `forwarding_api_invalid_parameter`, `forwarding_api_retryable_upstream_error`, `forwarding_api_upstream_connection_error`, `forwarding_api_upstream_connection_timeout`, `forwarding_api_upstream_error`, `idempotency_key_in_use`, `incorrect_address`, `incorrect_cvc`, `incorrect_number`, `incorrect_zip`, `india_recurring_payment_mandate_canceled`, `instant_payouts_config_disabled`, `instant_payouts_currency_disabled`, `instant_payouts_limit_exceeded`, `instant_payouts_unsupported`, `insufficient_funds`, `intent_invalid_state`, `intent_verification_method_missing`, `invalid_card_type`, `invalid_characters`, `invalid_charge_amount`, `invalid_cvc`, `invalid_expiry_month`, `invalid_expiry_year`, `invalid_mandate_reference_prefix_format`, `invalid_number`, `invalid_source_usage`, `invalid_tax_location`, `invoice_no_customer_line_items`, `invoice_no_payment_method_types`, `invoice_no_subscription_line_items`, `invoice_not_editable`, `invoice_on_behalf_of_not_editable`, `invoice_payment_intent_requires_action`, `invoice_upcoming_none`, `livemode_mismatch`, `lock_timeout`, `missing`, `no_account`, `not_allowed_on_standard_account`, `out_of_inventory`, `ownership_declaration_not_allowed`, `parameter_invalid_empty`, `parameter_invalid_integer`, `parameter_invalid_string_blank`, `parameter_invalid_string_empty`, `parameter_missing`, `parameter_unknown`, `parameters_exclusive`, `payment_intent_action_required`, `payment_intent_authentication_failure`, `payment_intent_incompatible_payment_method`, `payment_intent_invalid_parameter`, `payment_intent_konbini_rejected_confirmation_number`, `payment_intent_mandate_invalid`, `payment_intent_payment_attempt_expired`, `payment_intent_payment_attempt_failed`, `payment_intent_rate_limit_exceeded`, `payment_intent_unexpected_state`, `payment_method_bank_account_already_verified`, `payment_method_bank_account_blocked`, `payment_method_billing_details_address_missing`, `payment_method_configuration_failures`, `payment_method_currency_mismatch`, `payment_method_customer_decline`, `payment_method_invalid_parameter`, `payment_method_invalid_parameter_testmode`, `payment_method_microdeposit_failed`, `payment_method_microdeposit_verification_amounts_invalid`, `payment_method_microdeposit_verification_amounts_mismatch`, `payment_method_microdeposit_verification_attempts_exceeded`, `payment_method_microdeposit_verification_descriptor_code_mismatch`, `payment_method_microdeposit_verification_timeout`, `payment_method_not_available`, `payment_method_provider_decline`, `payment_method_provider_timeout`, `payment_method_unactivated`, `payment_method_unexpected_state`, `payment_method_unsupported_type`, `payout_reconciliation_not_ready`, `payouts_limit_exceeded`, `payouts_not_allowed`, `platform_account_required`, `platform_api_key_expired`, `postal_code_invalid`, `processing_error`, `product_inactive`, `progressive_onboarding_limit_exceeded`, `rate_limit`, `refer_to_customer`, `refund_disputed_payment`, `request_blocked`, `resource_already_exists`, `resource_missing`, `return_intent_already_processed`, `routing_number_invalid`, `secret_key_required`, `sepa_unsupported_account`, `service_period_coupon_with_metered_tiered_item_unsupported`, `setup_attempt_failed`, `setup_intent_authentication_failure`, `setup_intent_invalid_parameter`, `setup_intent_mandate_invalid`, `setup_intent_mobile_wallet_unsupported`, `setup_intent_setup_attempt_expired`, `setup_intent_unexpected_state`, `shipping_address_invalid`, `shipping_calculation_failed`, `sku_inactive`, `state_unsupported`, `status_transition_invalid`, `storer_capability_missing`, `storer_capability_not_active`, `stripe_tax_inactive`, `tax_id_invalid`, `tax_id_prohibited`, `taxes_calculation_failed`, `terminal_location_country_unsupported`, `terminal_reader_busy`, `terminal_reader_hardware_fault`, `terminal_reader_invalid_location_for_activation`, `terminal_reader_invalid_location_for_payment`, `terminal_reader_offline`, `terminal_reader_timeout`, `testmode_charges_only`, `tls_version_unsupported`, `token_already_used`, `token_card_network_invalid`, `token_in_use`, `transfer_source_balance_parameters_mismatch`, `transfers_not_allowed`, `url_invalid`. Max length: 5000.
  * `decline_code` - For card errors resulting from a card issuer decline, a short string indicating the [card issuer's reason for the decline](https://docs.stripe.com/declines#issuer-declines) if they provide one. Max length: 5000.
  * `doc_url` - A URL to more information about the [error code](https://docs.stripe.com/error-codes) reported. Max length: 5000.
  * `message` - A human-readable message providing more details about the error. For card errors, these messages can be shown to your users. Max length: 40000.
  * `network_advice_code` - For card errors resulting from a card issuer decline, a 2 digit code which indicates the advice given to merchant by the card network on how to proceed with an error. Max length: 5000.
  * `network_decline_code` - For payments declined by the network, an alphanumeric code which indicates the reason the payment failed. Max length: 5000.
  * `param` - If the error is parameter-specific, the parameter related to the error. For example, you can use this to display a message near the correct form field. Max length: 5000.
  * `payment_intent` - Expandable.
  * `payment_method` - Expandable.
  * `payment_method_type` - If the error is specific to the type of payment method, the payment method type that had a problem. This field is only populated for invoice-related errors. Max length: 5000.
  * `request_log_url` - A URL to the request log entry in your dashboard. Max length: 5000.
  * `setup_intent` - Expandable.
  * `source` - Expandable.
  * `type` - The type of error returned. One of `api_error`, `card_error`, `idempotency_error`, or `invalid_request_error` Possible values: `api_error`, `card_error`, `idempotency_error`, `invalid_request_error`.
  """
  @type t :: %__MODULE__{
          advice_code: String.t() | nil,
          charge: String.t() | nil,
          code: String.t() | nil,
          decline_code: String.t() | nil,
          doc_url: String.t() | nil,
          message: String.t() | nil,
          network_advice_code: String.t() | nil,
          network_decline_code: String.t() | nil,
          param: String.t() | nil,
          payment_intent: Stripe.Resources.PaymentIntent.t() | nil,
          payment_method: Stripe.Resources.PaymentMethod.t() | nil,
          payment_method_type: String.t() | nil,
          request_log_url: String.t() | nil,
          setup_intent: Stripe.Resources.SetupIntent.t() | nil,
          source: Stripe.Resources.PaymentSource.t() | nil,
          type: String.t()
        }

  defstruct [
    :advice_code,
    :charge,
    :code,
    :decline_code,
    :doc_url,
    :message,
    :network_advice_code,
    :network_decline_code,
    :param,
    :payment_intent,
    :payment_method,
    :payment_method_type,
    :request_log_url,
    :setup_intent,
    :source,
    :type
  ]

  @object_name "api_errors"
  def object_name, do: @object_name

  def expandable_fields, do: ["payment_intent", "payment_method", "setup_intent", "source"]

  def __nested_fields__ do
    %{
      "payment_intent" => {:resource, Stripe.Resources.PaymentIntent},
      "payment_method" => {:resource, Stripe.Resources.PaymentMethod},
      "setup_intent" => {:resource, Stripe.Resources.SetupIntent},
      "source" => {:resource, Stripe.Resources.PaymentSource}
    }
  end
end
