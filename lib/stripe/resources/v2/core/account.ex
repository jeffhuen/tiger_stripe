# File generated from our OpenAPI spec
defmodule Stripe.Resources.V2.Core.Account do
  @moduledoc """
  Account

  An Account v2 object represents a company, individual, or other entity that interacts with a platform on Stripe. It contains both identifying information and properties that control its behavior and functionality. An Account can have one or more configurations that enable sets of related features, such as allowing it to act as a merchant or customer.
  The Accounts v2 API supports both the Global Payouts preview feature and the Connect-Billing integration preview feature. However, a particular Account can only access one of them.
  The Connect-Billing integration preview feature allows an Account v2 to pay subscription fees to a platform. An Account v1 required a separate Customer object to pay subscription fees.
  """

  @typedoc """
  * `applied_configurations` - The configurations that have been applied to this account.
  * `closed` - Indicates whether the account has been closed.
  * `configuration` - An Account represents a company, individual, or other entity that a user interacts with. Accounts store identity information and one or more configurations that enable product-specific capabilities. You can assign configurations at creation or add them later.
  * `contact_email` - The default contact email address for the Account. Required when configuring the account as a merchant or recipient.
  * `contact_phone` - The default contact phone for the Account.
  * `created` - Time at which the object was created. Represented as a RFC 3339 date & time UTC value in millisecond precision, for example: 2022-09-18T13:22:18.123Z. Format: date-time.
  * `dashboard` - A value indicating the Stripe dashboard this Account has access to. This will depend on which configurations are enabled for this account. Possible values: `express`, `full`, `none`.
  * `defaults` - Default values for settings shared across Account configurations.
  * `display_name` - A descriptive name for the Account. This name will be surfaced in the Stripe Dashboard and on any invoices sent to the Account.
  * `future_requirements` - Information about the future requirements for the Account that will eventually come into effect, including what information needs to be collected, and by when.
  * `id` - Unique identifier for the Account.
  * `identity` - Information about the company, individual, and business represented by the Account.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `metadata` - Set of key-value pairs that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
  * `object` - String representing the object's type. Objects of the same type share the same value of the object field. Possible values: `v2.core.account`.
  * `requirements` - Information about the active requirements for the Account, including what information needs to be collected, and by when.
  """
  @type t :: %__MODULE__{
          applied_configurations: [String.t()],
          closed: boolean() | nil,
          configuration: __MODULE__.Configuration.t() | nil,
          contact_email: String.t() | nil,
          contact_phone: String.t() | nil,
          created: String.t(),
          dashboard: String.t() | nil,
          defaults: __MODULE__.Defaults.t() | nil,
          display_name: String.t() | nil,
          future_requirements: __MODULE__.FutureRequirements.t() | nil,
          id: String.t(),
          identity: __MODULE__.Identity.t() | nil,
          livemode: boolean(),
          metadata: %{String.t() => String.t()} | nil,
          object: String.t(),
          requirements: __MODULE__.Requirements.t() | nil
        }

  defstruct [
    :applied_configurations,
    :closed,
    :configuration,
    :contact_email,
    :contact_phone,
    :created,
    :dashboard,
    :defaults,
    :display_name,
    :future_requirements,
    :id,
    :identity,
    :livemode,
    :metadata,
    :object,
    :requirements
  ]

  @object_name "v2.core.account"
  def object_name, do: @object_name

  defmodule Configuration do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `customer` - The Customer Configuration allows the Account to be used in inbound payment flows.
    * `merchant` - Enables the Account to act as a connected account and collect payments facilitated by a Connect platform. You must onboard your platform to Connect before you can add this configuration to your connected accounts. Utilize this configuration when the Account will be the Merchant of Record, like with Direct charges or Destination Charges with on_behalf_of set.
    * `recipient` - The Recipient Configuration allows the Account to receive funds. Utilize this configuration if the Account will not be the Merchant of Record, like with Separate Charges & Transfers, or Destination Charges without on_behalf_of set.
    """
    @type t :: %__MODULE__{
            customer: __MODULE__.Customer.t() | nil,
            merchant: __MODULE__.Merchant.t() | nil,
            recipient: __MODULE__.Recipient.t() | nil
          }
    defstruct [:customer, :merchant, :recipient]

    defmodule Customer do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `applied` - Indicates whether the customer configuration is active. You can deactivate or reactivate the customer configuration by updating this property. Deactivating the configuration by setting this value to false will unrequest all capabilities within the configuration. It will not delete any of the configuration's other properties.
      * `automatic_indirect_tax` - Settings for automatic indirect tax calculation on the customer's invoices, subscriptions, Checkout Sessions, and Payment Links. Available when automatic tax calculation is available for the customer account's location.
      * `billing` - Default Billing settings for the customer account, used in Invoices and Subscriptions.
      * `capabilities` - Capabilities that have been requested on the Customer Configuration.
      * `shipping` - The customer's shipping information. Appears on invoices emailed to this customer.
      * `test_clock` - ID of the test clock to attach to the customer. Can only be set on testmode Accounts, and when the Customer Configuration is first set on an Account.
      """
      @type t :: %__MODULE__{
              applied: boolean() | nil,
              automatic_indirect_tax: __MODULE__.AutomaticIndirectTax.t() | nil,
              billing: __MODULE__.Billing.t() | nil,
              capabilities: __MODULE__.Capabilities.t() | nil,
              shipping: __MODULE__.Shipping.t() | nil,
              test_clock: String.t() | nil
            }
      defstruct [
        :applied,
        :automatic_indirect_tax,
        :billing,
        :capabilities,
        :shipping,
        :test_clock
      ]

      defmodule AutomaticIndirectTax do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `exempt` - The customer account's tax exemption status: `none`, `exempt`, or `reverse`. When `reverse`, invoice and receipt PDFs include "Reverse charge". Possible values: `exempt`, `none`, `reverse`.
        * `ip_address` - A recent IP address of the customer used for tax reporting and tax location inference.
        * `location` - The customer account's identified tax location, derived from `location_source`. Only rendered if the `automatic_indirect_tax` feature is requested and `active`.
        * `location_source` - Data source used to identify the customer account's tax location. Defaults to `identity_address`. Used for automatic indirect tax calculation. Possible values: `identity_address`, `ip_address`, `payment_method`, `shipping_address`.
        """
        @type t :: %__MODULE__{
                exempt: String.t() | nil,
                ip_address: String.t() | nil,
                location: __MODULE__.Location.t() | nil,
                location_source: String.t() | nil
              }
        defstruct [:exempt, :ip_address, :location, :location_source]

        defmodule Location do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `country` - The identified tax country of the customer.
          * `state` - The identified tax state, county, province, or region of the customer.
          """
          @type t :: %__MODULE__{
                  country: String.t() | nil,
                  state: String.t() | nil
                }
          defstruct [:country, :state]
        end

        def __inner_types__ do
          %{
            "location" => __MODULE__.Location
          }
        end
      end

      defmodule Billing do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `default_payment_method` - ID of a PaymentMethod attached to the customer account to use as the default for invoices and subscriptions.
        * `invoice` - Default invoice settings for the customer account.
        """
        @type t :: %__MODULE__{
                default_payment_method: String.t() | nil,
                invoice: __MODULE__.Invoice.t() | nil
              }
        defstruct [:default_payment_method, :invoice]

        defmodule Invoice do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `custom_fields` - The list of up to 4 default custom fields to be displayed on invoices for this customer. When updating, pass an empty string to remove previously-defined fields.
          * `footer` - Default invoice footer.
          * `next_sequence` - Sequence number to use on the customer account's next invoice. Defaults to 1.
          * `prefix` - Prefix used to generate unique invoice numbers. Must be 3-12 uppercase letters or numbers.
          * `rendering` - Default invoice PDF rendering options.
          """
          @type t :: %__MODULE__{
                  custom_fields: [__MODULE__.CustomFields.t()] | nil,
                  footer: String.t() | nil,
                  next_sequence: integer() | nil,
                  prefix: String.t() | nil,
                  rendering: __MODULE__.Rendering.t() | nil
                }
          defstruct [:custom_fields, :footer, :next_sequence, :prefix, :rendering]

          defmodule CustomFields do
            @moduledoc "Nested struct within the parent resource."

            @typedoc """
            * `name` - The name of the custom field. This may be up to 40 characters.
            * `value` - The value of the custom field. This may be up to 140 characters. When updating, pass an empty string to remove previously-defined values.
            """
            @type t :: %__MODULE__{
                    name: String.t() | nil,
                    value: String.t() | nil
                  }
            defstruct [:name, :value]
          end

          defmodule Rendering do
            @moduledoc "Nested struct within the parent resource."

            @typedoc """
            * `amount_tax_display` - Indicates whether displayed line item prices and amounts on invoice PDFs include inclusive tax amounts. Must be either `include_inclusive_tax` or `exclude_tax`. Possible values: `exclude_tax`, `include_inclusive_tax`.
            * `template` - ID of the invoice rendering template to use for future invoices.
            """
            @type t :: %__MODULE__{
                    amount_tax_display: String.t() | nil,
                    template: String.t() | nil
                  }
            defstruct [:amount_tax_display, :template]
          end

          def __inner_types__ do
            %{
              "custom_fields" => __MODULE__.CustomFields,
              "rendering" => __MODULE__.Rendering
            }
          end
        end

        def __inner_types__ do
          %{
            "invoice" => __MODULE__.Invoice
          }
        end
      end

      defmodule Capabilities do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `automatic_indirect_tax` - Generates requirements for enabling automatic indirect tax calculation on this customer's invoices or subscriptions. Recommended to request this capability if planning to enable automatic tax calculation on this customer's invoices or subscriptions.
        """
        @type t :: %__MODULE__{
                automatic_indirect_tax: __MODULE__.AutomaticIndirectTax.t() | nil
              }
        defstruct [:automatic_indirect_tax]

        defmodule AutomaticIndirectTax do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
          * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
          """
          @type t :: %__MODULE__{
                  status: String.t() | nil,
                  status_details: [__MODULE__.StatusDetails.t()] | nil
                }
          defstruct [:status, :status_details]

          defmodule StatusDetails do
            @moduledoc "Nested struct within the parent resource."

            @typedoc """
            * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
            * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
            """
            @type t :: %__MODULE__{
                    code: String.t() | nil,
                    resolution: String.t() | nil
                  }
            defstruct [:code, :resolution]
          end

          def __inner_types__ do
            %{
              "status_details" => __MODULE__.StatusDetails
            }
          end
        end

        def __inner_types__ do
          %{
            "automatic_indirect_tax" => __MODULE__.AutomaticIndirectTax
          }
        end
      end

      defmodule Shipping do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `address` - Customer shipping address.
        * `name` - Customer name.
        * `phone` - Customer phone (including extension).
        """
        @type t :: %__MODULE__{
                address: __MODULE__.Address.t() | nil,
                name: String.t() | nil,
                phone: String.t() | nil
              }
        defstruct [:address, :name, :phone]

        defmodule Address do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `city` - City, district, suburb, town, or village.
          * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)).
          * `line1` - Address line 1 (e.g., street, PO Box, or company name).
          * `line2` - Address line 2 (e.g., apartment, suite, unit, or building).
          * `postal_code` - ZIP or postal code.
          * `state` - State, county, province, or region.
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

        def __inner_types__ do
          %{
            "address" => __MODULE__.Address
          }
        end
      end

      def __inner_types__ do
        %{
          "automatic_indirect_tax" => __MODULE__.AutomaticIndirectTax,
          "billing" => __MODULE__.Billing,
          "capabilities" => __MODULE__.Capabilities,
          "shipping" => __MODULE__.Shipping
        }
      end
    end

    defmodule Merchant do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `applied` - Indicates whether the merchant configuration is active. You can deactivate or reactivate the merchant configuration by updating this property. Deactivating the configuration by setting this value to false doesn't delete the configuration's properties.
      * `bacs_debit_payments` - Settings for Bacs Direct Debit payments.
      * `branding` - Settings used to apply the merchant's branding to email receipts, invoices, Checkout, and other products.
      * `capabilities` - Capabilities that have been requested on the Merchant Configuration.
      * `card_payments` - Card payments settings.
      * `konbini_payments` - Settings specific to Konbini payments on the account.
      * `mcc` - The Merchant Category Code (MCC) for the merchant. MCCs classify businesses based on the goods or services they provide.
      * `script_statement_descriptor` - Settings for the default text that appears on statements for language variations.
      * `sepa_debit_payments` - Settings for SEPA Direct Debit payments.
      * `statement_descriptor` - Statement descriptor.
      * `support` - Publicly available contact information for sending support issues to.
      """
      @type t :: %__MODULE__{
              applied: boolean() | nil,
              bacs_debit_payments: __MODULE__.BacsDebitPayments.t() | nil,
              branding: __MODULE__.Branding.t() | nil,
              capabilities: __MODULE__.Capabilities.t() | nil,
              card_payments: __MODULE__.CardPayments.t() | nil,
              konbini_payments: __MODULE__.KonbiniPayments.t() | nil,
              mcc: String.t() | nil,
              script_statement_descriptor: __MODULE__.ScriptStatementDescriptor.t() | nil,
              sepa_debit_payments: __MODULE__.SepaDebitPayments.t() | nil,
              statement_descriptor: __MODULE__.StatementDescriptor.t() | nil,
              support: __MODULE__.Support.t() | nil
            }
      defstruct [
        :applied,
        :bacs_debit_payments,
        :branding,
        :capabilities,
        :card_payments,
        :konbini_payments,
        :mcc,
        :script_statement_descriptor,
        :sepa_debit_payments,
        :statement_descriptor,
        :support
      ]

      defmodule BacsDebitPayments do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `display_name` - Display name for Bacs Direct Debit payments.
        * `service_user_number` - Service User Number (SUN) for Bacs Direct Debit payments.
        """
        @type t :: %__MODULE__{
                display_name: String.t() | nil,
                service_user_number: String.t() | nil
              }
        defstruct [:display_name, :service_user_number]
      end

      defmodule Branding do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `icon` - ID of a [file upload](https://docs.stripe.com/api/persons/update#create_file): An icon for the merchant. Must be square and at least 128px x 128px.
        * `logo` - ID of a [file upload](https://docs.stripe.com/api/persons/update#create_file): A logo for the merchant that will be used in Checkout instead of the icon and without the merchant's name next to it if provided. Must be at least 128px x 128px.
        * `primary_color` - A CSS hex color value representing the primary branding color for the merchant.
        * `secondary_color` - A CSS hex color value representing the secondary branding color for the merchant.
        """
        @type t :: %__MODULE__{
                icon: String.t() | nil,
                logo: String.t() | nil,
                primary_color: String.t() | nil,
                secondary_color: String.t() | nil
              }
        defstruct [:icon, :logo, :primary_color, :secondary_color]
      end

      defmodule Capabilities do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `ach_debit_payments` - Allow the merchant to process ACH debit payments.
        * `acss_debit_payments` - Allow the merchant to process ACSS debit payments.
        * `affirm_payments` - Allow the merchant to process Affirm payments.
        * `afterpay_clearpay_payments` - Allow the merchant to process Afterpay/Clearpay payments.
        * `alma_payments` - Allow the merchant to process Alma payments.
        * `amazon_pay_payments` - Allow the merchant to process Amazon Pay payments.
        * `au_becs_debit_payments` - Allow the merchant to process Australian BECS Direct Debit payments.
        * `bacs_debit_payments` - Allow the merchant to process BACS Direct Debit payments.
        * `bancontact_payments` - Allow the merchant to process Bancontact payments.
        * `blik_payments` - Allow the merchant to process BLIK payments.
        * `boleto_payments` - Allow the merchant to process Boleto payments.
        * `card_payments` - Allow the merchant to collect card payments.
        * `cartes_bancaires_payments` - Allow the merchant to process Cartes Bancaires payments.
        * `cashapp_payments` - Allow the merchant to process Cash App payments.
        * `eps_payments` - Allow the merchant to process EPS payments.
        * `fpx_payments` - Allow the merchant to process FPX payments.
        * `gb_bank_transfer_payments` - Allow the merchant to process UK bank transfer payments.
        * `grabpay_payments` - Allow the merchant to process GrabPay payments.
        * `ideal_payments` - Allow the merchant to process iDEAL payments.
        * `jcb_payments` - Allow the merchant to process JCB card payments.
        * `jp_bank_transfer_payments` - Allow the merchant to process Japanese bank transfer payments.
        * `kakao_pay_payments` - Allow the merchant to process Kakao Pay payments.
        * `klarna_payments` - Allow the merchant to process Klarna payments.
        * `konbini_payments` - Allow the merchant to process Konbini convenience store payments.
        * `kr_card_payments` - Allow the merchant to process Korean card payments.
        * `link_payments` - Allow the merchant to process Link payments.
        * `mobilepay_payments` - Allow the merchant to process MobilePay payments.
        * `multibanco_payments` - Allow the merchant to process Multibanco payments.
        * `mx_bank_transfer_payments` - Allow the merchant to process Mexican bank transfer payments.
        * `naver_pay_payments` - Allow the merchant to process Naver Pay payments.
        * `oxxo_payments` - Allow the merchant to process OXXO payments.
        * `p24_payments` - Allow the merchant to process Przelewy24 (P24) payments.
        * `pay_by_bank_payments` - Allow the merchant to process Pay by Bank payments.
        * `payco_payments` - Allow the merchant to process PAYCO payments.
        * `paynow_payments` - Allow the merchant to process PayNow payments.
        * `promptpay_payments` - Allow the merchant to process PromptPay payments.
        * `revolut_pay_payments` - Allow the merchant to process Revolut Pay payments.
        * `samsung_pay_payments` - Allow the merchant to process Samsung Pay payments.
        * `sepa_bank_transfer_payments` - Allow the merchant to process SEPA bank transfer payments.
        * `sepa_debit_payments` - Allow the merchant to process SEPA Direct Debit payments.
        * `stripe_balance` - Capabilities that enable the merchant to manage their Stripe Balance (/v1/balance).
        * `swish_payments` - Allow the merchant to process Swish payments.
        * `twint_payments` - Allow the merchant to process TWINT payments.
        * `us_bank_transfer_payments` - Allow the merchant to process US bank transfer payments.
        * `zip_payments` - Allow the merchant to process Zip payments.
        """
        @type t :: %__MODULE__{
                ach_debit_payments: __MODULE__.AchDebitPayments.t() | nil,
                acss_debit_payments: __MODULE__.AcssDebitPayments.t() | nil,
                affirm_payments: __MODULE__.AffirmPayments.t() | nil,
                afterpay_clearpay_payments: __MODULE__.AfterpayClearpayPayments.t() | nil,
                alma_payments: __MODULE__.AlmaPayments.t() | nil,
                amazon_pay_payments: __MODULE__.AmazonPayPayments.t() | nil,
                au_becs_debit_payments: __MODULE__.AuBecsDebitPayments.t() | nil,
                bacs_debit_payments: __MODULE__.BacsDebitPayments.t() | nil,
                bancontact_payments: __MODULE__.BancontactPayments.t() | nil,
                blik_payments: __MODULE__.BlikPayments.t() | nil,
                boleto_payments: __MODULE__.BoletoPayments.t() | nil,
                card_payments: __MODULE__.CardPayments.t() | nil,
                cartes_bancaires_payments: __MODULE__.CartesBancairesPayments.t() | nil,
                cashapp_payments: __MODULE__.CashappPayments.t() | nil,
                eps_payments: __MODULE__.EpsPayments.t() | nil,
                fpx_payments: __MODULE__.FpxPayments.t() | nil,
                gb_bank_transfer_payments: __MODULE__.GbBankTransferPayments.t() | nil,
                grabpay_payments: __MODULE__.GrabpayPayments.t() | nil,
                ideal_payments: __MODULE__.IdealPayments.t() | nil,
                jcb_payments: __MODULE__.JcbPayments.t() | nil,
                jp_bank_transfer_payments: __MODULE__.JpBankTransferPayments.t() | nil,
                kakao_pay_payments: __MODULE__.KakaoPayPayments.t() | nil,
                klarna_payments: __MODULE__.KlarnaPayments.t() | nil,
                konbini_payments: __MODULE__.KonbiniPayments.t() | nil,
                kr_card_payments: __MODULE__.KrCardPayments.t() | nil,
                link_payments: __MODULE__.LinkPayments.t() | nil,
                mobilepay_payments: __MODULE__.MobilepayPayments.t() | nil,
                multibanco_payments: __MODULE__.MultibancoPayments.t() | nil,
                mx_bank_transfer_payments: __MODULE__.MxBankTransferPayments.t() | nil,
                naver_pay_payments: __MODULE__.NaverPayPayments.t() | nil,
                oxxo_payments: __MODULE__.OxxoPayments.t() | nil,
                p24_payments: __MODULE__.P24Payments.t() | nil,
                pay_by_bank_payments: __MODULE__.PayByBankPayments.t() | nil,
                payco_payments: __MODULE__.PaycoPayments.t() | nil,
                paynow_payments: __MODULE__.PaynowPayments.t() | nil,
                promptpay_payments: __MODULE__.PromptpayPayments.t() | nil,
                revolut_pay_payments: __MODULE__.RevolutPayPayments.t() | nil,
                samsung_pay_payments: __MODULE__.SamsungPayPayments.t() | nil,
                sepa_bank_transfer_payments: __MODULE__.SepaBankTransferPayments.t() | nil,
                sepa_debit_payments: __MODULE__.SepaDebitPayments.t() | nil,
                stripe_balance: __MODULE__.StripeBalance.t() | nil,
                swish_payments: __MODULE__.SwishPayments.t() | nil,
                twint_payments: __MODULE__.TwintPayments.t() | nil,
                us_bank_transfer_payments: __MODULE__.UsBankTransferPayments.t() | nil,
                zip_payments: __MODULE__.ZipPayments.t() | nil
              }
        defstruct [
          :ach_debit_payments,
          :acss_debit_payments,
          :affirm_payments,
          :afterpay_clearpay_payments,
          :alma_payments,
          :amazon_pay_payments,
          :au_becs_debit_payments,
          :bacs_debit_payments,
          :bancontact_payments,
          :blik_payments,
          :boleto_payments,
          :card_payments,
          :cartes_bancaires_payments,
          :cashapp_payments,
          :eps_payments,
          :fpx_payments,
          :gb_bank_transfer_payments,
          :grabpay_payments,
          :ideal_payments,
          :jcb_payments,
          :jp_bank_transfer_payments,
          :kakao_pay_payments,
          :klarna_payments,
          :konbini_payments,
          :kr_card_payments,
          :link_payments,
          :mobilepay_payments,
          :multibanco_payments,
          :mx_bank_transfer_payments,
          :naver_pay_payments,
          :oxxo_payments,
          :p24_payments,
          :pay_by_bank_payments,
          :payco_payments,
          :paynow_payments,
          :promptpay_payments,
          :revolut_pay_payments,
          :samsung_pay_payments,
          :sepa_bank_transfer_payments,
          :sepa_debit_payments,
          :stripe_balance,
          :swish_payments,
          :twint_payments,
          :us_bank_transfer_payments,
          :zip_payments
        ]

        defmodule AchDebitPayments do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
          * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
          """
          @type t :: %__MODULE__{
                  status: String.t() | nil,
                  status_details: [__MODULE__.StatusDetails.t()] | nil
                }
          defstruct [:status, :status_details]

          defmodule StatusDetails do
            @moduledoc "Nested struct within the parent resource."

            @typedoc """
            * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
            * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
            """
            @type t :: %__MODULE__{
                    code: String.t() | nil,
                    resolution: String.t() | nil
                  }
            defstruct [:code, :resolution]
          end

          def __inner_types__ do
            %{
              "status_details" => __MODULE__.StatusDetails
            }
          end
        end

        defmodule AcssDebitPayments do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
          * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
          """
          @type t :: %__MODULE__{
                  status: String.t() | nil,
                  status_details: [__MODULE__.StatusDetails.t()] | nil
                }
          defstruct [:status, :status_details]

          defmodule StatusDetails do
            @moduledoc "Nested struct within the parent resource."

            @typedoc """
            * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
            * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
            """
            @type t :: %__MODULE__{
                    code: String.t() | nil,
                    resolution: String.t() | nil
                  }
            defstruct [:code, :resolution]
          end

          def __inner_types__ do
            %{
              "status_details" => __MODULE__.StatusDetails
            }
          end
        end

        defmodule AffirmPayments do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
          * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
          """
          @type t :: %__MODULE__{
                  status: String.t() | nil,
                  status_details: [__MODULE__.StatusDetails.t()] | nil
                }
          defstruct [:status, :status_details]

          defmodule StatusDetails do
            @moduledoc "Nested struct within the parent resource."

            @typedoc """
            * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
            * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
            """
            @type t :: %__MODULE__{
                    code: String.t() | nil,
                    resolution: String.t() | nil
                  }
            defstruct [:code, :resolution]
          end

          def __inner_types__ do
            %{
              "status_details" => __MODULE__.StatusDetails
            }
          end
        end

        defmodule AfterpayClearpayPayments do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
          * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
          """
          @type t :: %__MODULE__{
                  status: String.t() | nil,
                  status_details: [__MODULE__.StatusDetails.t()] | nil
                }
          defstruct [:status, :status_details]

          defmodule StatusDetails do
            @moduledoc "Nested struct within the parent resource."

            @typedoc """
            * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
            * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
            """
            @type t :: %__MODULE__{
                    code: String.t() | nil,
                    resolution: String.t() | nil
                  }
            defstruct [:code, :resolution]
          end

          def __inner_types__ do
            %{
              "status_details" => __MODULE__.StatusDetails
            }
          end
        end

        defmodule AlmaPayments do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
          * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
          """
          @type t :: %__MODULE__{
                  status: String.t() | nil,
                  status_details: [__MODULE__.StatusDetails.t()] | nil
                }
          defstruct [:status, :status_details]

          defmodule StatusDetails do
            @moduledoc "Nested struct within the parent resource."

            @typedoc """
            * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
            * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
            """
            @type t :: %__MODULE__{
                    code: String.t() | nil,
                    resolution: String.t() | nil
                  }
            defstruct [:code, :resolution]
          end

          def __inner_types__ do
            %{
              "status_details" => __MODULE__.StatusDetails
            }
          end
        end

        defmodule AmazonPayPayments do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
          * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
          """
          @type t :: %__MODULE__{
                  status: String.t() | nil,
                  status_details: [__MODULE__.StatusDetails.t()] | nil
                }
          defstruct [:status, :status_details]

          defmodule StatusDetails do
            @moduledoc "Nested struct within the parent resource."

            @typedoc """
            * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
            * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
            """
            @type t :: %__MODULE__{
                    code: String.t() | nil,
                    resolution: String.t() | nil
                  }
            defstruct [:code, :resolution]
          end

          def __inner_types__ do
            %{
              "status_details" => __MODULE__.StatusDetails
            }
          end
        end

        defmodule AuBecsDebitPayments do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
          * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
          """
          @type t :: %__MODULE__{
                  status: String.t() | nil,
                  status_details: [__MODULE__.StatusDetails.t()] | nil
                }
          defstruct [:status, :status_details]

          defmodule StatusDetails do
            @moduledoc "Nested struct within the parent resource."

            @typedoc """
            * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
            * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
            """
            @type t :: %__MODULE__{
                    code: String.t() | nil,
                    resolution: String.t() | nil
                  }
            defstruct [:code, :resolution]
          end

          def __inner_types__ do
            %{
              "status_details" => __MODULE__.StatusDetails
            }
          end
        end

        defmodule BacsDebitPayments do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
          * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
          """
          @type t :: %__MODULE__{
                  status: String.t() | nil,
                  status_details: [__MODULE__.StatusDetails.t()] | nil
                }
          defstruct [:status, :status_details]

          defmodule StatusDetails do
            @moduledoc "Nested struct within the parent resource."

            @typedoc """
            * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
            * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
            """
            @type t :: %__MODULE__{
                    code: String.t() | nil,
                    resolution: String.t() | nil
                  }
            defstruct [:code, :resolution]
          end

          def __inner_types__ do
            %{
              "status_details" => __MODULE__.StatusDetails
            }
          end
        end

        defmodule BancontactPayments do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
          * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
          """
          @type t :: %__MODULE__{
                  status: String.t() | nil,
                  status_details: [__MODULE__.StatusDetails.t()] | nil
                }
          defstruct [:status, :status_details]

          defmodule StatusDetails do
            @moduledoc "Nested struct within the parent resource."

            @typedoc """
            * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
            * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
            """
            @type t :: %__MODULE__{
                    code: String.t() | nil,
                    resolution: String.t() | nil
                  }
            defstruct [:code, :resolution]
          end

          def __inner_types__ do
            %{
              "status_details" => __MODULE__.StatusDetails
            }
          end
        end

        defmodule BlikPayments do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
          * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
          """
          @type t :: %__MODULE__{
                  status: String.t() | nil,
                  status_details: [__MODULE__.StatusDetails.t()] | nil
                }
          defstruct [:status, :status_details]

          defmodule StatusDetails do
            @moduledoc "Nested struct within the parent resource."

            @typedoc """
            * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
            * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
            """
            @type t :: %__MODULE__{
                    code: String.t() | nil,
                    resolution: String.t() | nil
                  }
            defstruct [:code, :resolution]
          end

          def __inner_types__ do
            %{
              "status_details" => __MODULE__.StatusDetails
            }
          end
        end

        defmodule BoletoPayments do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
          * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
          """
          @type t :: %__MODULE__{
                  status: String.t() | nil,
                  status_details: [__MODULE__.StatusDetails.t()] | nil
                }
          defstruct [:status, :status_details]

          defmodule StatusDetails do
            @moduledoc "Nested struct within the parent resource."

            @typedoc """
            * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
            * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
            """
            @type t :: %__MODULE__{
                    code: String.t() | nil,
                    resolution: String.t() | nil
                  }
            defstruct [:code, :resolution]
          end

          def __inner_types__ do
            %{
              "status_details" => __MODULE__.StatusDetails
            }
          end
        end

        defmodule CardPayments do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
          * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
          """
          @type t :: %__MODULE__{
                  status: String.t() | nil,
                  status_details: [__MODULE__.StatusDetails.t()] | nil
                }
          defstruct [:status, :status_details]

          defmodule StatusDetails do
            @moduledoc "Nested struct within the parent resource."

            @typedoc """
            * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
            * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
            """
            @type t :: %__MODULE__{
                    code: String.t() | nil,
                    resolution: String.t() | nil
                  }
            defstruct [:code, :resolution]
          end

          def __inner_types__ do
            %{
              "status_details" => __MODULE__.StatusDetails
            }
          end
        end

        defmodule CartesBancairesPayments do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
          * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
          """
          @type t :: %__MODULE__{
                  status: String.t() | nil,
                  status_details: [__MODULE__.StatusDetails.t()] | nil
                }
          defstruct [:status, :status_details]

          defmodule StatusDetails do
            @moduledoc "Nested struct within the parent resource."

            @typedoc """
            * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
            * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
            """
            @type t :: %__MODULE__{
                    code: String.t() | nil,
                    resolution: String.t() | nil
                  }
            defstruct [:code, :resolution]
          end

          def __inner_types__ do
            %{
              "status_details" => __MODULE__.StatusDetails
            }
          end
        end

        defmodule CashappPayments do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
          * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
          """
          @type t :: %__MODULE__{
                  status: String.t() | nil,
                  status_details: [__MODULE__.StatusDetails.t()] | nil
                }
          defstruct [:status, :status_details]

          defmodule StatusDetails do
            @moduledoc "Nested struct within the parent resource."

            @typedoc """
            * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
            * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
            """
            @type t :: %__MODULE__{
                    code: String.t() | nil,
                    resolution: String.t() | nil
                  }
            defstruct [:code, :resolution]
          end

          def __inner_types__ do
            %{
              "status_details" => __MODULE__.StatusDetails
            }
          end
        end

        defmodule EpsPayments do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
          * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
          """
          @type t :: %__MODULE__{
                  status: String.t() | nil,
                  status_details: [__MODULE__.StatusDetails.t()] | nil
                }
          defstruct [:status, :status_details]

          defmodule StatusDetails do
            @moduledoc "Nested struct within the parent resource."

            @typedoc """
            * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
            * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
            """
            @type t :: %__MODULE__{
                    code: String.t() | nil,
                    resolution: String.t() | nil
                  }
            defstruct [:code, :resolution]
          end

          def __inner_types__ do
            %{
              "status_details" => __MODULE__.StatusDetails
            }
          end
        end

        defmodule FpxPayments do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
          * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
          """
          @type t :: %__MODULE__{
                  status: String.t() | nil,
                  status_details: [__MODULE__.StatusDetails.t()] | nil
                }
          defstruct [:status, :status_details]

          defmodule StatusDetails do
            @moduledoc "Nested struct within the parent resource."

            @typedoc """
            * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
            * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
            """
            @type t :: %__MODULE__{
                    code: String.t() | nil,
                    resolution: String.t() | nil
                  }
            defstruct [:code, :resolution]
          end

          def __inner_types__ do
            %{
              "status_details" => __MODULE__.StatusDetails
            }
          end
        end

        defmodule GbBankTransferPayments do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
          * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
          """
          @type t :: %__MODULE__{
                  status: String.t() | nil,
                  status_details: [__MODULE__.StatusDetails.t()] | nil
                }
          defstruct [:status, :status_details]

          defmodule StatusDetails do
            @moduledoc "Nested struct within the parent resource."

            @typedoc """
            * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
            * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
            """
            @type t :: %__MODULE__{
                    code: String.t() | nil,
                    resolution: String.t() | nil
                  }
            defstruct [:code, :resolution]
          end

          def __inner_types__ do
            %{
              "status_details" => __MODULE__.StatusDetails
            }
          end
        end

        defmodule GrabpayPayments do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
          * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
          """
          @type t :: %__MODULE__{
                  status: String.t() | nil,
                  status_details: [__MODULE__.StatusDetails.t()] | nil
                }
          defstruct [:status, :status_details]

          defmodule StatusDetails do
            @moduledoc "Nested struct within the parent resource."

            @typedoc """
            * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
            * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
            """
            @type t :: %__MODULE__{
                    code: String.t() | nil,
                    resolution: String.t() | nil
                  }
            defstruct [:code, :resolution]
          end

          def __inner_types__ do
            %{
              "status_details" => __MODULE__.StatusDetails
            }
          end
        end

        defmodule IdealPayments do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
          * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
          """
          @type t :: %__MODULE__{
                  status: String.t() | nil,
                  status_details: [__MODULE__.StatusDetails.t()] | nil
                }
          defstruct [:status, :status_details]

          defmodule StatusDetails do
            @moduledoc "Nested struct within the parent resource."

            @typedoc """
            * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
            * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
            """
            @type t :: %__MODULE__{
                    code: String.t() | nil,
                    resolution: String.t() | nil
                  }
            defstruct [:code, :resolution]
          end

          def __inner_types__ do
            %{
              "status_details" => __MODULE__.StatusDetails
            }
          end
        end

        defmodule JcbPayments do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
          * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
          """
          @type t :: %__MODULE__{
                  status: String.t() | nil,
                  status_details: [__MODULE__.StatusDetails.t()] | nil
                }
          defstruct [:status, :status_details]

          defmodule StatusDetails do
            @moduledoc "Nested struct within the parent resource."

            @typedoc """
            * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
            * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
            """
            @type t :: %__MODULE__{
                    code: String.t() | nil,
                    resolution: String.t() | nil
                  }
            defstruct [:code, :resolution]
          end

          def __inner_types__ do
            %{
              "status_details" => __MODULE__.StatusDetails
            }
          end
        end

        defmodule JpBankTransferPayments do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
          * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
          """
          @type t :: %__MODULE__{
                  status: String.t() | nil,
                  status_details: [__MODULE__.StatusDetails.t()] | nil
                }
          defstruct [:status, :status_details]

          defmodule StatusDetails do
            @moduledoc "Nested struct within the parent resource."

            @typedoc """
            * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
            * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
            """
            @type t :: %__MODULE__{
                    code: String.t() | nil,
                    resolution: String.t() | nil
                  }
            defstruct [:code, :resolution]
          end

          def __inner_types__ do
            %{
              "status_details" => __MODULE__.StatusDetails
            }
          end
        end

        defmodule KakaoPayPayments do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
          * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
          """
          @type t :: %__MODULE__{
                  status: String.t() | nil,
                  status_details: [__MODULE__.StatusDetails.t()] | nil
                }
          defstruct [:status, :status_details]

          defmodule StatusDetails do
            @moduledoc "Nested struct within the parent resource."

            @typedoc """
            * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
            * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
            """
            @type t :: %__MODULE__{
                    code: String.t() | nil,
                    resolution: String.t() | nil
                  }
            defstruct [:code, :resolution]
          end

          def __inner_types__ do
            %{
              "status_details" => __MODULE__.StatusDetails
            }
          end
        end

        defmodule KlarnaPayments do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
          * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
          """
          @type t :: %__MODULE__{
                  status: String.t() | nil,
                  status_details: [__MODULE__.StatusDetails.t()] | nil
                }
          defstruct [:status, :status_details]

          defmodule StatusDetails do
            @moduledoc "Nested struct within the parent resource."

            @typedoc """
            * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
            * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
            """
            @type t :: %__MODULE__{
                    code: String.t() | nil,
                    resolution: String.t() | nil
                  }
            defstruct [:code, :resolution]
          end

          def __inner_types__ do
            %{
              "status_details" => __MODULE__.StatusDetails
            }
          end
        end

        defmodule KonbiniPayments do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
          * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
          """
          @type t :: %__MODULE__{
                  status: String.t() | nil,
                  status_details: [__MODULE__.StatusDetails.t()] | nil
                }
          defstruct [:status, :status_details]

          defmodule StatusDetails do
            @moduledoc "Nested struct within the parent resource."

            @typedoc """
            * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
            * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
            """
            @type t :: %__MODULE__{
                    code: String.t() | nil,
                    resolution: String.t() | nil
                  }
            defstruct [:code, :resolution]
          end

          def __inner_types__ do
            %{
              "status_details" => __MODULE__.StatusDetails
            }
          end
        end

        defmodule KrCardPayments do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
          * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
          """
          @type t :: %__MODULE__{
                  status: String.t() | nil,
                  status_details: [__MODULE__.StatusDetails.t()] | nil
                }
          defstruct [:status, :status_details]

          defmodule StatusDetails do
            @moduledoc "Nested struct within the parent resource."

            @typedoc """
            * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
            * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
            """
            @type t :: %__MODULE__{
                    code: String.t() | nil,
                    resolution: String.t() | nil
                  }
            defstruct [:code, :resolution]
          end

          def __inner_types__ do
            %{
              "status_details" => __MODULE__.StatusDetails
            }
          end
        end

        defmodule LinkPayments do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
          * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
          """
          @type t :: %__MODULE__{
                  status: String.t() | nil,
                  status_details: [__MODULE__.StatusDetails.t()] | nil
                }
          defstruct [:status, :status_details]

          defmodule StatusDetails do
            @moduledoc "Nested struct within the parent resource."

            @typedoc """
            * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
            * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
            """
            @type t :: %__MODULE__{
                    code: String.t() | nil,
                    resolution: String.t() | nil
                  }
            defstruct [:code, :resolution]
          end

          def __inner_types__ do
            %{
              "status_details" => __MODULE__.StatusDetails
            }
          end
        end

        defmodule MobilepayPayments do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
          * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
          """
          @type t :: %__MODULE__{
                  status: String.t() | nil,
                  status_details: [__MODULE__.StatusDetails.t()] | nil
                }
          defstruct [:status, :status_details]

          defmodule StatusDetails do
            @moduledoc "Nested struct within the parent resource."

            @typedoc """
            * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
            * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
            """
            @type t :: %__MODULE__{
                    code: String.t() | nil,
                    resolution: String.t() | nil
                  }
            defstruct [:code, :resolution]
          end

          def __inner_types__ do
            %{
              "status_details" => __MODULE__.StatusDetails
            }
          end
        end

        defmodule MultibancoPayments do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
          * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
          """
          @type t :: %__MODULE__{
                  status: String.t() | nil,
                  status_details: [__MODULE__.StatusDetails.t()] | nil
                }
          defstruct [:status, :status_details]

          defmodule StatusDetails do
            @moduledoc "Nested struct within the parent resource."

            @typedoc """
            * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
            * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
            """
            @type t :: %__MODULE__{
                    code: String.t() | nil,
                    resolution: String.t() | nil
                  }
            defstruct [:code, :resolution]
          end

          def __inner_types__ do
            %{
              "status_details" => __MODULE__.StatusDetails
            }
          end
        end

        defmodule MxBankTransferPayments do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
          * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
          """
          @type t :: %__MODULE__{
                  status: String.t() | nil,
                  status_details: [__MODULE__.StatusDetails.t()] | nil
                }
          defstruct [:status, :status_details]

          defmodule StatusDetails do
            @moduledoc "Nested struct within the parent resource."

            @typedoc """
            * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
            * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
            """
            @type t :: %__MODULE__{
                    code: String.t() | nil,
                    resolution: String.t() | nil
                  }
            defstruct [:code, :resolution]
          end

          def __inner_types__ do
            %{
              "status_details" => __MODULE__.StatusDetails
            }
          end
        end

        defmodule NaverPayPayments do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
          * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
          """
          @type t :: %__MODULE__{
                  status: String.t() | nil,
                  status_details: [__MODULE__.StatusDetails.t()] | nil
                }
          defstruct [:status, :status_details]

          defmodule StatusDetails do
            @moduledoc "Nested struct within the parent resource."

            @typedoc """
            * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
            * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
            """
            @type t :: %__MODULE__{
                    code: String.t() | nil,
                    resolution: String.t() | nil
                  }
            defstruct [:code, :resolution]
          end

          def __inner_types__ do
            %{
              "status_details" => __MODULE__.StatusDetails
            }
          end
        end

        defmodule OxxoPayments do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
          * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
          """
          @type t :: %__MODULE__{
                  status: String.t() | nil,
                  status_details: [__MODULE__.StatusDetails.t()] | nil
                }
          defstruct [:status, :status_details]

          defmodule StatusDetails do
            @moduledoc "Nested struct within the parent resource."

            @typedoc """
            * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
            * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
            """
            @type t :: %__MODULE__{
                    code: String.t() | nil,
                    resolution: String.t() | nil
                  }
            defstruct [:code, :resolution]
          end

          def __inner_types__ do
            %{
              "status_details" => __MODULE__.StatusDetails
            }
          end
        end

        defmodule P24Payments do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
          * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
          """
          @type t :: %__MODULE__{
                  status: String.t() | nil,
                  status_details: [__MODULE__.StatusDetails.t()] | nil
                }
          defstruct [:status, :status_details]

          defmodule StatusDetails do
            @moduledoc "Nested struct within the parent resource."

            @typedoc """
            * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
            * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
            """
            @type t :: %__MODULE__{
                    code: String.t() | nil,
                    resolution: String.t() | nil
                  }
            defstruct [:code, :resolution]
          end

          def __inner_types__ do
            %{
              "status_details" => __MODULE__.StatusDetails
            }
          end
        end

        defmodule PayByBankPayments do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
          * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
          """
          @type t :: %__MODULE__{
                  status: String.t() | nil,
                  status_details: [__MODULE__.StatusDetails.t()] | nil
                }
          defstruct [:status, :status_details]

          defmodule StatusDetails do
            @moduledoc "Nested struct within the parent resource."

            @typedoc """
            * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
            * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
            """
            @type t :: %__MODULE__{
                    code: String.t() | nil,
                    resolution: String.t() | nil
                  }
            defstruct [:code, :resolution]
          end

          def __inner_types__ do
            %{
              "status_details" => __MODULE__.StatusDetails
            }
          end
        end

        defmodule PaycoPayments do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
          * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
          """
          @type t :: %__MODULE__{
                  status: String.t() | nil,
                  status_details: [__MODULE__.StatusDetails.t()] | nil
                }
          defstruct [:status, :status_details]

          defmodule StatusDetails do
            @moduledoc "Nested struct within the parent resource."

            @typedoc """
            * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
            * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
            """
            @type t :: %__MODULE__{
                    code: String.t() | nil,
                    resolution: String.t() | nil
                  }
            defstruct [:code, :resolution]
          end

          def __inner_types__ do
            %{
              "status_details" => __MODULE__.StatusDetails
            }
          end
        end

        defmodule PaynowPayments do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
          * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
          """
          @type t :: %__MODULE__{
                  status: String.t() | nil,
                  status_details: [__MODULE__.StatusDetails.t()] | nil
                }
          defstruct [:status, :status_details]

          defmodule StatusDetails do
            @moduledoc "Nested struct within the parent resource."

            @typedoc """
            * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
            * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
            """
            @type t :: %__MODULE__{
                    code: String.t() | nil,
                    resolution: String.t() | nil
                  }
            defstruct [:code, :resolution]
          end

          def __inner_types__ do
            %{
              "status_details" => __MODULE__.StatusDetails
            }
          end
        end

        defmodule PromptpayPayments do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
          * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
          """
          @type t :: %__MODULE__{
                  status: String.t() | nil,
                  status_details: [__MODULE__.StatusDetails.t()] | nil
                }
          defstruct [:status, :status_details]

          defmodule StatusDetails do
            @moduledoc "Nested struct within the parent resource."

            @typedoc """
            * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
            * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
            """
            @type t :: %__MODULE__{
                    code: String.t() | nil,
                    resolution: String.t() | nil
                  }
            defstruct [:code, :resolution]
          end

          def __inner_types__ do
            %{
              "status_details" => __MODULE__.StatusDetails
            }
          end
        end

        defmodule RevolutPayPayments do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
          * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
          """
          @type t :: %__MODULE__{
                  status: String.t() | nil,
                  status_details: [__MODULE__.StatusDetails.t()] | nil
                }
          defstruct [:status, :status_details]

          defmodule StatusDetails do
            @moduledoc "Nested struct within the parent resource."

            @typedoc """
            * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
            * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
            """
            @type t :: %__MODULE__{
                    code: String.t() | nil,
                    resolution: String.t() | nil
                  }
            defstruct [:code, :resolution]
          end

          def __inner_types__ do
            %{
              "status_details" => __MODULE__.StatusDetails
            }
          end
        end

        defmodule SamsungPayPayments do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
          * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
          """
          @type t :: %__MODULE__{
                  status: String.t() | nil,
                  status_details: [__MODULE__.StatusDetails.t()] | nil
                }
          defstruct [:status, :status_details]

          defmodule StatusDetails do
            @moduledoc "Nested struct within the parent resource."

            @typedoc """
            * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
            * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
            """
            @type t :: %__MODULE__{
                    code: String.t() | nil,
                    resolution: String.t() | nil
                  }
            defstruct [:code, :resolution]
          end

          def __inner_types__ do
            %{
              "status_details" => __MODULE__.StatusDetails
            }
          end
        end

        defmodule SepaBankTransferPayments do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
          * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
          """
          @type t :: %__MODULE__{
                  status: String.t() | nil,
                  status_details: [__MODULE__.StatusDetails.t()] | nil
                }
          defstruct [:status, :status_details]

          defmodule StatusDetails do
            @moduledoc "Nested struct within the parent resource."

            @typedoc """
            * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
            * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
            """
            @type t :: %__MODULE__{
                    code: String.t() | nil,
                    resolution: String.t() | nil
                  }
            defstruct [:code, :resolution]
          end

          def __inner_types__ do
            %{
              "status_details" => __MODULE__.StatusDetails
            }
          end
        end

        defmodule SepaDebitPayments do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
          * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
          """
          @type t :: %__MODULE__{
                  status: String.t() | nil,
                  status_details: [__MODULE__.StatusDetails.t()] | nil
                }
          defstruct [:status, :status_details]

          defmodule StatusDetails do
            @moduledoc "Nested struct within the parent resource."

            @typedoc """
            * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
            * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
            """
            @type t :: %__MODULE__{
                    code: String.t() | nil,
                    resolution: String.t() | nil
                  }
            defstruct [:code, :resolution]
          end

          def __inner_types__ do
            %{
              "status_details" => __MODULE__.StatusDetails
            }
          end
        end

        defmodule StripeBalance do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `payouts` - Enables this Account to complete payouts from their Stripe Balance (/v1/balance).
          """
          @type t :: %__MODULE__{
                  payouts: __MODULE__.Payouts.t() | nil
                }
          defstruct [:payouts]

          defmodule Payouts do
            @moduledoc "Nested struct within the parent resource."

            @typedoc """
            * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
            * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
            """
            @type t :: %__MODULE__{
                    status: String.t() | nil,
                    status_details: [__MODULE__.StatusDetails.t()] | nil
                  }
            defstruct [:status, :status_details]

            defmodule StatusDetails do
              @moduledoc "Nested struct within the parent resource."

              @typedoc """
              * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
              * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
              """
              @type t :: %__MODULE__{
                      code: String.t() | nil,
                      resolution: String.t() | nil
                    }
              defstruct [:code, :resolution]
            end

            def __inner_types__ do
              %{
                "status_details" => __MODULE__.StatusDetails
              }
            end
          end

          def __inner_types__ do
            %{
              "payouts" => __MODULE__.Payouts
            }
          end
        end

        defmodule SwishPayments do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
          * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
          """
          @type t :: %__MODULE__{
                  status: String.t() | nil,
                  status_details: [__MODULE__.StatusDetails.t()] | nil
                }
          defstruct [:status, :status_details]

          defmodule StatusDetails do
            @moduledoc "Nested struct within the parent resource."

            @typedoc """
            * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
            * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
            """
            @type t :: %__MODULE__{
                    code: String.t() | nil,
                    resolution: String.t() | nil
                  }
            defstruct [:code, :resolution]
          end

          def __inner_types__ do
            %{
              "status_details" => __MODULE__.StatusDetails
            }
          end
        end

        defmodule TwintPayments do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
          * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
          """
          @type t :: %__MODULE__{
                  status: String.t() | nil,
                  status_details: [__MODULE__.StatusDetails.t()] | nil
                }
          defstruct [:status, :status_details]

          defmodule StatusDetails do
            @moduledoc "Nested struct within the parent resource."

            @typedoc """
            * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
            * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
            """
            @type t :: %__MODULE__{
                    code: String.t() | nil,
                    resolution: String.t() | nil
                  }
            defstruct [:code, :resolution]
          end

          def __inner_types__ do
            %{
              "status_details" => __MODULE__.StatusDetails
            }
          end
        end

        defmodule UsBankTransferPayments do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
          * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
          """
          @type t :: %__MODULE__{
                  status: String.t() | nil,
                  status_details: [__MODULE__.StatusDetails.t()] | nil
                }
          defstruct [:status, :status_details]

          defmodule StatusDetails do
            @moduledoc "Nested struct within the parent resource."

            @typedoc """
            * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
            * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
            """
            @type t :: %__MODULE__{
                    code: String.t() | nil,
                    resolution: String.t() | nil
                  }
            defstruct [:code, :resolution]
          end

          def __inner_types__ do
            %{
              "status_details" => __MODULE__.StatusDetails
            }
          end
        end

        defmodule ZipPayments do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
          * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
          """
          @type t :: %__MODULE__{
                  status: String.t() | nil,
                  status_details: [__MODULE__.StatusDetails.t()] | nil
                }
          defstruct [:status, :status_details]

          defmodule StatusDetails do
            @moduledoc "Nested struct within the parent resource."

            @typedoc """
            * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
            * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
            """
            @type t :: %__MODULE__{
                    code: String.t() | nil,
                    resolution: String.t() | nil
                  }
            defstruct [:code, :resolution]
          end

          def __inner_types__ do
            %{
              "status_details" => __MODULE__.StatusDetails
            }
          end
        end

        def __inner_types__ do
          %{
            "ach_debit_payments" => __MODULE__.AchDebitPayments,
            "acss_debit_payments" => __MODULE__.AcssDebitPayments,
            "affirm_payments" => __MODULE__.AffirmPayments,
            "afterpay_clearpay_payments" => __MODULE__.AfterpayClearpayPayments,
            "alma_payments" => __MODULE__.AlmaPayments,
            "amazon_pay_payments" => __MODULE__.AmazonPayPayments,
            "au_becs_debit_payments" => __MODULE__.AuBecsDebitPayments,
            "bacs_debit_payments" => __MODULE__.BacsDebitPayments,
            "bancontact_payments" => __MODULE__.BancontactPayments,
            "blik_payments" => __MODULE__.BlikPayments,
            "boleto_payments" => __MODULE__.BoletoPayments,
            "card_payments" => __MODULE__.CardPayments,
            "cartes_bancaires_payments" => __MODULE__.CartesBancairesPayments,
            "cashapp_payments" => __MODULE__.CashappPayments,
            "eps_payments" => __MODULE__.EpsPayments,
            "fpx_payments" => __MODULE__.FpxPayments,
            "gb_bank_transfer_payments" => __MODULE__.GbBankTransferPayments,
            "grabpay_payments" => __MODULE__.GrabpayPayments,
            "ideal_payments" => __MODULE__.IdealPayments,
            "jcb_payments" => __MODULE__.JcbPayments,
            "jp_bank_transfer_payments" => __MODULE__.JpBankTransferPayments,
            "kakao_pay_payments" => __MODULE__.KakaoPayPayments,
            "klarna_payments" => __MODULE__.KlarnaPayments,
            "konbini_payments" => __MODULE__.KonbiniPayments,
            "kr_card_payments" => __MODULE__.KrCardPayments,
            "link_payments" => __MODULE__.LinkPayments,
            "mobilepay_payments" => __MODULE__.MobilepayPayments,
            "multibanco_payments" => __MODULE__.MultibancoPayments,
            "mx_bank_transfer_payments" => __MODULE__.MxBankTransferPayments,
            "naver_pay_payments" => __MODULE__.NaverPayPayments,
            "oxxo_payments" => __MODULE__.OxxoPayments,
            "p24_payments" => __MODULE__.P24Payments,
            "pay_by_bank_payments" => __MODULE__.PayByBankPayments,
            "payco_payments" => __MODULE__.PaycoPayments,
            "paynow_payments" => __MODULE__.PaynowPayments,
            "promptpay_payments" => __MODULE__.PromptpayPayments,
            "revolut_pay_payments" => __MODULE__.RevolutPayPayments,
            "samsung_pay_payments" => __MODULE__.SamsungPayPayments,
            "sepa_bank_transfer_payments" => __MODULE__.SepaBankTransferPayments,
            "sepa_debit_payments" => __MODULE__.SepaDebitPayments,
            "stripe_balance" => __MODULE__.StripeBalance,
            "swish_payments" => __MODULE__.SwishPayments,
            "twint_payments" => __MODULE__.TwintPayments,
            "us_bank_transfer_payments" => __MODULE__.UsBankTransferPayments,
            "zip_payments" => __MODULE__.ZipPayments
          }
        end
      end

      defmodule CardPayments do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `decline_on` - Automatically declines certain charge types regardless of whether the card issuer accepted or declined the charge.
        """
        @type t :: %__MODULE__{
                decline_on: __MODULE__.DeclineOn.t() | nil
              }
        defstruct [:decline_on]

        defmodule DeclineOn do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `avs_failure` - Whether Stripe automatically declines charges with an incorrect ZIP or postal code. This setting only applies when a ZIP or postal code is provided and they fail bank verification.
          * `cvc_failure` - Whether Stripe automatically declines charges with an incorrect CVC. This setting only applies when a CVC is provided and it fails bank verification.
          """
          @type t :: %__MODULE__{
                  avs_failure: boolean() | nil,
                  cvc_failure: boolean() | nil
                }
          defstruct [:avs_failure, :cvc_failure]
        end

        def __inner_types__ do
          %{
            "decline_on" => __MODULE__.DeclineOn
          }
        end
      end

      defmodule KonbiniPayments do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `support` - Support for Konbini payments.
        """
        @type t :: %__MODULE__{
                support: __MODULE__.Support.t() | nil
              }
        defstruct [:support]

        defmodule Support do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `email` - Support email address for Konbini payments.
          * `hours` - Support hours for Konbini payments.
          * `phone` - Support phone number for Konbini payments.
          """
          @type t :: %__MODULE__{
                  email: String.t() | nil,
                  hours: __MODULE__.Hours.t() | nil,
                  phone: String.t() | nil
                }
          defstruct [:email, :hours, :phone]

          defmodule Hours do
            @moduledoc "Nested struct within the parent resource."

            @typedoc """
            * `end_time` - Support hours end time (JST time of day) for in `HH:MM` format.
            * `start_time` - Support hours start time (JST time of day) for in `HH:MM` format.
            """
            @type t :: %__MODULE__{
                    end_time: String.t() | nil,
                    start_time: String.t() | nil
                  }
            defstruct [:end_time, :start_time]
          end

          def __inner_types__ do
            %{
              "hours" => __MODULE__.Hours
            }
          end
        end

        def __inner_types__ do
          %{
            "support" => __MODULE__.Support
          }
        end
      end

      defmodule ScriptStatementDescriptor do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `kana` - The Kana variation of statement_descriptor used for charges in Japan. Japanese statement descriptors have [special requirements](https://docs.stripe.com/get-started/account/statement-descriptors#set-japanese-statement-descriptors).
        * `kanji` - The Kanji variation of statement_descriptor used for charges in Japan. Japanese statement descriptors have [special requirements](https://docs.stripe.com/get-started/account/statement-descriptors#set-japanese-statement-descriptors).
        """
        @type t :: %__MODULE__{
                kana: __MODULE__.Kana.t() | nil,
                kanji: __MODULE__.Kanji.t() | nil
              }
        defstruct [:kana, :kanji]

        defmodule Kana do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `descriptor` - The default text that appears on statements for non-card charges outside of Japan. For card charges, if you don’t set a statement_descriptor_prefix, this text is also used as the statement descriptor prefix. In that case, if concatenating the statement descriptor suffix causes the combined statement descriptor to exceed 22 characters, we truncate the statement_descriptor text to limit the full descriptor to 22 characters. For more information about statement descriptors and their requirements, see the Merchant Configuration settings documentation.
          * `prefix` - Default text that appears on statements for card charges outside of Japan, prefixing any dynamic statement_descriptor_suffix specified on the charge. To maximize space for the dynamic part of the descriptor, keep this text short. If you don’t specify this value, statement_descriptor is used as the prefix. For more information about statement descriptors and their requirements, see the Merchant Configuration settings documentation.
          """
          @type t :: %__MODULE__{
                  descriptor: String.t() | nil,
                  prefix: String.t() | nil
                }
          defstruct [:descriptor, :prefix]
        end

        defmodule Kanji do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `descriptor` - The default text that appears on statements for non-card charges outside of Japan. For card charges, if you don’t set a statement_descriptor_prefix, this text is also used as the statement descriptor prefix. In that case, if concatenating the statement descriptor suffix causes the combined statement descriptor to exceed 22 characters, we truncate the statement_descriptor text to limit the full descriptor to 22 characters. For more information about statement descriptors and their requirements, see the Merchant Configuration settings documentation.
          * `prefix` - Default text that appears on statements for card charges outside of Japan, prefixing any dynamic statement_descriptor_suffix specified on the charge. To maximize space for the dynamic part of the descriptor, keep this text short. If you don’t specify this value, statement_descriptor is used as the prefix. For more information about statement descriptors and their requirements, see the Merchant Configuration settings documentation.
          """
          @type t :: %__MODULE__{
                  descriptor: String.t() | nil,
                  prefix: String.t() | nil
                }
          defstruct [:descriptor, :prefix]
        end

        def __inner_types__ do
          %{
            "kana" => __MODULE__.Kana,
            "kanji" => __MODULE__.Kanji
          }
        end
      end

      defmodule SepaDebitPayments do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `creditor_id` - Creditor ID for SEPA Direct Debit payments.
        """
        @type t :: %__MODULE__{
                creditor_id: String.t() | nil
              }
        defstruct [:creditor_id]
      end

      defmodule StatementDescriptor do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `descriptor` - The default text that appears on statements for non-card charges outside of Japan. For card charges, if you don’t set a statement_descriptor_prefix, this text is also used as the statement descriptor prefix. In that case, if concatenating the statement descriptor suffix causes the combined statement descriptor to exceed 22 characters, we truncate the statement_descriptor text to limit the full descriptor to 22 characters. For more information about statement descriptors and their requirements, see the Merchant Configuration settings documentation.
        * `prefix` - Default text that appears on statements for card charges outside of Japan, prefixing any dynamic statement_descriptor_suffix specified on the charge. To maximize space for the dynamic part of the descriptor, keep this text short. If you don’t specify this value, statement_descriptor is used as the prefix. For more information about statement descriptors and their requirements, see the Merchant Configuration settings documentation.
        """
        @type t :: %__MODULE__{
                descriptor: String.t() | nil,
                prefix: String.t() | nil
              }
        defstruct [:descriptor, :prefix]
      end

      defmodule Support do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `address` - A publicly available mailing address for sending support issues to.
        * `email` - A publicly available email address for sending support issues to.
        * `phone` - A publicly available phone number to call with support issues.
        * `url` - A publicly available website for handling support issues.
        """
        @type t :: %__MODULE__{
                address: __MODULE__.Address.t() | nil,
                email: String.t() | nil,
                phone: String.t() | nil,
                url: String.t() | nil
              }
        defstruct [:address, :email, :phone, :url]

        defmodule Address do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `city` - City, district, suburb, town, or village.
          * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)).
          * `line1` - Address line 1 (e.g., street, PO Box, or company name).
          * `line2` - Address line 2 (e.g., apartment, suite, unit, or building).
          * `postal_code` - ZIP or postal code.
          * `state` - State, county, province, or region.
          * `town` - Town or district.
          """
          @type t :: %__MODULE__{
                  city: String.t() | nil,
                  country: String.t() | nil,
                  line1: String.t() | nil,
                  line2: String.t() | nil,
                  postal_code: String.t() | nil,
                  state: String.t() | nil,
                  town: String.t() | nil
                }
          defstruct [:city, :country, :line1, :line2, :postal_code, :state, :town]
        end

        def __inner_types__ do
          %{
            "address" => __MODULE__.Address
          }
        end
      end

      def __inner_types__ do
        %{
          "bacs_debit_payments" => __MODULE__.BacsDebitPayments,
          "branding" => __MODULE__.Branding,
          "capabilities" => __MODULE__.Capabilities,
          "card_payments" => __MODULE__.CardPayments,
          "konbini_payments" => __MODULE__.KonbiniPayments,
          "script_statement_descriptor" => __MODULE__.ScriptStatementDescriptor,
          "sepa_debit_payments" => __MODULE__.SepaDebitPayments,
          "statement_descriptor" => __MODULE__.StatementDescriptor,
          "support" => __MODULE__.Support
        }
      end
    end

    defmodule Recipient do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `applied` - Indicates whether the recipient configuration is active. You can deactivate or reactivate the recipient configuration by updating this property. Deactivating the configuration by setting this value to false unrequest all capabilities within the configuration. It will not delete any of the configuration's other properties.
      * `capabilities` - Capabilities that have been requested on the Recipient Configuration.
      """
      @type t :: %__MODULE__{
              applied: boolean() | nil,
              capabilities: __MODULE__.Capabilities.t() | nil
            }
      defstruct [:applied, :capabilities]

      defmodule Capabilities do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `stripe_balance` - Capabilities that enable the recipient to manage their Stripe Balance (/v1/balance).
        """
        @type t :: %__MODULE__{
                stripe_balance: __MODULE__.StripeBalance.t() | nil
              }
        defstruct [:stripe_balance]

        defmodule StripeBalance do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `payouts` - Enables this Account to complete payouts from their Stripe Balance (/v1/balance).
          * `stripe_transfers` - Enables this Account to receive /v1/transfers into their Stripe Balance (/v1/balance).
          """
          @type t :: %__MODULE__{
                  payouts: __MODULE__.Payouts.t() | nil,
                  stripe_transfers: __MODULE__.StripeTransfers.t() | nil
                }
          defstruct [:payouts, :stripe_transfers]

          defmodule Payouts do
            @moduledoc "Nested struct within the parent resource."

            @typedoc """
            * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
            * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
            """
            @type t :: %__MODULE__{
                    status: String.t() | nil,
                    status_details: [__MODULE__.StatusDetails.t()] | nil
                  }
            defstruct [:status, :status_details]

            defmodule StatusDetails do
              @moduledoc "Nested struct within the parent resource."

              @typedoc """
              * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
              * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
              """
              @type t :: %__MODULE__{
                      code: String.t() | nil,
                      resolution: String.t() | nil
                    }
              defstruct [:code, :resolution]
            end

            def __inner_types__ do
              %{
                "status_details" => __MODULE__.StatusDetails
              }
            end
          end

          defmodule StripeTransfers do
            @moduledoc "Nested struct within the parent resource."

            @typedoc """
            * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
            * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
            """
            @type t :: %__MODULE__{
                    status: String.t() | nil,
                    status_details: [__MODULE__.StatusDetails.t()] | nil
                  }
            defstruct [:status, :status_details]

            defmodule StatusDetails do
              @moduledoc "Nested struct within the parent resource."

              @typedoc """
              * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
              * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
              """
              @type t :: %__MODULE__{
                      code: String.t() | nil,
                      resolution: String.t() | nil
                    }
              defstruct [:code, :resolution]
            end

            def __inner_types__ do
              %{
                "status_details" => __MODULE__.StatusDetails
              }
            end
          end

          def __inner_types__ do
            %{
              "payouts" => __MODULE__.Payouts,
              "stripe_transfers" => __MODULE__.StripeTransfers
            }
          end
        end

        def __inner_types__ do
          %{
            "stripe_balance" => __MODULE__.StripeBalance
          }
        end
      end

      def __inner_types__ do
        %{
          "capabilities" => __MODULE__.Capabilities
        }
      end
    end

    def __inner_types__ do
      %{
        "customer" => __MODULE__.Customer,
        "merchant" => __MODULE__.Merchant,
        "recipient" => __MODULE__.Recipient
      }
    end
  end

  defmodule Defaults do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    * `locales` - The Account's preferred locales (languages), ordered by preference.
    * `profile` - Account profile information.
    * `responsibilities` - Default responsibilities held by either Stripe or the platform.
    """
    @type t :: %__MODULE__{
            currency: String.t() | nil,
            locales: [String.t()] | nil,
            profile: __MODULE__.Profile.t() | nil,
            responsibilities: __MODULE__.Responsibilities.t() | nil
          }
    defstruct [:currency, :locales, :profile, :responsibilities]

    defmodule Profile do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `business_url` - The business's publicly-available website.
      * `doing_business_as` - The customer-facing business name.
      * `product_description` - Internal-only description of the product sold or service provided by the business. It's used by Stripe for risk and underwriting purposes.
      """
      @type t :: %__MODULE__{
              business_url: String.t() | nil,
              doing_business_as: String.t() | nil,
              product_description: String.t() | nil
            }
      defstruct [:business_url, :doing_business_as, :product_description]
    end

    defmodule Responsibilities do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `fees_collector` - Indicates whether the platform or connected account is responsible for paying Stripe fees for pricing-control-eligible products. Possible values: `application`, `application_custom`, `application_express`, `stripe`.
      * `losses_collector` - A value indicating responsibility for collecting requirements on this account. Possible values: `application`, `stripe`.
      * `requirements_collector` - A value indicating responsibility for collecting requirements on this account. Possible values: `application`, `stripe`.
      """
      @type t :: %__MODULE__{
              fees_collector: String.t() | nil,
              losses_collector: String.t() | nil,
              requirements_collector: String.t() | nil
            }
      defstruct [:fees_collector, :losses_collector, :requirements_collector]
    end

    def __inner_types__ do
      %{
        "profile" => __MODULE__.Profile,
        "responsibilities" => __MODULE__.Responsibilities
      }
    end
  end

  defmodule FutureRequirements do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `entries` - A list of requirements for the Account.
    * `minimum_transition_date` - The time at which the future requirements become effective. Format: date-time.
    * `summary` - An object containing an overview of requirements for the Account.
    """
    @type t :: %__MODULE__{
            entries: [__MODULE__.Entries.t()] | nil,
            minimum_transition_date: String.t() | nil,
            summary: __MODULE__.Summary.t() | nil
          }
    defstruct [:entries, :minimum_transition_date, :summary]

    defmodule Entries do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `awaiting_action_from` - Indicates whether the platform or Stripe is currently responsible for taking action on the requirement. Value can be `user` or `stripe`. Possible values: `stripe`, `user`.
      * `description` - Machine-readable string describing the requirement.
      * `errors` - Descriptions of why the requirement must be collected, or why the collected information isn't satisfactory to Stripe.
      * `impact` - A hash describing the impact of not collecting the requirement, or Stripe not being able to verify the collected information.
      * `minimum_deadline` - The soonest point when the account will be impacted by not providing the requirement.
      * `reference` - A reference to the location of the requirement.
      * `requested_reasons` - A list of reasons why Stripe is collecting the requirement.
      """
      @type t :: %__MODULE__{
              awaiting_action_from: String.t() | nil,
              description: String.t() | nil,
              errors: [__MODULE__.Errors.t()] | nil,
              impact: __MODULE__.Impact.t() | nil,
              minimum_deadline: __MODULE__.MinimumDeadline.t() | nil,
              reference: __MODULE__.Reference.t() | nil,
              requested_reasons: [__MODULE__.RequestedReasons.t()] | nil
            }
      defstruct [
        :awaiting_action_from,
        :description,
        :errors,
        :impact,
        :minimum_deadline,
        :reference,
        :requested_reasons
      ]

      defmodule Errors do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `code` - Machine-readable code describing the error. Possible values: `invalid_address_city_state_postal_code`, `invalid_address_highway_contract_box`, `invalid_address_private_mailbox`, `invalid_business_profile_name`, `invalid_business_profile_name_denylisted`, `invalid_company_name_denylisted`, `invalid_dob_age_over_maximum`, `invalid_dob_age_under_18`, `invalid_dob_age_under_minimum`, `invalid_product_description_length`, `invalid_product_description_url_match`, `invalid_representative_country`, `invalid_statement_descriptor_business_mismatch`, `invalid_statement_descriptor_denylisted`, `invalid_statement_descriptor_length`, `invalid_statement_descriptor_prefix_denylisted`, `invalid_statement_descriptor_prefix_mismatch`, `invalid_street_address`, `invalid_tax_id`, `invalid_tax_id_format`, `invalid_tos_acceptance`, `invalid_url_denylisted`, `invalid_url_format`, `invalid_url_website_business_information_mismatch`, `invalid_url_website_empty`, `invalid_url_website_inaccessible`, `invalid_url_website_inaccessible_geoblocked`, `invalid_url_website_inaccessible_password_protected`, `invalid_url_website_incomplete`, `invalid_url_website_incomplete_cancellation_policy`, `invalid_url_website_incomplete_customer_service_details`, `invalid_url_website_incomplete_legal_restrictions`, `invalid_url_website_incomplete_refund_policy`, `invalid_url_website_incomplete_return_policy`, `invalid_url_website_incomplete_terms_and_conditions`, `invalid_url_website_incomplete_under_construction`, `invalid_url_website_other`, `invalid_url_web_presence_detected`, `invalid_value_other`, `unresolvable_ip_address`, `unresolvable_postal_code`, `verification_directors_mismatch`, `verification_document_address_mismatch`, `verification_document_address_missing`, `verification_document_corrupt`, `verification_document_country_not_supported`, `verification_document_directors_mismatch`, `verification_document_dob_mismatch`, `verification_document_duplicate_type`, `verification_document_expired`, `verification_document_failed_copy`, `verification_document_failed_greyscale`, `verification_document_failed_other`, `verification_document_failed_test_mode`, `verification_document_fraudulent`, `verification_document_id_number_mismatch`, `verification_document_id_number_missing`, `verification_document_incomplete`, `verification_document_invalid`, `verification_document_issue_or_expiry_date_missing`, `verification_document_manipulated`, `verification_document_missing_back`, `verification_document_missing_front`, `verification_document_name_mismatch`, `verification_document_name_missing`, `verification_document_nationality_mismatch`, `verification_document_not_readable`, `verification_document_not_signed`, `verification_document_not_uploaded`, `verification_document_photo_mismatch`, `verification_document_too_large`, `verification_document_type_not_supported`, `verification_extraneous_directors`, `verification_failed_address_match`, `verification_failed_business_iec_number`, `verification_failed_document_match`, `verification_failed_id_number_match`, `verification_failed_keyed_identity`, `verification_failed_keyed_match`, `verification_failed_name_match`, `verification_failed_other`, `verification_failed_representative_authority`, `verification_failed_residential_address`, `verification_failed_tax_id_match`, `verification_failed_tax_id_not_issued`, `verification_missing_directors`, `verification_missing_executives`, `verification_missing_owners`, `verification_requires_additional_memorandum_of_associations`, `verification_requires_additional_proof_of_registration`, `verification_selfie_document_missing_photo`, `verification_selfie_face_mismatch`, `verification_selfie_manipulated`, `verification_selfie_unverified_other`, `verification_supportability`, `verification_token_stale`.
        * `description` - Human-readable description of the error.
        """
        @type t :: %__MODULE__{
                code: String.t() | nil,
                description: String.t() | nil
              }
        defstruct [:code, :description]
      end

      defmodule Impact do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `restricts_capabilities` - The Capabilities that will be restricted if the requirement is not collected and satisfactory to Stripe.
        """
        @type t :: %__MODULE__{
                restricts_capabilities: [__MODULE__.RestrictsCapabilities.t()] | nil
              }
        defstruct [:restricts_capabilities]

        defmodule RestrictsCapabilities do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `capability` - The name of the Capability which will be restricted. Possible values: `ach_debit_payments`, `acss_debit_payments`, `affirm_payments`, `afterpay_clearpay_payments`, `alma_payments`, `amazon_pay_payments`, `automatic_indirect_tax`, `au_becs_debit_payments`, `bacs_debit_payments`, `bancontact_payments`, `bank_accounts.local`, `bank_accounts.wire`, `blik_payments`, `boleto_payments`, `cards`, `card_payments`, `cartes_bancaires_payments`, `cashapp_payments`, `eps_payments`, `fpx_payments`, `gb_bank_transfer_payments`, `grabpay_payments`, `ideal_payments`, `jcb_payments`, `jp_bank_transfer_payments`, `kakao_pay_payments`, `klarna_payments`, `konbini_payments`, `kr_card_payments`, `link_payments`, `mobilepay_payments`, `multibanco_payments`, `mx_bank_transfer_payments`, `naver_pay_payments`, `oxxo_payments`, `p24_payments`, `payco_payments`, `paynow_payments`, `pay_by_bank_payments`, `promptpay_payments`, `revolut_pay_payments`, `samsung_pay_payments`, `sepa_bank_transfer_payments`, `sepa_debit_payments`, `stripe_balance.payouts`, `stripe_balance.stripe_transfers`, `swish_payments`, `twint_payments`, `us_bank_transfer_payments`, `zip_payments`.
          * `configuration` - The configuration which specifies the Capability which will be restricted. Possible values: `customer`, `merchant`, `recipient`.
          * `deadline` - Details about when in the account lifecycle the requirement must be collected by the avoid the Capability restriction.
          """
          @type t :: %__MODULE__{
                  capability: String.t() | nil,
                  configuration: String.t() | nil,
                  deadline: __MODULE__.Deadline.t() | nil
                }
          defstruct [:capability, :configuration, :deadline]

          defmodule Deadline do
            @moduledoc "Nested struct within the parent resource."

            @typedoc """
            * `status` - The current status of the requirement's impact. Possible values: `currently_due`, `eventually_due`, `past_due`.
            """
            @type t :: %__MODULE__{
                    status: String.t() | nil
                  }
            defstruct [:status]
          end

          def __inner_types__ do
            %{
              "deadline" => __MODULE__.Deadline
            }
          end
        end

        def __inner_types__ do
          %{
            "restricts_capabilities" => __MODULE__.RestrictsCapabilities
          }
        end
      end

      defmodule MinimumDeadline do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `status` - The current status of the requirement's impact. Possible values: `currently_due`, `eventually_due`, `past_due`.
        """
        @type t :: %__MODULE__{
                status: String.t() | nil
              }
        defstruct [:status]
      end

      defmodule Reference do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `inquiry` - If `inquiry` is the type, the inquiry token.
        * `resource` - If `resource` is the type, the resource token.
        * `type` - The type of the reference. If the type is "inquiry", the inquiry token can be found in the "inquiry" field.
        Otherwise the type is an API resource, the token for which can be found in the "resource" field. Possible values: `inquiry`, `payment_method`, `person`.
        """
        @type t :: %__MODULE__{
                inquiry: String.t() | nil,
                resource: String.t() | nil,
                type: String.t() | nil
              }
        defstruct [:inquiry, :resource, :type]
      end

      defmodule RequestedReasons do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `code` - Machine-readable description of Stripe's reason for collecting the requirement. Possible values: `routine_onboarding`, `routine_verification`.
        """
        @type t :: %__MODULE__{
                code: String.t() | nil
              }
        defstruct [:code]
      end

      def __inner_types__ do
        %{
          "errors" => __MODULE__.Errors,
          "impact" => __MODULE__.Impact,
          "minimum_deadline" => __MODULE__.MinimumDeadline,
          "reference" => __MODULE__.Reference,
          "requested_reasons" => __MODULE__.RequestedReasons
        }
      end
    end

    defmodule Summary do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `minimum_deadline` - The soonest date and time a requirement on the Account will become `past due`. Represented as a RFC 3339 date & time UTC value in millisecond precision, for example: `2022-09-18T13:22:18.123Z`.
      """
      @type t :: %__MODULE__{
              minimum_deadline: __MODULE__.MinimumDeadline.t() | nil
            }
      defstruct [:minimum_deadline]

      defmodule MinimumDeadline do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `status` - The current strictest status of all requirements on the Account. Possible values: `currently_due`, `eventually_due`, `past_due`.
        * `time` - The soonest RFC3339 date & time UTC value a requirement can impact the Account. Format: date-time.
        """
        @type t :: %__MODULE__{
                status: String.t() | nil,
                time: String.t() | nil
              }
        defstruct [:status, :time]
      end

      def __inner_types__ do
        %{
          "minimum_deadline" => __MODULE__.MinimumDeadline
        }
      end
    end

    def __inner_types__ do
      %{
        "entries" => __MODULE__.Entries,
        "summary" => __MODULE__.Summary
      }
    end
  end

  defmodule Identity do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `attestations` - Attestations from the identity's key people, e.g. owners, executives, directors, representatives.
    * `business_details` - Information about the company or business.
    * `country` - The country in which the account holder resides, or in which the business is legally established. This should be an [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country code.
    * `entity_type` - The entity type. Possible values: `company`, `government_entity`, `individual`, `non_profit`.
    * `individual` - Information about the individual represented by the Account. This property is `null` unless `entity_type` is set to `individual`.
    """
    @type t :: %__MODULE__{
            attestations: __MODULE__.Attestations.t() | nil,
            business_details: __MODULE__.BusinessDetails.t() | nil,
            country: String.t() | nil,
            entity_type: String.t() | nil,
            individual: __MODULE__.Individual.t() | nil
          }
    defstruct [:attestations, :business_details, :country, :entity_type, :individual]

    defmodule Attestations do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `directorship_declaration` - This hash is used to attest that the directors information provided to Stripe is both current and correct.
      * `ownership_declaration` - This hash is used to attest that the beneficial owner information provided to Stripe is both current and correct.
      * `persons_provided` - Attestation that all Persons with a specific Relationship value have been provided.
      * `representative_declaration` - This hash is used to attest that the representative is authorized to act as the representative of their legal entity.
      * `terms_of_service` - Attestations of accepted terms of service agreements.
      """
      @type t :: %__MODULE__{
              directorship_declaration: __MODULE__.DirectorshipDeclaration.t() | nil,
              ownership_declaration: __MODULE__.OwnershipDeclaration.t() | nil,
              persons_provided: __MODULE__.PersonsProvided.t() | nil,
              representative_declaration: __MODULE__.RepresentativeDeclaration.t() | nil,
              terms_of_service: __MODULE__.TermsOfService.t() | nil
            }
      defstruct [
        :directorship_declaration,
        :ownership_declaration,
        :persons_provided,
        :representative_declaration,
        :terms_of_service
      ]

      defmodule DirectorshipDeclaration do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `date` - The time marking when the director attestation was made. Represented as a RFC 3339 date & time UTC value in millisecond precision, for example: 2022-09-18T13:22:18.123Z. Format: date-time.
        * `ip` - The IP address from which the director attestation was made.
        * `user_agent` - The user agent of the browser from which the director attestation was made.
        """
        @type t :: %__MODULE__{
                date: String.t() | nil,
                ip: String.t() | nil,
                user_agent: String.t() | nil
              }
        defstruct [:date, :ip, :user_agent]
      end

      defmodule OwnershipDeclaration do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `date` - The time marking when the beneficial owner attestation was made. Represented as a RFC 3339 date & time UTC value in millisecond precision, for example: 2022-09-18T13:22:18.123Z. Format: date-time.
        * `ip` - The IP address from which the beneficial owner attestation was made.
        * `user_agent` - The user agent of the browser from which the beneficial owner attestation was made.
        """
        @type t :: %__MODULE__{
                date: String.t() | nil,
                ip: String.t() | nil,
                user_agent: String.t() | nil
              }
        defstruct [:date, :ip, :user_agent]
      end

      defmodule PersonsProvided do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `directors` - Whether the company’s directors have been provided. Set this Boolean to true after creating all the company’s directors with the [Persons API](https://docs.stripe.com/api/v2/core/accounts/createperson).
        * `executives` - Whether the company’s executives have been provided. Set this Boolean to true after creating all the company’s executives with the [Persons API](https://docs.stripe.com/api/v2/core/accounts/createperson).
        * `owners` - Whether the company’s owners have been provided. Set this Boolean to true after creating all the company’s owners with the [Persons API](https://docs.stripe.com/api/v2/core/accounts/createperson).
        * `ownership_exemption_reason` - Reason for why the company is exempt from providing ownership information. Possible values: `qualified_entity_exceeds_ownership_threshold`, `qualifies_as_financial_institution`.
        """
        @type t :: %__MODULE__{
                directors: boolean() | nil,
                executives: boolean() | nil,
                owners: boolean() | nil,
                ownership_exemption_reason: String.t() | nil
              }
        defstruct [:directors, :executives, :owners, :ownership_exemption_reason]
      end

      defmodule RepresentativeDeclaration do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `date` - The time marking when the representative attestation was made. Represented as a RFC 3339 date & time UTC value in millisecond precision, for example: 2022-09-18T13:22:18.123Z. Format: date-time.
        * `ip` - The IP address from which the representative attestation was made.
        * `user_agent` - The user agent of the browser from which the representative attestation was made.
        """
        @type t :: %__MODULE__{
                date: String.t() | nil,
                ip: String.t() | nil,
                user_agent: String.t() | nil
              }
        defstruct [:date, :ip, :user_agent]
      end

      defmodule TermsOfService do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `account` - Details on the Account's acceptance of the [Stripe Services Agreement](https://docs.stripe.com/connect/updating-accounts#tos-acceptance).
        """
        @type t :: %__MODULE__{
                account: __MODULE__.Account.t() | nil
              }
        defstruct [:account]

        defmodule Account do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `date` - The time when the Account's representative accepted the terms of service. Represented as a RFC 3339 date & time UTC value in millisecond precision, for example: 2022-09-18T13:22:18.123Z. Format: date-time.
          * `ip` - The IP address from which the Account's representative accepted the terms of service.
          * `user_agent` - The user agent of the browser from which the Account's representative accepted the terms of service.
          """
          @type t :: %__MODULE__{
                  date: String.t() | nil,
                  ip: String.t() | nil,
                  user_agent: String.t() | nil
                }
          defstruct [:date, :ip, :user_agent]
        end

        def __inner_types__ do
          %{
            "account" => __MODULE__.Account
          }
        end
      end

      def __inner_types__ do
        %{
          "directorship_declaration" => __MODULE__.DirectorshipDeclaration,
          "ownership_declaration" => __MODULE__.OwnershipDeclaration,
          "persons_provided" => __MODULE__.PersonsProvided,
          "representative_declaration" => __MODULE__.RepresentativeDeclaration,
          "terms_of_service" => __MODULE__.TermsOfService
        }
      end
    end

    defmodule BusinessDetails do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `address` - The company’s primary address.
      * `annual_revenue` - The business gross annual revenue for its preceding fiscal year.
      * `documents` - Documents that may be submitted to satisfy various informational requests.
      * `estimated_worker_count` - Estimated maximum number of workers currently engaged by the business (including employees, contractors, and vendors).
      * `id_numbers` - The provided ID numbers of a business entity.
      * `monthly_estimated_revenue` - An estimate of the monthly revenue of the business. Only accepted for accounts in Brazil and India.
      * `phone` - The company’s phone number (used for verification).
      * `registered_name` - The business legal name.
      * `registration_date` - When the business was incorporated or registered.
      * `script_addresses` - The business registration address of the business entity in non latin script.
      * `script_names` - The business legal name in non latin script.
      * `structure` - The category identifying the legal structure of the business. Possible values: `cooperative`, `free_zone_establishment`, `free_zone_llc`, `governmental_unit`, `government_instrumentality`, `incorporated_association`, `incorporated_non_profit`, `incorporated_partnership`, `limited_liability_partnership`, `llc`, `multi_member_llc`, `private_company`, `private_corporation`, `private_partnership`, `public_company`, `public_corporation`, `public_listed_corporation`, `public_partnership`, `registered_charity`, `single_member_llc`, `sole_establishment`, `sole_proprietorship`, `tax_exempt_government_instrumentality`, `trust`, `unincorporated_association`, `unincorporated_non_profit`, `unincorporated_partnership`.
      """
      @type t :: %__MODULE__{
              address: __MODULE__.Address.t() | nil,
              annual_revenue: __MODULE__.AnnualRevenue.t() | nil,
              documents: __MODULE__.Documents.t() | nil,
              estimated_worker_count: integer() | nil,
              id_numbers: [__MODULE__.IdNumbers.t()] | nil,
              monthly_estimated_revenue: __MODULE__.MonthlyEstimatedRevenue.t() | nil,
              phone: String.t() | nil,
              registered_name: String.t() | nil,
              registration_date: __MODULE__.RegistrationDate.t() | nil,
              script_addresses: __MODULE__.ScriptAddresses.t() | nil,
              script_names: __MODULE__.ScriptNames.t() | nil,
              structure: String.t() | nil
            }
      defstruct [
        :address,
        :annual_revenue,
        :documents,
        :estimated_worker_count,
        :id_numbers,
        :monthly_estimated_revenue,
        :phone,
        :registered_name,
        :registration_date,
        :script_addresses,
        :script_names,
        :structure
      ]

      defmodule Address do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `city` - City, district, suburb, town, or village.
        * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)).
        * `line1` - Address line 1 (e.g., street, PO Box, or company name).
        * `line2` - Address line 2 (e.g., apartment, suite, unit, or building).
        * `postal_code` - ZIP or postal code.
        * `state` - State, county, province, or region.
        * `town` - Town or district.
        """
        @type t :: %__MODULE__{
                city: String.t() | nil,
                country: String.t() | nil,
                line1: String.t() | nil,
                line2: String.t() | nil,
                postal_code: String.t() | nil,
                state: String.t() | nil,
                town: String.t() | nil
              }
        defstruct [:city, :country, :line1, :line2, :postal_code, :state, :town]
      end

      defmodule AnnualRevenue do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `amount` - Annual revenue amount in minor currency units (for example, '123' for 1.23 USD).
        * `fiscal_year_end` - The close-out date of the preceding fiscal year in ISO 8601 format. E.g. 2023-12-31 for the 31st of December, 2023.
        """
        @type t :: %__MODULE__{
                amount: __MODULE__.Amount.t() | nil,
                fiscal_year_end: String.t() | nil
              }
        defstruct [:amount, :fiscal_year_end]

        defmodule Amount do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
          * `value` - A non-negative integer representing how much to charge in the [smallest currency unit](https://docs.stripe.com/currencies#minor-units).
          """
          @type t :: %__MODULE__{
                  currency: String.t() | nil,
                  value: integer() | nil
                }
          defstruct [:currency, :value]
        end

        def __inner_types__ do
          %{
            "amount" => __MODULE__.Amount
          }
        end
      end

      defmodule Documents do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `bank_account_ownership_verification` - One or more documents that support the Bank account ownership verification requirement. Must be a document associated with the account’s primary active bank account that displays the last 4 digits of the account number, either a statement or a check.
        * `company_license` - One or more documents that demonstrate proof of a company’s license to operate.
        * `company_memorandum_of_association` - One or more documents showing the company’s Memorandum of Association.
        * `company_ministerial_decree` - Certain countries only: One or more documents showing the ministerial decree legalizing the company’s establishment.
        * `company_registration_verification` - One or more documents that demonstrate proof of a company’s registration with the appropriate local authorities.
        * `company_tax_id_verification` - One or more documents that demonstrate proof of a company’s tax ID.
        * `primary_verification` - A document verifying the business.
        * `proof_of_address` - One or more documents that demonstrate proof of address.
        * `proof_of_registration` - One or more documents showing the company’s proof of registration with the national business registry.
        * `proof_of_ultimate_beneficial_ownership` - One or more documents that demonstrate proof of ultimate beneficial ownership.
        """
        @type t :: %__MODULE__{
                bank_account_ownership_verification:
                  __MODULE__.BankAccountOwnershipVerification.t() | nil,
                company_license: __MODULE__.CompanyLicense.t() | nil,
                company_memorandum_of_association:
                  __MODULE__.CompanyMemorandumOfAssociation.t() | nil,
                company_ministerial_decree: __MODULE__.CompanyMinisterialDecree.t() | nil,
                company_registration_verification:
                  __MODULE__.CompanyRegistrationVerification.t() | nil,
                company_tax_id_verification: __MODULE__.CompanyTaxIdVerification.t() | nil,
                primary_verification: __MODULE__.PrimaryVerification.t() | nil,
                proof_of_address: __MODULE__.ProofOfAddress.t() | nil,
                proof_of_registration: __MODULE__.ProofOfRegistration.t() | nil,
                proof_of_ultimate_beneficial_ownership:
                  __MODULE__.ProofOfUltimateBeneficialOwnership.t() | nil
              }
        defstruct [
          :bank_account_ownership_verification,
          :company_license,
          :company_memorandum_of_association,
          :company_ministerial_decree,
          :company_registration_verification,
          :company_tax_id_verification,
          :primary_verification,
          :proof_of_address,
          :proof_of_registration,
          :proof_of_ultimate_beneficial_ownership
        ]

        defmodule BankAccountOwnershipVerification do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `files` - One or more document IDs returned by a [file upload](https://docs.stripe.com/api/persons/update#create_file) with a purpose value of `account_requirement`.
          * `type` - The format of the document. Currently supports `files` only. Possible values: `files`.
          """
          @type t :: %__MODULE__{
                  files: [String.t()] | nil,
                  type: String.t() | nil
                }
          defstruct [:files, :type]
        end

        defmodule CompanyLicense do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `files` - One or more document IDs returned by a [file upload](https://docs.stripe.com/api/persons/update#create_file) with a purpose value of `account_requirement`.
          * `type` - The format of the document. Currently supports `files` only. Possible values: `files`.
          """
          @type t :: %__MODULE__{
                  files: [String.t()] | nil,
                  type: String.t() | nil
                }
          defstruct [:files, :type]
        end

        defmodule CompanyMemorandumOfAssociation do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `files` - One or more document IDs returned by a [file upload](https://docs.stripe.com/api/persons/update#create_file) with a purpose value of `account_requirement`.
          * `type` - The format of the document. Currently supports `files` only. Possible values: `files`.
          """
          @type t :: %__MODULE__{
                  files: [String.t()] | nil,
                  type: String.t() | nil
                }
          defstruct [:files, :type]
        end

        defmodule CompanyMinisterialDecree do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `files` - One or more document IDs returned by a [file upload](https://docs.stripe.com/api/persons/update#create_file) with a purpose value of `account_requirement`.
          * `type` - The format of the document. Currently supports `files` only. Possible values: `files`.
          """
          @type t :: %__MODULE__{
                  files: [String.t()] | nil,
                  type: String.t() | nil
                }
          defstruct [:files, :type]
        end

        defmodule CompanyRegistrationVerification do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `files` - One or more document IDs returned by a [file upload](https://docs.stripe.com/api/persons/update#create_file) with a purpose value of `account_requirement`.
          * `type` - The format of the document. Currently supports `files` only. Possible values: `files`.
          """
          @type t :: %__MODULE__{
                  files: [String.t()] | nil,
                  type: String.t() | nil
                }
          defstruct [:files, :type]
        end

        defmodule CompanyTaxIdVerification do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `files` - One or more document IDs returned by a [file upload](https://docs.stripe.com/api/persons/update#create_file) with a purpose value of `account_requirement`.
          * `type` - The format of the document. Currently supports `files` only. Possible values: `files`.
          """
          @type t :: %__MODULE__{
                  files: [String.t()] | nil,
                  type: String.t() | nil
                }
          defstruct [:files, :type]
        end

        defmodule PrimaryVerification do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `front_back` - The [file upload](https://docs.stripe.com/api/persons/update#create_file) tokens for the front and back of the verification document.
          * `type` - The format of the verification document. Currently supports `front_back` only. Possible values: `front_back`.
          """
          @type t :: %__MODULE__{
                  front_back: __MODULE__.FrontBack.t() | nil,
                  type: String.t() | nil
                }
          defstruct [:front_back, :type]

          defmodule FrontBack do
            @moduledoc "Nested struct within the parent resource."

            @typedoc """
            * `back` - A [file upload](https://docs.stripe.com/api/persons/update#create_file) token representing the back of the verification document. The purpose of the uploaded file should be 'identity_document'. The uploaded file needs to be a color image (smaller than 8,000px by 8,000px), in JPG, PNG, or PDF format, and less than 10 MB in size.
            * `front` - A [file upload](https://docs.stripe.com/api/persons/update#create_file) token representing the front of the verification document. The purpose of the uploaded file should be 'identity_document'. The uploaded file needs to be a color image (smaller than 8,000px by 8,000px), in JPG, PNG, or PDF format, and less than 10 MB in size.
            """
            @type t :: %__MODULE__{
                    back: String.t() | nil,
                    front: String.t() | nil
                  }
            defstruct [:back, :front]
          end

          def __inner_types__ do
            %{
              "front_back" => __MODULE__.FrontBack
            }
          end
        end

        defmodule ProofOfAddress do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `files` - One or more document IDs returned by a [file upload](https://docs.stripe.com/api/persons/update#create_file) with a purpose value of `account_requirement`.
          * `type` - The format of the document. Currently supports `files` only. Possible values: `files`.
          """
          @type t :: %__MODULE__{
                  files: [String.t()] | nil,
                  type: String.t() | nil
                }
          defstruct [:files, :type]
        end

        defmodule ProofOfRegistration do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `files` - One or more document IDs returned by a [file upload](https://docs.stripe.com/api/persons/update#create_file) with a purpose value of `account_requirement`.
          * `type` - The format of the document. Currently supports `files` only. Possible values: `files`.
          """
          @type t :: %__MODULE__{
                  files: [String.t()] | nil,
                  type: String.t() | nil
                }
          defstruct [:files, :type]
        end

        defmodule ProofOfUltimateBeneficialOwnership do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `files` - One or more document IDs returned by a [file upload](https://docs.stripe.com/api/persons/update#create_file) with a purpose value of `account_requirement`.
          * `type` - The format of the document. Currently supports `files` only. Possible values: `files`.
          """
          @type t :: %__MODULE__{
                  files: [String.t()] | nil,
                  type: String.t() | nil
                }
          defstruct [:files, :type]
        end

        def __inner_types__ do
          %{
            "bank_account_ownership_verification" => __MODULE__.BankAccountOwnershipVerification,
            "company_license" => __MODULE__.CompanyLicense,
            "company_memorandum_of_association" => __MODULE__.CompanyMemorandumOfAssociation,
            "company_ministerial_decree" => __MODULE__.CompanyMinisterialDecree,
            "company_registration_verification" => __MODULE__.CompanyRegistrationVerification,
            "company_tax_id_verification" => __MODULE__.CompanyTaxIdVerification,
            "primary_verification" => __MODULE__.PrimaryVerification,
            "proof_of_address" => __MODULE__.ProofOfAddress,
            "proof_of_registration" => __MODULE__.ProofOfRegistration,
            "proof_of_ultimate_beneficial_ownership" =>
              __MODULE__.ProofOfUltimateBeneficialOwnership
          }
        end
      end

      defmodule IdNumbers do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `registrar` - The registrar of the ID number (Only valid for DE ID number types).
        * `type` - Open Enum. The ID number type of a business entity. Possible values: `ae_crn`, `ae_vat`, `ao_nif`, `ar_cuit`, `at_fn`, `at_stn`, `at_vat`, `au_abn`, `au_acn`, `au_in`, `az_tin`, `bd_etin`, `be_cbe`, `be_vat`, `bg_uic`, `bg_vat`, `br_cnpj`, `ca_cn`, `ca_crarr`, `ca_gst_hst`, `ca_neq`, `ca_rid`, `ch_chid`, `ch_uid`, `cr_cpj`, `cr_nite`, `cy_he`, `cy_tic`, `cy_vat`, `cz_ico`, `cz_vat`, `de_hrn`, `de_stn`, `de_vat`, `dk_cvr`, `dk_vat`, `do_rcn`, `ee_rk`, `ee_vat`, `es_cif`, `es_vat`, `fi_vat`, `fi_yt`, `fr_rna`, `fr_siren`, `fr_vat`, `gb_crn`, `gb_vat`, `gi_crn`, `gr_afm`, `gr_gemi`, `gr_vat`, `gt_nit`, `hk_br`, `hk_cr`, `hr_mbs`, `hr_oib`, `hr_vat`, `hu_cjs`, `hu_tin`, `hu_vat`, `ie_crn`, `ie_trn`, `ie_vat`, `it_rea`, `it_vat`, `jp_cn`, `kz_bin`, `li_uid`, `lt_ccrn`, `lt_vat`, `lu_nif`, `lu_rcs`, `lu_vat`, `lv_urn`, `lv_vat`, `mt_crn`, `mt_tin`, `mt_vat`, `mx_rfc`, `my_brn`, `my_coid`, `my_itn`, `my_sst`, `mz_nuit`, `nl_kvk`, `nl_rsin`, `nl_vat`, `no_orgnr`, `nz_bn`, `nz_ird`, `pe_ruc`, `pk_ntn`, `pl_nip`, `pl_regon`, `pl_vat`, `pt_vat`, `ro_cui`, `ro_orc`, `ro_vat`, `sa_crn`, `sa_tin`, `se_orgnr`, `se_vat`, `sg_uen`, `si_msp`, `si_tin`, `si_vat`, `sk_dic`, `sk_ico`, `sk_vat`, `th_crn`, `th_prn`, `th_tin`, `us_ein`.
        """
        @type t :: %__MODULE__{
                registrar: String.t() | nil,
                type: String.t() | nil
              }
        defstruct [:registrar, :type]
      end

      defmodule MonthlyEstimatedRevenue do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `amount` - Estimated monthly revenue amount in minor currency units (for example, '123' for 1.23 USD).
        """
        @type t :: %__MODULE__{
                amount: __MODULE__.Amount.t() | nil
              }
        defstruct [:amount]

        defmodule Amount do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
          * `value` - A non-negative integer representing how much to charge in the [smallest currency unit](https://docs.stripe.com/currencies#minor-units).
          """
          @type t :: %__MODULE__{
                  currency: String.t() | nil,
                  value: integer() | nil
                }
          defstruct [:currency, :value]
        end

        def __inner_types__ do
          %{
            "amount" => __MODULE__.Amount
          }
        end
      end

      defmodule RegistrationDate do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `day` - The day of registration, between 1 and 31.
        * `month` - The month of registration, between 1 and 12.
        * `year` - The four-digit year of registration.
        """
        @type t :: %__MODULE__{
                day: integer() | nil,
                month: integer() | nil,
                year: integer() | nil
              }
        defstruct [:day, :month, :year]
      end

      defmodule ScriptAddresses do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `kana` - Kana Address.
        * `kanji` - Kanji Address.
        """
        @type t :: %__MODULE__{
                kana: __MODULE__.Kana.t() | nil,
                kanji: __MODULE__.Kanji.t() | nil
              }
        defstruct [:kana, :kanji]

        defmodule Kana do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `city` - City, district, suburb, town, or village.
          * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)).
          * `line1` - Address line 1 (e.g., street, PO Box, or company name).
          * `line2` - Address line 2 (e.g., apartment, suite, unit, or building).
          * `postal_code` - ZIP or postal code.
          * `state` - State, county, province, or region.
          * `town` - Town or district.
          """
          @type t :: %__MODULE__{
                  city: String.t() | nil,
                  country: String.t() | nil,
                  line1: String.t() | nil,
                  line2: String.t() | nil,
                  postal_code: String.t() | nil,
                  state: String.t() | nil,
                  town: String.t() | nil
                }
          defstruct [:city, :country, :line1, :line2, :postal_code, :state, :town]
        end

        defmodule Kanji do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `city` - City, district, suburb, town, or village.
          * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)).
          * `line1` - Address line 1 (e.g., street, PO Box, or company name).
          * `line2` - Address line 2 (e.g., apartment, suite, unit, or building).
          * `postal_code` - ZIP or postal code.
          * `state` - State, county, province, or region.
          * `town` - Town or district.
          """
          @type t :: %__MODULE__{
                  city: String.t() | nil,
                  country: String.t() | nil,
                  line1: String.t() | nil,
                  line2: String.t() | nil,
                  postal_code: String.t() | nil,
                  state: String.t() | nil,
                  town: String.t() | nil
                }
          defstruct [:city, :country, :line1, :line2, :postal_code, :state, :town]
        end

        def __inner_types__ do
          %{
            "kana" => __MODULE__.Kana,
            "kanji" => __MODULE__.Kanji
          }
        end
      end

      defmodule ScriptNames do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `kana` - Kana name.
        * `kanji` - Kanji name.
        """
        @type t :: %__MODULE__{
                kana: __MODULE__.Kana.t() | nil,
                kanji: __MODULE__.Kanji.t() | nil
              }
        defstruct [:kana, :kanji]

        defmodule Kana do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `registered_name` - Registered name of the business.
          """
          @type t :: %__MODULE__{
                  registered_name: String.t() | nil
                }
          defstruct [:registered_name]
        end

        defmodule Kanji do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `registered_name` - Registered name of the business.
          """
          @type t :: %__MODULE__{
                  registered_name: String.t() | nil
                }
          defstruct [:registered_name]
        end

        def __inner_types__ do
          %{
            "kana" => __MODULE__.Kana,
            "kanji" => __MODULE__.Kanji
          }
        end
      end

      def __inner_types__ do
        %{
          "address" => __MODULE__.Address,
          "annual_revenue" => __MODULE__.AnnualRevenue,
          "documents" => __MODULE__.Documents,
          "id_numbers" => __MODULE__.IdNumbers,
          "monthly_estimated_revenue" => __MODULE__.MonthlyEstimatedRevenue,
          "registration_date" => __MODULE__.RegistrationDate,
          "script_addresses" => __MODULE__.ScriptAddresses,
          "script_names" => __MODULE__.ScriptNames
        }
      end
    end

    defmodule Individual do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `account` - The account ID which the individual belongs to.
      * `additional_addresses` - Additional addresses associated with the individual.
      * `additional_names` - Additional names (e.g. aliases) associated with the individual.
      * `additional_terms_of_service` - Terms of service acceptances.
      * `address` - The individual's residential address.
      * `created` - Time at which the object was created. Represented as a RFC 3339 date & time UTC value in millisecond precision, for example: 2022-09-18T13:22:18.123Z. Format: date-time.
      * `date_of_birth` - The individual's date of birth.
      * `documents` - Documents that may be submitted to satisfy various informational requests.
      * `email` - The individual's email address.
      * `given_name` - The individual's first name.
      * `id` - Unique identifier for the object.
      * `id_numbers` - The identification numbers (e.g., SSN) associated with the individual.
      * `legal_gender` - The individual's gender (International regulations require either "male” or "female"). Possible values: `female`, `male`.
      * `metadata` - Set of key-value pairs that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
      * `nationalities` - The countries where the individual is a national. Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)).
      * `object` - String representing the object's type. Objects of the same type share the same value.
      * `phone` - The individual's phone number.
      * `political_exposure` - Indicates if the individual or any of their representatives, family members, or other closely related persons, declares that they hold or have held an important public job or function, in any jurisdiction. Possible values: `existing`, `none`.
      * `relationship` - The relationship that this individual has with the Account's identity.
      * `script_addresses` - The script addresses (e.g., non-Latin characters) associated with the individual.
      * `script_names` - The script names (e.g. non-Latin characters) associated with the individual.
      * `surname` - The individual's last name.
      * `updated` - Time at which the object was last updated. Format: date-time.
      """
      @type t :: %__MODULE__{
              account: String.t() | nil,
              additional_addresses: [__MODULE__.AdditionalAddresses.t()] | nil,
              additional_names: [__MODULE__.AdditionalNames.t()] | nil,
              additional_terms_of_service: __MODULE__.AdditionalTermsOfService.t() | nil,
              address: __MODULE__.Address.t() | nil,
              created: String.t() | nil,
              date_of_birth: __MODULE__.DateOfBirth.t() | nil,
              documents: __MODULE__.Documents.t() | nil,
              email: String.t() | nil,
              given_name: String.t() | nil,
              id: String.t() | nil,
              id_numbers: [__MODULE__.IdNumbers.t()] | nil,
              legal_gender: String.t() | nil,
              metadata: %{String.t() => String.t()} | nil,
              nationalities: [String.t()] | nil,
              object: String.t() | nil,
              phone: String.t() | nil,
              political_exposure: String.t() | nil,
              relationship: __MODULE__.Relationship.t() | nil,
              script_addresses: __MODULE__.ScriptAddresses.t() | nil,
              script_names: __MODULE__.ScriptNames.t() | nil,
              surname: String.t() | nil,
              updated: String.t() | nil
            }
      defstruct [
        :account,
        :additional_addresses,
        :additional_names,
        :additional_terms_of_service,
        :address,
        :created,
        :date_of_birth,
        :documents,
        :email,
        :given_name,
        :id,
        :id_numbers,
        :legal_gender,
        :metadata,
        :nationalities,
        :object,
        :phone,
        :political_exposure,
        :relationship,
        :script_addresses,
        :script_names,
        :surname,
        :updated
      ]

      defmodule AdditionalAddresses do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `city` - City, district, suburb, town, or village.
        * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)).
        * `line1` - Address line 1 (e.g., street, PO Box, or company name).
        * `line2` - Address line 2 (e.g., apartment, suite, unit, or building).
        * `postal_code` - ZIP or postal code.
        * `purpose` - Purpose of additional address. Possible values: `registered`.
        * `state` - State, county, province, or region.
        * `town` - Town or district.
        """
        @type t :: %__MODULE__{
                city: String.t() | nil,
                country: String.t() | nil,
                line1: String.t() | nil,
                line2: String.t() | nil,
                postal_code: String.t() | nil,
                purpose: String.t() | nil,
                state: String.t() | nil,
                town: String.t() | nil
              }
        defstruct [:city, :country, :line1, :line2, :postal_code, :purpose, :state, :town]
      end

      defmodule AdditionalNames do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `full_name` - The individual's full name.
        * `given_name` - The individual's first or given name.
        * `purpose` - The purpose or type of the additional name. Possible values: `alias`, `maiden`.
        * `surname` - The individual's last or family name.
        """
        @type t :: %__MODULE__{
                full_name: String.t() | nil,
                given_name: String.t() | nil,
                purpose: String.t() | nil,
                surname: String.t() | nil
              }
        defstruct [:full_name, :given_name, :purpose, :surname]
      end

      defmodule AdditionalTermsOfService do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `account` - Stripe terms of service agreement.
        """
        @type t :: %__MODULE__{
                account: __MODULE__.Account.t() | nil
              }
        defstruct [:account]

        defmodule Account do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `date` - The time when the Account's representative accepted the terms of service. Represented as a RFC 3339 date & time UTC value in millisecond precision, for example: 2022-09-18T13:22:18.123Z. Format: date-time.
          * `ip` - The IP address from which the Account's representative accepted the terms of service.
          * `user_agent` - The user agent of the browser from which the Account's representative accepted the terms of service.
          """
          @type t :: %__MODULE__{
                  date: String.t() | nil,
                  ip: String.t() | nil,
                  user_agent: String.t() | nil
                }
          defstruct [:date, :ip, :user_agent]
        end

        def __inner_types__ do
          %{
            "account" => __MODULE__.Account
          }
        end
      end

      defmodule Address do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `city` - City, district, suburb, town, or village.
        * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)).
        * `line1` - Address line 1 (e.g., street, PO Box, or company name).
        * `line2` - Address line 2 (e.g., apartment, suite, unit, or building).
        * `postal_code` - ZIP or postal code.
        * `state` - State, county, province, or region.
        * `town` - Town or district.
        """
        @type t :: %__MODULE__{
                city: String.t() | nil,
                country: String.t() | nil,
                line1: String.t() | nil,
                line2: String.t() | nil,
                postal_code: String.t() | nil,
                state: String.t() | nil,
                town: String.t() | nil
              }
        defstruct [:city, :country, :line1, :line2, :postal_code, :state, :town]
      end

      defmodule DateOfBirth do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `day` - The day of birth, between 1 and 31.
        * `month` - The month of birth, between 1 and 12.
        * `year` - The four-digit year of birth.
        """
        @type t :: %__MODULE__{
                day: integer() | nil,
                month: integer() | nil,
                year: integer() | nil
              }
        defstruct [:day, :month, :year]
      end

      defmodule Documents do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `company_authorization` - One or more documents that demonstrate proof that this person is authorized to represent the company.
        * `passport` - One or more documents showing the person’s passport page with photo and personal data.
        * `primary_verification` - An identifying document showing the person's name, either a passport or local ID card.
        * `secondary_verification` - A document showing address, either a passport, local ID card, or utility bill from a well-known utility company.
        * `visa` - One or more documents showing the person’s visa required for living in the country where they are residing.
        """
        @type t :: %__MODULE__{
                company_authorization: __MODULE__.CompanyAuthorization.t() | nil,
                passport: __MODULE__.Passport.t() | nil,
                primary_verification: __MODULE__.PrimaryVerification.t() | nil,
                secondary_verification: __MODULE__.SecondaryVerification.t() | nil,
                visa: __MODULE__.Visa.t() | nil
              }
        defstruct [
          :company_authorization,
          :passport,
          :primary_verification,
          :secondary_verification,
          :visa
        ]

        defmodule CompanyAuthorization do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `files` - One or more document IDs returned by a [file upload](https://docs.stripe.com/api/persons/update#create_file) with a purpose value of `account_requirement`.
          * `type` - The format of the document. Currently supports `files` only. Possible values: `files`.
          """
          @type t :: %__MODULE__{
                  files: [String.t()] | nil,
                  type: String.t() | nil
                }
          defstruct [:files, :type]
        end

        defmodule Passport do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `files` - One or more document IDs returned by a [file upload](https://docs.stripe.com/api/persons/update#create_file) with a purpose value of `account_requirement`.
          * `type` - The format of the document. Currently supports `files` only. Possible values: `files`.
          """
          @type t :: %__MODULE__{
                  files: [String.t()] | nil,
                  type: String.t() | nil
                }
          defstruct [:files, :type]
        end

        defmodule PrimaryVerification do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `front_back` - The [file upload](https://docs.stripe.com/api/persons/update#create_file) tokens for the front and back of the verification document.
          * `type` - The format of the verification document. Currently supports `front_back` only. Possible values: `front_back`.
          """
          @type t :: %__MODULE__{
                  front_back: __MODULE__.FrontBack.t() | nil,
                  type: String.t() | nil
                }
          defstruct [:front_back, :type]

          defmodule FrontBack do
            @moduledoc "Nested struct within the parent resource."

            @typedoc """
            * `back` - A [file upload](https://docs.stripe.com/api/persons/update#create_file) token representing the back of the verification document. The purpose of the uploaded file should be 'identity_document'. The uploaded file needs to be a color image (smaller than 8,000px by 8,000px), in JPG, PNG, or PDF format, and less than 10 MB in size.
            * `front` - A [file upload](https://docs.stripe.com/api/persons/update#create_file) token representing the front of the verification document. The purpose of the uploaded file should be 'identity_document'. The uploaded file needs to be a color image (smaller than 8,000px by 8,000px), in JPG, PNG, or PDF format, and less than 10 MB in size.
            """
            @type t :: %__MODULE__{
                    back: String.t() | nil,
                    front: String.t() | nil
                  }
            defstruct [:back, :front]
          end

          def __inner_types__ do
            %{
              "front_back" => __MODULE__.FrontBack
            }
          end
        end

        defmodule SecondaryVerification do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `front_back` - The [file upload](https://docs.stripe.com/api/persons/update#create_file) tokens for the front and back of the verification document.
          * `type` - The format of the verification document. Currently supports `front_back` only. Possible values: `front_back`.
          """
          @type t :: %__MODULE__{
                  front_back: __MODULE__.FrontBack.t() | nil,
                  type: String.t() | nil
                }
          defstruct [:front_back, :type]

          defmodule FrontBack do
            @moduledoc "Nested struct within the parent resource."

            @typedoc """
            * `back` - A [file upload](https://docs.stripe.com/api/persons/update#create_file) token representing the back of the verification document. The purpose of the uploaded file should be 'identity_document'. The uploaded file needs to be a color image (smaller than 8,000px by 8,000px), in JPG, PNG, or PDF format, and less than 10 MB in size.
            * `front` - A [file upload](https://docs.stripe.com/api/persons/update#create_file) token representing the front of the verification document. The purpose of the uploaded file should be 'identity_document'. The uploaded file needs to be a color image (smaller than 8,000px by 8,000px), in JPG, PNG, or PDF format, and less than 10 MB in size.
            """
            @type t :: %__MODULE__{
                    back: String.t() | nil,
                    front: String.t() | nil
                  }
            defstruct [:back, :front]
          end

          def __inner_types__ do
            %{
              "front_back" => __MODULE__.FrontBack
            }
          end
        end

        defmodule Visa do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `files` - One or more document IDs returned by a [file upload](https://docs.stripe.com/api/persons/update#create_file) with a purpose value of `account_requirement`.
          * `type` - The format of the document. Currently supports `files` only. Possible values: `files`.
          """
          @type t :: %__MODULE__{
                  files: [String.t()] | nil,
                  type: String.t() | nil
                }
          defstruct [:files, :type]
        end

        def __inner_types__ do
          %{
            "company_authorization" => __MODULE__.CompanyAuthorization,
            "passport" => __MODULE__.Passport,
            "primary_verification" => __MODULE__.PrimaryVerification,
            "secondary_verification" => __MODULE__.SecondaryVerification,
            "visa" => __MODULE__.Visa
          }
        end
      end

      defmodule IdNumbers do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `type` - The ID number type of an individual. Possible values: `ae_eid`, `ao_nif`, `ar_cuil`, `ar_dni`, `at_stn`, `az_tin`, `bd_brc`, `bd_etin`, `bd_nid`, `be_nrn`, `bg_ucn`, `bn_nric`, `br_cpf`, `ca_sin`, `ch_oasi`, `cl_rut`, `cn_pp`, `co_nuip`, `cr_ci`, `cr_cpf`, `cr_dimex`, `cr_nite`, `cy_tic`, `cz_rc`, `de_stn`, `dk_cpr`, `do_cie`, `do_rcn`, `ec_ci`, `ee_ik`, `es_nif`, `fi_hetu`, `fr_nir`, `gb_nino`, `gr_afm`, `gt_nit`, `hk_id`, `hr_oib`, `hu_ad`, `id_nik`, `ie_ppsn`, `is_kt`, `it_cf`, `jp_inc`, `ke_pin`, `kz_iin`, `li_peid`, `lt_ak`, `lu_nif`, `lv_pk`, `mx_rfc`, `my_nric`, `mz_nuit`, `ng_nin`, `nl_bsn`, `no_nin`, `nz_ird`, `pe_dni`, `pk_cnic`, `pk_snic`, `pl_pesel`, `pt_nif`, `ro_cnp`, `sa_tin`, `se_pin`, `sg_fin`, `sg_nric`, `sk_dic`, `th_lc`, `th_pin`, `tr_tin`, `us_itin`, `us_itin_last_4`, `us_ssn`, `us_ssn_last_4`, `uy_dni`, `za_id`.
        """
        @type t :: %__MODULE__{
                type: String.t() | nil
              }
        defstruct [:type]
      end

      defmodule Relationship do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `authorizer` - Whether the individual is an authorizer of the Account's identity.
        * `director` - Whether the individual is a director of the Account's identity. Directors are typically members of the governing board of the company or are responsible for making sure that the company meets its regulatory obligations.
        * `executive` - Whether the individual has significant responsibility to control, manage, or direct the organization.
        * `legal_guardian` - Whether the individual is the legal guardian of the Account's representative.
        * `owner` - Whether the individual is an owner of the Account's identity.
        * `percent_ownership` - The percentage of the Account's identity that the individual owns. Format: decimal string.
        * `representative` - Whether the individual is authorized as the primary representative of the Account. This is the person nominated by the business to provide information about themselves, and general information about the account. There can only be one representative at any given time. At the time the account is created, this person should be set to the person responsible for opening the account.
        * `title` - The individual's title (e.g., CEO, Support Engineer).
        """
        @type t :: %__MODULE__{
                authorizer: boolean() | nil,
                director: boolean() | nil,
                executive: boolean() | nil,
                legal_guardian: boolean() | nil,
                owner: boolean() | nil,
                percent_ownership: String.t() | nil,
                representative: boolean() | nil,
                title: String.t() | nil
              }
        defstruct [
          :authorizer,
          :director,
          :executive,
          :legal_guardian,
          :owner,
          :percent_ownership,
          :representative,
          :title
        ]
      end

      defmodule ScriptAddresses do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `kana` - Kana Address.
        * `kanji` - Kanji Address.
        """
        @type t :: %__MODULE__{
                kana: __MODULE__.Kana.t() | nil,
                kanji: __MODULE__.Kanji.t() | nil
              }
        defstruct [:kana, :kanji]

        defmodule Kana do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `city` - City, district, suburb, town, or village.
          * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)).
          * `line1` - Address line 1 (e.g., street, PO Box, or company name).
          * `line2` - Address line 2 (e.g., apartment, suite, unit, or building).
          * `postal_code` - ZIP or postal code.
          * `state` - State, county, province, or region.
          * `town` - Town or district.
          """
          @type t :: %__MODULE__{
                  city: String.t() | nil,
                  country: String.t() | nil,
                  line1: String.t() | nil,
                  line2: String.t() | nil,
                  postal_code: String.t() | nil,
                  state: String.t() | nil,
                  town: String.t() | nil
                }
          defstruct [:city, :country, :line1, :line2, :postal_code, :state, :town]
        end

        defmodule Kanji do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `city` - City, district, suburb, town, or village.
          * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)).
          * `line1` - Address line 1 (e.g., street, PO Box, or company name).
          * `line2` - Address line 2 (e.g., apartment, suite, unit, or building).
          * `postal_code` - ZIP or postal code.
          * `state` - State, county, province, or region.
          * `town` - Town or district.
          """
          @type t :: %__MODULE__{
                  city: String.t() | nil,
                  country: String.t() | nil,
                  line1: String.t() | nil,
                  line2: String.t() | nil,
                  postal_code: String.t() | nil,
                  state: String.t() | nil,
                  town: String.t() | nil
                }
          defstruct [:city, :country, :line1, :line2, :postal_code, :state, :town]
        end

        def __inner_types__ do
          %{
            "kana" => __MODULE__.Kana,
            "kanji" => __MODULE__.Kanji
          }
        end
      end

      defmodule ScriptNames do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `kana` - Persons name in kana script.
        * `kanji` - Persons name in kanji script.
        """
        @type t :: %__MODULE__{
                kana: __MODULE__.Kana.t() | nil,
                kanji: __MODULE__.Kanji.t() | nil
              }
        defstruct [:kana, :kanji]

        defmodule Kana do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `given_name` - The person's first or given name.
          * `surname` - The person's last or family name.
          """
          @type t :: %__MODULE__{
                  given_name: String.t() | nil,
                  surname: String.t() | nil
                }
          defstruct [:given_name, :surname]
        end

        defmodule Kanji do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `given_name` - The person's first or given name.
          * `surname` - The person's last or family name.
          """
          @type t :: %__MODULE__{
                  given_name: String.t() | nil,
                  surname: String.t() | nil
                }
          defstruct [:given_name, :surname]
        end

        def __inner_types__ do
          %{
            "kana" => __MODULE__.Kana,
            "kanji" => __MODULE__.Kanji
          }
        end
      end

      def __inner_types__ do
        %{
          "additional_addresses" => __MODULE__.AdditionalAddresses,
          "additional_names" => __MODULE__.AdditionalNames,
          "additional_terms_of_service" => __MODULE__.AdditionalTermsOfService,
          "address" => __MODULE__.Address,
          "date_of_birth" => __MODULE__.DateOfBirth,
          "documents" => __MODULE__.Documents,
          "id_numbers" => __MODULE__.IdNumbers,
          "relationship" => __MODULE__.Relationship,
          "script_addresses" => __MODULE__.ScriptAddresses,
          "script_names" => __MODULE__.ScriptNames
        }
      end
    end

    def __inner_types__ do
      %{
        "attestations" => __MODULE__.Attestations,
        "business_details" => __MODULE__.BusinessDetails,
        "individual" => __MODULE__.Individual
      }
    end
  end

  defmodule Requirements do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `entries` - A list of requirements for the Account.
    * `summary` - An object containing an overview of requirements for the Account.
    """
    @type t :: %__MODULE__{
            entries: [__MODULE__.Entries.t()] | nil,
            summary: __MODULE__.Summary.t() | nil
          }
    defstruct [:entries, :summary]

    defmodule Entries do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `awaiting_action_from` - Indicates whether the platform or Stripe is currently responsible for taking action on the requirement. Value can be `user` or `stripe`. Possible values: `stripe`, `user`.
      * `description` - Machine-readable string describing the requirement.
      * `errors` - Descriptions of why the requirement must be collected, or why the collected information isn't satisfactory to Stripe.
      * `impact` - A hash describing the impact of not collecting the requirement, or Stripe not being able to verify the collected information.
      * `minimum_deadline` - The soonest point when the account will be impacted by not providing the requirement.
      * `reference` - A reference to the location of the requirement.
      * `requested_reasons` - A list of reasons why Stripe is collecting the requirement.
      """
      @type t :: %__MODULE__{
              awaiting_action_from: String.t() | nil,
              description: String.t() | nil,
              errors: [__MODULE__.Errors.t()] | nil,
              impact: __MODULE__.Impact.t() | nil,
              minimum_deadline: __MODULE__.MinimumDeadline.t() | nil,
              reference: __MODULE__.Reference.t() | nil,
              requested_reasons: [__MODULE__.RequestedReasons.t()] | nil
            }
      defstruct [
        :awaiting_action_from,
        :description,
        :errors,
        :impact,
        :minimum_deadline,
        :reference,
        :requested_reasons
      ]

      defmodule Errors do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `code` - Machine-readable code describing the error. Possible values: `invalid_address_city_state_postal_code`, `invalid_address_highway_contract_box`, `invalid_address_private_mailbox`, `invalid_business_profile_name`, `invalid_business_profile_name_denylisted`, `invalid_company_name_denylisted`, `invalid_dob_age_over_maximum`, `invalid_dob_age_under_18`, `invalid_dob_age_under_minimum`, `invalid_product_description_length`, `invalid_product_description_url_match`, `invalid_representative_country`, `invalid_statement_descriptor_business_mismatch`, `invalid_statement_descriptor_denylisted`, `invalid_statement_descriptor_length`, `invalid_statement_descriptor_prefix_denylisted`, `invalid_statement_descriptor_prefix_mismatch`, `invalid_street_address`, `invalid_tax_id`, `invalid_tax_id_format`, `invalid_tos_acceptance`, `invalid_url_denylisted`, `invalid_url_format`, `invalid_url_website_business_information_mismatch`, `invalid_url_website_empty`, `invalid_url_website_inaccessible`, `invalid_url_website_inaccessible_geoblocked`, `invalid_url_website_inaccessible_password_protected`, `invalid_url_website_incomplete`, `invalid_url_website_incomplete_cancellation_policy`, `invalid_url_website_incomplete_customer_service_details`, `invalid_url_website_incomplete_legal_restrictions`, `invalid_url_website_incomplete_refund_policy`, `invalid_url_website_incomplete_return_policy`, `invalid_url_website_incomplete_terms_and_conditions`, `invalid_url_website_incomplete_under_construction`, `invalid_url_website_other`, `invalid_url_web_presence_detected`, `invalid_value_other`, `unresolvable_ip_address`, `unresolvable_postal_code`, `verification_directors_mismatch`, `verification_document_address_mismatch`, `verification_document_address_missing`, `verification_document_corrupt`, `verification_document_country_not_supported`, `verification_document_directors_mismatch`, `verification_document_dob_mismatch`, `verification_document_duplicate_type`, `verification_document_expired`, `verification_document_failed_copy`, `verification_document_failed_greyscale`, `verification_document_failed_other`, `verification_document_failed_test_mode`, `verification_document_fraudulent`, `verification_document_id_number_mismatch`, `verification_document_id_number_missing`, `verification_document_incomplete`, `verification_document_invalid`, `verification_document_issue_or_expiry_date_missing`, `verification_document_manipulated`, `verification_document_missing_back`, `verification_document_missing_front`, `verification_document_name_mismatch`, `verification_document_name_missing`, `verification_document_nationality_mismatch`, `verification_document_not_readable`, `verification_document_not_signed`, `verification_document_not_uploaded`, `verification_document_photo_mismatch`, `verification_document_too_large`, `verification_document_type_not_supported`, `verification_extraneous_directors`, `verification_failed_address_match`, `verification_failed_business_iec_number`, `verification_failed_document_match`, `verification_failed_id_number_match`, `verification_failed_keyed_identity`, `verification_failed_keyed_match`, `verification_failed_name_match`, `verification_failed_other`, `verification_failed_representative_authority`, `verification_failed_residential_address`, `verification_failed_tax_id_match`, `verification_failed_tax_id_not_issued`, `verification_missing_directors`, `verification_missing_executives`, `verification_missing_owners`, `verification_requires_additional_memorandum_of_associations`, `verification_requires_additional_proof_of_registration`, `verification_selfie_document_missing_photo`, `verification_selfie_face_mismatch`, `verification_selfie_manipulated`, `verification_selfie_unverified_other`, `verification_supportability`, `verification_token_stale`.
        * `description` - Human-readable description of the error.
        """
        @type t :: %__MODULE__{
                code: String.t() | nil,
                description: String.t() | nil
              }
        defstruct [:code, :description]
      end

      defmodule Impact do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `restricts_capabilities` - The Capabilities that will be restricted if the requirement is not collected and satisfactory to Stripe.
        """
        @type t :: %__MODULE__{
                restricts_capabilities: [__MODULE__.RestrictsCapabilities.t()] | nil
              }
        defstruct [:restricts_capabilities]

        defmodule RestrictsCapabilities do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `capability` - The name of the Capability which will be restricted. Possible values: `ach_debit_payments`, `acss_debit_payments`, `affirm_payments`, `afterpay_clearpay_payments`, `alma_payments`, `amazon_pay_payments`, `automatic_indirect_tax`, `au_becs_debit_payments`, `bacs_debit_payments`, `bancontact_payments`, `bank_accounts.local`, `bank_accounts.wire`, `blik_payments`, `boleto_payments`, `cards`, `card_payments`, `cartes_bancaires_payments`, `cashapp_payments`, `eps_payments`, `fpx_payments`, `gb_bank_transfer_payments`, `grabpay_payments`, `ideal_payments`, `jcb_payments`, `jp_bank_transfer_payments`, `kakao_pay_payments`, `klarna_payments`, `konbini_payments`, `kr_card_payments`, `link_payments`, `mobilepay_payments`, `multibanco_payments`, `mx_bank_transfer_payments`, `naver_pay_payments`, `oxxo_payments`, `p24_payments`, `payco_payments`, `paynow_payments`, `pay_by_bank_payments`, `promptpay_payments`, `revolut_pay_payments`, `samsung_pay_payments`, `sepa_bank_transfer_payments`, `sepa_debit_payments`, `stripe_balance.payouts`, `stripe_balance.stripe_transfers`, `swish_payments`, `twint_payments`, `us_bank_transfer_payments`, `zip_payments`.
          * `configuration` - The configuration which specifies the Capability which will be restricted. Possible values: `customer`, `merchant`, `recipient`.
          * `deadline` - Details about when in the account lifecycle the requirement must be collected by the avoid the Capability restriction.
          """
          @type t :: %__MODULE__{
                  capability: String.t() | nil,
                  configuration: String.t() | nil,
                  deadline: __MODULE__.Deadline.t() | nil
                }
          defstruct [:capability, :configuration, :deadline]

          defmodule Deadline do
            @moduledoc "Nested struct within the parent resource."

            @typedoc """
            * `status` - The current status of the requirement's impact. Possible values: `currently_due`, `eventually_due`, `past_due`.
            """
            @type t :: %__MODULE__{
                    status: String.t() | nil
                  }
            defstruct [:status]
          end

          def __inner_types__ do
            %{
              "deadline" => __MODULE__.Deadline
            }
          end
        end

        def __inner_types__ do
          %{
            "restricts_capabilities" => __MODULE__.RestrictsCapabilities
          }
        end
      end

      defmodule MinimumDeadline do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `status` - The current status of the requirement's impact. Possible values: `currently_due`, `eventually_due`, `past_due`.
        """
        @type t :: %__MODULE__{
                status: String.t() | nil
              }
        defstruct [:status]
      end

      defmodule Reference do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `inquiry` - If `inquiry` is the type, the inquiry token.
        * `resource` - If `resource` is the type, the resource token.
        * `type` - The type of the reference. If the type is "inquiry", the inquiry token can be found in the "inquiry" field.
        Otherwise the type is an API resource, the token for which can be found in the "resource" field. Possible values: `inquiry`, `payment_method`, `person`.
        """
        @type t :: %__MODULE__{
                inquiry: String.t() | nil,
                resource: String.t() | nil,
                type: String.t() | nil
              }
        defstruct [:inquiry, :resource, :type]
      end

      defmodule RequestedReasons do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `code` - Machine-readable description of Stripe's reason for collecting the requirement. Possible values: `routine_onboarding`, `routine_verification`.
        """
        @type t :: %__MODULE__{
                code: String.t() | nil
              }
        defstruct [:code]
      end

      def __inner_types__ do
        %{
          "errors" => __MODULE__.Errors,
          "impact" => __MODULE__.Impact,
          "minimum_deadline" => __MODULE__.MinimumDeadline,
          "reference" => __MODULE__.Reference,
          "requested_reasons" => __MODULE__.RequestedReasons
        }
      end
    end

    defmodule Summary do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `minimum_deadline` - The soonest date and time a requirement on the Account will become `past due`. Represented as a RFC 3339 date & time UTC value in millisecond precision, for example: `2022-09-18T13:22:18.123Z`.
      """
      @type t :: %__MODULE__{
              minimum_deadline: __MODULE__.MinimumDeadline.t() | nil
            }
      defstruct [:minimum_deadline]

      defmodule MinimumDeadline do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `status` - The current strictest status of all requirements on the Account. Possible values: `currently_due`, `eventually_due`, `past_due`.
        * `time` - The soonest RFC3339 date & time UTC value a requirement can impact the Account. Format: date-time.
        """
        @type t :: %__MODULE__{
                status: String.t() | nil,
                time: String.t() | nil
              }
        defstruct [:status, :time]
      end

      def __inner_types__ do
        %{
          "minimum_deadline" => __MODULE__.MinimumDeadline
        }
      end
    end

    def __inner_types__ do
      %{
        "entries" => __MODULE__.Entries,
        "summary" => __MODULE__.Summary
      }
    end
  end

  def __inner_types__ do
    %{
      "configuration" => __MODULE__.Configuration,
      "defaults" => __MODULE__.Defaults,
      "future_requirements" => __MODULE__.FutureRequirements,
      "identity" => __MODULE__.Identity,
      "requirements" => __MODULE__.Requirements
    }
  end
end
