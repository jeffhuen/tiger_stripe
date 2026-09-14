# File generated from our OpenAPI spec
defmodule Stripe.Resources.Issuing.Card do
  @moduledoc """
  IssuingCard

  You can [create physical or virtual cards](https://docs.stripe.com/issuing) that are issued to cardholders.
  """

  @typedoc """
  * `brand` - The brand of the card. Max length: 5000.
  * `cancellation_reason` - The reason why the card was canceled. Possible values: `design_rejected`, `fulfillment_error`, `lost`, `stolen`. Nullable.
  * `cardholder` - Expandable.
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Supported currencies are `usd` in the US, `eur` in the EU, and `gbp` in the UK. Format: ISO 4217 currency code.
  * `cvc` - The card's CVC. For security reasons, this is only available for virtual cards, and will be omitted unless you explicitly request it with [the `expand` parameter](https://docs.stripe.com/api/expanding_objects). Additionally, it's only available via the ["Retrieve a card" endpoint](https://docs.stripe.com/api/issuing/cards/retrieve), not via "List all cards" or any other endpoint. Max length: 5000.
  * `exp_month` - The expiration month of the card.
  * `exp_year` - The expiration year of the card.
  * `financial_account` - The financial account this card is attached to. Max length: 5000. Nullable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `last4` - The last 4 digits of the card number. Max length: 5000.
  * `latest_fraud_warning` - Stripe’s assessment of whether this card’s details have been compromised. If this property isn't null, cancel and reissue the card to prevent fraudulent activity risk. Nullable. Expandable.
  * `lifecycle_controls` - Rules that control the lifecycle of this card, such as automatic cancellation. Refer to our [documentation](https://stripe.com/issuing/controls/lifecycle-controls) for more details. Nullable. Expandable.
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
  * `number` - The full unredacted card number. For security reasons, this is only available for virtual cards, and will be omitted unless you explicitly request it with [the `expand` parameter](https://docs.stripe.com/api/expanding_objects). Additionally, it's only available via the ["Retrieve a card" endpoint](https://docs.stripe.com/api/issuing/cards/retrieve), not via "List all cards" or any other endpoint. Max length: 5000.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `issuing.card`.
  * `personalization_design` - The personalization design object belonging to this card. Nullable. Expandable.
  * `replaced_by` - The latest card that replaces this card, if any. Nullable. Expandable.
  * `replacement_for` - The card this card replaces, if any. Nullable. Expandable.
  * `replacement_reason` - The reason why the previous card needed to be replaced. Possible values: `damaged`, `expired`, `fulfillment_error`, `lost`, `stolen`. Nullable.
  * `second_line` - Text separate from cardholder name, printed on the card. Max length: 5000. Nullable.
  * `shipping` - Where and how the card will be shipped. Nullable. Expandable.
  * `spending_controls` - Expandable.
  * `status` - Whether authorizations can be approved on this card. May be blocked from activating cards depending on past-due Cardholder requirements. Defaults to `inactive`. Possible values: `active`, `canceled`, `inactive`.
  * `type` - The type of the card. Possible values: `physical`, `virtual`.
  * `wallets` - Information relating to digital wallets (like Apple Pay and Google Pay). Nullable. Expandable.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :brand,
    :cancellation_reason,
    :cardholder,
    :created,
    :currency,
    :cvc,
    :exp_month,
    :exp_year,
    :financial_account,
    :id,
    :last4,
    :latest_fraud_warning,
    :lifecycle_controls,
    :livemode,
    :metadata,
    :number,
    :object,
    :personalization_design,
    :replaced_by,
    :replacement_for,
    :replacement_reason,
    :second_line,
    :shipping,
    :spending_controls,
    :status,
    :type,
    :wallets
  ]

  @object_name "issuing.card"
  def object_name, do: @object_name

  def expandable_fields,
    do: [
      "cardholder",
      "latest_fraud_warning",
      "lifecycle_controls",
      "personalization_design",
      "replaced_by",
      "replacement_for",
      "shipping",
      "spending_controls",
      "wallets"
    ]

  def __nested_fields__ do
    %{
      "latest_fraud_warning" => %{
        fields: %{
          "started_at" => :scalar,
          "type" => :scalar
        }
      },
      "lifecycle_controls" => %{
        fields: %{
          "cancel_after" => %{
            fields: %{
              "payment_count" => :scalar
            }
          }
        }
      },
      "shipping" => %{
        fields: %{
          "address" => {:resource, Stripe.Resources.Address},
          "address_validation" => %{
            fields: %{
              "mode" => :scalar,
              "normalized_address" => {:resource, Stripe.Resources.Address},
              "result" => :scalar
            }
          },
          "business_name" => :scalar,
          "carrier" => :scalar,
          "customs" => %{
            fields: %{
              "eori_number" => :scalar
            }
          },
          "eta" => :scalar,
          "name" => :scalar,
          "phone_number" => :scalar,
          "require_signature" => :scalar,
          "service" => :scalar,
          "status" => :scalar,
          "tracking_number" => :scalar,
          "tracking_url" => :scalar,
          "type" => :scalar
        }
      },
      "spending_controls" => %{
        fields: %{
          "allowed_card_presences" => {:list, :scalar},
          "allowed_categories" => {:list, :scalar},
          "allowed_merchant_countries" => {:list, :scalar},
          "blocked_card_presences" => {:list, :scalar},
          "blocked_categories" => {:list, :scalar},
          "blocked_merchant_countries" => {:list, :scalar},
          "spending_limits" =>
            {:list,
             %{
               fields: %{
                 "amount" => :scalar,
                 "categories" => {:list, :scalar},
                 "interval" => :scalar
               }
             }},
          "spending_limits_currency" => :scalar
        }
      },
      "wallets" => %{
        fields: %{
          "apple_pay" => %{
            fields: %{
              "eligible" => :scalar,
              "ineligible_reason" => :scalar
            }
          },
          "google_pay" => %{
            fields: %{
              "eligible" => :scalar,
              "ineligible_reason" => :scalar
            }
          },
          "primary_account_identifier" => :scalar
        }
      },
      "cardholder" => {:resource, Stripe.Resources.Issuing.Cardholder}
    }
  end
end
