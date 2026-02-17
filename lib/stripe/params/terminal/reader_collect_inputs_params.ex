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
          inputs: [__MODULE__.Inputs.t()],
          metadata: %{String.t() => String.t()} | nil
        }

  defstruct [:expand, :inputs, :metadata]

  defmodule Inputs do
    @moduledoc "Nested parameters."

    @typedoc """
    * `custom_text` - Customize the text which will be displayed while collecting this input
    * `required` - Indicate that this input is required, disabling the skip button
    * `selection` - Options for the `selection` input
    * `toggles` - List of toggles to be displayed and customization for the toggles
    * `type` - The type of input to collect Possible values: `email`, `numeric`, `phone`, `selection`, `signature`, `text`.
    """
    @type t :: %__MODULE__{
            custom_text: __MODULE__.CustomText.t() | nil,
            required: boolean() | nil,
            selection: __MODULE__.Selection.t() | nil,
            toggles: [__MODULE__.Toggles.t()] | nil,
            type: String.t() | nil
          }
    defstruct [:custom_text, :required, :selection, :toggles, :type]

    defmodule CustomText do
      @moduledoc "Nested parameters."

      @typedoc """
      * `description` - The description which will be displayed when collecting this input Max length: 500.
      * `skip_button` - Custom text for the skip button. Maximum 14 characters. Max length: 14.
      * `submit_button` - Custom text for the submit button. Maximum 30 characters. Max length: 30.
      * `title` - The title which will be displayed when collecting this input Max length: 40.
      """
      @type t :: %__MODULE__{
              description: String.t() | nil,
              skip_button: String.t() | nil,
              submit_button: String.t() | nil,
              title: String.t() | nil
            }
      defstruct [:description, :skip_button, :submit_button, :title]
    end

    defmodule Selection do
      @moduledoc "Nested parameters."

      @typedoc """
      * `choices` - List of choices for the `selection` input
      """
      @type t :: %__MODULE__{
              choices: [__MODULE__.Choices.t()] | nil
            }
      defstruct [:choices]

      defmodule Choices do
        @moduledoc "Nested parameters."

        @typedoc """
        * `id` - The unique identifier for this choice Max length: 50.
        * `style` - The style of the button which will be shown for this choice. Can be `primary` or `secondary`. Possible values: `primary`, `secondary`.
        * `text` - The text which will be shown on the button for this choice Max length: 30.
        """
        @type t :: %__MODULE__{
                id: String.t() | nil,
                style: String.t() | nil,
                text: String.t() | nil
              }
        defstruct [:id, :style, :text]
      end
    end

    defmodule Toggles do
      @moduledoc "Nested parameters."

      @typedoc """
      * `default_value` - The default value of the toggle. Can be `enabled` or `disabled`. Possible values: `disabled`, `enabled`.
      * `description` - The description which will be displayed for the toggle. Maximum 50 characters. At least one of title or description must be provided. Max length: 50.
      * `title` - The title which will be displayed for the toggle. Maximum 50 characters. At least one of title or description must be provided. Max length: 50.
      """
      @type t :: %__MODULE__{
              default_value: String.t() | nil,
              description: String.t() | nil,
              title: String.t() | nil
            }
      defstruct [:default_value, :description, :title]
    end
  end
end
