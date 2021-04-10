defmodule PhxShooping.Repo do
  use Ecto.Repo,
    otp_app: :phx_shooping,
    adapter: Ecto.Adapters.Postgres
end
