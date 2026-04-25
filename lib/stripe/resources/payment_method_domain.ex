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
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `payment_method_domain`.
  * `paypal` - Expandable.
  """
  @type t :: %__MODULE__{
          amazon_pay: amazon_pay(),
          apple_pay: apple_pay(),
          created: integer(),
          domain_name: String.t(),
          enabled: boolean(),
          google_pay: google_pay(),
          id: String.t(),
          klarna: klarna(),
          link: link(),
          livemode: boolean(),
          object: String.t(),
          paypal: paypal()
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

  @typedoc """
  * `status` - The status of the payment method on the domain. Possible values: `active`, `inactive`.
  * `status_details`
  """
  @type amazon_pay :: %{
          optional(:status) => String.t() | nil,
          optional(:status_details) => amazon_pay_status_details() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `error_message` - The error message associated with the status of the payment method on the domain. Max length: 5000.
  """
  @type amazon_pay_status_details :: %{
          optional(:error_message) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `status` - The status of the payment method on the domain. Possible values: `active`, `inactive`.
  * `status_details`
  """
  @type apple_pay :: %{
          optional(:status) => String.t() | nil,
          optional(:status_details) => apple_pay_status_details() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `error_message` - The error message associated with the status of the payment method on the domain. Max length: 5000.
  """
  @type apple_pay_status_details :: %{
          optional(:error_message) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `status` - The status of the payment method on the domain. Possible values: `active`, `inactive`.
  * `status_details`
  """
  @type google_pay :: %{
          optional(:status) => String.t() | nil,
          optional(:status_details) => google_pay_status_details() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `error_message` - The error message associated with the status of the payment method on the domain. Max length: 5000.
  """
  @type google_pay_status_details :: %{
          optional(:error_message) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `status` - The status of the payment method on the domain. Possible values: `active`, `inactive`.
  * `status_details`
  """
  @type klarna :: %{
          optional(:status) => String.t() | nil,
          optional(:status_details) => klarna_status_details() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `error_message` - The error message associated with the status of the payment method on the domain. Max length: 5000.
  """
  @type klarna_status_details :: %{
          optional(:error_message) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `status` - The status of the payment method on the domain. Possible values: `active`, `inactive`.
  * `status_details`
  """
  @type link :: %{
          optional(:status) => String.t() | nil,
          optional(:status_details) => link_status_details() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `error_message` - The error message associated with the status of the payment method on the domain. Max length: 5000.
  """
  @type link_status_details :: %{
          optional(:error_message) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `status` - The status of the payment method on the domain. Possible values: `active`, `inactive`.
  * `status_details`
  """
  @type paypal :: %{
          optional(:status) => String.t() | nil,
          optional(:status_details) => paypal_status_details() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `error_message` - The error message associated with the status of the payment method on the domain. Max length: 5000.
  """
  @type paypal_status_details :: %{
          optional(:error_message) => String.t() | nil,
          optional(String.t()) => term()
        }

  def __nested_fields__ do
    %{
      "amazon_pay" => %{
        fields: %{
          "status" => :scalar,
          "status_details" => %{
            fields: %{
              "error_message" => :scalar
            }
          }
        }
      },
      "apple_pay" => %{
        fields: %{
          "status" => :scalar,
          "status_details" => %{
            fields: %{
              "error_message" => :scalar
            }
          }
        }
      },
      "google_pay" => %{
        fields: %{
          "status" => :scalar,
          "status_details" => %{
            fields: %{
              "error_message" => :scalar
            }
          }
        }
      },
      "klarna" => %{
        fields: %{
          "status" => :scalar,
          "status_details" => %{
            fields: %{
              "error_message" => :scalar
            }
          }
        }
      },
      "link" => %{
        fields: %{
          "status" => :scalar,
          "status_details" => %{
            fields: %{
              "error_message" => :scalar
            }
          }
        }
      },
      "paypal" => %{
        fields: %{
          "status" => :scalar,
          "status_details" => %{
            fields: %{
              "error_message" => :scalar
            }
          }
        }
      }
    }
  end
end
