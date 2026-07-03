# File generated from our OpenAPI spec
defmodule Stripe.Resources.Payto do
  @moduledoc """
  mandate_payto
  """

  @typedoc """
  * `amount` - Amount that will be collected. It is required when `amount_type` is `fixed`. Nullable.
  * `amount_type` - The type of amount that will be collected. The amount charged must be exact or up to the value of `amount` param for `fixed` or `maximum` type respectively. Defaults to `maximum`. Possible values: `fixed`, `maximum`.
  * `end_date` - Date, in YYYY-MM-DD format, after which payments will not be collected. Defaults to no end date. Max length: 5000. Nullable.
  * `payment_schedule` - The periodicity at which payments will be collected. Defaults to `adhoc`. Possible values: `adhoc`, `annual`, `daily`, `fortnightly`, `monthly`, `quarterly`, `semi_annual`, `weekly`.
  * `payments_per_period` - The number of payments that will be made during a payment period. Defaults to 1 except for when `payment_schedule` is `adhoc`. In that case, it defaults to no limit. Nullable.
  * `purpose` - The purpose for which payments are made. Has a default value based on your merchant category code. Possible values: `dependant_support`, `government`, `loan`, `mortgage`, `other`, `pension`, `personal`, `retail`, `salary`, `tax`, `utility`. Nullable.
  * `start_date` - Date, in YYYY-MM-DD format, from which payments will be collected. Defaults to confirmation time. Max length: 5000. Nullable.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :amount,
    :amount_type,
    :end_date,
    :payment_schedule,
    :payments_per_period,
    :purpose,
    :start_date
  ]

  @object_name "mandate_payto"
  def object_name, do: @object_name
end
