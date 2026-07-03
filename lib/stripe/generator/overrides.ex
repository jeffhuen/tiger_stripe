defmodule Stripe.Generator.Overrides do
  @moduledoc false

  # ---------------------------------------------------------------------------
  # Override policy (enforced by overrides_validation_test.exs):
  #
  #   1. Every override MUST have a :reason documenting why the structural
  #      rules in openapi.ex cannot derive the correct service class.
  #   2. Every override MUST reference the Ruby SDK service file it mirrors.
  #   3. Prefer fixing structural rules over adding one-off overrides.
  #   4. Stale keys (endpoint removed from spec) are caught automatically.
  # ---------------------------------------------------------------------------

  # Override service_class for specific operations.
  # Key: {http_method_string, path}
  # Value: %{service_class: "Name", reason: "...", ruby: "..."}
  #
  # These overrides exist because the spec's x-stripeResource metadata routes
  # these operations to the parent resource's service class, but the Ruby SDK
  # splits them into dedicated services for the child resource.
  @operation_overrides %{
    # -- Line-item sub-resources ---------------------------------------------
    # The spec attaches line_items operations to the parent resource schema
    # (e.g. Session, PaymentLink, Quote). Ruby splits them into dedicated
    # line-item services matching the child resource name.
    {"get", "/v1/checkout/sessions/{session}/line_items"} => %{
      service_class: "SessionLineItem",
      reason: "Ruby splits session line items from SessionService",
      ruby: "checkout/session_line_item_service.rb"
    },
    {"get", "/v1/payment_links/{payment_link}/line_items"} => %{
      service_class: "PaymentLinkLineItem",
      reason: "Ruby splits payment link line items from PaymentLinkService",
      ruby: "payment_link_line_item_service.rb"
    },
    {"get", "/v1/quotes/{quote}/computed_upfront_line_items"} => %{
      service_class: "QuoteComputedUpfrontLineItems",
      reason: "Ruby splits computed upfront line items from QuoteService",
      ruby: "quote_computed_upfront_line_items_service.rb"
    },
    {"get", "/v1/quotes/{quote}/line_items"} => %{
      service_class: "QuoteLineItem",
      reason: "Ruby splits quote line items from QuoteService",
      ruby: "quote_line_item_service.rb"
    },
    {"get", "/v1/tax/calculations/{calculation}/line_items"} => %{
      service_class: "CalculationLineItem",
      reason: "Ruby splits calculation line items from CalculationService",
      ruby: "tax/calculation_line_item_service.rb"
    },
    {"get", "/v1/tax/transactions/{transaction}/line_items"} => %{
      service_class: "TransactionLineItem",
      reason: "Ruby splits transaction line items from TransactionService",
      ruby: "tax/transaction_line_item_service.rb"
    },

    # -- Credit note preview lines -------------------------------------------
    # preview/lines is a standalone listing endpoint, not part of
    # CreditNoteService. Ruby has a dedicated service for it.
    {"get", "/v1/credit_notes/preview/lines"} => %{
      service_class: "CreditNotePreviewLines",
      reason: "Ruby has dedicated service for credit note preview lines",
      ruby: "credit_note_preview_lines_service.rb"
    },

    # -- Customer child-resource services ------------------------------------
    # The spec attaches these to the Customer schema, but Ruby splits
    # customer sub-resources into dedicated services.
    {"post", "/v1/customers/{customer}/funding_instructions"} => %{
      service_class: "CustomerFundingInstructions",
      reason: "Ruby splits funding instructions from CustomerService",
      ruby: "customer_funding_instructions_service.rb"
    },
    {"get", "/v1/customers/{customer}/payment_methods"} => %{
      service_class: "CustomerPaymentMethod",
      reason: "Ruby splits customer payment methods from CustomerService",
      ruby: "customer_payment_method_service.rb"
    },
    {"get", "/v1/customers/{customer}/payment_methods/{payment_method}"} => %{
      service_class: "CustomerPaymentMethod",
      reason: "Ruby splits customer payment methods from CustomerService",
      ruby: "customer_payment_method_service.rb"
    },
    {"delete", "/v1/customers/{customer}/sources/{id}"} => %{
      service_class: "CustomerPaymentSource",
      reason: "Ruby splits customer payment sources from CustomerService",
      ruby: "customer_payment_source_service.rb"
    },
    {"post", "/v1/customers/{customer}/sources/{id}"} => %{
      service_class: "CustomerPaymentSource",
      reason: "Ruby splits customer payment sources from CustomerService",
      ruby: "customer_payment_source_service.rb"
    },
    {"post", "/v1/customers/{customer}/sources/{id}/verify"} => %{
      service_class: "CustomerPaymentSource",
      reason: "Ruby splits customer payment sources from CustomerService",
      ruby: "customer_payment_source_service.rb"
    },

    # -- Other child-resource services ---------------------------------------
    {"get", "/v1/financial_connections/accounts/{account}/owners"} => %{
      service_class: "AccountOwner",
      reason: "Ruby splits account owners from AccountService",
      ruby: "financial_connections/account_owner_service.rb"
    },
    {"get", "/v1/sources/{source}/source_transactions"} => %{
      service_class: "SourceTransaction",
      reason: "Ruby has dedicated source transaction service",
      ruby: "source_transaction_service.rb"
    },
    {"get", "/v1/treasury/financial_accounts/{financial_account}/features"} => %{
      service_class: "FinancialAccountFeatures",
      reason: "Ruby splits features from FinancialAccountService",
      ruby: "treasury/financial_account_features_service.rb"
    },
    {"post", "/v1/treasury/financial_accounts/{financial_account}/features"} => %{
      service_class: "FinancialAccountFeatures",
      reason: "Ruby splits features from FinancialAccountService",
      ruby: "treasury/financial_account_features_service.rb"
    },

    # -- V2 endpoints --------------------------------------------------------
    # V2 endpoints where spec x-stripeResource routing doesn't match Ruby's
    # service file layout.
    {"post", "/v2/billing/meter_event_stream"} => %{
      service_class: "MeterEventStream",
      reason: "Ruby has dedicated meter event stream service",
      ruby: "v2/billing/meter_event_stream_service.rb"
    },
    {"post", "/v2/commerce/product_catalog/imports"} => %{
      service_class: "Import",
      service_package: "V2.Commerce.ProductCatalog",
      reason: "Ruby nests product catalog imports under v2/commerce/product_catalog/ package",
      ruby: "v2/commerce/product_catalog/import_service.rb"
    },
    {"get", "/v2/commerce/product_catalog/imports"} => %{
      service_class: "Import",
      service_package: "V2.Commerce.ProductCatalog",
      reason: "Ruby nests product catalog imports under v2/commerce/product_catalog/ package",
      ruby: "v2/commerce/product_catalog/import_service.rb"
    },
    {"get", "/v2/commerce/product_catalog/imports/{id}"} => %{
      service_class: "Import",
      service_package: "V2.Commerce.ProductCatalog",
      reason: "Ruby nests product catalog imports under v2/commerce/product_catalog/ package",
      ruby: "v2/commerce/product_catalog/import_service.rb"
    },
    {"post", "/v2/core/accounts/{account_id}/persons"} => %{
      service_class: "Person",
      service_package: "V2.Core.Accounts",
      reason: "Ruby nests persons under v2/core/accounts/ package",
      ruby: "v2/core/accounts/person_service.rb"
    },
    {"get", "/v2/core/accounts/{account_id}/persons"} => %{
      service_class: "Person",
      service_package: "V2.Core.Accounts",
      reason: "Ruby nests persons under v2/core/accounts/ package",
      ruby: "v2/core/accounts/person_service.rb"
    },
    {"get", "/v2/core/accounts/{account_id}/persons/{id}"} => %{
      service_class: "Person",
      service_package: "V2.Core.Accounts",
      reason: "Ruby nests persons under v2/core/accounts/ package",
      ruby: "v2/core/accounts/person_service.rb"
    },
    {"post", "/v2/core/accounts/{account_id}/persons/{id}"} => %{
      service_class: "Person",
      service_package: "V2.Core.Accounts",
      reason: "Ruby nests persons under v2/core/accounts/ package",
      ruby: "v2/core/accounts/person_service.rb"
    },
    {"delete", "/v2/core/accounts/{account_id}/persons/{id}"} => %{
      service_class: "Person",
      service_package: "V2.Core.Accounts",
      reason: "Ruby nests persons under v2/core/accounts/ package",
      ruby: "v2/core/accounts/person_service.rb"
    },
    {"post", "/v2/core/accounts/{account_id}/person_tokens"} => %{
      service_class: "PersonToken",
      service_package: "V2.Core.Accounts",
      reason: "Ruby nests person tokens under v2/core/accounts/ package",
      ruby: "v2/core/accounts/person_token_service.rb"
    },
    {"get", "/v2/core/accounts/{account_id}/person_tokens/{id}"} => %{
      service_class: "PersonToken",
      service_package: "V2.Core.Accounts",
      reason: "Ruby nests person tokens under v2/core/accounts/ package",
      ruby: "v2/core/accounts/person_token_service.rb"
    }
  }

  def operation_overrides, do: @operation_overrides

  # Override params module prefix for specific operations.
  # Key: {http_method_string, path}
  # Value: %{params_class: "NewParamsPrefix", reason: "...", ruby: "..."}
  @params_overrides %{}

  def params_overrides, do: @params_overrides

  # ---------------------------------------------------------------------------
  # Field overrides: add or replace properties on a resource.
  #
  # Key: schema_id (e.g. "charge")
  # Value: %{ field_name => %{type: ..., description: ..., ...} }
  # ---------------------------------------------------------------------------
  @field_overrides %{
    "charge" => %{
      "invoice" => %{
        type: {:expandable_ref, "invoice"},
        description: "ID of the invoice this charge is for if one exists.",
        nullable: true,
        reason: "Spec omits invoice on Charge; API returns it. Ruby handles via method_missing.",
        ruby: "charge.rb"
      }
    }
  }

  def field_overrides, do: @field_overrides

  # Schemas to skip entirely.
  @skip_schemas MapSet.new([])

  def skip_schemas, do: @skip_schemas
end
