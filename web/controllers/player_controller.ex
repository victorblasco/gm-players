defmodule GmPlayers.PlayerController do
  use GmPlayers.Web, :controller

  def index(conn, params) do
    players = params["ids"]
    |> String.split(",")
    |> Player.find_by_ids

    render(conn, "index.json", players: players)
  end

  def show(conn, %{"id" => player_id}) do
    player = Player.find(player_id)

    render(conn, "show.json", player: player)
  end
end