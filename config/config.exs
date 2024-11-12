# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config
config :emergency_dispatcher,
  ecto_repos: [EmergencyDispatcher.Repo],
  generators: [timestamp_type: :utc_datetime, binary_id: true]

# Configures the endpoint
config :emergency_dispatcher, EmergencyDispatcherWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Bandit.PhoenixAdapter,
  render_errors: [
    formats: [json: EmergencyDispatcherWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: EmergencyDispatcher.PubSub,
  live_view: [signing_salt: "8iOfKVZ4"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason


if config_env() in [:dev, :test] do
  import_config ".env.exs"
end

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
