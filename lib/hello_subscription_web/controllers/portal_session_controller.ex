defmodule HelloSubscriptionWeb.PortalSessionController do
  use HelloSubscriptionWeb, :controller

  def create(conn, %{"portal_session" => portal_params}) do
    %{"session_id" => session_id} = portal_params

    IO.inspect(session_id)
    # For demonstration purposes, we're using the Checkout session to retrieve the customer ID.
    # Typically this is stored alongside the authenticated user in your database.
    {:ok, checkout_session} = Stripe.Session.retrieve(session_id)

    # This is the URL to which users will be redirected after they are done
    # managing their billing.
    url = HelloSubscriptionWeb.Endpoint.url()

    {:ok, session} =
      Stripe.BillingPortal.Session.create(%{customer: checkout_session.customer, return_url: url})

    conn
    |> put_status(303)
    |> redirect(external: session.url)
  end
end
