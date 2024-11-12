defmodule EmergencyDispatcher.Repo do
  use Ecto.Repo,
    otp_app: :emergency_dispatcher,
    adapter: Ecto.Adapters.Postgres
end
