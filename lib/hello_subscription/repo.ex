defmodule HelloSubscription.Repo do
  use Ecto.Repo,
    otp_app: :hello_subscription,
    adapter: Ecto.Adapters.Postgres
end
