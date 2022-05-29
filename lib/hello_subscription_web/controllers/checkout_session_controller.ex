defmodule HelloSubscriptionWeb.CheckoutSessionController do
  use HelloSubscriptionWeb, :controller

  def create(conn, %{"checkout_session" => checkout_params}) do
    %{"lookup_key" => lookup_key} = checkout_params
    {:ok, %{data: [price]}} = Stripe.Price.list(%{lookup_keys: [lookup_key]})

    url = HelloSubscriptionWeb.Endpoint.url()

    params = %{
      line_items: [
        %{
          # Provide the exact Price ID (e.g. pr_1234) of the product you want to sell
          price: price.id,
          quantity: 1
        }
      ],
      mode: "subscription",
      success_url: url <> "/success?session_id={CHECKOUT_SESSION_ID}",
      cancel_url: url <> "/cancel"
    }

    {:ok, session} = Stripe.Session.create(params)

    conn
    |> put_status(303)
    |> redirect(external: session.url)
  end
end
