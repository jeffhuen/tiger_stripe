# File generated from our OpenAPI spec
defmodule Stripe.Resources.DisputesListConfig do
  @moduledoc """
  ConnectEmbeddedDisputesListConfig
  """

  @typedoc """
  * `enabled` - Whether the embedded component is enabled.
  * `features` - Expandable.
  """
  @type t :: %__MODULE__{}

  defstruct [:enabled, :features]

  @object_name "connect_embedded_disputes_list_config"
  def object_name, do: @object_name

  def expandable_fields, do: ["features"]

  def __nested_fields__ do
    %{
      "features" => {:resource, Stripe.Resources.DisputesListFeatures}
    }
  end
end
