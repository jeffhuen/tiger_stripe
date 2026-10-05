# File generated from our OpenAPI spec
defmodule Stripe.Params.SubscriptionResumeParams do
  @moduledoc "Parameters for subscription resume."

  @typedoc """
  * `billing_cycle_anchor` - The billing cycle anchor that applies when the subscription is resumed. Either `now` or `unchanged`. The default is `now`. For more information, see the billing cycle [documentation](https://docs.stripe.com/billing/subscriptions/billing-cycle).
  * `expand` - Specifies which fields in the response should be expanded.
  * `payment_behavior` - Controls whether Stripe attempts payment on the resumption invoice in the resume request, and how payment on that invoice affects the subscription's status. The default is `resume_on_payment_attempt`. Possible values: `resume_on_payment_attempt`, `resume_on_payment_success`.
  * `proration_behavior` - Determines how to handle [prorations](https://docs.stripe.com/billing/subscriptions/prorations) resulting from the `billing_cycle_anchor` being `unchanged`. When the `billing_cycle_anchor` is set to `now` (default value), no prorations are generated. If no value is passed, the default is `create_prorations`. Possible values: `always_invoice`, `create_prorations`, `none`.
  * `proration_date` - If set, prorations will be calculated as though the subscription was resumed at the given time. This can be used to apply exactly the same prorations that were previewed with the [create preview](https://stripe.com/docs/api/invoices/create_preview) endpoint. Format: Unix timestamp.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :billing_cycle_anchor,
    :expand,
    :payment_behavior,
    :proration_behavior,
    :proration_date
  ]
end
