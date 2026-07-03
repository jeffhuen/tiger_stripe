# File generated from our OpenAPI spec
defmodule Stripe.Params.Issuing.CardholderUpdateParams do
  @moduledoc "Parameters for cardholder update."

  @typedoc """
  * `billing` - The cardholder's billing address.
  * `company` - Additional information about a `company` cardholder.
  * `email` - The cardholder's email address.
  * `expand` - Specifies which fields in the response should be expanded.
  * `individual` - Additional information about an `individual` cardholder.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `phone_number` - The cardholder's phone number. This is required for all cardholders who will be creating EU cards. See the [3D Secure documentation](https://docs.stripe.com/issuing/3d-secure) for more details.
  * `preferred_locales` - The cardholder’s preferred locales (languages), ordered by preference. Locales can be `de`, `en`, `es`, `fr`, or `it`.
  This changes the language of the [3D Secure flow](https://docs.stripe.com/issuing/3d-secure) and one-time password messages sent to the cardholder.
  * `spending_controls` - Rules that control spending across this cardholder's cards. Refer to our [documentation](https://docs.stripe.com/issuing/controls/spending-controls) for more details.
  * `status` - Specifies whether to permit authorizations on this cardholder's cards. Possible values: `active`, `inactive`.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :billing,
    :company,
    :email,
    :expand,
    :individual,
    :metadata,
    :phone_number,
    :preferred_locales,
    :spending_controls,
    :status
  ]
end
