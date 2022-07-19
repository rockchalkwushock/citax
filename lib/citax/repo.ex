defmodule App.Repo do
  use Ecto.Repo,
    otp_app: :citax,
    adapter: Ecto.Adapters.Postgres
end
