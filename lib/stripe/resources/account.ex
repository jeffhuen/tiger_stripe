# File generated from our OpenAPI spec
defmodule Stripe.Resources.Account do
  @moduledoc """
  Account

  For new integrations, we recommend using the [Accounts v2 API](https://docs.stripe.com/api/v2/core/accounts), in place of /v1/accounts and /v1/customers to represent a user.

  This is an object representing a Stripe account. You can retrieve it to see
  properties on the account like its current requirements or if the account is
  enabled to make live charges or receive payouts.

  For accounts where [controller.requirement_collection](https://docs.stripe.com/api/accounts/object#account_object-controller-requirement_collection)
  is `application`, which includes Custom accounts, the properties below are always
  returned.

  For accounts where [controller.requirement_collection](https://docs.stripe.com/api/accounts/object#account_object-controller-requirement_collection)
  is `stripe`, which includes Standard and Express accounts, some properties are only returned
  until you create an [Account Link](https://docs.stripe.com/api/account_links) or [Account Session](https://docs.stripe.com/api/account_sessions)
  to start Connect Onboarding. Learn about the [differences between accounts](https://stripe.com/connect/accounts).
  """

  @typedoc """
  * `business_profile` - Business information about the account. Nullable. Expandable.
  * `business_type` - The business type. Possible values: `company`, `government_entity`, `individual`, `non_profit`. Nullable.
  * `capabilities` - Expandable.
  * `charges_enabled` - Whether the account can process charges.
  * `company` - Expandable.
  * `controller` - Expandable.
  * `country` - The account's country. Max length: 5000.
  * `created` - Time at which the account was connected. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `default_currency` - Three-letter ISO currency code representing the default currency for the account. This must be a currency that [Stripe supports in the account's country](https://stripe.com/docs/payouts). Max length: 5000.
  * `details_submitted` - Whether account details have been submitted. Accounts with Stripe Dashboard access, which includes Standard accounts, cannot receive payouts before this is true. Accounts where this is false should be directed to [an onboarding flow](https://stripe.com/connect/onboarding) to finish submitting account details.
  * `email` - An email address associated with the account. It's not used for authentication and Stripe doesn't market to this field without explicit approval from the platform. Max length: 5000. Nullable.
  * `external_accounts` - External accounts (bank accounts and debit cards) currently attached to this account. External accounts are only returned for requests where `controller[is_controller]` is true. Expandable.
  * `future_requirements` - Expandable.
  * `groups` - The groups associated with the account. Nullable. Expandable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `individual` - Expandable.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `account`.
  * `payouts_enabled` - Whether the funds in this account can be paid out.
  * `requirements` - Expandable.
  * `settings` - Options for customizing how the account functions within Stripe. Nullable. Expandable.
  * `tos_acceptance` - Expandable.
  * `type` - The Stripe account type. Can be `standard`, `express`, `custom`, or `none`. Possible values: `custom`, `express`, `none`, `standard`.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :business_profile,
    :business_type,
    :capabilities,
    :charges_enabled,
    :company,
    :controller,
    :country,
    :created,
    :default_currency,
    :details_submitted,
    :email,
    :external_accounts,
    :future_requirements,
    :groups,
    :id,
    :individual,
    :metadata,
    :object,
    :payouts_enabled,
    :requirements,
    :settings,
    :tos_acceptance,
    :type
  ]

  @object_name "account"
  def object_name, do: @object_name

  def expandable_fields,
    do: [
      "business_profile",
      "capabilities",
      "company",
      "controller",
      "external_accounts",
      "future_requirements",
      "groups",
      "individual",
      "requirements",
      "settings",
      "tos_acceptance"
    ]

  def __nested_fields__ do
    %{
      "business_profile" => %{
        fields: %{
          "annual_revenue" => %{
            fields: %{
              "amount" => :scalar,
              "currency" => :scalar,
              "fiscal_year_end" => :scalar
            }
          },
          "estimated_worker_count" => :scalar,
          "mcc" => :scalar,
          "minority_owned_business_designation" => {:list, :scalar},
          "monthly_estimated_revenue" => %{
            fields: %{
              "amount" => :scalar,
              "currency" => :scalar
            }
          },
          "name" => :scalar,
          "product_description" => :scalar,
          "support_address" => {:resource, Stripe.Resources.Address},
          "support_email" => :scalar,
          "support_phone" => :scalar,
          "support_url" => :scalar,
          "url" => :scalar
        }
      },
      "capabilities" => %{
        fields: %{
          "acss_debit_payments" => :scalar,
          "affirm_payments" => :scalar,
          "afterpay_clearpay_payments" => :scalar,
          "alma_payments" => :scalar,
          "amazon_pay_payments" => :scalar,
          "app_distribution" => :scalar,
          "au_becs_debit_payments" => :scalar,
          "bacs_debit_payments" => :scalar,
          "bancontact_payments" => :scalar,
          "bank_transfer_payments" => :scalar,
          "billie_payments" => :scalar,
          "bizum_payments" => :scalar,
          "blik_payments" => :scalar,
          "boleto_payments" => :scalar,
          "card_issuing" => :scalar,
          "card_payments" => :scalar,
          "cartes_bancaires_payments" => :scalar,
          "cashapp_payments" => :scalar,
          "crypto_payments" => :scalar,
          "eps_payments" => :scalar,
          "fpx_payments" => :scalar,
          "gb_bank_transfer_payments" => :scalar,
          "giropay_payments" => :scalar,
          "grabpay_payments" => :scalar,
          "ideal_payments" => :scalar,
          "india_international_payments" => :scalar,
          "jcb_payments" => :scalar,
          "jp_bank_transfer_payments" => :scalar,
          "kakao_pay_payments" => :scalar,
          "klarna_payments" => :scalar,
          "konbini_payments" => :scalar,
          "kr_card_payments" => :scalar,
          "legacy_payments" => :scalar,
          "link_payments" => :scalar,
          "mb_way_payments" => :scalar,
          "mobilepay_payments" => :scalar,
          "multibanco_payments" => :scalar,
          "mx_bank_transfer_payments" => :scalar,
          "naver_pay_payments" => :scalar,
          "nz_bank_account_becs_debit_payments" => :scalar,
          "oxxo_payments" => :scalar,
          "p24_payments" => :scalar,
          "pay_by_bank_payments" => :scalar,
          "payco_payments" => :scalar,
          "paynow_payments" => :scalar,
          "payto_payments" => :scalar,
          "pix_payments" => :scalar,
          "promptpay_payments" => :scalar,
          "revolut_pay_payments" => :scalar,
          "samsung_pay_payments" => :scalar,
          "satispay_payments" => :scalar,
          "scalapay_payments" => :scalar,
          "sepa_bank_transfer_payments" => :scalar,
          "sepa_debit_payments" => :scalar,
          "sofort_payments" => :scalar,
          "sunbit_payments" => :scalar,
          "swish_payments" => :scalar,
          "tax_reporting_us_1099_k" => :scalar,
          "tax_reporting_us_1099_misc" => :scalar,
          "transfers" => :scalar,
          "treasury" => :scalar,
          "twint_payments" => :scalar,
          "upi_payments" => :scalar,
          "us_bank_account_ach_payments" => :scalar,
          "us_bank_transfer_payments" => :scalar,
          "zip_payments" => :scalar
        }
      },
      "company" => %{
        fields: %{
          "address" => {:resource, Stripe.Resources.Address},
          "address_kana" => %{
            fields: %{
              "city" => :scalar,
              "country" => :scalar,
              "line1" => :scalar,
              "line2" => :scalar,
              "postal_code" => :scalar,
              "state" => :scalar,
              "town" => :scalar
            }
          },
          "address_kanji" => %{
            fields: %{
              "city" => :scalar,
              "country" => :scalar,
              "line1" => :scalar,
              "line2" => :scalar,
              "postal_code" => :scalar,
              "state" => :scalar,
              "town" => :scalar
            }
          },
          "administrative_address" => {:resource, Stripe.Resources.Address},
          "directors_provided" => :scalar,
          "directorship_declaration" => %{
            fields: %{
              "date" => :scalar,
              "ip" => :scalar,
              "user_agent" => :scalar
            }
          },
          "executives_provided" => :scalar,
          "export_license_id" => :scalar,
          "export_purpose_code" => :scalar,
          "name" => :scalar,
          "name_kana" => :scalar,
          "name_kanji" => :scalar,
          "owners_provided" => :scalar,
          "ownership_declaration" => %{
            fields: %{
              "date" => :scalar,
              "ip" => :scalar,
              "user_agent" => :scalar
            }
          },
          "ownership_exemption_reason" => :scalar,
          "phone" => :scalar,
          "principal_place_of_business" => {:resource, Stripe.Resources.Address},
          "registration_date" => %{
            fields: %{
              "day" => :scalar,
              "month" => :scalar,
              "year" => :scalar
            }
          },
          "representative_declaration" => %{
            fields: %{
              "date" => :scalar,
              "ip" => :scalar,
              "user_agent" => :scalar
            }
          },
          "structure" => :scalar,
          "tax_id_provided" => :scalar,
          "tax_id_registrar" => :scalar,
          "vat_id_provided" => :scalar,
          "verification" => %{
            fields: %{
              "document" => %{
                fields: %{
                  "back" => {:resource, Stripe.Resources.File},
                  "details" => :scalar,
                  "details_code" => :scalar,
                  "front" => {:resource, Stripe.Resources.File}
                }
              }
            }
          }
        }
      },
      "controller" => %{
        fields: %{
          "fees" => %{
            fields: %{
              "payer" => :scalar
            }
          },
          "is_controller" => :scalar,
          "losses" => %{
            fields: %{
              "payments" => :scalar
            }
          },
          "requirement_collection" => :scalar,
          "stripe_dashboard" => %{
            fields: %{
              "type" => :scalar
            }
          },
          "type" => :scalar
        }
      },
      "external_accounts" => %{
        fields: %{
          "data" => {:list, {:resource, Stripe.Resources.ExternalAccount}},
          "has_more" => :scalar,
          "object" => :scalar,
          "url" => :scalar
        }
      },
      "future_requirements" => %{
        fields: %{
          "alternatives" =>
            {:list,
             %{
               fields: %{
                 "alternative_fields_due" => {:list, :scalar},
                 "original_fields_due" => {:list, :scalar}
               }
             }},
          "current_deadline" => :scalar,
          "currently_due" => {:list, :scalar},
          "disabled_reason" => :scalar,
          "errors" =>
            {:list,
             %{
               fields: %{
                 "code" => :scalar,
                 "reason" => :scalar,
                 "requirement" => :scalar
               }
             }},
          "eventually_due" => {:list, :scalar},
          "past_due" => {:list, :scalar},
          "pending_verification" => {:list, :scalar}
        }
      },
      "groups" => %{
        fields: %{
          "payments_pricing" => :scalar
        }
      },
      "requirements" => %{
        fields: %{
          "alternatives" =>
            {:list,
             %{
               fields: %{
                 "alternative_fields_due" => {:list, :scalar},
                 "original_fields_due" => {:list, :scalar}
               }
             }},
          "current_deadline" => :scalar,
          "currently_due" => {:list, :scalar},
          "disabled_reason" => :scalar,
          "errors" =>
            {:list,
             %{
               fields: %{
                 "code" => :scalar,
                 "reason" => :scalar,
                 "requirement" => :scalar
               }
             }},
          "eventually_due" => {:list, :scalar},
          "past_due" => {:list, :scalar},
          "pending_verification" => {:list, :scalar}
        }
      },
      "settings" => %{
        fields: %{
          "bacs_debit_payments" => %{
            fields: %{
              "display_name" => :scalar,
              "service_user_number" => :scalar
            }
          },
          "branding" => %{
            fields: %{
              "icon" => {:resource, Stripe.Resources.File},
              "logo" => {:resource, Stripe.Resources.File},
              "primary_color" => :scalar,
              "secondary_color" => :scalar
            }
          },
          "card_issuing" => %{
            fields: %{
              "tos_acceptance" => %{
                fields: %{
                  "date" => :scalar,
                  "ip" => :scalar,
                  "user_agent" => :scalar
                }
              }
            }
          },
          "card_payments" => %{
            fields: %{
              "decline_on" => %{
                fields: %{
                  "avs_failure" => :scalar,
                  "cvc_failure" => :scalar
                }
              },
              "statement_descriptor_prefix" => :scalar,
              "statement_descriptor_prefix_kana" => :scalar,
              "statement_descriptor_prefix_kanji" => :scalar
            }
          },
          "dashboard" => %{
            fields: %{
              "display_name" => :scalar,
              "timezone" => :scalar
            }
          },
          "invoices" => %{
            fields: %{
              "default_account_tax_ids" => {:list, {:resource, Stripe.Resources.TaxId}},
              "hosted_payment_method_save" => :scalar
            }
          },
          "payments" => %{
            fields: %{
              "statement_descriptor" => :scalar,
              "statement_descriptor_kana" => :scalar,
              "statement_descriptor_kanji" => :scalar,
              "statement_descriptor_prefix_kana" => :scalar,
              "statement_descriptor_prefix_kanji" => :scalar
            }
          },
          "payouts" => %{
            fields: %{
              "debit_negative_balances" => :scalar,
              "schedule" => %{
                fields: %{
                  "delay_days" => :scalar,
                  "interval" => :scalar,
                  "monthly_anchor" => :scalar,
                  "monthly_payout_days" => {:list, :scalar},
                  "weekly_anchor" => :scalar,
                  "weekly_payout_days" => {:list, :scalar}
                }
              },
              "statement_descriptor" => :scalar
            }
          },
          "sepa_debit_payments" => %{
            fields: %{
              "creditor_id" => :scalar
            }
          },
          "treasury" => %{
            fields: %{
              "tos_acceptance" => %{
                fields: %{
                  "date" => :scalar,
                  "ip" => :scalar,
                  "user_agent" => :scalar
                }
              }
            }
          }
        }
      },
      "tos_acceptance" => %{
        fields: %{
          "date" => :scalar,
          "ip" => :scalar,
          "service_agreement" => :scalar,
          "user_agent" => :scalar
        }
      },
      "individual" => {:resource, Stripe.Resources.Person}
    }
  end
end
