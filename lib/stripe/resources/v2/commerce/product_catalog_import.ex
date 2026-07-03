# File generated from our OpenAPI spec
defmodule Stripe.Resources.V2.Commerce.ProductCatalogImport do
  @moduledoc """
  Product Catalog Import

  The ProductCatalogImport object tracks the long-running background process that handles uploading, processing and validation.
  """

  @typedoc """
  * `created` - The time this ProductCatalogImport was created. Format: date-time.
  * `feed_type` - The type of feed data being imported into the product catalog. Possible values: `inventory`, `pricing`, `product`, `promotion`.
  * `id` - The unique identifier for this ProductCatalogImport.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `metadata` - Additional information about the object in a structured format.
  * `mode` - The import strategy for handling existing catalog data. Possible values: `replace`, `upsert`.
  * `object` - String representing the object's type. Objects of the same type share the same value of the object field. Possible values: `v2.commerce.product_catalog_import`.
  * `status` - The current status of this ProductCatalogImport. Possible values: `awaiting_upload`, `failed`, `processing`, `succeeded`, `succeeded_with_errors`.
  * `status_details` - Details about the current import status.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :created,
    :feed_type,
    :id,
    :livemode,
    :metadata,
    :mode,
    :object,
    :status,
    :status_details
  ]

  @object_name "v2.commerce.product_catalog_import"
  def object_name, do: @object_name

  def __nested_fields__ do
    %{
      "status_details" => %{
        fields: %{
          "awaiting_upload" => %{
            fields: %{
              "upload_url" => %{
                fields: %{
                  "expires_at" => :scalar,
                  "url" => :scalar
                }
              }
            }
          },
          "failed" => %{
            fields: %{
              "code" => :scalar,
              "failure_message" => :scalar,
              "type" => :scalar
            }
          },
          "processing" => %{
            fields: %{
              "error_count" => :scalar,
              "success_count" => :scalar
            }
          },
          "succeeded" => %{
            fields: %{
              "success_count" => :scalar
            }
          },
          "succeeded_with_errors" => %{
            fields: %{
              "error_count" => :scalar,
              "error_file" => %{
                fields: %{
                  "content_type" => :scalar,
                  "download_url" => %{
                    fields: %{
                      "expires_at" => :scalar,
                      "url" => :scalar
                    }
                  },
                  "size" => :scalar
                }
              },
              "samples" =>
                {:list,
                 %{
                   fields: %{
                     "error_message" => :scalar,
                     "field" => :scalar,
                     "id" => :scalar,
                     "row" => :scalar
                   }
                 }},
              "success_count" => :scalar
            }
          }
        }
      }
    }
  end
end
