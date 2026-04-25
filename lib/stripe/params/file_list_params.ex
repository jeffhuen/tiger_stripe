# File generated from our OpenAPI spec
defmodule Stripe.Params.FileListParams do
  @moduledoc "Parameters for file list."

  @typedoc """
  * `created` - Only return files that were created during the given date interval.
  * `ending_before` - A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. Max length: 5000.
  * `expand` - Specifies which fields in the response should be expanded.
  * `limit` - A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
  * `purpose` - Filter queries by the file purpose. If you don't provide a purpose, the queries return unfiltered files. Possible values: `account_requirement`, `additional_verification`, `business_icon`, `business_logo`, `customer_signature`, `dispute_evidence`, `document_provider_identity_document`, `finance_report_run`, `financial_account_statement`, `identity_document`, `identity_document_downloadable`, `issuing_regulatory_reporting`, `pci_document`, `platform_terms_of_service`, `selfie`, `sigma_scheduled_query`, `tax_document_user_upload`, `terminal_android_apk`, `terminal_reader_splashscreen`. Max length: 5000.
  * `starting_after` - A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. Max length: 5000.
  """
  @type t :: %__MODULE__{
          created: map() | nil,
          ending_before: String.t() | nil,
          expand: [String.t()] | nil,
          limit: integer() | nil,
          purpose: String.t() | nil,
          starting_after: String.t() | nil
        }

  defstruct [:created, :ending_before, :expand, :limit, :purpose, :starting_after]
end
