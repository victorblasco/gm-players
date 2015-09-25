defmodule GmPlayers.PlayerController do
  use GmPlayers.Web, :controller

  def index(conn, _params) do
    render conn, "index.json"
  end

  def show(conn, %{"id" => player_id}) do
    render conn, "show.json", player_id: player_id
  end
end