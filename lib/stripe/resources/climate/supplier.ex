# File generated from our OpenAPI spec
defmodule Stripe.Resources.Climate.Supplier do
  @moduledoc """
  ClimateRemovalsSuppliers

  A supplier of carbon removal.
  """

  @typedoc """
  * `id` - Unique identifier for the object. Max length: 5000.
  * `info_url` - Link to a webpage to learn more about the supplier. Max length: 5000.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `locations` - The locations in which this supplier operates. Expandable.
  * `name` - Name of this carbon removal supplier. Max length: 5000.
  * `object` - String representing the object’s type. Objects of the same type share the same value. Possible values: `climate.supplier`.
  * `removal_pathway` - The scientific pathway used for carbon removal. Possible values: `biomass_carbon_removal_and_storage`, `direct_air_capture`, `enhanced_weathering`, `marine_carbon_removal`.
  """
  @type t :: %__MODULE__{
          id: String.t(),
          info_url: String.t(),
          livemode: boolean(),
          locations: [__MODULE__.Locations.t()],
          name: String.t(),
          object: String.t(),
          removal_pathway: String.t()
        }

  defstruct [:id, :info_url, :livemode, :locations, :name, :object, :removal_pathway]

  @object_name "climate.supplier"
  def object_name, do: @object_name

  def expandable_fields, do: ["locations"]

  defmodule Locations do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `city` - The city where the supplier is located. Max length: 5000. Nullable.
    * `country` - Two-letter ISO code representing the country where the supplier is located. Max length: 5000.
    * `latitude` - The geographic latitude where the supplier is located. Nullable.
    * `longitude` - The geographic longitude where the supplier is located. Nullable.
    * `region` - The state/county/province/region where the supplier is located. Max length: 5000. Nullable.
    """
    @type t :: %__MODULE__{
            city: String.t() | nil,
            country: String.t() | nil,
            latitude: float() | nil,
            longitude: float() | nil,
            region: String.t() | nil
          }
    defstruct [:city, :country, :latitude, :longitude, :region]
  end

  def __inner_types__ do
    %{
      "locations" => __MODULE__.Locations
    }
  end
end
