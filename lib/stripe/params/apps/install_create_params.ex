# File generated from our OpenAPI spec
defmodule Stripe.Params.Apps.InstallCreateParams do
  @moduledoc "Parameters for install create."

  @typedoc """
  * `app` - The ID of the app to install. Max length: 5000.
  * `channel` - The distribution channel to install from. Defaults to `public`. A private app must be installed on `private_test` or `private_live`, matching the mode of the API key. Possible values: `private_live`, `private_test`, `public`, `testing`.
  * `code_challenge` - For OAuth apps, the PKCE code challenge used to issue the `auth_code` returned on the install. Must be 43 to 128 characters and contain only letters, numbers, `-`, `.`, `_`, and `~`. Only applies to installs made by the app developer or an embedding platform; ignored when an account installs its own private app. Max length: 5000.
  * `code_challenge_method` - The method used to derive `code_challenge`. Required when `code_challenge` is provided, and must be `S256`. Max length: 5000.
  * `expand` - Specifies which fields in the response should be expanded.
  """
  @type t :: %__MODULE__{}

  defstruct [:app, :channel, :code_challenge, :code_challenge_method, :expand]
end
