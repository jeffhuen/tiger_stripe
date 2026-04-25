# File generated from our OpenAPI spec
defmodule Stripe.Resources.FileLink do
  @moduledoc """
  FileLink

  To share the contents of a `File` object with non-Stripe users, you can
  create a `FileLink`. `FileLink`s contain a URL that you can use to
  retrieve the contents of the file without authentication.
  """

  @typedoc """
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `expired` - Returns if the link is already expired.
  * `expires_at` - Time that the link expires. Format: Unix timestamp. Nullable.
  * `file` - The file object this link points to. Expandable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `file_link`.
  * `url` - The publicly accessible URL to download the file. Max length: 5000. Nullable.
  """
  @type t :: %__MODULE__{
          created: integer(),
          expired: boolean(),
          expires_at: integer(),
          file: String.t() | Stripe.Resources.File.t(),
          id: String.t(),
          livemode: boolean(),
          metadata: %{String.t() => String.t()},
          object: String.t(),
          url: String.t()
        }

  defstruct [:created, :expired, :expires_at, :file, :id, :livemode, :metadata, :object, :url]

  @object_name "file_link"
  def object_name, do: @object_name

  def expandable_fields, do: ["file"]
end
