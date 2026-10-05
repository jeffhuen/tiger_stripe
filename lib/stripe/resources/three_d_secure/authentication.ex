# File generated from our OpenAPI spec
defmodule Stripe.Resources.ThreeDSecure.Authentication do
  @moduledoc """
  3DS Authentication

  The Standalone 3DS API allows you to run EMV 3D Secure (3DS) authentication using Stripe while authorizing the payment with any PSP.

  Related guide: [Standalone 3DS](https://stripe.com/payments/3d-secure/standalone-3d-secure)
  """

  @typedoc """
  * `acquirer_details` - Expandable.
  * `amount` - The amount for this 3DS Authentication.
  * `challenge_url` - The URL for presenting a challenge to your cardholder, present if status is requires_challenge. Max length: 5000.
  * `channel` - Expandable.
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `directory_server` - The 3DS directory server with which this 3DS Authentication was processed. Possible values: `american_express`, `cartes_bancaires`, `discover`, `mastercard`, `visa`.
  * `fingerprinting_url` - The URL for performing issuer fingerprinting, present if fingerprinting is supported for the given payment method. Max length: 5000.
  * `flow_preference` - Expandable.
  * `future_usage` - Expandable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `message_category` - Indicates whether this 3DS Authentication is being performed for a payment or non-payment use case. Possible values: `non_payment_authentication`, `payment_authentication`.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Nullable.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `three_d_secure.authentication`.
  * `outcome` - The outcome of this 3DS Authentication. Possible values: `abandoned`, `attempt_acknowledged`, `authenticated`, `canceled`, `denied`, `informational`, `internal_error`, `not_supported`, `not_triggered`, `processing_error`, `rejected`.
  * `outcome_details` - Expandable.
  * `payment_method` - ID of the payment method (a PaymentMethod object) to attach to this 3DS Authentication. Expandable.
  * `reason` - The reason for invoking this 3DS Authentication. Possible values: `cardholder_authentication`, `issuer_requested`, `liability_shift`, `processing_costs`, `regulatory_compliance`.
  * `shipping_address` - Expandable.
  * `status` - Status of this Authentication. Possible values: `canceled`, `error`, `failed`, `requires_challenge`, `requires_submission`, `succeeded`.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :acquirer_details,
    :amount,
    :challenge_url,
    :channel,
    :created,
    :currency,
    :directory_server,
    :fingerprinting_url,
    :flow_preference,
    :future_usage,
    :id,
    :livemode,
    :message_category,
    :metadata,
    :object,
    :outcome,
    :outcome_details,
    :payment_method,
    :reason,
    :shipping_address,
    :status
  ]

  @object_name "three_d_secure.authentication"
  def object_name, do: @object_name

  def expandable_fields,
    do: [
      "acquirer_details",
      "channel",
      "flow_preference",
      "future_usage",
      "outcome_details",
      "payment_method",
      "shipping_address"
    ]

  def __nested_fields__ do
    %{
      "acquirer_details" => %{
        fields: %{
          "acquirer_bin" => :scalar,
          "acquirer_country" => :scalar,
          "acquirer_merchant_id" => :scalar,
          "mcc" => :scalar,
          "merchant_name" => :scalar,
          "requestor_id" => :scalar
        }
      },
      "channel" => %{
        fields: %{
          "browser" => %{
            fields: %{
              "accept_header" => :scalar,
              "color_depth" => :scalar,
              "ip_address" => :scalar,
              "java_enabled" => :scalar,
              "javascript_enabled" => :scalar,
              "language" => :scalar,
              "screen_height" => :scalar,
              "screen_width" => :scalar,
              "timezone_offset" => :scalar,
              "user_agent" => :scalar
            }
          },
          "three_r_i" => %{
            fields: %{
              "previous_authentication" => :scalar,
              "type" => :scalar
            }
          },
          "type" => :scalar
        }
      },
      "flow_preference" => %{
        fields: %{
          "challenge" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "data_share" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "frictionless" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "type" => :scalar
        }
      },
      "future_usage" => %{
        fields: %{
          "installment" => %{
            fields: %{
              "amount" => :scalar,
              "expiry" => %{
                fields: %{
                  "date" => :scalar,
                  "type" => :scalar
                }
              },
              "interval" => :scalar,
              "interval_count" => :scalar,
              "number" => :scalar
            }
          },
          "recurring" => %{
            fields: %{
              "amount" => :scalar,
              "expiry" => %{
                fields: %{
                  "date" => :scalar,
                  "type" => :scalar
                }
              },
              "interval" => :scalar,
              "interval_count" => :scalar
            }
          },
          "type" => :scalar
        }
      },
      "outcome_details" => %{
        fields: %{
          "acs_transaction_id" => :scalar,
          "ares" => :scalar,
          "ares_trans_status" => :scalar,
          "cryptogram" => :scalar,
          "ds_transaction_id" => :scalar,
          "eci" => :scalar,
          "network_details" => %{
            fields: %{
              "cartes_bancaires" => %{
                fields: %{
                  "avalgo" => :scalar,
                  "cb_exemption" => :scalar,
                  "cb_score" => :scalar
                }
              }
            }
          },
          "protocol_version" => :scalar,
          "requestor_challenge_indicator" => :scalar,
          "rreq" => :scalar,
          "rreq_trans_status" => :scalar,
          "three_ds_server_transaction_id" => :scalar
        }
      },
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
  end
end
