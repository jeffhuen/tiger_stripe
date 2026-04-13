# File generated from our OpenAPI spec
defmodule Stripe.Resources.PaymentMethodDomain do
  @moduledoc """
  PaymentMethodDomainResourcePaymentMethodDomain

  A payment method domain represents a web domain that you have registered with Stripe.
  Stripe Elements use registered payment method domains to control where certain payment methods are shown.

  Related guide: [Payment method domains](https://docs.stripe.com/payments/payment-methods/pmd-registration).
  """

  @typedoc """
  * `amazon_pay` - Expandable.
  * `apple_pay` - Expandable.
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `domain_name` - The domain name that this payment method domain object represents. Max length: 5000.
  * `enabled` - Whether this payment method domain is enabled. If the domain is not enabled, payment methods that require a payment method domain will not appear in Elements.
  * `google_pay` - Expandable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `klarna` - Expandable.
  * `link` - Expandable.
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `payment_method_domain`.
  * `paypal` - Expandable.
  """
  @type t :: %__MODULE__{
          amazon_pay: __MODULE__.AmazonPay.t(),
          apple_pay: __MODULE__.ApplePay.t(),
          created: integer(),
          domain_name: String.t(),
          enabled: boolean(),
          google_pay: __MODULE__.GooglePay.t(),
          id: String.t(),
          klarna: __MODULE__.Klarna.t(),
          link: __MODULE__.Link.t(),
          livemode: boolean(),
          object: String.t(),
          paypal: __MODULE__.Paypal.t()
        }

  defstruct [
    :amazon_pay,
    :apple_pay,
    :created,
    :domain_name,
    :enabled,
    :google_pay,
    :id,
    :klarna,
    :link,
    :livemode,
    :object,
    :paypal
  ]

  @object_name "payment_method_domain"
  def object_name, do: @object_name

  def expandable_fields, do: ["amazon_pay", "apple_pay", "google_pay", "klarna", "link", "paypal"]

  defmodule AmazonPay do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `status` - The status of the payment method on the domain. Possible values: `active`, `inactive`.
    * `status_details`
    """
    @type t :: %__MODULE__{
            status: String.t() | nil,
            status_details: __MODULE__.StatusDetails.t() | nil
          }
    defstruct [:status, :status_details]

    defmodule StatusDetails do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `error_message` - The error message associated with the status of the payment method on the domain. Max length: 5000.
      """
      @type t :: %__MODULE__{
              error_message: String.t() | nil
            }
      defstruct [:error_message]
    end

    def __inner_types__ do
      %{
        "status_details" => __MODULE__.StatusDetails
      }
    end
  end

  defmodule ApplePay do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `status` - The status of the payment method on the domain. Possible values: `active`, `inactive`.
    * `status_details`
    """
    @type t :: %__MODULE__{
            status: String.t() | nil,
            status_details: __MODULE__.StatusDetails.t() | nil
          }
    defstruct [:status, :status_details]

    defmodule StatusDetails do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `error_message` - The error message associated with the status of the payment method on the domain. Max length: 5000.
      """
      @type t :: %__MODULE__{
              error_message: String.t() | nil
            }
      defstruct [:error_message]
    end

    def __inner_types__ do
      %{
        "status_details" => __MODULE__.StatusDetails
      }
    end
  end

  defmodule GooglePay do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `status` - The status of the payment method on the domain. Possible values: `active`, `inactive`.
    * `status_details`
    """
    @type t :: %__MODULE__{
            status: String.t() | nil,
            status_details: __MODULE__.StatusDetails.t() | nil
          }
    defstruct [:status, :status_details]

    defmodule StatusDetails do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `error_message` - The error message associated with the status of the payment method on the domain. Max length: 5000.
      """
      @type t :: %__MODULE__{
              error_message: String.t() | nil
            }
      defstruct [:error_message]
    end

    def __inner_types__ do
      %{
        "status_details" => __MODULE__.StatusDetails
      }
    end
  end

  defmodule Klarna do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `status` - The status of the payment method on the domain. Possible values: `active`, `inactive`.
    * `status_details`
    """
    @type t :: %__MODULE__{
            status: String.t() | nil,
            status_details: __MODULE__.StatusDetails.t() | nil
          }
    defstruct [:status, :status_details]

    defmodule StatusDetails do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `error_message` - The error message associated with the status of the payment method on the domain. Max length: 5000.
      """
      @type t :: %__MODULE__{
              error_message: String.t() | nil
            }
      defstruct [:error_message]
    end

    def __inner_types__ do
      %{
        "status_details" => __MODULE__.StatusDetails
      }
    end
  end

  defmodule Link do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `status` - The status of the payment method on the domain. Possible values: `active`, `inactive`.
    * `status_details`
    """
    @type t :: %__MODULE__{
            status: String.t() | nil,
            status_details: __MODULE__.StatusDetails.t() | nil
          }
    defstruct [:status, :status_details]

    defmodule StatusDetails do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `error_message` - The error message associated with the status of the payment method on the domain. Max length: 5000.
      """
      @type t :: %__MODULE__{
              error_message: String.t() | nil
            }
      defstruct [:error_message]
    end

    def __inner_types__ do
      %{
        "status_details" => __MODULE__.StatusDetails
      }
    end
  end

  defmodule Paypal do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `status` - The status of the payment method on the domain. Possible values: `active`, `inactive`.
    * `status_details`
    """
    @type t :: %__MODULE__{
            status: String.t() | nil,
            status_details: __MODULE__.StatusDetails.t() | nil
          }
    defstruct [:status, :status_details]

    defmodule StatusDetails do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `error_message` - The error message associated with the status of the payment method on the domain. Max length: 5000.
      """
      @type t :: %__MODULE__{
              error_message: String.t() | nil
            }
      defstruct [:error_message]
    end

    def __inner_types__ do
      %{
        "status_details" => __MODULE__.StatusDetails
      }
    end
  end

  def __inner_types__ do
    %{
      "amazon_pay" => __MODULE__.AmazonPay,
      "apple_pay" => __MODULE__.ApplePay,
      "google_pay" => __MODULE__.GooglePay,
      "klarna" => __MODULE__.Klarna,
      "link" => __MODULE__.Link,
      "paypal" => __MODULE__.Paypal
    }
  end
end
