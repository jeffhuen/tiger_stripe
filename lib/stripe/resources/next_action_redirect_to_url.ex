# File generated from our OpenAPI spec
defmodule Stripe.Resources.NextActionRedirectToUrl do
  @moduledoc """
  SetupIntentNextActionRedirectToUrl
  """

  @typedoc """
  * `return_url` - If the customer does not exit their browser while authenticating, they will be redirected to this specified URL after completion. Max length: 5000. Nullable.
  * `url` - The URL you must redirect your customer to in order to authenticate. Max length: 5000. Nullable.
  """
  @type t :: %__MODULE__{}

  defstruct [:return_url, :url]

  @object_name "setup_intent_next_action_redirect_to_url"
  def object_name, do: @object_name
end
