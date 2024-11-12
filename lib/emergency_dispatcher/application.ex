defmodule EmergencyDispatcher.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      EmergencyDispatcherWeb.Telemetry,
      EmergencyDispatcher.Repo,
      {DNSCluster, query: Application.get_env(:emergency_dispatcher, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: EmergencyDispatcher.PubSub},
      # Start a worker by calling: EmergencyDispatcher.Worker.start_link(arg)
      # {EmergencyDispatcher.Worker, arg},
      # Start to serve requests, typically the last entry
      EmergencyDispatcherWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: EmergencyDispatcher.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    EmergencyDispatcherWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
