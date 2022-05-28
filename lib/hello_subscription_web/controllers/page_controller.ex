defmodule HelloSubscriptionWeb.PageController do
  use HelloSubscriptionWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def success(conn, _params) do
    render(conn, "success.html")
  end
end
