# File generated from our OpenAPI spec
defmodule Stripe.Resources.IssuingCardConfig do
  @moduledoc """
  ConnectEmbeddedIssuingCardConfigClaim
  """

  @typedoc """
  * `enabled` - Whether the embedded component is enabled.
  * `features` - Expandable.
  """
  @type t :: %__MODULE__{
          enabled: boolean(),
          features: Stripe.Resources.IssuingCardFeatures.t()
        }

  defstruct [:enabled, :features]

  @object_name "connect_embedded_issuing_card_config_claim"
  def object_name, do: @object_name

  def expandable_fields, do: ["features"]

  def __nested_fields__ do
    %{
      "features" => {:resource, Stripe.Resources.IssuingCardFeatures}
    }
  end
end
