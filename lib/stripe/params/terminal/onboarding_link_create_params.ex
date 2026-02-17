# File generated from our OpenAPI spec
defmodule Stripe.Params.Terminal.OnboardingLinkCreateParams do
  @moduledoc "Parameters for onboarding link create."

  @typedoc """
  * `expand` - Specifies which fields in the response should be expanded.
  * `link_options` - Specific fields needed to generate the desired link type.
  * `link_type` - The type of link being generated. Possible values: `apple_terms_and_conditions`.
  * `on_behalf_of` - Stripe account ID to generate the link for. Max length: 5000.
  """
  @type t :: %__MODULE__{
          expand: [String.t()] | nil,
          link_options: __MODULE__.LinkOptions.t(),
          link_type: String.t(),
          on_behalf_of: String.t() | nil
        }

  defstruct [:expand, :link_options, :link_type, :on_behalf_of]

  defmodule LinkOptions do
    @moduledoc "Nested parameters."

    @typedoc """
    * `apple_terms_and_conditions` - The options associated with the Apple Terms and Conditions link type.
    """
    @type t :: %__MODULE__{
            apple_terms_and_conditions: __MODULE__.AppleTermsAndConditions.t() | nil
          }
    defstruct [:apple_terms_and_conditions]

    defmodule AppleTermsAndConditions do
      @moduledoc "Nested parameters."

      @typedoc """
      * `allow_relinking` - Whether the link should also support users relinking their Apple account.
      * `merchant_display_name` - The business name of the merchant accepting Apple's Terms and Conditions. Max length: 5000.
      """
      @type t :: %__MODULE__{
              allow_relinking: boolean() | nil,
              merchant_display_name: String.t() | nil
            }
      defstruct [:allow_relinking, :merchant_display_name]
    end
  end
end
