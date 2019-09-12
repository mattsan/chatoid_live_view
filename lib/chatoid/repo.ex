defmodule Chatoid.Repo do
  use Ecto.Repo,
    otp_app: :chatoid,
    adapter: Ecto.Adapters.Postgres
end
