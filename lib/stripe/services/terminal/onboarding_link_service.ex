# File generated from our OpenAPI spec
defmodule Stripe.Services.Terminal.OnboardingLinkService do
  @moduledoc """
  TerminalOnboardingLinkOnboardingLink

  Returns redirect links used for onboarding onto Tap to Pay on iPhone.
  """
  alias Stripe.Client

  @doc """
  Create an Onboarding Link

  Creates a new `OnboardingLink` object that contains a redirect_url used for onboarding onto Tap to Pay on iPhone.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Terminal.OnboardingLink.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/terminal/onboarding_links",
      Keyword.merge(opts, params: params)
    )
  end
end
