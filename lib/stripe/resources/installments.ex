# File generated from our OpenAPI spec
defmodule Stripe.Resources.Installments do
  @moduledoc """
  PaymentFlowsInstallmentOptions
  """

  @typedoc """
  * `enabled`
  * `plan` - Expandable.
  """
  @type t :: %__MODULE__{
          enabled: boolean(),
          plan: plan() | nil
        }

  defstruct [:enabled, :plan]

  @object_name "payment_flows_installment_options"
  def object_name, do: @object_name

  def expandable_fields, do: ["plan"]

  @typedoc """
  * `count` - For `fixed_count` installment plans, this is the number of installment payments your customer will make to their credit card. Nullable.
  * `interval` - For `fixed_count` installment plans, this is the interval between installment payments your customer will make to their credit card.
  One of `month`. Possible values: `month`. Nullable.
  * `type` - Type of installment plan, one of `fixed_count`, `bonus`, or `revolving`. Possible values: `bonus`, `fixed_count`, `revolving`.
  """
  @type plan :: %{
          optional(:count) => integer() | nil,
          optional(:interval) => String.t() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  def __nested_fields__ do
    %{
      "plan" => %{
        fields: %{
          "count" => :scalar,
          "interval" => :scalar,
          "type" => :scalar
        }
      }
    }
  end
end
