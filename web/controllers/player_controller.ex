defmodule GmPlayers.PlayerController do
  use GmPlayers.Web, :controller

  def index(conn, _params) do
    players = [player_for(1), player_for(2), player_for(3)]

    render(conn, "index.json", players: players)
  end

  def show(conn, %{"id" => player_id}) do
    player = player_for(player_id)

    render(conn, "show.json", player: player)
  end

  defp player_for(id) do
    %{
      id: "#{id}",
      public_name: "Player #{id}"
    }
  end
end