# File generated from our OpenAPI spec
defmodule Stripe.Params.Radar.ValueListCreateParams do
  @moduledoc "Parameters for value list create."

  @typedoc """
  * `alias` - The name of the value list for use in rules. Max length: 100.
  * `expand` - Specifies which fields in the response should be expanded.
  * `item_type` - Type of the items in the value list. One of `card_fingerprint`, `card_bin`, `email`, `ip_address`, `country`, `string`, `case_sensitive_string`, `customer_id`, `sepa_debit_fingerprint`, or `us_bank_account_fingerprint`. Use `string` if the item type is unknown or mixed. Possible values: `card_bin`, `card_fingerprint`, `case_sensitive_string`, `country`, `customer_id`, `email`, `ip_address`, `sepa_debit_fingerprint`, `string`, `us_bank_account_fingerprint`. Max length: 5000.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `name` - The human-readable name of the value list. Max length: 100.
  """
  @type t :: %__MODULE__{
          alias: String.t(),
          expand: [String.t()] | nil,
          item_type: String.t() | nil,
          metadata: %{String.t() => String.t()} | nil,
          name: String.t()
        }

  defstruct [:alias, :expand, :item_type, :metadata, :name]
end
