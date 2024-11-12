defmodule EmergencyDispatcherWeb.Router do
  use EmergencyDispatcherWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", EmergencyDispatcherWeb do
    pipe_through :api
    get "/", DefaultController, :index
  end
end
