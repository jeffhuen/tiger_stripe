# File generated from our OpenAPI spec
defmodule Stripe.Params.SourceUpdateParams do
  @moduledoc "Parameters for source update."

  @typedoc """
  * `amount` - Amount associated with the source.
  * `expand` - Specifies which fields in the response should be expanded.
  * `mandate` - Information about a mandate possibility attached to a source object (generally for bank debits) as well as its acceptance status.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `owner` - Information about the owner of the payment instrument that may be used or required by particular source types.
  * `source_order` - Information about the items and shipping associated with the source. Required for transactional credit (for example Klarna) sources before you can charge it.
  """
  @type t :: %__MODULE__{
          amount: integer() | nil,
          expand: [String.t()] | nil,
          mandate: mandate() | nil,
          metadata: map() | nil,
          owner: owner() | nil,
          source_order: source_order() | nil
        }

  defstruct [:amount, :expand, :mandate, :metadata, :owner, :source_order]

  @typedoc """
  * `acceptance` - The parameters required to notify Stripe of a mandate acceptance or refusal by the customer.
  * `amount` - The amount specified by the mandate. (Leave null for a mandate covering all amounts)
  * `currency` - The currency specified by the mandate. (Must match `currency` of the source) Format: ISO 4217 currency code.
  * `interval` - The interval of debits permitted by the mandate. Either `one_time` (just permitting a single debit), `scheduled` (with debits on an agreed schedule or for clearly-defined events), or `variable`(for debits with any frequency) Possible values: `one_time`, `scheduled`, `variable`. Max length: 5000.
  * `notification_method` - The method Stripe should use to notify the customer of upcoming debit instructions and/or mandate confirmation as required by the underlying debit network. Either `email` (an email is sent directly to the customer), `manual` (a `source.mandate_notification` event is sent to your webhooks endpoint and you should handle the notification) or `none` (the underlying debit network does not require any notification). Possible values: `deprecated_none`, `email`, `manual`, `none`, `stripe_email`. Max length: 5000.
  """
  @type mandate :: %{
          optional(:acceptance) => mandate_acceptance() | nil,
          optional(:amount) => map() | nil,
          optional(:currency) => String.t() | nil,
          optional(:interval) => String.t() | nil,
          optional(:notification_method) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `date` - The Unix timestamp (in seconds) when the mandate was accepted or refused by the customer. Format: Unix timestamp.
  * `ip` - The IP address from which the mandate was accepted or refused by the customer.
  * `offline` - The parameters required to store a mandate accepted offline. Should only be set if `mandate[type]` is `offline`
  * `online` - The parameters required to store a mandate accepted online. Should only be set if `mandate[type]` is `online`
  * `status` - The status of the mandate acceptance. Either `accepted` (the mandate was accepted) or `refused` (the mandate was refused). Possible values: `accepted`, `pending`, `refused`, `revoked`. Max length: 5000.
  * `type` - The type of acceptance information included with the mandate. Either `online` or `offline` Possible values: `offline`, `online`. Max length: 5000.
  * `user_agent` - The user agent of the browser from which the mandate was accepted or refused by the customer. Max length: 5000.
  """
  @type mandate_acceptance :: %{
          optional(:date) => integer() | nil,
          optional(:ip) => String.t() | nil,
          optional(:offline) => mandate_acceptance_offline() | nil,
          optional(:online) => mandate_acceptance_online() | nil,
          optional(:status) => String.t() | nil,
          optional(:type) => String.t() | nil,
          optional(:user_agent) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `contact_email` - An email to contact you with if a copy of the mandate is requested, required if `type` is `offline`.
  """
  @type mandate_acceptance_offline :: %{
          optional(:contact_email) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `date` - The Unix timestamp (in seconds) when the mandate was accepted or refused by the customer. Format: Unix timestamp.
  * `ip` - The IP address from which the mandate was accepted or refused by the customer.
  * `user_agent` - The user agent of the browser from which the mandate was accepted or refused by the customer. Max length: 5000.
  """
  @type mandate_acceptance_online :: %{
          optional(:date) => integer() | nil,
          optional(:ip) => String.t() | nil,
          optional(:user_agent) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `address` - Owner's address.
  * `email` - Owner's email address.
  * `name` - Owner's full name. Max length: 5000.
  * `phone` - Owner's phone number. Max length: 5000.
  """
  @type owner :: %{
          optional(:address) => owner_address() | nil,
          optional(:email) => String.t() | nil,
          optional(:name) => String.t() | nil,
          optional(:phone) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `city` - City, district, suburb, town, or village. Max length: 5000.
  * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)). Max length: 5000.
  * `line1` - Address line 1, such as the street, PO Box, or company name. Max length: 5000.
  * `line2` - Address line 2, such as the apartment, suite, unit, or building. Max length: 5000.
  * `postal_code` - ZIP or postal code. Max length: 5000.
  * `state` - State, county, province, or region ([ISO 3166-2](https://en.wikipedia.org/wiki/ISO_3166-2)). Max length: 5000.
  """
  @type owner_address :: %{
          optional(:city) => String.t() | nil,
          optional(:country) => String.t() | nil,
          optional(:line1) => String.t() | nil,
          optional(:line2) => String.t() | nil,
          optional(:postal_code) => String.t() | nil,
          optional(:state) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `items` - List of items constituting the order.
  * `shipping` - Shipping address for the order. Required if any of the SKUs are for products that have `shippable` set to true.
  """
  @type source_order :: %{
          optional(:items) => [source_order_items()] | nil,
          optional(:shipping) => source_order_shipping() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `amount`
  * `currency` - Format: ISO 4217 currency code.
  * `description` - Max length: 1000.
  * `parent` - The ID of the SKU being ordered. Max length: 5000.
  * `quantity` - The quantity of this order item. When type is `sku`, this is the number of instances of the SKU to be ordered.
  * `type` - Possible values: `discount`, `shipping`, `sku`, `tax`. Max length: 5000.
  """
  @type source_order_items :: %{
          optional(:amount) => integer() | nil,
          optional(:currency) => String.t() | nil,
          optional(:description) => String.t() | nil,
          optional(:parent) => String.t() | nil,
          optional(:quantity) => integer() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `address` - Shipping address.
  * `carrier` - The delivery service that shipped a physical product, such as Fedex, UPS, USPS, etc. Max length: 5000.
  * `name` - Recipient name. Max length: 5000.
  * `phone` - Recipient phone (including extension). Max length: 5000.
  * `tracking_number` - The tracking number for a physical product, obtained from the delivery service. If multiple tracking numbers were generated for this purchase, please separate them with commas. Max length: 5000.
  """
  @type source_order_shipping :: %{
          optional(:address) => source_order_shipping_address() | nil,
          optional(:carrier) => String.t() | nil,
          optional(:name) => String.t() | nil,
          optional(:phone) => String.t() | nil,
          optional(:tracking_number) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `city` - City, district, suburb, town, or village. Max length: 5000.
  * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)). Max length: 5000.
  * `line1` - Address line 1, such as the street, PO Box, or company name. Max length: 5000.
  * `line2` - Address line 2, such as the apartment, suite, unit, or building. Max length: 5000.
  * `postal_code` - ZIP or postal code. Max length: 5000.
  * `state` - State, county, province, or region ([ISO 3166-2](https://en.wikipedia.org/wiki/ISO_3166-2)). Max length: 5000.
  """
  @type source_order_shipping_address :: %{
          optional(:city) => String.t() | nil,
          optional(:country) => String.t() | nil,
          optional(:line1) => String.t() | nil,
          optional(:line2) => String.t() | nil,
          optional(:postal_code) => String.t() | nil,
          optional(:state) => String.t() | nil,
          optional(String.t()) => term()
        }
end
