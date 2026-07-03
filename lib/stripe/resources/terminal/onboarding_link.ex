# File generated from our OpenAPI spec
defmodule Stripe.Resources.Terminal.OnboardingLink do
  @moduledoc """
  TerminalOnboardingLinkOnboardingLink

  Returns redirect links used for onboarding onto Tap to Pay on iPhone.
  """

  @typedoc """
  * `link_options` - Expandable.
  * `link_type` - The type of link being generated. Possible values: `apple_terms_and_conditions`.
  * `object` - Possible values: `terminal.onboarding_link`.
  * `on_behalf_of` - Stripe account ID to generate the link for. Max length: 5000. Nullable.
  * `redirect_url` - The link passed back to the user for their onboarding. Max length: 5000.
  """
  @type t :: %__MODULE__{}

  defstruct [:link_options, :link_type, :object, :on_behalf_of, :redirect_url]

  @object_name "terminal.onboarding_link"
  def object_name, do: @object_name

  def expandable_fields, do: ["link_options"]

  def __nested_fields__ do
    %{
      "link_options" => %{
        fields: %{
          "apple_terms_and_conditions" => %{
            fields: %{
              "allow_relinking" => :scalar,
              "merchant_display_name" => :scalar
            }
          }
        }
      }
    }
  end
end
