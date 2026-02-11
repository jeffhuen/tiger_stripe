# File generated from our OpenAPI spec
defmodule Stripe.Resources.Event do
  @moduledoc """
  NotificationEvent

  Snapshot events allow you to track and react to activity in your Stripe integration. When
  the state of another API resource changes, Stripe creates an `Event` object that contains
  all the relevant information associated with that action, including the affected API
  resource. For example, a successful payment triggers a `charge.succeeded` event, which
  contains the `Charge` in the event's data property. Some actions trigger multiple events.
  For example, if you create a new subscription for a customer, it triggers both a
  `customer.subscription.created` event and a `charge.succeeded` event.

  Configure an event destination in your account to listen for events that represent actions
  your integration needs to respond to. Additionally, you can retrieve an individual event or
  a list of events from the API.

  [Connect](https://docs.stripe.com/connect) platforms can also receive event notifications
  that occur in their connected accounts. These events include an account attribute that
  identifies the relevant connected account.

  You can access events through the [Retrieve Event API](https://docs.stripe.com/api/events#retrieve_event)
  for 30 days.
  """

  @typedoc """
  * `account` - The connected account that originates the event. Max length: 5000.
  * `api_version` - The Stripe API version used to render `data` when the event was created. The contents of `data` never change, so this value remains static regardless of the API version currently in use. This property is populated only for events created on or after October 31, 2014. Max length: 5000. Nullable.
  * `context` - Authentication context needed to fetch the event or related object. Max length: 5000.
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `data` - Expandable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `event`.
  * `pending_webhooks` - Number of webhooks that haven't been successfully delivered (for example, to return a 20x response) to the URLs you specify.
  * `request` - Information on the API request that triggers the event. Nullable. Expandable.
  * `type` - Description of the event (for example, `invoice.created` or `charge.refunded`). Possible values: `account.application.authorized`, `account.application.deauthorized`, `account.external_account.created`, `account.external_account.deleted`, `account.external_account.updated`, `account.updated`, `application_fee.created`, `application_fee.refund.updated`, `application_fee.refunded`, `balance.available`, `balance_settings.updated`, `billing.alert.triggered`, `billing_portal.configuration.created`, `billing_portal.configuration.updated`, `billing_portal.session.created`, `capability.updated`, `cash_balance.funds_available`, `charge.captured`, `charge.dispute.closed`, `charge.dispute.created`, `charge.dispute.funds_reinstated`, `charge.dispute.funds_withdrawn`, `charge.dispute.updated`, `charge.expired`, `charge.failed`, `charge.pending`, `charge.refund.updated`, `charge.refunded`, `charge.succeeded`, `charge.updated`, `checkout.session.async_payment_failed`, `checkout.session.async_payment_succeeded`, `checkout.session.completed`, `checkout.session.expired`, `climate.order.canceled`, `climate.order.created`, `climate.order.delayed`, `climate.order.delivered`, `climate.order.product_substituted`, `climate.product.created`, `climate.product.pricing_updated`, `coupon.created`, `coupon.deleted`, `coupon.updated`, `credit_note.created`, `credit_note.updated`, `credit_note.voided`, `customer.created`, `customer.deleted`, `customer.discount.created`, `customer.discount.deleted`, `customer.discount.updated`, `customer.source.created`, `customer.source.deleted`, `customer.source.expiring`, `customer.source.updated`, `customer.subscription.created`, `customer.subscription.deleted`, `customer.subscription.paused`, `customer.subscription.pending_update_applied`, `customer.subscription.pending_update_expired`, `customer.subscription.resumed`, `customer.subscription.trial_will_end`, `customer.subscription.updated`, `customer.tax_id.created`, `customer.tax_id.deleted`, `customer.tax_id.updated`, `customer.updated`, `customer_cash_balance_transaction.created`, `entitlements.active_entitlement_summary.updated`, `file.created`, `financial_connections.account.account_numbers_updated`, `financial_connections.account.created`, `financial_connections.account.deactivated`, `financial_connections.account.disconnected`, `financial_connections.account.reactivated`, `financial_connections.account.refreshed_balance`, `financial_connections.account.refreshed_ownership`, `financial_connections.account.refreshed_transactions`, `financial_connections.account.upcoming_account_number_expiry`, `identity.verification_session.canceled`, `identity.verification_session.created`, `identity.verification_session.processing`, `identity.verification_session.redacted`, `identity.verification_session.requires_input`, `identity.verification_session.verified`, `invoice.created`, `invoice.deleted`, `invoice.finalization_failed`, `invoice.finalized`, `invoice.marked_uncollectible`, `invoice.overdue`, `invoice.overpaid`, `invoice.paid`, `invoice.payment_action_required`, `invoice.payment_attempt_required`, `invoice.payment_failed`, `invoice.payment_succeeded`, `invoice.sent`, `invoice.upcoming`, `invoice.updated`, `invoice.voided`, `invoice.will_be_due`, `invoice_payment.paid`, `invoiceitem.created`, `invoiceitem.deleted`, `issuing_authorization.created`, `issuing_authorization.request`, `issuing_authorization.updated`, `issuing_card.created`, `issuing_card.updated`, `issuing_cardholder.created`, `issuing_cardholder.updated`, `issuing_dispute.closed`, `issuing_dispute.created`, `issuing_dispute.funds_reinstated`, `issuing_dispute.funds_rescinded`, `issuing_dispute.submitted`, `issuing_dispute.updated`, `issuing_personalization_design.activated`, `issuing_personalization_design.deactivated`, `issuing_personalization_design.rejected`, `issuing_personalization_design.updated`, `issuing_token.created`, `issuing_token.updated`, `issuing_transaction.created`, `issuing_transaction.purchase_details_receipt_updated`, `issuing_transaction.updated`, `mandate.updated`, `payment_intent.amount_capturable_updated`, `payment_intent.canceled`, `payment_intent.created`, `payment_intent.partially_funded`, `payment_intent.payment_failed`, `payment_intent.processing`, `payment_intent.requires_action`, `payment_intent.succeeded`, `payment_link.created`, `payment_link.updated`, `payment_method.attached`, `payment_method.automatically_updated`, `payment_method.detached`, `payment_method.updated`, `payout.canceled`, `payout.created`, `payout.failed`, `payout.paid`, `payout.reconciliation_completed`, `payout.updated`, `person.created`, `person.deleted`, `person.updated`, `plan.created`, `plan.deleted`, `plan.updated`, `price.created`, `price.deleted`, `price.updated`, `product.created`, `product.deleted`, `product.updated`, `promotion_code.created`, `promotion_code.updated`, `quote.accepted`, `quote.canceled`, `quote.created`, `quote.finalized`, `radar.early_fraud_warning.created`, `radar.early_fraud_warning.updated`, `refund.created`, `refund.failed`, `refund.updated`, `reporting.report_run.failed`, `reporting.report_run.succeeded`, `reporting.report_type.updated`, `review.closed`, `review.opened`, `setup_intent.canceled`, `setup_intent.created`, `setup_intent.requires_action`, `setup_intent.setup_failed`, `setup_intent.succeeded`, `sigma.scheduled_query_run.created`, `source.canceled`, `source.chargeable`, `source.failed`, `source.mandate_notification`, `source.refund_attributes_required`, `source.transaction.created`, `source.transaction.updated`, `subscription_schedule.aborted`, `subscription_schedule.canceled`, `subscription_schedule.completed`, `subscription_schedule.created`, `subscription_schedule.expiring`, `subscription_schedule.released`, `subscription_schedule.updated`, `tax.settings.updated`, `tax_rate.created`, `tax_rate.updated`, `terminal.reader.action_failed`, `terminal.reader.action_succeeded`, `terminal.reader.action_updated`, `test_helpers.test_clock.advancing`, `test_helpers.test_clock.created`, `test_helpers.test_clock.deleted`, `test_helpers.test_clock.internal_failure`, `test_helpers.test_clock.ready`, `topup.canceled`, `topup.created`, `topup.failed`, `topup.reversed`, `topup.succeeded`, `transfer.created`, `transfer.reversed`, `transfer.updated`, `treasury.credit_reversal.created`, `treasury.credit_reversal.posted`, `treasury.debit_reversal.completed`, `treasury.debit_reversal.created`, `treasury.debit_reversal.initial_credit_granted`, `treasury.financial_account.closed`, `treasury.financial_account.created`, `treasury.financial_account.features_status_updated`, `treasury.inbound_transfer.canceled`, `treasury.inbound_transfer.created`, `treasury.inbound_transfer.failed`, `treasury.inbound_transfer.succeeded`, `treasury.outbound_payment.canceled`, `treasury.outbound_payment.created`, `treasury.outbound_payment.expected_arrival_date_updated`, `treasury.outbound_payment.failed`, `treasury.outbound_payment.posted`, `treasury.outbound_payment.returned`, `treasury.outbound_payment.tracking_details_updated`, `treasury.outbound_transfer.canceled`, `treasury.outbound_transfer.created`, `treasury.outbound_transfer.expected_arrival_date_updated`, `treasury.outbound_transfer.failed`, `treasury.outbound_transfer.posted`, `treasury.outbound_transfer.returned`, `treasury.outbound_transfer.tracking_details_updated`, `treasury.received_credit.created`, `treasury.received_credit.failed`, `treasury.received_credit.succeeded`, `treasury.received_debit.created`. Max length: 5000.
  """
  @type t :: %__MODULE__{
          account: String.t() | nil,
          api_version: String.t(),
          context: String.t() | nil,
          created: integer(),
          data: String.t() | map(),
          id: String.t(),
          livemode: boolean(),
          object: String.t(),
          pending_webhooks: integer(),
          request: map(),
          type: String.t()
        }

  defstruct [
    :account,
    :api_version,
    :context,
    :created,
    :data,
    :id,
    :livemode,
    :object,
    :pending_webhooks,
    :request,
    :type
  ]

  @object_name "event"
  def object_name, do: @object_name

  def expandable_fields, do: ["data", "request"]

  def __inner_types__ do
    %{
      "data" => Stripe.Resources.EventData
    }
  end
end
