# File generated from our OpenAPI spec
defmodule Stripe.Resources.File do
  @moduledoc """
  File

  This object represents files hosted on Stripe's servers. You can upload
  files with the [create file](https://api.stripe.com#create_file) request
  (for example, when uploading dispute evidence). Stripe also
  creates files independently (for example, the results of a [Sigma scheduled
  query](#scheduled_queries)).

  Related guide: [File upload guide](https://docs.stripe.com/file-upload)
  """

  @typedoc """
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `expires_at` - The file expires and isn't available at this time in epoch seconds. Format: Unix timestamp. Nullable.
  * `filename` - The suitable name for saving the file to a filesystem. Max length: 5000. Nullable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `links` - A list of [file links](https://api.stripe.com#file_links) that point at this file. Nullable. Expandable.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `file`.
  * `purpose` - The [purpose](https://docs.stripe.com/file-upload#uploading-a-file) of the uploaded file. Possible values: `account_requirement`, `additional_verification`, `business_icon`, `business_logo`, `customer_signature`, `dispute_evidence`, `document_provider_identity_document`, `finance_report_run`, `financial_account_statement`, `identity_document`, `identity_document_downloadable`, `issuing_regulatory_reporting`, `pci_document`, `platform_terms_of_service`, `selfie`, `sigma_scheduled_query`, `tax_document_user_upload`, `terminal_android_apk`, `terminal_reader_splashscreen`, `terminal_wifi_certificate`, `terminal_wifi_private_key`.
  * `size` - The size of the file object in bytes.
  * `title` - A suitable title for the document. Max length: 5000. Nullable.
  * `type` - The returned file type (for example, `csv`, `pdf`, `jpg`, or `png`). Max length: 5000. Nullable.
  * `url` - Use your live secret API key to download the file from this URL. Max length: 5000. Nullable.
  """
  @type t :: %__MODULE__{
          created: integer(),
          expires_at: integer(),
          filename: String.t(),
          id: String.t(),
          links: __MODULE__.Links.t() | nil,
          object: String.t(),
          purpose: String.t(),
          size: integer(),
          title: String.t(),
          type: String.t(),
          url: String.t()
        }

  defstruct [
    :created,
    :expires_at,
    :filename,
    :id,
    :links,
    :object,
    :purpose,
    :size,
    :title,
    :type,
    :url
  ]

  @object_name "file"
  def object_name, do: @object_name

  def expandable_fields, do: ["links"]

  defmodule Links do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `data` - Details about each object.
    * `has_more` - True if this list has another page of items after this one that can be fetched.
    * `object` - String representing the object's type. Objects of the same type share the same value. Always has the value `list`. Possible values: `list`.
    * `url` - The URL where this list can be accessed. Max length: 5000.
    """
    @type t :: %__MODULE__{
            data: [Stripe.Resources.FileLink.t()] | nil,
            has_more: boolean() | nil,
            object: String.t() | nil,
            url: String.t() | nil
          }
    defstruct [:data, :has_more, :object, :url]
  end

  def __inner_types__ do
    %{
      "links" => __MODULE__.Links
    }
  end
end
