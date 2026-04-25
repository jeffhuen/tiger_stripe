# File generated from our OpenAPI spec
defmodule Stripe.Resources.Custom do
  @moduledoc """
  payment_method_custom
  """

  @typedoc """
  * `display_name` - Display name of the Dashboard-only CustomPaymentMethodType. Max length: 5000. Nullable.
  * `logo` - Contains information about the Dashboard-only CustomPaymentMethodType logo. Nullable. Expandable.
  * `type` - ID of the Dashboard-only CustomPaymentMethodType. Not expandable. Max length: 5000.
  """
  @type t :: %__MODULE__{
          display_name: String.t(),
          logo: logo(),
          type: String.t()
        }

  defstruct [:display_name, :logo, :type]

  @object_name "payment_method_custom"
  def object_name, do: @object_name

  def expandable_fields, do: ["logo"]

  @typedoc """
  * `content_type` - Content type of the Dashboard-only CustomPaymentMethodType logo. Max length: 5000. Nullable.
  * `url` - URL of the Dashboard-only CustomPaymentMethodType logo. Max length: 5000.
  """
  @type logo :: %{
          optional(:content_type) => String.t() | nil,
          optional(:url) => String.t() | nil,
          optional(String.t()) => term()
        }

  def __nested_fields__ do
    %{
      "logo" => %{
        fields: %{
          "content_type" => :scalar,
          "url" => :scalar
        }
      }
    }
  end
end
