defmodule GmPlayers.Router do
  use GmPlayers.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", GmPlayers do
    pipe_through :api

    scope "/v1", V1, as: :v1 do
      resources "/players", PlayerController
    end
  end
end
