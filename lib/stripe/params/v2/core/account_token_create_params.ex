# File generated from our OpenAPI spec
defmodule Stripe.Params.V2.Core.AccountTokenCreateParams do
  @moduledoc "Parameters for account token create."

  @typedoc """
  * `contact_email` - The primary contact email address for the Account.
  * `contact_phone` - The default contact phone for the Account.
  * `display_name` - A descriptive name for the Account. This name will be surfaced in the Stripe Dashboard and on any invoices sent to the Account.
  * `identity` - Information about the company, individual, and business represented by the Account.
  """
  @type t :: %__MODULE__{}

  defstruct [:contact_email, :contact_phone, :display_name, :identity]
end
