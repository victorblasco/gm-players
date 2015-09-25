defmodule GmPlayers.Router do
  use GmPlayers.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", GmPlayers do
    pipe_through :api

    get "/players", PlayerController, :index
    get "/players/:id", PlayerController, :show
  end
end
