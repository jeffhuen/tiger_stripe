Stripe.Test.start()

case Finch.start_link(name: Stripe.Finch) do
  {:ok, _pid} -> :ok
  {:error, {:already_started, _pid}} -> :ok
end

ExUnit.start(exclude: [:integration])
