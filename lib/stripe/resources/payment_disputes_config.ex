# File generated from our OpenAPI spec
defmodule Stripe.Resources.PaymentDisputesConfig do
  @moduledoc """
  ConnectEmbeddedPaymentDisputesConfig
  """

  @typedoc """
  * `enabled` - Whether the embedded component is enabled.
  * `features` - Expandable.
  """
  @type t :: %__MODULE__{
          enabled: boolean(),
          features: Stripe.Resources.PaymentDisputesFeatures.t()
        }

  defstruct [:enabled, :features]

  @object_name "connect_embedded_payment_disputes_config"
  def object_name, do: @object_name

  def expandable_fields, do: ["features"]

  def __nested_fields__ do
    %{
      "features" => {:resource, Stripe.Resources.PaymentDisputesFeatures}
    }
  end
end
