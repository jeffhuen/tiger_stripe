# File generated from our OpenAPI spec
defmodule Stripe.Params.TestHelpers.Issuing.TransactionCreateUnlinkedRefundParams do
  @moduledoc "Parameters for transaction create unlinked refund."

  @typedoc """
  * `amount` - The total amount to attempt to refund. This amount is in the provided currency, or defaults to the cards currency, and in the [smallest currency unit](https://docs.stripe.com/currencies#zero-decimal).
  * `card` - Card associated with this unlinked refund transaction. Max length: 5000.
  * `currency` - The currency of the unlinked refund. If not provided, defaults to the currency of the card. Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `expand` - Specifies which fields in the response should be expanded.
  * `merchant_data` - Details about the seller (grocery store, e-commerce website, etc.) where the card authorization happened.
  * `purchase_details` - Additional purchase information that is optionally provided by the merchant.
  """
  @type t :: %__MODULE__{
          amount: integer(),
          card: String.t(),
          currency: String.t() | nil,
          expand: [String.t()] | nil,
          merchant_data: merchant_data() | nil,
          purchase_details: purchase_details() | nil
        }

  defstruct [:amount, :card, :currency, :expand, :merchant_data, :purchase_details]

  @typedoc """
  * `category` - A categorization of the seller's type of business. See our [merchant categories guide](https://docs.stripe.com/issuing/merchant-categories) for a list of possible values. Possible values: `ac_refrigeration_repair`, `accounting_bookkeeping_services`, `advertising_services`, `agricultural_cooperative`, `airlines_air_carriers`, `airports_flying_fields`, `ambulance_services`, `amusement_parks_carnivals`, `antique_reproductions`, `antique_shops`, `aquariums`, `architectural_surveying_services`, `art_dealers_and_galleries`, `artists_supply_and_craft_shops`, `auto_and_home_supply_stores`, `auto_body_repair_shops`, `auto_paint_shops`, `auto_service_shops`, `automated_cash_disburse`, `automated_fuel_dispensers`, `automobile_associations`, `automotive_parts_and_accessories_stores`, `automotive_tire_stores`, `bail_and_bond_payments`, `bakeries`, `bands_orchestras`, `barber_and_beauty_shops`, `betting_casino_gambling`, `bicycle_shops`, `billiard_pool_establishments`, `boat_dealers`, `boat_rentals_and_leases`, `book_stores`, `books_periodicals_and_newspapers`, `bowling_alleys`, `bus_lines`, `business_secretarial_schools`, `buying_shopping_services`, `cable_satellite_and_other_pay_television_and_radio`, `camera_and_photographic_supply_stores`, `candy_nut_and_confectionery_stores`, `car_and_truck_dealers_new_used`, `car_and_truck_dealers_used_only`, `car_rental_agencies`, `car_washes`, `carpentry_services`, `carpet_upholstery_cleaning`, `caterers`, `charitable_and_social_service_organizations_fundraising`, `chemicals_and_allied_products`, `child_care_services`, `childrens_and_infants_wear_stores`, `chiropodists_podiatrists`, `chiropractors`, `cigar_stores_and_stands`, `civic_social_fraternal_associations`, `cleaning_and_maintenance`, `clothing_rental`, `colleges_universities`, `commercial_equipment`, `commercial_footwear`, `commercial_photography_art_and_graphics`, `commuter_transport_and_ferries`, `computer_network_services`, `computer_programming`, `computer_repair`, `computer_software_stores`, `computers_peripherals_and_software`, `concrete_work_services`, `construction_materials`, `consulting_public_relations`, `correspondence_schools`, `cosmetic_stores`, `counseling_services`, `country_clubs`, `courier_services`, `court_costs`, `credit_reporting_agencies`, `cruise_lines`, `dairy_products_stores`, `dance_hall_studios_schools`, `dating_escort_services`, `dentists_orthodontists`, `department_stores`, `detective_agencies`, `digital_goods_applications`, `digital_goods_games`, `digital_goods_large_volume`, `digital_goods_media`, `direct_marketing_catalog_merchant`, `direct_marketing_combination_catalog_and_retail_merchant`, `direct_marketing_inbound_telemarketing`, `direct_marketing_insurance_services`, `direct_marketing_other`, `direct_marketing_outbound_telemarketing`, `direct_marketing_subscription`, `direct_marketing_travel`, `discount_stores`, `doctors`, `door_to_door_sales`, `drapery_window_covering_and_upholstery_stores`, `drinking_places`, `drug_stores_and_pharmacies`, `drugs_drug_proprietaries_and_druggist_sundries`, `dry_cleaners`, `durable_goods`, `duty_free_stores`, `eating_places_restaurants`, `educational_services`, `electric_razor_stores`, `electric_vehicle_charging`, `electrical_parts_and_equipment`, `electrical_services`, `electronics_repair_shops`, `electronics_stores`, `elementary_secondary_schools`, `emergency_services_gcas_visa_use_only`, `employment_temp_agencies`, `equipment_rental`, `exterminating_services`, `family_clothing_stores`, `fast_food_restaurants`, `financial_institutions`, `fines_government_administrative_entities`, `fireplace_fireplace_screens_and_accessories_stores`, `floor_covering_stores`, `florists`, `florists_supplies_nursery_stock_and_flowers`, `freezer_and_locker_meat_provisioners`, `fuel_dealers_non_automotive`, `funeral_services_crematories`, `furniture_home_furnishings_and_equipment_stores_except_appliances`, `furniture_repair_refinishing`, `furriers_and_fur_shops`, `general_services`, `gift_card_novelty_and_souvenir_shops`, `glass_paint_and_wallpaper_stores`, `glassware_crystal_stores`, `golf_courses_public`, `government_licensed_horse_dog_racing_us_region_only`, `government_licensed_online_casions_online_gambling_us_region_only`, `government_owned_lotteries_non_us_region`, `government_owned_lotteries_us_region_only`, `government_services`, `grocery_stores_supermarkets`, `hardware_equipment_and_supplies`, `hardware_stores`, `health_and_beauty_spas`, `hearing_aids_sales_and_supplies`, `heating_plumbing_a_c`, `hobby_toy_and_game_shops`, `home_supply_warehouse_stores`, `hospitals`, `hotels_motels_and_resorts`, `household_appliance_stores`, `industrial_supplies`, `information_retrieval_services`, `insurance_default`, `insurance_underwriting_premiums`, `intra_company_purchases`, `jewelry_stores_watches_clocks_and_silverware_stores`, `landscaping_services`, `laundries`, `laundry_cleaning_services`, `legal_services_attorneys`, `luggage_and_leather_goods_stores`, `lumber_building_materials_stores`, `manual_cash_disburse`, `marinas_service_and_supplies`, `marketplaces`, `masonry_stonework_and_plaster`, `massage_parlors`, `medical_and_dental_labs`, `medical_dental_ophthalmic_and_hospital_equipment_and_supplies`, `medical_services`, `membership_organizations`, `mens_and_boys_clothing_and_accessories_stores`, `mens_womens_clothing_stores`, `metal_service_centers`, `miscellaneous_apparel_and_accessory_shops`, `miscellaneous_auto_dealers`, `miscellaneous_business_services`, `miscellaneous_food_stores`, `miscellaneous_general_merchandise`, `miscellaneous_general_services`, `miscellaneous_home_furnishing_specialty_stores`, `miscellaneous_publishing_and_printing`, `miscellaneous_recreation_services`, `miscellaneous_repair_shops`, `miscellaneous_specialty_retail`, `mobile_home_dealers`, `motion_picture_theaters`, `motor_freight_carriers_and_trucking`, `motor_homes_dealers`, `motor_vehicle_supplies_and_new_parts`, `motorcycle_shops_and_dealers`, `motorcycle_shops_dealers`, `music_stores_musical_instruments_pianos_and_sheet_music`, `news_dealers_and_newsstands`, `non_fi_money_orders`, `non_fi_stored_value_card_purchase_load`, `nondurable_goods`, `nurseries_lawn_and_garden_supply_stores`, `nursing_personal_care`, `office_and_commercial_furniture`, `opticians_eyeglasses`, `optometrists_ophthalmologist`, `orthopedic_goods_prosthetic_devices`, `osteopaths`, `package_stores_beer_wine_and_liquor`, `paints_varnishes_and_supplies`, `parking_lots_garages`, `passenger_railways`, `pawn_shops`, `pet_shops_pet_food_and_supplies`, `petroleum_and_petroleum_products`, `photo_developing`, `photographic_photocopy_microfilm_equipment_and_supplies`, `photographic_studios`, `picture_video_production`, `piece_goods_notions_and_other_dry_goods`, `plumbing_heating_equipment_and_supplies`, `political_organizations`, `postal_services_government_only`, `precious_stones_and_metals_watches_and_jewelry`, `professional_services`, `public_warehousing_and_storage`, `quick_copy_repro_and_blueprint`, `railroads`, `real_estate_agents_and_managers_rentals`, `record_stores`, `recreational_vehicle_rentals`, `religious_goods_stores`, `religious_organizations`, `roofing_siding_sheet_metal`, `secretarial_support_services`, `security_brokers_dealers`, `service_stations`, `sewing_needlework_fabric_and_piece_goods_stores`, `shoe_repair_hat_cleaning`, `shoe_stores`, `small_appliance_repair`, `snowmobile_dealers`, `special_trade_services`, `specialty_cleaning`, `sporting_goods_stores`, `sporting_recreation_camps`, `sports_and_riding_apparel_stores`, `sports_clubs_fields`, `stamp_and_coin_stores`, `stationary_office_supplies_printing_and_writing_paper`, `stationery_stores_office_and_school_supply_stores`, `swimming_pools_sales`, `t_ui_travel_germany`, `tailors_alterations`, `tax_payments_government_agencies`, `tax_preparation_services`, `taxicabs_limousines`, `telecommunication_equipment_and_telephone_sales`, `telecommunication_services`, `telegraph_services`, `tent_and_awning_shops`, `testing_laboratories`, `theatrical_ticket_agencies`, `timeshares`, `tire_retreading_and_repair`, `tolls_bridge_fees`, `tourist_attractions_and_exhibits`, `towing_services`, `trailer_parks_campgrounds`, `transportation_services`, `travel_agencies_tour_operators`, `truck_stop_iteration`, `truck_utility_trailer_rentals`, `typesetting_plate_making_and_related_services`, `typewriter_stores`, `u_s_federal_government_agencies_or_departments`, `uniforms_commercial_clothing`, `used_merchandise_and_secondhand_stores`, `utilities`, `variety_stores`, `veterinary_services`, `video_amusement_game_supplies`, `video_game_arcades`, `video_tape_rental_stores`, `vocational_trade_schools`, `watch_jewelry_repair`, `welding_repair`, `wholesale_clubs`, `wig_and_toupee_stores`, `wires_money_orders`, `womens_accessory_and_specialty_shops`, `womens_ready_to_wear_stores`, `wrecking_and_salvage_yards`. Max length: 5000.
  * `city` - City where the seller is located Max length: 5000.
  * `country` - Country where the seller is located Max length: 5000.
  * `name` - Name of the seller Max length: 5000.
  * `network_id` - Identifier assigned to the seller by the card network. Different card networks may assign different network_id fields to the same merchant. Max length: 5000.
  * `postal_code` - Postal code where the seller is located Max length: 5000.
  * `state` - State where the seller is located Max length: 5000.
  * `terminal_id` - An ID assigned by the seller to the location of the sale. Max length: 5000.
  * `url` - URL provided by the merchant on a 3DS request Max length: 5000.
  """
  @type merchant_data :: %{
          optional(:category) => String.t() | nil,
          optional(:city) => String.t() | nil,
          optional(:country) => String.t() | nil,
          optional(:name) => String.t() | nil,
          optional(:network_id) => String.t() | nil,
          optional(:postal_code) => String.t() | nil,
          optional(:state) => String.t() | nil,
          optional(:terminal_id) => String.t() | nil,
          optional(:url) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `fleet` - Fleet-specific information for transactions using Fleet cards.
  * `flight` - Information about the flight that was purchased with this transaction.
  * `fuel` - Information about fuel that was purchased with this transaction.
  * `lodging` - Information about lodging that was purchased with this transaction.
  * `receipt` - The line items in the purchase.
  * `reference` - A merchant-specific order number. Max length: 5000.
  """
  @type purchase_details :: %{
          optional(:fleet) => purchase_details_fleet() | nil,
          optional(:flight) => purchase_details_flight() | nil,
          optional(:fuel) => purchase_details_fuel() | nil,
          optional(:lodging) => purchase_details_lodging() | nil,
          optional(:receipt) => [purchase_details_receipt()] | nil,
          optional(:reference) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `cardholder_prompt_data` - Answers to prompts presented to the cardholder at the point of sale. Prompted fields vary depending on the configuration of your physical fleet cards. Typical points of sale support only numeric entry.
  * `purchase_type` - The type of purchase. One of `fuel_purchase`, `non_fuel_purchase`, or `fuel_and_non_fuel_purchase`. Possible values: `fuel_and_non_fuel_purchase`, `fuel_purchase`, `non_fuel_purchase`. Max length: 5000.
  * `reported_breakdown` - More information about the total amount. This information is not guaranteed to be accurate as some merchants may provide unreliable data.
  * `service_type` - The type of fuel service. One of `non_fuel_transaction`, `full_service`, or `self_service`. Possible values: `full_service`, `non_fuel_transaction`, `self_service`. Max length: 5000.
  """
  @type purchase_details_fleet :: %{
          optional(:cardholder_prompt_data) =>
            purchase_details_fleet_cardholder_prompt_data() | nil,
          optional(:purchase_type) => String.t() | nil,
          optional(:reported_breakdown) => purchase_details_fleet_reported_breakdown() | nil,
          optional(:service_type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `driver_id` - Driver ID. Max length: 5000.
  * `odometer` - Odometer reading.
  * `unspecified_id` - An alphanumeric ID. This field is used when a vehicle ID, driver ID, or generic ID is entered by the cardholder, but the merchant or card network did not specify the prompt type. Max length: 5000.
  * `user_id` - User ID. Max length: 5000.
  * `vehicle_number` - Vehicle number. Max length: 5000.
  """
  @type purchase_details_fleet_cardholder_prompt_data :: %{
          optional(:driver_id) => String.t() | nil,
          optional(:odometer) => integer() | nil,
          optional(:unspecified_id) => String.t() | nil,
          optional(:user_id) => String.t() | nil,
          optional(:vehicle_number) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `fuel` - Breakdown of fuel portion of the purchase.
  * `non_fuel` - Breakdown of non-fuel portion of the purchase.
  * `tax` - Information about tax included in this transaction.
  """
  @type purchase_details_fleet_reported_breakdown :: %{
          optional(:fuel) => purchase_details_fleet_reported_breakdown_fuel() | nil,
          optional(:non_fuel) => purchase_details_fleet_reported_breakdown_non_fuel() | nil,
          optional(:tax) => purchase_details_fleet_reported_breakdown_tax() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `gross_amount_decimal` - Gross fuel amount that should equal Fuel Volume multipled by Fuel Unit Cost, inclusive of taxes. Format: decimal string.
  """
  @type purchase_details_fleet_reported_breakdown_fuel :: %{
          optional(:gross_amount_decimal) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `gross_amount_decimal` - Gross non-fuel amount that should equal the sum of the line items, inclusive of taxes. Format: decimal string.
  """
  @type purchase_details_fleet_reported_breakdown_non_fuel :: %{
          optional(:gross_amount_decimal) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `local_amount_decimal` - Amount of state or provincial Sales Tax included in the transaction amount. Null if not reported by merchant or not subject to tax. Format: decimal string.
  * `national_amount_decimal` - Amount of national Sales Tax or VAT included in the transaction amount. Null if not reported by merchant or not subject to tax. Format: decimal string.
  """
  @type purchase_details_fleet_reported_breakdown_tax :: %{
          optional(:local_amount_decimal) => String.t() | nil,
          optional(:national_amount_decimal) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `departure_at` - The time that the flight departed. Format: Unix timestamp.
  * `passenger_name` - The name of the passenger. Max length: 5000.
  * `refundable` - Whether the ticket is refundable.
  * `segments` - The legs of the trip.
  * `travel_agency` - The travel agency that issued the ticket. Max length: 5000.
  """
  @type purchase_details_flight :: %{
          optional(:departure_at) => integer() | nil,
          optional(:passenger_name) => String.t() | nil,
          optional(:refundable) => boolean() | nil,
          optional(:segments) => [purchase_details_flight_segments()] | nil,
          optional(:travel_agency) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `arrival_airport_code` - The three-letter IATA airport code of the flight's destination. Max length: 3.
  * `carrier` - The airline carrier code. Max length: 5000.
  * `departure_airport_code` - The three-letter IATA airport code that the flight departed from. Max length: 3.
  * `flight_number` - The flight number. Max length: 5000.
  * `service_class` - The flight's service class. Max length: 5000.
  * `stopover_allowed` - Whether a stopover is allowed on this flight.
  """
  @type purchase_details_flight_segments :: %{
          optional(:arrival_airport_code) => String.t() | nil,
          optional(:carrier) => String.t() | nil,
          optional(:departure_airport_code) => String.t() | nil,
          optional(:flight_number) => String.t() | nil,
          optional(:service_class) => String.t() | nil,
          optional(:stopover_allowed) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `industry_product_code` - [Conexxus Payment System Product Code](https://www.conexxus.org/conexxus-payment-system-product-codes) identifying the primary fuel product purchased. Max length: 5000.
  * `quantity_decimal` - The quantity of `unit`s of fuel that was dispensed, represented as a decimal string with at most 12 decimal places. Format: decimal string.
  * `type` - The type of fuel that was purchased. One of `diesel`, `unleaded_plus`, `unleaded_regular`, `unleaded_super`, or `other`. Possible values: `diesel`, `other`, `unleaded_plus`, `unleaded_regular`, `unleaded_super`. Max length: 5000.
  * `unit` - The units for `quantity_decimal`. One of `charging_minute`, `imperial_gallon`, `kilogram`, `kilowatt_hour`, `liter`, `pound`, `us_gallon`, or `other`. Possible values: `charging_minute`, `imperial_gallon`, `kilogram`, `kilowatt_hour`, `liter`, `other`, `pound`, `us_gallon`. Max length: 5000.
  * `unit_cost_decimal` - The cost in cents per each unit of fuel, represented as a decimal string with at most 12 decimal places. Format: decimal string.
  """
  @type purchase_details_fuel :: %{
          optional(:industry_product_code) => String.t() | nil,
          optional(:quantity_decimal) => String.t() | nil,
          optional(:type) => String.t() | nil,
          optional(:unit) => String.t() | nil,
          optional(:unit_cost_decimal) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `check_in_at` - The time of checking into the lodging. Format: Unix timestamp.
  * `nights` - The number of nights stayed at the lodging.
  """
  @type purchase_details_lodging :: %{
          optional(:check_in_at) => integer() | nil,
          optional(:nights) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `description` - Max length: 26.
  * `quantity` - Format: decimal string.
  * `total`
  * `unit_cost`
  """
  @type purchase_details_receipt :: %{
          optional(:description) => String.t() | nil,
          optional(:quantity) => String.t() | nil,
          optional(:total) => integer() | nil,
          optional(:unit_cost) => integer() | nil,
          optional(String.t()) => term()
        }
end
