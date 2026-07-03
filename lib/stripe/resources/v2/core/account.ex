# File generated from our OpenAPI spec
defmodule Stripe.Resources.V2.Core.Account do
  @moduledoc """
  Account

  A V2 Account is a representation of a company or individual that a Stripe user does business with. Accounts contain the contact details, Legal Entity information, and configuration required to enable the Account for use across Stripe products.
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
  @type t :: %__MODULE__{}

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

  def __nested_fields__ do
    %{
      "configuration" => %{
        fields: %{
          "customer" => %{
            fields: %{
              "applied" => :scalar,
              "automatic_indirect_tax" => %{
                fields: %{
                  "exempt" => :scalar,
                  "ip_address" => :scalar,
                  "location" => %{
                    fields: %{
                      "country" => :scalar,
                      "state" => :scalar
                    }
                  },
                  "location_source" => :scalar
                }
              },
              "billing" => %{
                fields: %{
                  "default_payment_method" => :scalar,
                  "invoice" => %{
                    fields: %{
                      "custom_fields" =>
                        {:list,
                         %{
                           fields: %{
                             "name" => :scalar,
                             "value" => :scalar
                           }
                         }},
                      "footer" => :scalar,
                      "next_sequence" => :scalar,
                      "prefix" => :scalar,
                      "rendering" => %{
                        fields: %{
                          "amount_tax_display" => :scalar,
                          "template" => :scalar
                        }
                      }
                    }
                  }
                }
              },
              "capabilities" => %{
                fields: %{
                  "automatic_indirect_tax" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  }
                }
              },
              "shipping" => %{
                fields: %{
                  "address" => %{
                    fields: %{
                      "city" => :scalar,
                      "country" => :scalar,
                      "line1" => :scalar,
                      "line2" => :scalar,
                      "postal_code" => :scalar,
                      "state" => :scalar
                    }
                  },
                  "name" => :scalar,
                  "phone" => :scalar
                }
              },
              "test_clock" => :scalar
            }
          },
          "merchant" => %{
            fields: %{
              "applied" => :scalar,
              "bacs_debit_payments" => %{
                fields: %{
                  "display_name" => :scalar,
                  "service_user_number" => :scalar
                }
              },
              "branding" => %{
                fields: %{
                  "icon" => :scalar,
                  "logo" => :scalar,
                  "primary_color" => :scalar,
                  "secondary_color" => :scalar
                }
              },
              "capabilities" => %{
                fields: %{
                  "ach_debit_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "acss_debit_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "affirm_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "afterpay_clearpay_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "alma_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "amazon_pay_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "au_becs_debit_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "bacs_debit_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "bancontact_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "blik_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "boleto_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "card_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "cartes_bancaires_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "cashapp_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "eps_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "fpx_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "gb_bank_transfer_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "grabpay_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "ideal_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "jcb_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "jp_bank_transfer_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "kakao_pay_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "klarna_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "konbini_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "kr_card_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "link_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "mobilepay_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "multibanco_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "mx_bank_transfer_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "naver_pay_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "oxxo_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "p24_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "pay_by_bank_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "payco_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "paynow_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "promptpay_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "revolut_pay_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "samsung_pay_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "sepa_bank_transfer_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "sepa_debit_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "stripe_balance" => %{
                    fields: %{
                      "payouts" => %{
                        fields: %{
                          "status" => :scalar,
                          "status_details" =>
                            {:list,
                             %{
                               fields: %{
                                 "code" => :scalar,
                                 "resolution" => :scalar
                               }
                             }}
                        }
                      }
                    }
                  },
                  "swish_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "twint_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "us_bank_transfer_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "zip_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
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
                  }
                }
              },
              "konbini_payments" => %{
                fields: %{
                  "support" => %{
                    fields: %{
                      "email" => :scalar,
                      "hours" => %{
                        fields: %{
                          "end_time" => :scalar,
                          "start_time" => :scalar
                        }
                      },
                      "phone" => :scalar
                    }
                  }
                }
              },
              "mcc" => :scalar,
              "script_statement_descriptor" => %{
                fields: %{
                  "kana" => %{
                    fields: %{
                      "descriptor" => :scalar,
                      "prefix" => :scalar
                    }
                  },
                  "kanji" => %{
                    fields: %{
                      "descriptor" => :scalar,
                      "prefix" => :scalar
                    }
                  }
                }
              },
              "sepa_debit_payments" => %{
                fields: %{
                  "creditor_id" => :scalar
                }
              },
              "statement_descriptor" => %{
                fields: %{
                  "descriptor" => :scalar,
                  "prefix" => :scalar
                }
              },
              "support" => %{
                fields: %{
                  "address" => %{
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
                  "email" => :scalar,
                  "phone" => :scalar,
                  "url" => :scalar
                }
              }
            }
          },
          "recipient" => %{
            fields: %{
              "applied" => :scalar,
              "capabilities" => %{
                fields: %{
                  "stripe_balance" => %{
                    fields: %{
                      "payouts" => %{
                        fields: %{
                          "status" => :scalar,
                          "status_details" =>
                            {:list,
                             %{
                               fields: %{
                                 "code" => :scalar,
                                 "resolution" => :scalar
                               }
                             }}
                        }
                      },
                      "stripe_transfers" => %{
                        fields: %{
                          "status" => :scalar,
                          "status_details" =>
                            {:list,
                             %{
                               fields: %{
                                 "code" => :scalar,
                                 "resolution" => :scalar
                               }
                             }}
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      },
      "defaults" => %{
        fields: %{
          "currency" => :scalar,
          "locales" => {:list, :scalar},
          "profile" => %{
            fields: %{
              "business_url" => :scalar,
              "doing_business_as" => :scalar,
              "product_description" => :scalar
            }
          },
          "responsibilities" => %{
            fields: %{
              "fees_collector" => :scalar,
              "losses_collector" => :scalar,
              "requirements_collector" => :scalar
            }
          }
        }
      },
      "future_requirements" => %{
        fields: %{
          "entries" =>
            {:list,
             %{
               fields: %{
                 "awaiting_action_from" => :scalar,
                 "description" => :scalar,
                 "errors" =>
                   {:list,
                    %{
                      fields: %{
                        "code" => :scalar,
                        "description" => :scalar
                      }
                    }},
                 "impact" => %{
                   fields: %{
                     "restricts_capabilities" =>
                       {:list,
                        %{
                          fields: %{
                            "capability" => :scalar,
                            "configuration" => :scalar,
                            "deadline" => %{
                              fields: %{
                                "status" => :scalar
                              }
                            }
                          }
                        }}
                   }
                 },
                 "minimum_deadline" => %{
                   fields: %{
                     "status" => :scalar
                   }
                 },
                 "reference" => %{
                   fields: %{
                     "inquiry" => :scalar,
                     "resource" => :scalar,
                     "type" => :scalar
                   }
                 },
                 "requested_reasons" =>
                   {:list,
                    %{
                      fields: %{
                        "code" => :scalar
                      }
                    }}
               }
             }},
          "minimum_transition_date" => :scalar,
          "summary" => %{
            fields: %{
              "minimum_deadline" => %{
                fields: %{
                  "status" => :scalar,
                  "time" => :scalar
                }
              }
            }
          }
        }
      },
      "identity" => %{
        fields: %{
          "attestations" => %{
            fields: %{
              "directorship_declaration" => %{
                fields: %{
                  "date" => :scalar,
                  "ip" => :scalar,
                  "user_agent" => :scalar
                }
              },
              "ownership_declaration" => %{
                fields: %{
                  "date" => :scalar,
                  "ip" => :scalar,
                  "user_agent" => :scalar
                }
              },
              "persons_provided" => %{
                fields: %{
                  "directors" => :scalar,
                  "executives" => :scalar,
                  "owners" => :scalar,
                  "ownership_exemption_reason" => :scalar
                }
              },
              "representative_declaration" => %{
                fields: %{
                  "date" => :scalar,
                  "ip" => :scalar,
                  "user_agent" => :scalar
                }
              },
              "terms_of_service" => %{
                fields: %{
                  "account" => %{
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
          "business_details" => %{
            fields: %{
              "address" => %{
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
              "annual_revenue" => %{
                fields: %{
                  "amount" => %{
                    fields: %{
                      "currency" => :scalar,
                      "value" => :scalar
                    }
                  },
                  "fiscal_year_end" => :scalar
                }
              },
              "documents" => %{
                fields: %{
                  "bank_account_ownership_verification" => %{
                    fields: %{
                      "files" => {:list, :scalar},
                      "type" => :scalar
                    }
                  },
                  "company_license" => %{
                    fields: %{
                      "files" => {:list, :scalar},
                      "type" => :scalar
                    }
                  },
                  "company_memorandum_of_association" => %{
                    fields: %{
                      "files" => {:list, :scalar},
                      "type" => :scalar
                    }
                  },
                  "company_ministerial_decree" => %{
                    fields: %{
                      "files" => {:list, :scalar},
                      "type" => :scalar
                    }
                  },
                  "company_registration_verification" => %{
                    fields: %{
                      "files" => {:list, :scalar},
                      "type" => :scalar
                    }
                  },
                  "company_tax_id_verification" => %{
                    fields: %{
                      "files" => {:list, :scalar},
                      "type" => :scalar
                    }
                  },
                  "primary_verification" => %{
                    fields: %{
                      "front_back" => %{
                        fields: %{
                          "back" => :scalar,
                          "front" => :scalar
                        }
                      },
                      "type" => :scalar
                    }
                  },
                  "proof_of_address" => %{
                    fields: %{
                      "files" => {:list, :scalar},
                      "type" => :scalar
                    }
                  },
                  "proof_of_registration" => %{
                    fields: %{
                      "files" => {:list, :scalar},
                      "type" => :scalar
                    }
                  },
                  "proof_of_ultimate_beneficial_ownership" => %{
                    fields: %{
                      "files" => {:list, :scalar},
                      "type" => :scalar
                    }
                  }
                }
              },
              "estimated_worker_count" => :scalar,
              "id_numbers" =>
                {:list,
                 %{
                   fields: %{
                     "registrar" => :scalar,
                     "type" => :scalar
                   }
                 }},
              "monthly_estimated_revenue" => %{
                fields: %{
                  "amount" => %{
                    fields: %{
                      "currency" => :scalar,
                      "value" => :scalar
                    }
                  }
                }
              },
              "phone" => :scalar,
              "registered_name" => :scalar,
              "registration_date" => %{
                fields: %{
                  "day" => :scalar,
                  "month" => :scalar,
                  "year" => :scalar
                }
              },
              "script_addresses" => %{
                fields: %{
                  "kana" => %{
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
                  "kanji" => %{
                    fields: %{
                      "city" => :scalar,
                      "country" => :scalar,
                      "line1" => :scalar,
                      "line2" => :scalar,
                      "postal_code" => :scalar,
                      "state" => :scalar,
                      "town" => :scalar
                    }
                  }
                }
              },
              "script_names" => %{
                fields: %{
                  "kana" => %{
                    fields: %{
                      "registered_name" => :scalar
                    }
                  },
                  "kanji" => %{
                    fields: %{
                      "registered_name" => :scalar
                    }
                  }
                }
              },
              "structure" => :scalar
            }
          },
          "country" => :scalar,
          "entity_type" => :scalar,
          "individual" => %{
            fields: %{
              "account" => :scalar,
              "additional_addresses" =>
                {:list,
                 %{
                   fields: %{
                     "city" => :scalar,
                     "country" => :scalar,
                     "line1" => :scalar,
                     "line2" => :scalar,
                     "postal_code" => :scalar,
                     "purpose" => :scalar,
                     "state" => :scalar,
                     "town" => :scalar
                   }
                 }},
              "additional_names" =>
                {:list,
                 %{
                   fields: %{
                     "full_name" => :scalar,
                     "given_name" => :scalar,
                     "purpose" => :scalar,
                     "surname" => :scalar
                   }
                 }},
              "additional_terms_of_service" => %{
                fields: %{
                  "account" => %{
                    fields: %{
                      "date" => :scalar,
                      "ip" => :scalar,
                      "user_agent" => :scalar
                    }
                  }
                }
              },
              "address" => %{
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
              "created" => :scalar,
              "date_of_birth" => %{
                fields: %{
                  "day" => :scalar,
                  "month" => :scalar,
                  "year" => :scalar
                }
              },
              "documents" => %{
                fields: %{
                  "company_authorization" => %{
                    fields: %{
                      "files" => {:list, :scalar},
                      "type" => :scalar
                    }
                  },
                  "passport" => %{
                    fields: %{
                      "files" => {:list, :scalar},
                      "type" => :scalar
                    }
                  },
                  "primary_verification" => %{
                    fields: %{
                      "front_back" => %{
                        fields: %{
                          "back" => :scalar,
                          "front" => :scalar
                        }
                      },
                      "type" => :scalar
                    }
                  },
                  "secondary_verification" => %{
                    fields: %{
                      "front_back" => %{
                        fields: %{
                          "back" => :scalar,
                          "front" => :scalar
                        }
                      },
                      "type" => :scalar
                    }
                  },
                  "visa" => %{
                    fields: %{
                      "files" => {:list, :scalar},
                      "type" => :scalar
                    }
                  }
                }
              },
              "email" => :scalar,
              "given_name" => :scalar,
              "id" => :scalar,
              "id_numbers" =>
                {:list,
                 %{
                   fields: %{
                     "type" => :scalar
                   }
                 }},
              "legal_gender" => :scalar,
              "metadata" => {:map, :scalar},
              "nationalities" => {:list, :scalar},
              "object" => :scalar,
              "phone" => :scalar,
              "political_exposure" => :scalar,
              "relationship" => %{
                fields: %{
                  "authorizer" => :scalar,
                  "director" => :scalar,
                  "executive" => :scalar,
                  "legal_guardian" => :scalar,
                  "owner" => :scalar,
                  "percent_ownership" => :scalar,
                  "representative" => :scalar,
                  "title" => :scalar
                }
              },
              "script_addresses" => %{
                fields: %{
                  "kana" => %{
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
                  "kanji" => %{
                    fields: %{
                      "city" => :scalar,
                      "country" => :scalar,
                      "line1" => :scalar,
                      "line2" => :scalar,
                      "postal_code" => :scalar,
                      "state" => :scalar,
                      "town" => :scalar
                    }
                  }
                }
              },
              "script_names" => %{
                fields: %{
                  "kana" => %{
                    fields: %{
                      "given_name" => :scalar,
                      "surname" => :scalar
                    }
                  },
                  "kanji" => %{
                    fields: %{
                      "given_name" => :scalar,
                      "surname" => :scalar
                    }
                  }
                }
              },
              "surname" => :scalar,
              "updated" => :scalar
            }
          }
        }
      },
      "requirements" => %{
        fields: %{
          "entries" =>
            {:list,
             %{
               fields: %{
                 "awaiting_action_from" => :scalar,
                 "description" => :scalar,
                 "errors" =>
                   {:list,
                    %{
                      fields: %{
                        "code" => :scalar,
                        "description" => :scalar
                      }
                    }},
                 "impact" => %{
                   fields: %{
                     "restricts_capabilities" =>
                       {:list,
                        %{
                          fields: %{
                            "capability" => :scalar,
                            "configuration" => :scalar,
                            "deadline" => %{
                              fields: %{
                                "status" => :scalar
                              }
                            }
                          }
                        }}
                   }
                 },
                 "minimum_deadline" => %{
                   fields: %{
                     "status" => :scalar
                   }
                 },
                 "reference" => %{
                   fields: %{
                     "inquiry" => :scalar,
                     "resource" => :scalar,
                     "type" => :scalar
                   }
                 },
                 "requested_reasons" =>
                   {:list,
                    %{
                      fields: %{
                        "code" => :scalar
                      }
                    }}
               }
             }},
          "summary" => %{
            fields: %{
              "minimum_deadline" => %{
                fields: %{
                  "status" => :scalar,
                  "time" => :scalar
                }
              }
            }
          }
        }
      }
    }
  end
end
