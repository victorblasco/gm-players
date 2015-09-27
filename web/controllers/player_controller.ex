defmodule GmPlayers.PlayerController do
  use GmPlayers.Web, :controller

  def index(conn, params) do
    players = params["ids"]
    |> String.split(",")
    |> Enum.map(fn(x) -> String.to_integer(x) end)
    |> Player.find_by_ids

    render(conn, "index.json", players: players)
  end

  def show(conn, %{"id" => player_id}) do
    player = String.to_integer(player_id)
    |> Player.find

    render(conn, "show.json", player: player)
  end
end