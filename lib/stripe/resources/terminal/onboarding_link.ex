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
  @type t :: %__MODULE__{
          link_options: link_options(),
          link_type: String.t(),
          object: String.t(),
          on_behalf_of: String.t(),
          redirect_url: String.t()
        }

  defstruct [:link_options, :link_type, :object, :on_behalf_of, :redirect_url]

  @object_name "terminal.onboarding_link"
  def object_name, do: @object_name

  def expandable_fields, do: ["link_options"]

  @typedoc """
  * `apple_terms_and_conditions` - The options associated with the Apple Terms and Conditions link type. Nullable.
  """
  @type link_options :: %{
          optional(:apple_terms_and_conditions) =>
            link_options_apple_terms_and_conditions() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `allow_relinking` - Whether the link should also support users relinking their Apple account. Nullable.
  * `merchant_display_name` - The business name of the merchant accepting Apple's Terms and Conditions. Max length: 5000.
  """
  @type link_options_apple_terms_and_conditions :: %{
          optional(:allow_relinking) => boolean() | nil,
          optional(:merchant_display_name) => String.t() | nil,
          optional(String.t()) => term()
        }

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
