# File generated from our OpenAPI spec
defmodule Stripe.Resources.Issuing.PhysicalBundle do
  @moduledoc """
  IssuingPhysicalBundle

  A Physical Bundle represents the bundle of physical items - card stock, carrier letter, and envelope - that is shipped to a cardholder when you create a physical card.
  """

  @typedoc """
  * `features` - Expandable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `name` - Friendly display name. Max length: 5000.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `issuing.physical_bundle`.
  * `status` - Whether this physical bundle can be used to create cards. Possible values: `active`, `inactive`, `review`.
  * `type` - Whether this physical bundle is a standard Stripe offering or custom-made for you. Possible values: `custom`, `standard`.
  """
  @type t :: %__MODULE__{
          features: __MODULE__.Features.t(),
          id: String.t(),
          livemode: boolean(),
          name: String.t(),
          object: String.t(),
          status: String.t(),
          type: String.t()
        }

  defstruct [:features, :id, :livemode, :name, :object, :status, :type]

  @object_name "issuing.physical_bundle"
  def object_name, do: @object_name

  def expandable_fields, do: ["features"]

  defmodule Features do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `card_logo` - The policy for how to use card logo images in a card design with this physical bundle. Possible values: `optional`, `required`, `unsupported`.
    * `carrier_text` - The policy for how to use carrier letter text in a card design with this physical bundle. Possible values: `optional`, `required`, `unsupported`.
    * `second_line` - The policy for how to use a second line on a card with this physical bundle. Possible values: `optional`, `required`, `unsupported`.
    """
    @type t :: %__MODULE__{
            card_logo: String.t() | nil,
            carrier_text: String.t() | nil,
            second_line: String.t() | nil
          }
    defstruct [:card_logo, :carrier_text, :second_line]
  end

  def __inner_types__ do
    %{
      "features" => __MODULE__.Features
    }
  end
end
