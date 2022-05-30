defmodule HelloSubscriptionWeb.StripeHandler do
  @behaviour Stripe.WebhookHandler

  @impl true
  def handle_event(%Stripe.Event{type: "customer.subscription.created"} = event) do
    # TODO: handle the customer.subscription.succeeded event
    IO.inspect(event, label: "customer.subscription.created")
    {:ok, event}
  end

  @impl true
  def handle_event(event) do
    IO.inspect(event)
    :ok
  end
end
