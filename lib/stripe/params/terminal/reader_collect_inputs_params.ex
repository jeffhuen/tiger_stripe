# File generated from our OpenAPI spec
defmodule Stripe.Params.Terminal.ReaderCollectInputsParams do
  @moduledoc "Parameters for reader collect inputs."

  @typedoc """
  * `expand` - Specifies which fields in the response should be expanded.
  * `inputs` - List of inputs to be collected from the customer using the Reader. Maximum 5 inputs.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  """
  @type t :: %__MODULE__{
          expand: [String.t()] | nil,
          inputs: [inputs()],
          metadata: %{String.t() => String.t()} | nil
        }

  defstruct [:expand, :inputs, :metadata]

  @typedoc """
  * `custom_text` - Customize the text which will be displayed while collecting this input
  * `required` - Indicate that this input is required, disabling the skip button
  * `selection` - Options for the `selection` input
  * `toggles` - List of toggles to be displayed and customization for the toggles
  * `type` - The type of input to collect Possible values: `email`, `numeric`, `phone`, `selection`, `signature`, `text`.
  """
  @type inputs :: %{
          optional(:custom_text) => inputs_custom_text() | nil,
          optional(:required) => boolean() | nil,
          optional(:selection) => inputs_selection() | nil,
          optional(:toggles) => [inputs_toggles()] | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `description` - The description which will be displayed when collecting this input Max length: 500.
  * `skip_button` - Custom text for the skip button. Maximum 14 characters. Max length: 14.
  * `submit_button` - Custom text for the submit button. Maximum 30 characters. Max length: 30.
  * `title` - The title which will be displayed when collecting this input Max length: 40.
  """
  @type inputs_custom_text :: %{
          optional(:description) => String.t() | nil,
          optional(:skip_button) => String.t() | nil,
          optional(:submit_button) => String.t() | nil,
          optional(:title) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `choices` - List of choices for the `selection` input
  """
  @type inputs_selection :: %{
          optional(:choices) => [inputs_selection_choices()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `id` - The unique identifier for this choice Max length: 50.
  * `style` - The style of the button which will be shown for this choice. Can be `primary` or `secondary`. Possible values: `primary`, `secondary`.
  * `text` - The text which will be shown on the button for this choice Max length: 30.
  """
  @type inputs_selection_choices :: %{
          optional(:id) => String.t() | nil,
          optional(:style) => String.t() | nil,
          optional(:text) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `default_value` - The default value of the toggle. Can be `enabled` or `disabled`. Possible values: `disabled`, `enabled`.
  * `description` - The description which will be displayed for the toggle. Maximum 50 characters. At least one of title or description must be provided. Max length: 50.
  * `title` - The title which will be displayed for the toggle. Maximum 50 characters. At least one of title or description must be provided. Max length: 50.
  """
  @type inputs_toggles :: %{
          optional(:default_value) => String.t() | nil,
          optional(:description) => String.t() | nil,
          optional(:title) => String.t() | nil,
          optional(String.t()) => term()
        }
end
