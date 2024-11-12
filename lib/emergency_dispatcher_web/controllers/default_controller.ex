defmodule EmergencyDispatcherWeb.DefaultController do
  use EmergencyDispatcherWeb, :controller

  def index(conn, _params) do
    text conn, "Emergency Dispatcher - #{Mix.env()}"
  end
end
