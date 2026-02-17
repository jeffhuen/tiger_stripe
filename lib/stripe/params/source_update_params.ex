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
          mandate: __MODULE__.Mandate.t() | nil,
          metadata: map() | nil,
          owner: __MODULE__.Owner.t() | nil,
          source_order: __MODULE__.SourceOrder.t() | nil
        }

  defstruct [:amount, :expand, :mandate, :metadata, :owner, :source_order]

  defmodule Mandate do
    @moduledoc "Nested parameters."

    @typedoc """
    * `acceptance` - The parameters required to notify Stripe of a mandate acceptance or refusal by the customer.
    * `amount` - The amount specified by the mandate. (Leave null for a mandate covering all amounts)
    * `currency` - The currency specified by the mandate. (Must match `currency` of the source) Format: ISO 4217 currency code.
    * `interval` - The interval of debits permitted by the mandate. Either `one_time` (just permitting a single debit), `scheduled` (with debits on an agreed schedule or for clearly-defined events), or `variable`(for debits with any frequency) Possible values: `one_time`, `scheduled`, `variable`. Max length: 5000.
    * `notification_method` - The method Stripe should use to notify the customer of upcoming debit instructions and/or mandate confirmation as required by the underlying debit network. Either `email` (an email is sent directly to the customer), `manual` (a `source.mandate_notification` event is sent to your webhooks endpoint and you should handle the notification) or `none` (the underlying debit network does not require any notification). Possible values: `deprecated_none`, `email`, `manual`, `none`, `stripe_email`. Max length: 5000.
    """
    @type t :: %__MODULE__{
            acceptance: __MODULE__.Acceptance.t() | nil,
            amount: map() | nil,
            currency: String.t() | nil,
            interval: String.t() | nil,
            notification_method: String.t() | nil
          }
    defstruct [:acceptance, :amount, :currency, :interval, :notification_method]

    defmodule Acceptance do
      @moduledoc "Nested parameters."

      @typedoc """
      * `date` - The Unix timestamp (in seconds) when the mandate was accepted or refused by the customer. Format: Unix timestamp.
      * `ip` - The IP address from which the mandate was accepted or refused by the customer.
      * `offline` - The parameters required to store a mandate accepted offline. Should only be set if `mandate[type]` is `offline`
      * `online` - The parameters required to store a mandate accepted online. Should only be set if `mandate[type]` is `online`
      * `status` - The status of the mandate acceptance. Either `accepted` (the mandate was accepted) or `refused` (the mandate was refused). Possible values: `accepted`, `pending`, `refused`, `revoked`. Max length: 5000.
      * `type` - The type of acceptance information included with the mandate. Either `online` or `offline` Possible values: `offline`, `online`. Max length: 5000.
      * `user_agent` - The user agent of the browser from which the mandate was accepted or refused by the customer. Max length: 5000.
      """
      @type t :: %__MODULE__{
              date: integer() | nil,
              ip: String.t() | nil,
              offline: __MODULE__.Offline.t() | nil,
              online: __MODULE__.Online.t() | nil,
              status: String.t() | nil,
              type: String.t() | nil,
              user_agent: String.t() | nil
            }
      defstruct [:date, :ip, :offline, :online, :status, :type, :user_agent]

      defmodule Offline do
        @moduledoc "Nested parameters."

        @typedoc """
        * `contact_email` - An email to contact you with if a copy of the mandate is requested, required if `type` is `offline`.
        """
        @type t :: %__MODULE__{
                contact_email: String.t() | nil
              }
        defstruct [:contact_email]
      end

      defmodule Online do
        @moduledoc "Nested parameters."

        @typedoc """
        * `date` - The Unix timestamp (in seconds) when the mandate was accepted or refused by the customer. Format: Unix timestamp.
        * `ip` - The IP address from which the mandate was accepted or refused by the customer.
        * `user_agent` - The user agent of the browser from which the mandate was accepted or refused by the customer. Max length: 5000.
        """
        @type t :: %__MODULE__{
                date: integer() | nil,
                ip: String.t() | nil,
                user_agent: String.t() | nil
              }
        defstruct [:date, :ip, :user_agent]
      end
    end
  end

  defmodule Owner do
    @moduledoc "Nested parameters."

    @typedoc """
    * `address` - Owner's address.
    * `email` - Owner's email address.
    * `name` - Owner's full name. Max length: 5000.
    * `phone` - Owner's phone number. Max length: 5000.
    """
    @type t :: %__MODULE__{
            address: __MODULE__.Address.t() | nil,
            email: String.t() | nil,
            name: String.t() | nil,
            phone: String.t() | nil
          }
    defstruct [:address, :email, :name, :phone]

    defmodule Address do
      @moduledoc "Nested parameters."

      @typedoc """
      * `city` - City, district, suburb, town, or village. Max length: 5000.
      * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)). Max length: 5000.
      * `line1` - Address line 1, such as the street, PO Box, or company name. Max length: 5000.
      * `line2` - Address line 2, such as the apartment, suite, unit, or building. Max length: 5000.
      * `postal_code` - ZIP or postal code. Max length: 5000.
      * `state` - State, county, province, or region ([ISO 3166-2](https://en.wikipedia.org/wiki/ISO_3166-2)). Max length: 5000.
      """
      @type t :: %__MODULE__{
              city: String.t() | nil,
              country: String.t() | nil,
              line1: String.t() | nil,
              line2: String.t() | nil,
              postal_code: String.t() | nil,
              state: String.t() | nil
            }
      defstruct [:city, :country, :line1, :line2, :postal_code, :state]
    end
  end

  defmodule SourceOrder do
    @moduledoc "Nested parameters."

    @typedoc """
    * `items` - List of items constituting the order.
    * `shipping` - Shipping address for the order. Required if any of the SKUs are for products that have `shippable` set to true.
    """
    @type t :: %__MODULE__{
            items: [__MODULE__.Items.t()] | nil,
            shipping: __MODULE__.Shipping.t() | nil
          }
    defstruct [:items, :shipping]

    defmodule Items do
      @moduledoc "Nested parameters."

      @typedoc """
      * `amount`
      * `currency` - Format: ISO 4217 currency code.
      * `description` - Max length: 1000.
      * `parent` - The ID of the SKU being ordered. Max length: 5000.
      * `quantity` - The quantity of this order item. When type is `sku`, this is the number of instances of the SKU to be ordered.
      * `type` - Possible values: `discount`, `shipping`, `sku`, `tax`. Max length: 5000.
      """
      @type t :: %__MODULE__{
              amount: integer() | nil,
              currency: String.t() | nil,
              description: String.t() | nil,
              parent: String.t() | nil,
              quantity: integer() | nil,
              type: String.t() | nil
            }
      defstruct [:amount, :currency, :description, :parent, :quantity, :type]
    end

    defmodule Shipping do
      @moduledoc "Nested parameters."

      @typedoc """
      * `address` - Shipping address.
      * `carrier` - The delivery service that shipped a physical product, such as Fedex, UPS, USPS, etc. Max length: 5000.
      * `name` - Recipient name. Max length: 5000.
      * `phone` - Recipient phone (including extension). Max length: 5000.
      * `tracking_number` - The tracking number for a physical product, obtained from the delivery service. If multiple tracking numbers were generated for this purchase, please separate them with commas. Max length: 5000.
      """
      @type t :: %__MODULE__{
              address: __MODULE__.Address.t() | nil,
              carrier: String.t() | nil,
              name: String.t() | nil,
              phone: String.t() | nil,
              tracking_number: String.t() | nil
            }
      defstruct [:address, :carrier, :name, :phone, :tracking_number]

      defmodule Address do
        @moduledoc "Nested parameters."

        @typedoc """
        * `city` - City, district, suburb, town, or village. Max length: 5000.
        * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)). Max length: 5000.
        * `line1` - Address line 1, such as the street, PO Box, or company name. Max length: 5000.
        * `line2` - Address line 2, such as the apartment, suite, unit, or building. Max length: 5000.
        * `postal_code` - ZIP or postal code. Max length: 5000.
        * `state` - State, county, province, or region ([ISO 3166-2](https://en.wikipedia.org/wiki/ISO_3166-2)). Max length: 5000.
        """
        @type t :: %__MODULE__{
                city: String.t() | nil,
                country: String.t() | nil,
                line1: String.t() | nil,
                line2: String.t() | nil,
                postal_code: String.t() | nil,
                state: String.t() | nil
              }
        defstruct [:city, :country, :line1, :line2, :postal_code, :state]
      end
    end
  end
end
