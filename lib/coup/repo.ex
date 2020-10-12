defmodule Coup.Repo do
  use Ecto.Repo,
    otp_app: :coup,
    adapter: Ecto.Adapters.Postgres
end
