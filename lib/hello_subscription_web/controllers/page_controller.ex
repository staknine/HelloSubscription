defmodule HelloSubscriptionWeb.PageController do
  use HelloSubscriptionWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def success(conn, params) do
    %{"session_id" => session_id} = params

    conn
    |> assign(:session_id, session_id)
    |> render("success.html")
  end
end
