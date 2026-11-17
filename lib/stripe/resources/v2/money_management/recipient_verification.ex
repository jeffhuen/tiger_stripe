# File generated from our OpenAPI spec
defmodule Stripe.Resources.V2.MoneyManagement.RecipientVerification do
  @moduledoc """
  Recipient Verification

  RecipientVerification represents a verification of recipient you intend to send funds to.
  """

  @typedoc """
  * `consumed_by` - The resource that consumed this verification.
  * `created` - Time at which the RecipientVerification was created.
  Represented as a RFC 3339 date & time UTC value in millisecond precision, for example: 2022-09-18T13:22:18.123Z. Format: date-time.
  * `expires_at` - Time at which the RecipientVerification expires, 5 minutes after the creation. Only applicable for Verification of Payee (VoP) verifications.
  Represented as a RFC 3339 date & time UTC value in millisecond precision, for example: 2022-09-18T13:22:18.123Z. Format: date-time.
  * `id` - The ID of the RecipientVerification.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `match_result` - Closed Enum. Match level of the RecipientVerification: `match`, `close_match`, `no_match`, `unavailable`. Possible values: `close_match`, `match`, `no_match`, `unavailable`.
  * `match_result_details` - Details for the match result.
  * `object` - String representing the object's type. Objects of the same type share the same value of the object field. Possible values: `v2.money_management.recipient_verification`.
  * `payout_method` - ID of the payout method that was verified.
  * `recipient` - ID of the recipient account. Omitted for same-entity payouts.
  * `status` - Current status of the recipient verification. Possible values: `acknowledged`, `awaiting_acknowledgement`, `consumed`, `expired`, `verified`.
  * `status_transitions` - Hash containing timestamps of when the object transitioned to a particular status.
  * `verification_type` - Open Enum. The type of verification performed: `verification_of_payee`, `confirmation_of_payee`. Possible values: `confirmation_of_payee`, `verification_of_payee`.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :consumed_by,
    :created,
    :expires_at,
    :id,
    :livemode,
    :match_result,
    :match_result_details,
    :object,
    :payout_method,
    :recipient,
    :status,
    :status_transitions,
    :verification_type
  ]

  @object_name "v2.money_management.recipient_verification"
  def object_name, do: @object_name

  def __nested_fields__ do
    %{
      "consumed_by" => %{
        fields: %{
          "outbound_payment" => :scalar,
          "type" => :scalar
        }
      },
      "match_result_details" => %{
        fields: %{
          "matched_business_type" => :scalar,
          "matched_name" => :scalar,
          "message" => :scalar,
          "provided_business_type" => :scalar,
          "provided_name" => :scalar
        }
      },
      "status_transitions" => %{
        fields: %{
          "acknowledged_at" => :scalar,
          "consumed_at" => :scalar
        }
      }
    }
  end
end
