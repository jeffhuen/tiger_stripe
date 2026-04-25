# File generated from our OpenAPI spec
defmodule Stripe.Services.PayoutService do
  @moduledoc """
  Payout

  A `Payout` object is created when you receive funds from Stripe, or when you
  initiate a payout to either a bank account or debit card of a [connected
  Stripe account](https://docs.stripe.com/docs/connect/bank-debit-card-payouts). You can retrieve individual payouts,
  and list all payouts. Payouts are made on [varying
  schedules](https://docs.stripe.com/docs/connect/manage-payout-schedule), depending on your country and
  industry.

  Related guide: [Receiving payouts](https://docs.stripe.com/payouts)
  """
  alias Stripe.Client

  @doc """
  Cancel a payout

  You can cancel a previously created payout if its status is `pending`. Stripe refunds the funds to your available balance. You can’t cancel automatic Stripe payouts.
  """
  @spec cancel(Client.t(), String.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
  def cancel(client, payout, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/payouts/#{payout}/cancel",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Create a payout

  To send funds to your own bank account, create a new payout object. Your [Stripe balance](#balance) must cover the payout amount. If it doesn’t, you receive an “Insufficient Funds” error.

  If your API key is in test mode, money won’t actually be sent, though every other action occurs as if you’re in live mode.

  If you create a manual payout on a Stripe account that uses multiple payment source types, you need to specify the source type balance that the payout draws from. The [balance object](#balance_object) details available and pending amounts by source type.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v1/payouts", Keyword.merge(opts, params: params))
  end

  @doc """
  List all payouts

  Returns a list of existing payouts sent to third-party bank accounts or payouts that Stripe sent to you. The payouts return in sorted order, with the most recently created payouts appearing first.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/payouts", Keyword.merge(opts, params: params))
  end

  @doc """
  Retrieve a payout

  Retrieves the details of an existing payout. Supply the unique payout ID from either a payout creation request or the payout list. Stripe returns the corresponding payout information.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
  def retrieve(client, payout, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/payouts/#{payout}", Keyword.merge(opts, params: params))
  end

  @doc """
  Reverse a payout

  Reverses a payout by debiting the destination bank account. At this time, you can only reverse payouts for connected accounts to US and Canadian bank accounts. If the payout is manual and in the `pending` status, use `/v1/payouts/:id/cancel` instead.

  By requesting a reversal through `/v1/payouts/:id/reverse`, you confirm that the authorized signatory of the selected bank account authorizes the debit on the bank account and that no other authorization is required.
  """
  @spec reverse(Client.t(), String.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
  def reverse(client, payout, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/payouts/#{payout}/reverse",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Update a payout

  Updates the specified payout by setting the values of the parameters you pass. We don’t change parameters that you don’t provide. This request only accepts the metadata as arguments.
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
  def update(client, payout, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v1/payouts/#{payout}", Keyword.merge(opts, params: params))
  end
end
