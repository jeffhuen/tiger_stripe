# File generated from our OpenAPI spec
defmodule Stripe.Resources.LoginLink do
  @moduledoc """
  LoginLink

  Login Links are single-use URLs that takes an Express account to the login page for their Stripe dashboard.
  A Login Link differs from an [Account Link](https://docs.stripe.com/api/account_links) in that it takes the user directly to their [Express dashboard for the specified account](https://docs.stripe.com/connect/integrate-express-dashboard#create-login-link)
  """

  @typedoc """
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `login_link`.
  * `url` - The URL for the login link. Max length: 5000.
  """
  @type t :: %__MODULE__{}

  defstruct [:created, :object, :url]

  @object_name "login_link"
  def object_name, do: @object_name
end
