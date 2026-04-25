# File generated from our OpenAPI spec
defmodule Stripe.Params.TestHelpers.Terminal.ReaderPresentPaymentMethodParams do
  @moduledoc "Parameters for reader present payment method."

  @typedoc """
  * `amount_tip` - Simulated on-reader tip amount.
  * `card` - Simulated data for the card payment method.
  * `card_present` - Simulated data for the card_present payment method.
  * `expand` - Specifies which fields in the response should be expanded.
  * `interac_present` - Simulated data for the interac_present payment method.
  * `type` - Simulated payment type. Possible values: `card`, `card_present`, `interac_present`.
  """
  @type t :: %__MODULE__{
          amount_tip: integer() | nil,
          card: card() | nil,
          card_present: card_present() | nil,
          expand: [String.t()] | nil,
          interac_present: interac_present() | nil,
          type: String.t() | nil
        }

  defstruct [:amount_tip, :card, :card_present, :expand, :interac_present, :type]

  @typedoc """
  * `cvc` - Card security code. Max length: 5000.
  * `exp_month` - Two-digit number representing the card's expiration month.
  * `exp_year` - Two- or four-digit number representing the card's expiration year.
  * `number` - The card number, as a string without any separators. Max length: 5000.
  """
  @type card :: %{
          optional(:cvc) => String.t() | nil,
          optional(:exp_month) => integer() | nil,
          optional(:exp_year) => integer() | nil,
          optional(:number) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `number` - The card number, as a string without any separators. Max length: 5000.
  """
  @type card_present :: %{
          optional(:number) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `number` - The Interac card number. Max length: 5000.
  """
  @type interac_present :: %{
          optional(:number) => String.t() | nil,
          optional(String.t()) => term()
        }
end
